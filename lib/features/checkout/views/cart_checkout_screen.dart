import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/app_theme.dart';
import '../../home/view_models/home_view_model.dart';

class CartCheckoutScreen extends StatelessWidget {
  const CartCheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("سلة الطلبات والدفع"),
        backgroundColor: AppColors.primaryEspresso,
      ),
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) {
          final cartItems = viewModel.cartItems;
          final subtotal = viewModel.subtotal;
          const freeDeliveryTarget = 50.0;
          final progressPercent = (subtotal / freeDeliveryTarget).clamp(
            0.0,
            1.0,
          );

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE8E2D9)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "سلة الطلبات",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            "${cartItems.length} منتجات",
                            style: const TextStyle(
                              fontSize: 11,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Divider(height: 24),
                      cartItems.isEmpty
                          ? const Padding(
                              padding: EdgeInsets.symmetric(vertical: 24.0),
                              child: Center(
                                child: Text(
                                  "سلة الطلبات فارغة حالياً",
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: cartItems.length,
                              itemBuilder: (context, index) {
                                final item = cartItems[index];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 8.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              item.product.name,
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              "${item.product.price.toStringAsFixed(2)} ر.س",
                                              style: const TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(
                                              Icons.remove_circle_outline,
                                              size: 18,
                                            ),
                                            onPressed: () => viewModel
                                                .updateQuantity(index, -1),
                                          ),
                                          Text(
                                            "${item.quantity}",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.add_circle_outline,
                                              size: 18,
                                            ),
                                            onPressed: () => viewModel
                                                .updateQuantity(index, 1),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            "${item.total.toStringAsFixed(2)} ر.س",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE8E2D9)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            subtotal >= freeDeliveryTarget
                                ? "تهانينا! لقد حصلت على توصيل مجاني"
                                : "أضف ${(freeDeliveryTarget - subtotal).toStringAsFixed(2)} ر.س للحصول على توصيل مجاني",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            "${(progressPercent * 100).toInt()}%",
                            style: const TextStyle(
                              color: AppColors.accentNeonGold,
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: LinearProgressIndicator(
                          value: progressPercent,
                          minHeight: 8,
                          backgroundColor: AppColors.backgroundWarmCream,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            AppColors.accentNeonGold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE8E2D9)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.accentNeonGold,
                            size: 18,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "العنوان الوطني للتوصيل",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: _buildTextField("رقم المبنى", "4215"),
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: _buildTextField("الطابق", "2")),
                          const SizedBox(width: 8),
                          Expanded(child: _buildTextField("رقم الشقة", "204")),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildTextField(
                        "اسم الحي / الشارع",
                        "حي الياسمين، شارع التخصصي",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                if (cartItems.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFEF3C7),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFFFDE68A)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.percent,
                              color: AppColors.accentNeonGold,
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "مكافأة النقاط النشطة",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  "مشروب مجاني (-100% على أرخص مشروب)",
                                  style: TextStyle(
                                    fontSize: 9,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () => viewModel.toggleReward(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: viewModel.isRewardApplied
                                ? AppColors.primaryEspresso
                                : AppColors.accentNeonGold,
                            foregroundColor: viewModel.isRewardApplied
                                ? Colors.white
                                : AppColors.primaryEspresso,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 6,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            viewModel.isRewardApplied
                                ? "إلغاء المكافأة"
                                : "تفعيل المكافأة",
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE8E2D9)),
                  ),
                  child: Column(
                    children: [
                      _buildSummaryRow(
                        "مجموع المنتجات",
                        "${subtotal.toStringAsFixed(2)} ر.س",
                      ),
                      const SizedBox(height: 6),
                      _buildSummaryRow(
                        "رسوم التوصيل",
                        viewModel.deliveryFee == 0
                            ? "مجاني (0.00 ر.س)"
                            : "${viewModel.deliveryFee.toStringAsFixed(2)} ر.س",
                      ),
                      if (viewModel.isRewardApplied) ...[
                        const SizedBox(height: 6),
                        _buildSummaryRow(
                          "خصم مكافأة النقاط",
                          "-${viewModel.discountAmount.toStringAsFixed(2)} ر.س",
                          isDiscount: true,
                        ),
                      ],
                      const Divider(height: 20),
                      _buildSummaryRow(
                        "المجموع الكلي",
                        "${viewModel.totalPrice.toStringAsFixed(2)} ر.س",
                        isTotal: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (cartItems.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("سلة الطلبات فارغة!")),
                        );
                        return;
                      }
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "تم استلام طلبك بنجاح! جاري التوجيه للدفع الآمن...",
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryEspresso,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.lock,
                          color: AppColors.accentNeonGold,
                          size: 16,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "تأكيد الطلب والدفع (Apple Pay / Mada)",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 4),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(fontSize: 11, color: Colors.grey),
            filled: true,
            fillColor: AppColors.backgroundWarmCream,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE8E2D9)),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFFE8E2D9)),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryRow(
    String title,
    String value, {
    bool isDiscount = false,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 13 : 11,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isDiscount ? Colors.green[700] : Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 15 : 11,
            fontWeight: FontWeight.bold,
            color: isTotal
                ? AppColors.accentNeonGold
                : (isDiscount ? Colors.green[700] : AppColors.primaryEspresso),
          ),
        ),
      ],
    );
  }
}
