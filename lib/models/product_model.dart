class ProductModel {
  final int id;
  final String name;
  final double price;
  final double originalPrice;
  final int discountPercent;
  final String imageUrl;
  final String category;

  const ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.originalPrice,
    required this.discountPercent,
    required this.imageUrl,
    required this.category,
  });
}
