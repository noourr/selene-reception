import 'package:flutter/material.dart';
import '../screens/case_registration_screen/view/case_registration_page.dart';

class SeleneReceptionApp extends StatelessWidget {
  const SeleneReceptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Selene Reception',
      home: const CaseRegistrationPage(),
      
    );
  }
}
