import 'package:flutter/material.dart';

import '../models/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});

  double get total => product.price * quantity;
}

class HomeViewModel extends ChangeNotifier {
  String _selectedCategory = 'all';
  String _searchQuery = '';

  final List<CartItem> _cartItems = [];
  int _currentPoints = 45;
  bool _isRewardApplied = false;

  final List<ProductModel> _products = [
    ProductModel(
      id: 1,
      name: 'كوين ماتشا (Queen Matcha)',
      category: 'matcha',
      price: 16.00,
      description: 'شاي أخضر ياباني فاخر مع رغوة حليبية غنية',
      iconName: 'leaf',
    ),
    ProductModel(
      id: 2,
      name: 'آيس ماتشا فانيلا',
      category: 'matcha',
      price: 12.00,
      description: 'ماتشا مثلجة مع لمسة فانيلا ناعمة ومنعشة',
      iconName: 'water',
    ),
    ProductModel(
      id: 3,
      name: 'كلاود ماتشا',
      category: 'matcha',
      price: 16.00,
      description: 'ماتشا بطبقة رغوة السحاب الكريمية المميزة',
      iconName: 'cloud',
    ),
    ProductModel(
      id: 4,
      name: 'بلو ماتشا',
      category: 'matcha',
      price: 16.00,
      description: 'ماتشا زرقاء بخلطة خاصة ومنعشة',
      iconName: 'droplet',
    ),
    ProductModel(
      id: 5,
      name: 'موهيتو مكال',
      category: 'cold',
      price: 9.00,
      description: 'موهيتو منعش بنكهة النعناع والليمون الأصلي',
      iconName: 'local_bar',
    ),
    ProductModel(
      id: 6,
      name: 'بلو موهيتو',
      category: 'cold',
      price: 12.00,
      description: 'موهيتو أزرق مثلج بنكهة استوائية فريدة',
      iconName: 'icecream',
    ),
    ProductModel(
      id: 7,
      name: 'كركديه صغير',
      category: 'cold',
      price: 6.00,
      description: 'مشروب كركديه بارد ومنعش (حجم صغير)',
      iconName: 'local_drink',
    ),
    ProductModel(
      id: 8,
      name: 'كركديه وسط',
      category: 'cold',
      price: 8.00,
      description: 'مشروب كركديه بارد ومنعش (حجم وسط)',
      iconName: 'local_drink',
    ),
    ProductModel(
      id: 9,
      name: 'كركديه كبير',
      category: 'cold',
      price: 12.00,
      description: 'مشروب كركديه بارد ومنعش (حجم كبير)',
      iconName: 'local_drink',
    ),
    ProductModel(
      id: 10,
      name: 'بوكس كركديه',
      category: 'cold',
      price: 30.00,
      description: 'بوكس حفلات كركديه بارد (يكفي عدة أشخاص)',
      iconName: 'card_giftcard',
    ),
    ProductModel(
      id: 11,
      name: 'ايس تي',
      category: 'cold',
      price: 36.00,
      description: 'ايس تي منعش ومميز بمذاق الفواكه الصيفية',
      iconName: 'emoji_food_beverage',
    ),
    ProductModel(
      id: 12,
      name: 'V60',
      category: 'coffee',
      price: 10.00,
      description: 'قهوة تقطير سوداء بمحاصيل فاخرة',
      iconName: 'coffee',
    ),
    ProductModel(
      id: 13,
      name: 'V60 كبير',
      category: 'coffee',
      price: 12.00,
      description: 'قهوة تقطير سوداء (حجم كبير)',
      iconName: 'coffee',
    ),
    ProductModel(
      id: 14,
      name: 'V60 ديكاف',
      category: 'coffee',
      price: 16.00,
      description: 'تقطير بدون كافيين بمذاق غني وعطري',
      iconName: 'coffee',
    ),
    ProductModel(
      id: 15,
      name: 'قهوة صغير',
      category: 'coffee',
      price: 6.00,
      description: 'قهوة الفلتر الطازجة اليومية (حجم صغير)',
      iconName: 'free_breakfast',
    ),
    ProductModel(
      id: 16,
      name: 'قهوة (وسط)',
      category: 'coffee',
      price: 8.00,
      description: 'قهوة الفلتر الطازجة اليومية (حجم وسط)',
      iconName: 'free_breakfast',
    ),
    ProductModel(
      id: 17,
      name: 'قهوة اليوم كبير',
      category: 'coffee',
      price: 12.00,
      description: 'قهوة الفلتر الطازجة اليومية (حجم كبير)',
      iconName: 'free_breakfast',
    ),
    ProductModel(
      id: 18,
      name: 'بوكس قهوة اليوم',
      category: 'coffee',
      price: 34.00,
      description: 'بوكس قهوة اليوم الدافئة مع الأكواب والإضافات',
      iconName: 'all_inclusive',
    ),
    ProductModel(
      id: 19,
      name: 'بوكس قهوة اليوم 2 لتر',
      category: 'coffee',
      price: 44.00,
      description: 'بوكس قهوة يومية بحجم 2 لتر للمناسبات',
      iconName: 'all_inclusive',
    ),
    ProductModel(
      id: 20,
      name: 'كوكيز',
      category: 'sweets',
      price: 6.00,
      description: 'كوكيز طازج برقائق الشوكولاتة البلجيكية',
      iconName: 'cookie',
    ),
    ProductModel(
      id: 21,
      name: 'براوني',
      category: 'sweets',
      price: 6.00,
      description: 'كيكة براوني غنية بالشوكولاتة الداكنة',
      iconName: 'cake',
    ),
    ProductModel(
      id: 22,
      name: 'بودينج',
      category: 'sweets',
      price: 9.50,
      description: 'بودينج كريمي ناعم بنكهة الفانيلا والكراميل',
      iconName: 'dessert',
    ),
    ProductModel(
      id: 23,
      name: 'تشيز كيك توت',
      category: 'sweets',
      price: 14.00,
      description: 'تشيز كيك نيويوركي بصوص التوت البري الطازج',
      iconName: 'bakery_dining',
    ),
    ProductModel(
      id: 24,
      name: 'تشيز كيك شوكلت',
      category: 'sweets',
      price: 14.00,
      description: 'تشيز كيك غني بطبقات الشوكولاتة الفاخرة',
      iconName: 'bakery_dining',
    ),
    ProductModel(
      id: 25,
      name: 'تشيز كيك بيكان',
      category: 'sweets',
      price: 14.00,
      description: 'تشيز كيك مع صوص الكراميل وجوز البيكان المحمص',
      iconName: 'bakery_dining',
    ),
    ProductModel(
      id: 26,
      name: 'تشيز كيك مدريد',
      category: 'sweets',
      price: 16.00,
      description: 'تشيز كيك محمص على الطريقة الإسبانية الأصلية',
      iconName: 'bakery_dining',
    ),
    ProductModel(
      id: 27,
      name: 'دولتشي',
      category: 'sweets',
      price: 16.00,
      description: 'حلوى الدولتشي الخاصة بمُكال الفاخرة',
      iconName: 'cake',
    ),
  ];

  String get selectedCategory => _selectedCategory;
  String get searchQuery => _searchQuery;
  List<CartItem> get cartItems => _cartItems;
  int get currentPoints => _currentPoints;
  bool get isRewardApplied => _isRewardApplied;

  List<ProductModel> get filteredProducts {
    return _products.where((p) {
      final matchesCategory =
          _selectedCategory == 'all' || p.category == _selectedCategory;
      final matchesSearch =
          p.name.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          p.description.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  void selectCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addToCart(ProductModel product) {
    final existingIndex = _cartItems.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingIndex >= 0) {
      _cartItems[existingIndex].quantity += 1;
    } else {
      _cartItems.add(CartItem(product: product));
    }
    notifyListeners();
  }

  void updateQuantity(int index, int delta) {
    _cartItems[index].quantity += delta;
    if (_cartItems[index].quantity <= 0) {
      _cartItems.removeAt(index);
    }
    notifyListeners();
  }

  double get subtotal {
    return _cartItems.fold(0, (sum, item) => sum + item.total);
  }

  double get discountAmount {
    if (!_isRewardApplied || _cartItems.isEmpty) return 0.0;
    final sortedItems = [..._cartItems]
      ..sort((a, b) => a.product.price.compareTo(b.product.price));
    return sortedItems.first.product.price;
  }

  double get deliveryFee {
    if (subtotal >= 50.0) return 0.0;
    return 15.0;
  }

  double get totalPrice {
    return (subtotal + deliveryFee - discountAmount).clamp(
      0.0,
      double.infinity,
    );
  }

  void toggleReward() {
    _isRewardApplied = !_isRewardApplied;
    notifyListeners();
  }

  void redeemPoints() {
    if (_currentPoints >= 65) {
      _currentPoints -= 65;
      _isRewardApplied = true;
      notifyListeners();
    }
  }
}
