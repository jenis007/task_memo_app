import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:task_memo_app/services/pref_manager.dart';
import 'package:task_memo_app/ui/home_page/home_page.dart';

void storeKeyInStorage() {
  if (PrefManager.getKey() == null) {
    final key = enc.Key.fromLength(32);
    PrefManager.setKey(key.base16);
  }
}

Future<void> main() async {
  await GetStorage.init();
  storeKeyInStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
