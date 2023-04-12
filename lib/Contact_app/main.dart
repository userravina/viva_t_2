import 'package:flutter/material.dart';
import 'package:viva_t_2/Contact_app/Screen/Contacte_Screen.dart';
import 'package:viva_t_2/Contact_app/Screen/Home_Screen.dart';
import 'package:viva_t_2/Contact_app/Screen/add_Screen.dart';
import 'package:viva_t_2/Contact_app/Screen/user_Screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home_Screen(),
      'contacte': (context) => contacte(),
      'add_Screen': (context) => ViewProfile(),
       'user': (context) => Call_Screen(),
    },
  ));
}
