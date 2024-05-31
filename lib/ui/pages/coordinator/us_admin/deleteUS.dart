import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/coordinator/us_admin/createus.dart';
import 'package:project/ui/pages/coordinator/us_admin/updateUS.dart';

class deleteUS extends StatefulWidget {
  const deleteUS({super.key});

  @override
  State<deleteUS> createState() => _deleteUSState();
}

class _deleteUSState extends State<deleteUS> {
  String? email = Get.arguments[0];
  USController userController = Get.put(USController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(child: _getXlistView()),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          logInfo("Add user from UI");
          Get.to(() => const CreateUser());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _getXlistView() {
    return Obx(
      () => ListView.builder(
        itemCount: userController.supports.length,
        itemBuilder: (context, index) {
          UserSupport user = userController.supports[index];
          print(user);
          return Dismissible(
            key: UniqueKey(),
            background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Deleting",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            onDismissed: (direction) {
              userController.deleteSupport(user.id!);
            },
            child: Card(
              child: ListTile(
                leading: Text(user.id.toString()),
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () {
                  Get.to(() => const UpdateUS(), arguments: [user, user.id]);
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
