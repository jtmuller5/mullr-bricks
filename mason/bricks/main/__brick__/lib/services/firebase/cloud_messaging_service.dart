import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CloudMessagingService {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  String? uid;

  // Should set up FCM after user has logged into Firebase auth
  Future<void> setupMessaging(String _uid, List<String> topics) async {
    print('Setting up FCM');
    uid = _uid;
    await requestMessagingPermissions(); // Check for appropriate permissions
    await getToken(); // Get messaging token for this app instance and save token to Firestore
    await subscribeToTopics(_uid, topics);
    listenToForegroundMessages(); // Set up listener for foreground notifications
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler); // Set up listener for background notifications
  }

  Future<void> getToken({bool sharedPrefs = true}) async {
    String? token = await messaging.getToken();

    if (token != null){
      if(sharedPrefs){
        saveTokenToSharedPrefs(token);

        // Any time the token refreshes, store this in the database too.
        FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToSharedPrefs);
      } else{
        saveTokenToDatabase(token);

        // Any time the token refreshes, store this in the database too.
        FirebaseMessaging.instance.onTokenRefresh.listen(saveTokenToDatabase);
      }

    }
  }

  Future<void> saveTokenToSharedPrefs(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setString('messaging_token', token);
  }

  /// Save the user's current FCM token to Firestore
  Future<void> saveTokenToDatabase(String token) async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(userService.uid).update(
        {
          'tokens': FieldValue.arrayUnion([token]),
        },
      );
    } catch(e){
      print('Token update error: '+ e.toString());
    }
  }

  Future<void> requestMessagingPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }

  /// Subscribe to all topics listed in the user's UserSettings object (see settingsService loadSettings())
  Future<void> subscribeToTopics(String uid, List<String> topics) async {
    Future.forEach((topics), (topic) async {
      print('Subscribing to topic: '+ topic.toString());
      await messaging.subscribeToTopic(topic.toString());
    });

  }

  /// Listen to FCM notifications while the app is open and in use
  void listenToForegroundMessages() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Got a message whilst in the foreground!');
      print('Message data: ${message.data}');
      print('Message title: ${message.notification?.title}');
      print('Message text: ${message.notification?.body}');

      if (message.notification != null) {
        print('Message also contained a notification: ${message.notification}');
      }
    });
  }

  /// Check for permissions without requesting them
  Future<void> checkForPermissions() async {
    NotificationSettings settings = await messaging.getNotificationSettings();

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
}

/// Background listener must be a top level function
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}
