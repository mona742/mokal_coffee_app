import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/theme/app_theme.dart';
import 'features/loyalty/view_models/loyalty_view_model.dart';
import 'features/loyalty/views/loyalty_screen.dart';

void main() {
  runApp(const MokalCoffeeApp());
}

class MokalCoffeeApp extends StatelessWidget {
  const MokalCoffeeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => LoyaltyViewModel())],
      child: MaterialApp(
        title: 'مُكال - قهوة مختصة',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        locale: const Locale('ar', 'SA'),
        home: const LoyaltyScreen(),
      ),
    );
  }
}
