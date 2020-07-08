import 'package:coffee_brew/models/user.dart';
import 'package:coffee_brew/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:coffee_brew/screens/wrapper.dart';
import 'package:provider/provider.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}