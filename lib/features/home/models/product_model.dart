class ProductModel {
  final String id;
  final String name;
  final String category; // (ماتشا، آيس تي، قهوة وتقطير، حلويات)
  final double price;
  final String imagePlaceholder;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.imagePlaceholder,
  });
}
