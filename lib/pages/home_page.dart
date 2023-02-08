import 'package:flutter/material.dart';
import 'package:flutter_first_project/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  final int days = 40;
  final String name = "vishal";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PSM 100",
        ),
      ),
      body: Center(
        child: Container(
          child: Text("Welcome to $days days of flutter first project $name"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
