import 'package:assignment_test/api/shared_pref.dart';
import 'package:assignment_test/constants/color.dart';
import 'package:assignment_test/home.dart';
import 'package:flutter/material.dart';

import 'api/apiservices.dart';
import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: FutureBuilder<bool?>(
          future: SharedPref.isLoggedIn(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Error"));
            } else {
              if (snapshot.data != null) {
                return HomeScreen();
              } else {
                return const LoginScreen();
              }
            }
          }),
    );
  }
}

