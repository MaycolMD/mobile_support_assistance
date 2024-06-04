import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_support.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/coordinator/us_admin/us_admin_page.dart';

import '../../../../widgets/submit_button.dart';
import '../../../../widgets/text_field.dart';

class deleteUS extends StatefulWidget {
  const deleteUS({super.key, required this.email});
  final String email;
  @override
  State<deleteUS> createState() => _deleteUSState();
}

class _deleteUSState extends State<deleteUS> {
  final USController controller = Get.put(USController());
  Future<void>? supportNamesFuture;
  String selectedSupport = '';
  final _formKey = GlobalKey<FormState>();

  bool showUserDataInput = false;

  final userIdController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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

  // Función para mostrar el widget de entrada de datos
  void showUserDataInputWidget() {
    setState(() {
      showUserDataInput = true;
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
                              color: Theme.of(context).colorScheme.surface,
                              size: 80,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'REMOVE A SUPPORT USER',
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
                            SizedBox(
                              width: 600.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.deepPurple, // Color del borde
                                    width: 2.0, // Ancho del borde
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      8.0), // Radio de los bordes
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedSupport,
                                    icon: const Icon(Icons.arrow_downward),
                                    isExpanded:
                                        true, // Asegura que el DropdownButton ocupe todo el ancho del SizedBox
                                    items: supportsName
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Center(child: Text(value)),
                                      );
                                    }).toList(),
                                    selectedItemBuilder:
                                        (BuildContext context) {
                                      return supportsName
                                          .map<Widget>((String value) {
                                        return Center(
                                          child: Text(
                                            value,
                                            style: const TextStyle(
                                              color: Colors
                                                  .black, // Estilo del texto del valor seleccionado
                                            ),
                                          ),
                                        );
                                      }).toList();
                                    },
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedSupport = value!;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: () async {
                                // Acción para el botón de la lupa

                                try {
                                  UserSupport? user = await controller
                                      .getSupportByName(selectedSupport);

                                  userIdController.text = user!.id.toString();
                                  nameController.text = user.name;
                                  emailController.text = user.email;
                                  passwordController.text = user.password;

                                  showUserDataInputWidget();
                                } catch (e) {
                                  Get.snackbar('Error',
                                      'No se pudo obtener los datos del usuario. Error: $e');
                                }
                              },
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        buildUserDataInputWidget(),
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
        // Limpiar el controlador asociado a UpdateUS antes de navegar de regreso
        Get.delete<USController>();
        Get.to(
          () => AdminPageUS(email: widget.email),
        );
      },
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 12,
          ),
        ),
        shape: WidgetStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        side: WidgetStateProperty.all<BorderSide>(
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

  // Widget para mostrar los datos de entrada
  Widget buildUserDataInputWidget() {
    if (showUserDataInput) {
      return Column(
        children: [
          buildTextField('US_ID', userIdController, userIdController.text,
              isEditable: false),
          const SizedBox(height: 20),
          buildTextField('Name', nameController, nameController.text,
              isEditable: false),
          const SizedBox(height: 20),
          buildTextField('Email', emailController, emailController.text,
              isEditable: false),
          const SizedBox(height: 20),
          buildTextField(
            'Password',
            passwordController,
            passwordController.text,
            isEditable: false,
            isObscureText: true,
          ),
          const SizedBox(height: 50),
          buildSubmitButton(
            onPressed: () {
              print(int.parse(userIdController.text));
              print(nameController.text);

              controller.deleteSupport(int.parse(userIdController.text));

              Get.delete<USController>();
              Get.back();
            },
          ),
        ],
      );
    } else {
      return const Column(
        children: [],
      );
    }
  }
}
