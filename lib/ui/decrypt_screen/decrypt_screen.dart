import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_memo_app/ui/controller/data_controller.dart';
import 'package:task_memo_app/ui/decrypt_screen/data_item_widget.dart';
import 'package:task_memo_app/widget/app_app_bar.dart';

class DecryptScreen extends StatefulWidget {
  const DecryptScreen({super.key});

  @override
  State<DecryptScreen> createState() => _DecryptScreenState();
}

class _DecryptScreenState extends State<DecryptScreen> {
  DataController dataController = Get.put(DataController());

  @override
  void initState() {
    super.initState();
    dataController.fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(
        titleText: 'Decrypt',
      ),
      body: GetBuilder<DataController>(
        builder: (controller) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return DataItemWidget(
                index: index,
                value: controller.dataList[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(),
            itemCount: controller.dataList.length,
          );
        },
      ),
    );
  }
}
