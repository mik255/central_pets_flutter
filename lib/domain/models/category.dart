class Category {
  String name;
  String description;
  String image;

  Category({
    required this.name,
    required this.description,
    required this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map toJson() {
    return {
      'name': name,
      'description': description,
      'image': image,
    };
  }
}
