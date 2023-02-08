import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_project/models/catalog.dart';
import 'package:flutter_first_project/widgets/drawer.dart';
import 'dart:convert';
import '../widgets/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 40;

  final String name = "vishal";

  get decodedData => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    // List<Item> list = List.from(productsData)
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
    // print(productsData);
  }

  @override
  Widget build(BuildContext context) {
    // final dumyList = List.generate(26, (index) => CatalogModel.items[0]); // copy of list

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "PSM 100",
        ),
      ),
      body: ListView.builder(
        // itemCount: CatalogModel.items.length,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            // item: CatalogModel.items[index],
            item: CatalogModel.items[index],
          );
        },
      ),
      drawer: MyDrawer(),
    );
  }
}
