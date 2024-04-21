import 'package:get/get.dart';

class CreateReportController extends GetX {
  final List<String> clientName = [
    'Client 1',
    'Client 2'
  ]; //obtener de los createcliente en coordinator

  String selectedClientName = '';

  CreateReportController({required super.builder});

  void handleSelection(String newClient) {
    selectedClientName = newClient;
  }
}
