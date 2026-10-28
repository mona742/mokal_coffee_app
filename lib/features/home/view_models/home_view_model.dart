import 'package:flutter/material.dart';

import '../models/product_model.dart';

class HomeViewModel extends ChangeNotifier {
  String _selectedCategory = 'الكل';

  final List<String> categories = [
    'الكل',
    'ماتشا وموهيتو',
    'أيس تي وكركديه',
    'قهوة وتقطير',
    'حلويات',
  ];

  // قائمة المنتجات المستخرجة من منيو مُكال الفعلي
  final List<ProductModel> _products = [
    // ماتشا وموهيتو
    const ProductModel(
      id: 'p1',
      name: 'كوين ماتشا',
      category: 'ماتشا وموهيتو',
      price: 16.0,
      imagePlaceholder: '🍵',
    ),
    const ProductModel(
      id: 'p2',
      name: 'بلو ماتشا',
      category: 'ماتشا وموهيتو',
      price: 16.0,
      imagePlaceholder: '🍵',
    ),
    const ProductModel(
      id: 'p3',
      name: 'آيس ماتشا فانيلا',
      category: 'ماتشا وموهيتو',
      price: 16.0,
      imagePlaceholder: '🍵',
    ),
    const ProductModel(
      id: 'p4',
      name: 'كلاود ماتشا',
      category: 'ماتشا وموهيتو',
      price: 12.0,
      imagePlaceholder: '🍵',
    ),
    const ProductModel(
      id: 'p5',
      name: 'بلو موهيتو',
      category: 'ماتشا وموهيتو',
      price: 12.0,
      imagePlaceholder: '🍹',
    ),
    const ProductModel(
      id: 'p6',
      name: 'موهيتو مكال',
      category: 'ماتشا وموهيتو',
      price: 9.0,
      imagePlaceholder: '🍹',
    ),

    // أيس تي وكركديه
    const ProductModel(
      id: 'p7',
      name: 'كركديه صغير',
      category: 'أيس تي وكركديه',
      price: 6.0,
      imagePlaceholder: '🌺',
    ),
    const ProductModel(
      id: 'p8',
      name: 'كركديه كبير',
      category: 'أيس تي وكركديه',
      price: 8.0,
      imagePlaceholder: '🌺',
    ),
    const ProductModel(
      id: 'p9',
      name: 'آيس تي',
      category: 'أيس تي وكركديه',
      price: 12.0,
      imagePlaceholder: '🧊',
    ),
    const ProductModel(
      id: 'p10',
      name: 'بوكس كركديه',
      category: 'أيس تي وكركديه',
      price: 30.0,
      imagePlaceholder: '📦',
    ),

    // قهوة وتقطير
    const ProductModel(
      id: 'p11',
      name: 'V60 عادي',
      category: 'قهوة وتقطير',
      price: 10.0,
      imagePlaceholder: '☕️',
    ),
    const ProductModel(
      id: 'p12',
      name: 'V60 كبير',
      category: 'قهوة وتقطير',
      price: 12.0,
      imagePlaceholder: '☕️',
    ),
    const ProductModel(
      id: 'p13',
      name: 'V60 ديكاف',
      category: 'قهوة وتقطير',
      price: 16.0,
      imagePlaceholder: '☕️',
    ),
    const ProductModel(
      id: 'p14',
      name: 'قهوة اليوم (وسط)',
      category: 'قهوة وتقطير',
      price: 8.0,
      imagePlaceholder: '☕️',
    ),
    const ProductModel(
      id: 'p15',
      name: 'بوكس قهوة اليوم',
      category: 'قهوة وتقطير',
      price: 34.0,
      imagePlaceholder: '📦',
    ),

    // حلويات
    const ProductModel(
      id: 'p16',
      name: 'تشيز كيك توت',
      category: 'حلويات',
      price: 14.0,
      imagePlaceholder: '🍰',
    ),
    const ProductModel(
      id: 'p17',
      name: 'كوكيز براونيز',
      category: 'حلويات',
      price: 9.5,
      imagePlaceholder: '🍪',
    ),
    const ProductModel(
      id: 'p18',
      name: 'بودينق',
      category: 'حلويات',
      price: 6.0,
      imagePlaceholder: '🍮',
    ),
    const ProductModel(
      id: 'p19',
      name: 'تشيز كيك مدريد',
      category: 'حلويات',
      price: 16.0,
      imagePlaceholder: '🍰',
    ),
  ];

  String get selectedCategory => _selectedCategory;

  List<ProductModel> get filteredProducts {
    if (_selectedCategory == 'الكل') {
      return _products;
    }
    return _products.where((p) => p.category == _selectedCategory).toList();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
