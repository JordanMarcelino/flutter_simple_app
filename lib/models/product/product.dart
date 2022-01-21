class Product {
  int id;
  String name;
  String desc;
  String image;
  int price;

  Product(
      {required this.name,
      required this.desc,
      required this.image,
      required this.price,
      required this.id});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'image': image,
      'price': price
    };
  }

  static Product fromJson(Map<String, dynamic>? json) => Product(
      name: json?['name'],
      desc: json?['desc'],
      image: json?['image'],
      price: json?['price'],
      id: json?['id']);
}
