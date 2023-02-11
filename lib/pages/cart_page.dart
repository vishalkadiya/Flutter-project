import 'package:flutter/material.dart';
import 'package:flutter_first_project/models/cart.dart';
import 'package:flutter_first_project/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.color(MyTheme.blueColor).make(),
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        children: [
          VxBuilder(
            mutations: {RemoveMutation},
            builder: (context, store, status) => "\$${_cart.totalPrice}"
                .text
                .xl5
                .color(context.theme.colorScheme.secondary)
                .make()
                .px20(),
          ),
          50.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Buing not supproted yet".text.make(),
              ));
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                MyTheme.blueColor,
              ),
              shape: MaterialStateProperty.all(StadiumBorder()),
            ),
            child: "Buy".text.color(Colors.white).make(),
          ).wh(170, 50)
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  final CartModel _cart = (VxState.store as MyStore).cart;
  @override
  Widget build(BuildContext context) {
    var listen = VxState.watch(context, on: [RemoveMutation]);
    return _cart.items.isEmpty
        ? "Nothing to show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: () {
                  RemoveMutation(_cart.items[index]);
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}
