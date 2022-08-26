import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:project01/screens/home.dart';
import 'package:project01/search.dart';
import 'package:project01/bottom_navigation.dart';
import 'package:project01/splash.dart';
import 'package:project01/wordsJSON.dart';
import 'package:project01/screens/favoritePage.dart';
import 'package:project01/search.dart';
import 'package:flutter/services.dart' show rootBundle;
 

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splash(),
    );
  }
}
