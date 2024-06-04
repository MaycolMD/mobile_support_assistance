import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:project/ui/controllers/login_controller.dart';
import 'package:project/ui/pages/login/login.dart';

// Crear un Mock para LoginController
class MockLoginController extends GetxService
    with Mock
    implements LoginController {
  @override
  final emailController = TextEditingController();
  @override
  final passwordController = TextEditingController();

  @override
  Future<void> validateLogin() async {
    String email = emailController.text;
    String password = passwordController.text;
    print('email: $email, password: $password');
  }
}

void main() {
  testWidgets('Login widget test', (WidgetTester tester) async {
    final mockController = MockLoginController();
    Get.put<LoginController>(mockController);

    await tester.pumpWidget(const GetMaterialApp(home: Login()));
    await tester.pumpAndSettle();
    // Verificar que el widget inicial tiene los textos esperados
    expect(find.text('Your Support Assistance'), findsOneWidget);
    expect(find.byType(TextField), findsNWidgets(2));
    expect(find.byKey(const Key('ButtonLogin')), findsOneWidget);

    // Escribir en los TextFields
    await tester.enterText(find.byKey(const Key('email')), 'test@example.com');
    await tester.enterText(find.byKey(const Key('password')), 'password');

    expect(
        (find.byKey(const Key('email')).evaluate().single.widget as TextField)
            .controller
            ?.text,
        'test@example.com');
    expect(
        (find.byKey(const Key('password')).evaluate().single.widget
                as TextField)
            .controller
            ?.text,
        'password');

    // Pulsar el botón de inicio de sesión
    await tester.tap(find.byKey(const Key('ButtonLogin')));
    await tester.pumpAndSettle();
  });
}
