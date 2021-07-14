import 'package:flutter/material.dart';
import './ui/home.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Body Mass Index',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: BMIHome()
    )
  );
}