import 'package:flutter/material.dart';
import './../../../widgets/text_field.dart';
import './../../../widgets/back_button.dart';
import './../../../widgets/submit_button.dart';

class CreateUser extends StatefulWidget {
  const CreateUser({super.key});

  @override
  _CreateUserState createState() => _CreateUserState();
}

class _CreateUserState extends State<CreateUser> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50, 20.0, 12.0),
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
                  'NEW REPORTING USER',
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
                buildTextField('US_ID', _userIdController, 'Enter User ID'),
                const SizedBox(height: 20),
                buildTextField('Name', _nameController, 'Enter Name'),
                const SizedBox(height: 20),
                buildTextField('Email', _emailController, 'Enter Email'),
                const SizedBox(height: 20),
                buildTextField(
                    'Password', _passwordController, 'Enter Password',
                    isObscureText: true),
                const SizedBox(
                  height: 50,
                ),
                buildSubmitButton(),
                const SizedBox(
                  height: 20,
                ),
                buildGoBackButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
