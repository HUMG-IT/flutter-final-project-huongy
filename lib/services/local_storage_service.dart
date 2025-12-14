import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/product.dart';

class LocalStorageService {
  static const _key = 'products';

  Future<List<Product>> loadProducts() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(_key);
    if (data == null) return [];
    final List list = jsonDecode(data);
    return list.map((e) => Product.fromJson(e)).toList();
  }

  Future<void> saveProducts(List<Product> products) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      _key,
      jsonEncode(products.map((e) => e.toJson()).toList()),
    );
  }
}
