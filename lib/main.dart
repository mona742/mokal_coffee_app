import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'features/checkout/views/cart_checkout_screen.dart';
import 'features/home/view_models/home_view_model.dart';
import 'features/home/views/home_screen.dart';
import 'features/loyalty/views/loyalty_screen.dart';

void main() {
  runApp(const MokalCoffeeApp());
}

class MokalCoffeeApp extends StatelessWidget {
  const MokalCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => HomeViewModel())],
      child: MaterialApp(
        title: 'مُكال - قهوة مختصة',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        locale: const Locale('ar', 'SA'),
        home: const MainNavigationWrapper(),
      ),
    );
  }
}

class MainNavigationWrapper extends StatefulWidget {
  const MainNavigationWrapper({Key? key}) : super(key: key);

  @override
  State<MainNavigationWrapper> createState() => _MainNavigationWrapperState();
}

class _MainNavigationWrapperState extends State<MainNavigationWrapper> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const LoyaltyScreen(),
    const CartCheckoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        backgroundColor: AppColors.primaryEspresso,
        selectedItemColor: AppColors.accentNeonGold,
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.coffee), label: 'الرئيسية'),
          BottomNavigationBarItem(
            icon: Icon(Icons.military_tech),
            label: 'النقاط والمكافآت',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'سلة الطلبات',
          ),
        ],
      ),
    );
  }
}
