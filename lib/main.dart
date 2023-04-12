import 'package:flutter/material.dart';
import 'package:viva_t_2/Multi_table/Multi_table.dart';
import 'package:viva_t_2/Multi_table/Show_table.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/':(context) => Multi_table(),
      'show':(context) => Show_table(),

    },
  ));
}
