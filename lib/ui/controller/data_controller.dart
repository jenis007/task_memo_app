import 'package:encrypt/encrypt.dart' as enc;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_memo_app/databse/database.dart';
import 'package:task_memo_app/services/pref_manager.dart';

class DataController extends GetxController {
  TextEditingController textValueController = TextEditingController();
  List<String> dataList = [];
  final encrypter = enc.Encrypter(enc.AES(PrefManager.getKey()));

  fetchDataBase() async {
    await LocalDataBase.createDb();
    update();
  }

  insertData() async {
    final iv = enc.IV.fromLength(16);
    final encrypted = encrypter.encrypt(textValueController.text, iv: iv);

    Map<String, dynamic> dataMap = {
      'id': iv.bytes,
      'value': encrypted.bytes,
    };

    await LocalDataBase().insertEncryptData(dataMap);
    textValueController.clear();
    update();
  }

  fetchData() async {
    dataList.clear();
    final List data = await LocalDataBase().fetchEncryptData();
    for (var element in data) {
      final decrypted = encrypter.decrypt(
        enc.Encrypted(element['value']),
        iv: enc.IV(element['id']),
      );
      dataList.add(decrypted);
    }
    update();
  }
}
