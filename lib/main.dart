import 'package:flutter/material.dart';
import 'package:netflix_clone/domain/core/const.dart';
import 'package:netflix_clone/presentation/home/homescreen.dart';
import 'package:netflix_clone/presentation/main_page/mainpage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: background,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: MainPage(),
    );
  }
}
