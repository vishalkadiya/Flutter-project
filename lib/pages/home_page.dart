// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_first_project/core/store.dart';
import 'package:flutter_first_project/models/cart.dart';
import 'package:flutter_first_project/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_first_project/models/catalog.dart';
import 'package:flutter_first_project/widgets/themes.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 40;

  final String name = "vishal";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

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

    // get data from url

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

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
    final _cart = (VxState.store as MyStore).cart; // store,
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, store, status) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            backgroundColor: MyTheme.blueColor,
            child: const Icon(
              CupertinoIcons.cart,
            ),
          ).badge(
              color: Vx.red500,
              size: 22,
              count: _cart.items.length,
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Vx.white,
              )),
        ),
        body: SafeArea(
          child: Container(
              padding: Vx.m24, // akhi screen ma card ne padding ape che
              child: Column(
                children: [
                  CatalogHeader(),
                  if (CatalogModel.items != null &&
                      CatalogModel.items.isNotEmpty)
                    const CatalogList().py24().expand()
                  // const CatalogList().py64().expand() y axis ne padding ape che
                  else
                    Center(
                      child:
                          const CircularProgressIndicator().centered().py16(),
                    )
                ],
              )),
        ));
  }
}
