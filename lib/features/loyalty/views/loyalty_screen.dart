import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_theme.dart';
import '../view_models/loyalty_view_model.dart';

class LoyaltyScreen extends StatelessWidget {
  const LoyaltyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("نظام مكافآت مُكال")),
      body: Consumer<LoyaltyViewModel>(
        builder: (context, viewModel, child) {
          final loyalty = viewModel.loyalty;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // بطاقة تتبع النقاط الرئيسية
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      children: [
                        const Text(
                          "رصيد نقاطك الحالي",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: AppColors.primaryEspresso,
                          ),
                        ),
                        const SizedBox(height: 24),

                        // مؤشر التقدم الدائري
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 160,
                              child: CircularProgressIndicator(
                                value: loyalty.progressRatio,
                                strokeWidth: 14,
                                backgroundColor: AppColors.primaryEspresso
                                    .withOpacity(0.08),
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                  AppColors.accentNeonGold,
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${loyalty.currentPoints}",
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primaryEspresso,
                                  ),
                                ),
                                Text(
                                  "من أصل ${loyalty.targetPoints} نقطة",
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),

                        Text(
                          loyalty.isEligibleForFreeDrink
                              ? "تهانينا! أكملت النقاط المطلوبة للحصول على مشروبك المجاني ☕️"
                              : "باقي لك ${loyalty.targetPoints - loyalty.currentPoints} نقطة لتحصل على مشروبك المجاني",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: loyalty.isEligibleForFreeDrink
                                ? AppColors.primaryEspresso
                                : AppColors.textMuted,
                            fontWeight: loyalty.isEligibleForFreeDrink
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // زر استبدال النقاط
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:
                        (loyalty.isEligibleForFreeDrink && !viewModel.isLoading)
                        ? () async {
                            final code = await viewModel.redeemFreeDrink();
                            if (code != null && context.mounted) {
                              _showRedeemSuccessDialog(context, code);
                            }
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      disabledBackgroundColor: AppColors.primaryEspresso
                          .withOpacity(0.12),
                      disabledForegroundColor: AppColors.textMuted,
                    ),
                    child: viewModel.isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: AppColors.primaryEspresso,
                            ),
                          )
                        : const Text("استبدال بمشروب مجاني"),
                  ),
                ),

                const SizedBox(height: 32),

                // عرض رموز الخصم النشطة إن وجدت
                if (loyalty.activeRedeemCodes.isNotEmpty) ...[
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "رموز الخصم المستبدلة",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryEspresso,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: loyalty.activeRedeemCodes.length,
                    itemBuilder: (context, index) {
                      final redeemCode = loyalty.activeRedeemCodes[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          leading: const Icon(
                            Icons.local_offer,
                            color: AppColors.accentNeonGold,
                          ),
                          title: Text(
                            redeemCode,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.1,
                            ),
                          ),
                          subtitle: const Text("جاهز للاستخدام مع طلبك القادم"),
                          trailing: const Icon(
                            Icons.check_circle,
                            color: Colors.green,
                            size: 20,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ],
            ),
          );
        },
      ),
    );
  }

  void _showRedeemSuccessDialog(BuildContext context, String code) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("تم الاستبدال بنجاح! 🎉"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("تم إنشاء رمز الخصم الخاص بمشروبك المجاني:"),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.backgroundWarmCream,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppColors.accentNeonGold),
              ),
              child: SelectableText(
                code,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryEspresso,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              "موافق",
              style: TextStyle(color: AppColors.primaryEspresso),
            ),
          ),
        ],
      ),
    );
  }
}
