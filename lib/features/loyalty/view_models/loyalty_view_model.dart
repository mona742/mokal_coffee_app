import 'dart:math';

import 'package:flutter/material.dart';

import '../models/loyalty_model.dart';

class LoyaltyViewModel extends ChangeNotifier {
  // نموذج افتراضي للعميل (يمكن ربطه لاحقاً بـ Firebase Firestore)
  LoyaltyModel _loyalty = const LoyaltyModel(
    userId: "mokal_user_01",
    currentPoints: 65, // مُعيّنة على 65 تجريبياً لاختبار زر الاستبدال الفوري
    activeRedeemCodes: [],
  );

  bool _isLoading = false;

  LoyaltyModel get loyalty => _loyalty;
  bool get isLoading => _isLoading;

  /// دالة استبدال النقاط بمشروب مجاني وتوليد رمز الخصم
  Future<String?> redeemFreeDrink() async {
    if (!_loyalty.isEligibleForFreeDrink) return null;

    _isLoading = true;
    notifyListeners();

    // محاكاة عملية اتصال بالخادم (Backend / Firestore)
    await Future.delayed(const Duration(seconds: 1));

    try {
      final String rewardCode = _generateRewardCode();
      final int remainingPoints =
          _loyalty.currentPoints - _loyalty.targetPoints;
      final updatedCodes = List<String>.from(_loyalty.activeRedeemCodes)
        ..add(rewardCode);

      _loyalty = _loyalty.copyWith(
        currentPoints: remainingPoints,
        activeRedeemCodes: updatedCodes,
      );

      _isLoading = false;
      notifyListeners();
      return rewardCode;
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint("Error redeeming reward: $e");
      return null;
    }
  }

  String _generateRewardCode() {
    final random = Random();
    final int randomNumber = 1000 + random.nextInt(9000);
    return "MOKAL-FREE-$randomNumber";
  }
}
