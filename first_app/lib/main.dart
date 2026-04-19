import 'package:flutter/material.dart';
import 'package:first_app/gradient_container.dart';

void main() {
  const color1 = Colors.amber;
  const color2 = Colors.blue;
  runApp(const MaterialApp(home: Scaffold(body: GradientContainer(color1, color2))));
}
