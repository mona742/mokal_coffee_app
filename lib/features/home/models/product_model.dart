class ProductModel {
  final int id;
  final String name;
  final String category; // 'matcha', 'coffee', 'cold', 'sweets'
  final double price;
  final String description;
  final String iconName;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.description,
    required this.iconName,
  });
}
