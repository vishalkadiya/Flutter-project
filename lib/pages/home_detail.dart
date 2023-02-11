import 'package:flutter/material.dart';
import 'package:flutter_first_project/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_first_project/models/catalog.dart';
import 'package:flutter_first_project/widgets/themes.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          // buttonPadding: Vx.mH16,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: Column(
                  children: [
                    catalog.name.text.xl4.color(MyTheme.blueColor).bold.make(),
                    catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ).py64(), // product details ma vetical y axis ne ape che
              ),
            ))
          ],
        ),
      ),
    );
  }
}
