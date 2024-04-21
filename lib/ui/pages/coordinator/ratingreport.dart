import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingReport extends StatefulWidget {
  const RatingReport({super.key});

  @override
  _RatingReportState createState() => _RatingReportState();
}

class _RatingReportState extends State<RatingReport> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  DateTime? _selectedDate, _selectedDateI, _selectedDateF;
  double _rating = 3;

  bool _isExpanded = false;

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
                  'REPORT #[ID] FROM [US USERNAME]',
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
                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Client ID',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              45, 0, 10, 0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter Client ID',
                              hintStyle: const TextStyle(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                                fontSize: 16,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Date',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              70, 0, 10, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                _selectDate(
                                    context); // Función para abrir el selector de fecha
                              },
                              child: Text(
                                _selectedDate != null
                                    ? DateFormat('yyyy-MM-dd')
                                        .format(_selectedDate!)
                                    : 'Select Date',
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.black,
                                  letterSpacing: 0,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                          child: TextFormField(
                            maxLines: 2,
                            decoration: InputDecoration(
                              hintText: 'Description',
                              hintStyle: const TextStyle(
                                fontFamily: 'Readex Pro',
                                letterSpacing: 0,
                                fontSize: 16,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 40, horizontal: 12),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  color: Colors.blue,
                                  width: 2,
                                ),
                              ),
                            ),
                            style: const TextStyle(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Start time',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              65, 0, 10, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                _selectDateI(
                                    context); // Función para abrir el selector de fecha
                              },
                              child: Text(
                                _selectedDateI != null
                                    ? DateFormat('yyyy-MM-dd')
                                        .format(_selectedDateI!)
                                    : 'Select Date',
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.black,
                                  letterSpacing: 0,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'End time',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontFamily: 'Readex Pro',
                              letterSpacing: 0,
                            ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              70, 0, 10, 0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () {
                                _selectDateF(
                                    context); // Función para abrir el selector de fecha
                              },
                              child: Text(
                                _selectedDateF != null
                                    ? DateFormat('yyyy-MM-dd')
                                        .format(_selectedDateF!)
                                    : 'Select Date',
                                style: const TextStyle(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.black,
                                  letterSpacing: 0,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 800,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Rate   ',
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0,
                            fontSize: 18),
                      ),
                      RatingBar.builder(
                        onRatingUpdate: (newValue) {
                          setState(() {
                            _rating =
                                newValue; // Actualiza el valor del rating cuando cambia
                          });
                        },
                        itemBuilder: (context, index) => Icon(
                          Icons.star_rounded,
                          color: Theme.of(context).primaryColor,
                        ),
                        direction: Axis.horizontal,
                        initialRating:
                            _rating, // Utiliza el valor del rating definido
                        itemCount: 5,
                        itemSize: 50,
                        glowColor: Theme.of(context).primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  key: const Key('ButtonSubmit'),
                  onPressed: () {
                    Get.back();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Colors.purple), // Color morado
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical:
                              12), // Ajusta el padding según sea necesario
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(8), // Borde suavizado
                      ),
                    ),
                  ),
                  child: const Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30), // Color del texto blanco
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                OutlinedButton(
                  key: const Key('ButtonGoBack'),
                  onPressed: () {
                    Get.back();
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
                        color: Colors.purple, // Borde morado
                        width: 2, // Ancho del borde
                      ),
                    ),
                  ),
                  child: const Text(
                    "Go Back",
                    style: TextStyle(
                      color: Colors.purple, // Color del texto morado
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ??
          DateTime
              .now(), // Fecha inicial (hoy si no hay ninguna fecha seleccionada)
      firstDate: DateTime(1900), // Fecha mínima
      lastDate: DateTime(2100), // Fecha máxima
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate; // Actualiza la fecha seleccionada
      });
    }
  }

  void _selectDateI(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateI ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDateI = pickedDate; // Actualiza la fecha seleccionada
      });
    }
  }

  void _selectDateF(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDateF ??
          DateTime
              .now(), // Fecha inicial (hoy si no hay ninguna fecha seleccionada)
      firstDate: DateTime(1900), // Fecha mínima
      lastDate: DateTime(2100), // Fecha máxima
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDateF = pickedDate; // Actualiza la fecha seleccionada
      });
    }
  }
}
