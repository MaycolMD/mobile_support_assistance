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
          Get.to(() => const CreateUser(), arguments: [email]);
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
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(user.name, textAlign: TextAlign.center),
                    Text(user.email, textAlign: TextAlign.center),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        Get.to(() => const UpdateUS(),
                            arguments: [user, user.id]);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        userController.deleteSupport(user.id!);
                      },
                    ),
                  ],
                ),
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
