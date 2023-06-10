import 'package:event_driver_arch/domain/models/product.dart';

class StoryCategory {
  String name;
  List<Product> productList;
  bool isSelected;

  StoryCategory({
    required this.name,
    required this.productList,
    this.isSelected = false,
  });

  factory StoryCategory.fromJson(Map<String, dynamic> json) {
    return StoryCategory(
      name: json['name'],
      productList: (json['productList'] as List)
          .map((e) => Product.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'productList': productList.map((e) => e.toJson()).toList(),
      };
  StoryCategory copyWith({
    String? name,
    List<Product>? productList,
    bool? isSelected,
  }) {
    return StoryCategory(
      name: name ?? this.name,
      productList: productList ?? this.productList,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
