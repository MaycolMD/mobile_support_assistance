import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/pages/coordinator/us_admin/us_admin_page.dart';
import '../../../../widgets/text_field.dart';
import '../../../../widgets/back_button.dart';
import '../../../../widgets/submit_button.dart';
import '../../../controllers/coordinator/us.controller.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  String? email = Get.arguments[0];
  final FormControllers _controllers = FormControllers();

  @override
  Widget build(BuildContext context) {
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
                    'NEW SUPPORT USER',
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
                  const SizedBox(height: 20),
                  buildTextField(
                      'US_ID', _controllers.userIdController, 'Enter User ID'),
                  const SizedBox(height: 20),
                  buildTextField(
                      'Name', _controllers.nameController, 'Enter Name'),
                  const SizedBox(height: 20),
                  buildTextField(
                      'Email', _controllers.emailController, 'Enter Email'),
                  const SizedBox(height: 20),
                  buildTextField('Password', _controllers.passwordController,
                      'Enter Password',
                      isObscureText: true),
                  const SizedBox(
                    height: 50,
                  ),
                  buildSubmitButton(onPressed: () {
                    _controllers.createSupportUser(
                        int.parse(_controllers.userIdController.text),
                        _controllers.nameController.text,
                        _controllers.emailController.text,
                        _controllers.passwordController.text);
                    Get.back();
                  }),
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
