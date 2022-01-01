import 'package:injectable/injectable.dart';

@singleton
class UserService {
 String? get uid{
    return FirebaseAuth.instance.currentUser?.uid;
  }
}