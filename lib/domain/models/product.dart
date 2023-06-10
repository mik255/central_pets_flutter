class Product {
  String name;
  String description;
  String image;
  double price;
  int count;

  Product({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.count,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'],
      description: json['description'],
      image: json['image'],
      price: json['price'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'count': count,
    };
  }
}
