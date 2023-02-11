import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_first_project/core/store.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../models/cart.dart';
import '../../models/catalog.dart';
import '../themes.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;

  const AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listen = VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    // final CatalogModel _catalog = (VxState.store as MyStore).catalog;

    bool isInCart = _cart.items.contains(catalog);

    return ElevatedButton(
        onPressed: () {
          if (!isInCart) {
            // final _catalog = CatalogModel();
            // isInCart = isInCart.toggle();
            // _cart.catalog = _catalog;
            // _cart.add(catalog);
            AddMutation(catalog);
            // setState(() {});
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            MyTheme.blueColor,
          ),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        child: isInCart
            ? const Icon(Icons.done)
            : Icon(CupertinoIcons.cart_badge_plus));
  }
}
