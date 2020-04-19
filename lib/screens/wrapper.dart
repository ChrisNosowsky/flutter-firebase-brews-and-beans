import 'package:coffee_brew/screens/authenticate/authenticate.dart';
import 'package:coffee_brew/screens/home/home.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // return Home or Authenticate widget
    return Authenticate();
  }
}