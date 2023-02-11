// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_first_project/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_first_project/models/catalog.dart';
import 'package:flutter_first_project/pages/home_detail.dart';
import 'package:flutter_first_project/widgets/themes.dart';

import 'catalog_image.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          final catalog = CatalogModel.items[index];
          // final catalog = CatalogModel.getByPosition(index);
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(catalog: catalog))),
            child: CatalogItem(
              catalog: catalog,
            ),
          );
        });
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;

  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Hero(
          tag: Key(catalog.id.toString()),
          child: CatalogImage(
            image: catalog.image,
          ),
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catalog.name.text.lg.color(MyTheme.blueColor).bold.make(),
            catalog.desc.text.textStyle(context.captionStyle).make(),
            const SizedBox(
              height: 10,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              // buttonPadding: Vx.mH16,
              children: [
                "\$${catalog.price}".text.bold.xl.make(),
                _AddToCart(catalog: catalog)
              ],
            ).pOnly(right: 8)
          ],
        ))
      ],
    )).white.roundedLg.square(160).make().py8();
  }
}

class _AddToCart extends StatefulWidget {
  const _AddToCart({
    Key? key,
    required this.catalog,
  }) : super(key: key);

  final Item catalog;

  @override
  State<_AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<_AddToCart> {
  bool isAdded = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        isAdded = isAdded.toggle();
        final _catalog = CatalogModel();
        final _cart = CartModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);
        setState(() {});
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          MyTheme.blueColor,
        ),
        shape: MaterialStateProperty.all(StadiumBorder()),
      ),
      child: isAdded ? const Icon(Icons.done) : "Add to cart".text.make(),
    );
  }
}
