import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/ui/pages/coordinator/main_uc.dart';
import 'package:project/ui/pages/coordinator/us_admin/createUS.dart';
import 'package:project/ui/pages/coordinator/us_admin/deleteUS.dart';
import 'package:project/ui/pages/coordinator/us_admin/updateUS.dart';

class AdminPageUS extends StatefulWidget {
  const AdminPageUS({super.key, required this.email});
  final String email;

  @override
  _AdminPageUSState createState() => _AdminPageUSState();
}

class _AdminPageUSState extends State<AdminPageUS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 50, 20.0, 12.0),
          child: SingleChildScrollView(
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
                  'Administration for US',
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Divider(
                  height: 44,
                  thickness: 1,
                  indent: 24,
                  endIndent: 24,
                  color: Theme.of(context).dividerColor,
                ),
                const SizedBox(
                  height: 50,
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: _buildCustomCard(
                      'Add an US',
                      onTap: () {
                        Get.to(() => CreateUser(email: widget.email));
                      },
                      icon: Icons.person_add,
                    )),
                    const SizedBox(width: 25),
                    Expanded(
                        child: _buildCustomCard(
                      'Update an US',
                      onTap: () {
                        Get.to(() => UpdateUS(email: widget.email));
                      },
                      icon: Icons.create_rounded,
                    )),
                    const SizedBox(width: 25),
                    Expanded(
                        child: _buildCustomCard(
                      'Remove an US',
                      onTap: () {
                        Get.to(() => deleteUS(email: widget.email), arguments: [widget.email]);
                      },
                      icon: Icons.group_remove,
                    )),
                  ],
                ),
                const SizedBox(
                  height: 70,
                ),
                ElevatedButton(
                  key: const Key('ButtonGoBack'),
                  onPressed: () {
                    Get.to(() => MainPageUC(email: widget.email));
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.deepPurple), // Color morado
                    padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical:
                              12), // Ajusta el padding según sea necesario
                    ),
                    shape: WidgetStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Borde suavizado
                      ),
                    ),
                  ),
                  child: const Text(
                    "Go Back",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24), // Color del texto blanco
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCustomCard(String title,
      {required VoidCallback onTap, required IconData icon}) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  icon,
                  size: 60,
                  color: Colors.deepPurple,
                ),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
