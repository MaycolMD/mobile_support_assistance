import 'package:flutter/material.dart';
import './../../../widgets/text_field.dart';
import './../../../widgets/back_button.dart';
import './../../../widgets/submit_button.dart';

class CreateClient extends StatefulWidget {
  const CreateClient({super.key});

  @override
  _CreateClientState createState() => _CreateClientState();
}

class _CreateClientState extends State<CreateClient> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

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
                  'NEW CLIENT',
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
                buildTextField(
                    'Client ID', _userIdController, 'Enter Client ID'),
                const SizedBox(
                  height: 20,
                ),
                buildTextField('Name', _nameController, 'Enter Name'),
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
