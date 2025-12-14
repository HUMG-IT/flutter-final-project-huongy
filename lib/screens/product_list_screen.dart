import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../providers/theme_provider.dart';
import 'product_form_screen.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final p = context.watch<ProductProvider>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mini Shop',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => context.read<ThemeProvider>().toggle(),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue.shade300,
        child: const Icon(Icons.add),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const ProductFormScreen()),
        ),
      ),

      /// SCROLL TOÀN BỘ MÀN HÌNH
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            /// ---------- PHẦN TRÊN ----------
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// TÌM KIẾM
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Tìm kiếm sản phẩm',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onChanged: p.search,
                  ),

                  const SizedBox(height: 12),

                  /// LỌC LOẠI
                  Row(
                    children: [
                      const Icon(Icons.category),
                      const SizedBox(width: 8),
                      Expanded(
                        child: DropdownButtonFormField<String>(
                          value: p.selectedCategory,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          items: p.categories
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(e),
                                ),
                              )
                              .toList(),
                          onChanged: (v) => p.filter(v!),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  /// TỔNG THỐNG KÊ
                  Row(
                    children: [
                      _summaryCard(
                        title: 'Tổng số lượng',
                        value: p.totalQuantity.toString(),
                        icon: Icons.inventory,
                      ),
                      const SizedBox(width: 12),
                      _summaryCard(
                        title: 'Tổng giá trị',
                        value: '${p.totalValue.toStringAsFixed(0)} đ',
                        icon: Icons.attach_money,
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  /// 🔹 TIÊU ĐỀ DANH SÁCH
                  const Text(
                    'Danh sách sản phẩm',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),
                ],
              ),
            ),

            /// ---------- DANH SÁCH ----------
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, i) {
                  final e = p.products[i];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      title: Text(
                        e.name,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        '${e.category} | SL: ${e.quantity} | ${e.price} đ',
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => p.delete(e.id),
                      ),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductFormScreen(product: e),
                        ),
                      ),
                    ),
                  );
                },
                childCount: p.products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// CARD TỔNG
  Widget _summaryCard({
    required String title,
    required String value,
    required IconData icon,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.blue),
            const SizedBox(height: 8),
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
