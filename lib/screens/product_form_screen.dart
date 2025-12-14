import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductFormScreen extends StatefulWidget {
  final Product? product;
  const ProductFormScreen({super.key, this.product});

  @override
  State<ProductFormScreen> createState() => _ProductFormScreenState();
}

class _ProductFormScreenState extends State<ProductFormScreen> {
  final _name = TextEditingController();
  final _qty = TextEditingController();
  final _price = TextEditingController();

  final _categories = [
    'Thực phẩm',
    'Gia dụng',
    'Đồ dùng học tập',
    'Điện tử',
    'Khác',
  ];

  String _category = 'Thực phẩm';
  DateTime _date = DateTime.now();

  @override
  void initState() {
    super.initState();
    final p = widget.product;
    if (p != null) {
      _name.text = p.name;
      _qty.text = p.quantity.toString();
      _price.text = p.price.toString();
      _category = p.category;
      _date = p.importDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Thêm sản phẩm' : 'Sửa sản phẩm'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            _field(_name, 'Tên sản phẩm'),
            const SizedBox(height: 12),

            DropdownButtonFormField<String>(
              value: _category,
              decoration: _decor('Loại sản phẩm'),
              items: _categories
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (v) => setState(() => _category = v!),
            ),

            const SizedBox(height: 12),
            _field(_qty, 'Số lượng', isNum: true),
            const SizedBox(height: 12),
            _field(_price, 'Giá', isNum: true),

            const SizedBox(height: 12),

            /// 📅 NGÀY NHẬP
            ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(color: Colors.grey),
              ),
              title: Text(
                DateFormat('dd/MM/yyyy').format(_date),
              ),
              trailing: const Icon(Icons.calendar_month),
              onTap: () async {
                final d = await showDatePicker(
                  context: context,
                  initialDate: _date,
                  firstDate: DateTime(2020),
                  lastDate: DateTime(2100),
                );
                if (d != null) setState(() => _date = d);
              },
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text('Lưu sản phẩm'),
              onPressed: () {
                final p = Product(
                  id: widget.product?.id ?? '',
                  name: _name.text,
                  category: _category,
                  quantity: int.parse(_qty.text),
                  price: double.parse(_price.text),
                  importDate: _date,
                );
                final pro = context.read<ProductProvider>();
                widget.product == null ? pro.add(p) : pro.update(p);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  InputDecoration _decor(String label) => InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
      );

  Widget _field(TextEditingController c, String label, {bool isNum = false}) {
    return TextField(
      controller: c,
      keyboardType: isNum ? TextInputType.number : null,
      decoration: _decor(label),
    );
  }
}
