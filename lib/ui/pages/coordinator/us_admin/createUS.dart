import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/controllers/user_support/us_controller.dart';
import 'package:project/ui/pages/coordinator/us_admin/us_admin_page.dart';
import '../../../../widgets/text_field.dart';
import '../../../../widgets/submit_button.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key, required this.email});
  final String email;

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();

  final USController controller = Get.put(USController());

  var userIdController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                  buildTextField('US_ID', userIdController, 'Enter User ID'),
                  const SizedBox(height: 20),
                  buildTextField('Name', nameController, 'Enter Name'),
                  const SizedBox(height: 20),
                  buildTextField('Email', emailController, 'Enter Email'),
                  const SizedBox(height: 20),
                  buildTextField(
                      'Password', passwordController, 'Enter Password',
                      isObscureText: true),
                  const SizedBox(
                    height: 50,
                  ),
                  buildSubmitButton(onPressed: () {
                    controller.createSupportUser(
                        int.parse(userIdController.text),
                        nameController.text,
                        emailController.text,
                        passwordController.text);

                    Get.delete<USController>();
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
      onPressed: () async {
        Get.to(() => AdminPageUS(email: widget.email));
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
