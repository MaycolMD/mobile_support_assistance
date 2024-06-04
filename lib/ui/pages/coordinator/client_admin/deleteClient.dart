import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/domain/entities/user_client.dart';

import 'package:project/ui/controllers/client/client_controller.dart';
import 'package:project/ui/pages/coordinator/client_admin/client_admin_page.dart';

import '../../../../widgets/submit_button.dart';
import '../../../../widgets/text_field.dart';

class DeleteClient extends StatefulWidget {
  const DeleteClient({super.key, required this.email});
  final String email;

  @override
  State<DeleteClient> createState() => _deleteClientState();
}

class _deleteClientState extends State<DeleteClient> {
  final ClientController controller = Get.put(ClientController());
  Future<void>? clientNamesFuture;
  String selectedclient = '';
  final _formKey = GlobalKey<FormState>();

  bool showUserDataInput = false;

  final userIdController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    clientNamesFuture = controller.getClientsName().then((_) {
      if (controller.clientsNameList.isNotEmpty) {
        setState(() {
          selectedclient = controller.clientsNameList.first;
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
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder<void>(
          future: clientNamesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              List<String> clientsName = controller.clientsNameList;
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
                              'REMOVE A CLIENT USER',
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
                                        color: Colors
                                            .deepPurple, // Color del borde
                                        width: 2.0, // Ancho del borde
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          8.0), // Radio de los bordes
                                    ),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<String>(
                                        value: selectedclient,
                                        icon: const Icon(Icons.arrow_downward),
                                        isExpanded:
                                            true, // Asegura que el DropdownButton ocupe todo el ancho del SizedBox
                                        items: clientsName
                                            .map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Center(child: Text(value)),
                                          );
                                        }).toList(),
                                        selectedItemBuilder:
                                            (BuildContext context) {
                                          return clientsName
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
                                            selectedclient = value!;
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
                                      UserClient? user = await controller
                                          .getClientByName(selectedclient);

                                      userIdController.text =
                                          user!.id.toString();
                                      nameController.text = user.name;

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
        ));
  }

  Widget buildGoBackButton() {
    return OutlinedButton(
      key: const Key('ButtonGoBack'),
      onPressed: () {
        // Limpiar el controlador asociado a UpdateUS antes de navegar de regreso
        Get.delete<ClientController>();
        Get.to(() => AdminPageClient(email: widget.email));
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
          const SizedBox(height: 50),
          buildSubmitButton(
            onPressed: () {
              print(int.parse(userIdController.text));
              print(nameController.text);

              controller.deleteClient(int.parse(userIdController.text));

              Get.delete<ClientController>();
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
