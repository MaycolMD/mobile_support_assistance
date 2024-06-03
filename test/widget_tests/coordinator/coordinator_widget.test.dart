import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:project/ui/pages/coordinator/main_uc.dart';

void main() {
  group('MainPageUC Widget Test', () {
    setUpAll(() {
      // Test enviroment
      Get.testMode = true;
    });

    testWidgets('MainPageUC receives and displays email argument',
        (WidgetTester tester) async {

      String testEmail = 'test@example.com';

      await tester.pumpWidget(MaterialApp(
        home: MainPageUC(email: testEmail),
      ));
      await tester.pumpAndSettle();
      expect(find.text('Coordinator'), findsOneWidget);
    });

    
  });
}
