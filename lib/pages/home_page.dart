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
    // await Future.delayed(Duration(seconds: 2));
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
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
              ? GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // display 2 column in one row
                    mainAxisSpacing: 16, // give space between two row
                    crossAxisSpacing: 16, // give space between two column
                  ),
                  itemBuilder: (context, index) {
                    final item = CatalogModel.items[index];
                    return Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: GridTile(
                            header: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                              ),
                              child: Text(
                                item.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            // footer: Text(item.price.toString()),
                            footer: Container(
                              padding: const EdgeInsets.all(12),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                              ),
                              child: Text(
                                item.price.toString(),
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            child: Image.network(item.image)));
                  },
                  itemCount: CatalogModel.items.length,
                )
              // ? ListView.builder(
              //     // itemCount: CatalogModel.items.length,
              //     itemCount: CatalogModel.items.length,
              //     itemBuilder: (context, index) {
              //       return ItemWidget(
              //         // item: CatalogModel.items[index],
              //         item: CatalogModel.items[index],
              //       );
              //     },
              //   )
              : const Center(
                  child: CircularProgressIndicator(),
                )),
      drawer: MyDrawer(),
    );
  }
}
