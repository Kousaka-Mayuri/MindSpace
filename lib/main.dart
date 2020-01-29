import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_mindspace/loginAndRegisterPage/theFirstPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
        title: ("Mind Space"),
      home:HomePage(),
    );
  }
}

class HomePage extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
      return Scaffold(
          body:Container(
            child: Login(),
      )
    );
  }
}




