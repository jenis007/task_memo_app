import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_memo_app/ui/controller/data_controller.dart';
import 'package:task_memo_app/ui/decrypt_screen/decrypt_screen.dart';
import 'package:task_memo_app/ui/encrypt_screen/encrypt_screen.dart';
import 'package:task_memo_app/widget/app_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dataController.fetchDataBase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        titleText: 'Home',
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EncryptScreen(),
                  ),
                );
              },
              child: const Text('Encrypt'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DecryptScreen(),
                  ),
                );
              },
              child: const Text('Decrypt'),
            ),
          ],
        ),
      ),
    );
  }
}
