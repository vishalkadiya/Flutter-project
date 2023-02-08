import 'package:flutter/material.dart';
import 'package:flutter_first_project/models/catalog.dart';
import 'package:flutter_first_project/widgets/drawer.dart';

import '../widgets/item_widget.dart';

class HomePage extends StatelessWidget {
  final int days = 40;
  final String name = "vishal";

  @override
  Widget build(BuildContext context) {
    final dumyList =
        List.generate(26, (index) => CatalogModel.items[0]); // copy of list

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PSM 100",
        ),
      ),
      body: ListView.builder(
        // itemCount: CatalogModel.items.length,
        itemCount: dumyList.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            // item: CatalogModel.items[index],
            item: dumyList[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
