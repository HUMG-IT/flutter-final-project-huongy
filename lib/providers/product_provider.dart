import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../models/product.dart';
import '../services/local_storage_service.dart';

class ProductProvider extends ChangeNotifier {
  final _storage = LocalStorageService();
  final _uuid = const Uuid();

  List<Product> _products = [];
  String _keyword = '';
  String _category = 'All';

  String get selectedCategory => _category;

  List<Product> get products {
    return _products.where((p) {
      final matchName = p.name.toLowerCase().contains(_keyword.toLowerCase());
      final matchCat = _category == 'All' || p.category == _category;
      return matchName && matchCat;
    }).toList();
  }

  int get totalQuantity => _products.fold(0, (s, p) => s + p.quantity);

  double get totalValue =>
      _products.fold(0, (s, p) => s + p.quantity * p.price);

  List<String> get categories => [
        'All',
        ...{..._products.map((e) => e.category)}
      ];

  Future<void> load() async {
    _products = await _storage.loadProducts();
    notifyListeners();
  }

  Future<void> add(Product p) async {
    _products.add(
      Product(
        id: _uuid.v4(),
        name: p.name,
        category: p.category,
        quantity: p.quantity,
        price: p.price,
        importDate: p.importDate,
      ),
    );
    await _storage.saveProducts(_products);
    notifyListeners();
  }

  Future<void> update(Product p) async {
    final i = _products.indexWhere((e) => e.id == p.id);
    if (i == -1) return;
    _products[i] = p;
    await _storage.saveProducts(_products);
    notifyListeners();
  }

  Future<void> delete(String id) async {
    _products.removeWhere((e) => e.id == id);
    await _storage.saveProducts(_products);
    notifyListeners();
  }

  void search(String k) {
    _keyword = k;
    notifyListeners();
  }

  void filter(String c) {
    _category = c;
    notifyListeners();
  }
}
