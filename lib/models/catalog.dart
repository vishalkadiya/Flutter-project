class Item {
  final String id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});
}

final products = [
  Item(
    id: "001",
    name: "iphone 14 pro",
    desc: "Apple iphone 14th genration mobile",
    price: 9999,
    color: "#33505a",
    image:
        "https://upload.wikimedia.org/wikipedia/commons/b/b5/Mahant_Swami_Maharaj.jpg",
  )
];
