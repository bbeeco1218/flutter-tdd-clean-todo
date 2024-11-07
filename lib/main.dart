import 'package:flutter/material.dart';
import 'package:tdd_clean_flutter_todo/di/injection_container.dart';
import 'package:tdd_clean_flutter_todo/presentation/login/screen/login_screen.dart';

Future<void> main() async {
  await setupLocator();
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
      ),
      home: const LoginScreen(),
    );
  }
}
