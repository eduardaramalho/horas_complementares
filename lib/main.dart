import 'package:flutter/material.dart';
import 'package:horas_complementares/modules/hours/presenter/actitivies_detail_page.dart';
import 'package:horas_complementares/modules/hours/presenter/actitivies_page.dart';
import 'package:horas_complementares/modules/hours/presenter/activities_form_page.dart';
import 'package:horas_complementares/modules/auth/presenter/login_page.dart';
import 'package:horas_complementares/modules/user/presenter/user_profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Montserrat'),
      home: LoginPage(),
    );
  }
}
