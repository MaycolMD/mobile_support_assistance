import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/coordinator/us_admin/us_admin_page.dart';

class UpdateUS extends StatefulWidget {
  const UpdateUS({super.key});

  @override
  _UpdateUSState createState() => _UpdateUSState();
}

class _UpdateUSState extends State<UpdateUS> {
  String email = Get.arguments[0];
  final USController controller = Get.put(USController());
  Future<void>? supportNamesFuture;
  String? selectedSupport;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    supportNamesFuture = controller.getSupportsName().then((_) {
      if (controller.supportsNameList.isNotEmpty) {
        setState(() {
          selectedSupport = controller.supportsNameList.first;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: supportNamesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          List<String> supportsName = controller.supportsNameList;
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 50, 20.0, 12.0),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          color: Theme.of(context).primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Icon(
                              Icons.tag_faces_sharp,
                              color: Theme.of(context).colorScheme.background,
                              size: 80,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'UPDATE A SUPPORT USER',
                          style: TextStyle(
                            fontSize: 40,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(
                          height: 44,
                          thickness: 1,
                          indent: 24,
                          endIndent: 24,
                          color: Theme.of(context).dividerColor,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            DropdownButton<String>(
                              value: selectedSupport,
                              icon: const Icon(Icons.arrow_downward),
                              items: supportsName.map<DropdownMenuItem<String>>(
                                  (String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? value) {
                                setState(() {
                                  selectedSupport = value!;
                                });
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () {
                                // Acción para el botón de la lupa
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildGoBackButton(),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }

  Widget buildGoBackButton() {
    return OutlinedButton(
      key: const Key('ButtonGoBack'),
      onPressed: () {
        Get.to(() => AdminPageUS(), arguments: [email]);
      },
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(
          const BorderSide(
            color: Colors.deepPurple, // Borde morado
            width: 2, // Ancho del borde
          ),
        ),
      ),
      child: const Text(
        "Go Back",
        style: TextStyle(
          color: Colors.deepPurple, // Color del texto morado
          fontSize: 20,
        ),
      ),
    );
  }
}
