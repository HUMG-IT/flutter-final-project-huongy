import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:minii_shop/models/product.dart';
import 'package:minii_shop/providers/product_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late ProductProvider provider;

  setUp(() async {
    SharedPreferences.setMockInitialValues({});

    provider = ProductProvider();
  });

  test('Thêm sản phẩm', () async {
    final product = Product(
      id: '',
      name: 'Test',
      category: 'A',
      quantity: 10,
      price: 1000,
      importDate: DateTime.now(),
    );

    await provider.add(product);

    expect(provider.products.length, 1);
    expect(provider.totalQuantity, 10);
  });

  test('Xóa sản phẩm', () async {
    final product = Product(
      id: '',
      name: 'Delete',
      category: 'B',
      quantity: 5,
      price: 2000,
      importDate: DateTime.now(),
    );

    await provider.add(product);
    final id = provider.products.first.id;

    await provider.delete(id);

    expect(provider.products.isEmpty, true);
  });

  test('Tính tổng giá trị kho', () async {
    await provider.add(Product(
      id: '',
      name: 'A',
      category: 'A',
      quantity: 2,
      price: 1000,
      importDate: DateTime.now(),
    ));

    await provider.add(Product(
      id: '',
      name: 'B',
      category: 'B',
      quantity: 3,
      price: 2000,
      importDate: DateTime.now(),
    ));

    expect(provider.totalValue, 2 * 1000 + 3 * 2000);
  });
}
