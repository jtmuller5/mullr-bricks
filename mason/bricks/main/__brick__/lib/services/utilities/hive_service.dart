import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

@injectable
class HiveService {
  bool initialized = false;

  // Need to register adapters before calling initFlutter - https://github.com/hivedb/hive/issues/269
  Future<void> setupHive() async {
    if (!initialized) {
     /* if (!Hive.isAdapterRegistered(0)) {
        Hive.registerAdapter(UserAdapter());
      }*/

      await Hive.initFlutter();

      try {
        Hive.ignoreTypeId(45);
        Hive.ignoreTypeId(77);
      } catch (e) {
        debugPrint('Hive error: '+ e.toString());
      }

      await Hive.openBox('app'); // For storing app state-related data
     // await Hive.openBox<User>('users');

      initialized = true;
    }
  }
}
