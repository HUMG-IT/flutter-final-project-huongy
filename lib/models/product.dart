class Product {
  final String id;
  final String name;
  final String category;
  final int quantity;
  final double price;
  final DateTime importDate;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.quantity,
    required this.price,
    required this.importDate,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      category: json['category'],
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
      importDate: DateTime.parse(json['importDate']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'category': category,
        'quantity': quantity,
        'price': price,
        'importDate': importDate.toIso8601String(),
      };
}
