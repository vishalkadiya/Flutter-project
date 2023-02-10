import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_first_project/widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        "Shop".text.xl5.bold.color(MyTheme.blueColor).make(),
        "Trending products".text.xl2.make(),
      ],
    );
  }
}
