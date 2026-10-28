class LoyaltyModel {
  final String userId;
  final int currentPoints;
  final int targetPoints;
  final List<String> activeRedeemCodes;

  const LoyaltyModel({
    required this.userId,
    required this.currentPoints,
    this.targetPoints = 65,
    required this.activeRedeemCodes,
  });

  bool get isEligibleForFreeDrink => currentPoints >= targetPoints;

  double get progressRatio => (currentPoints / targetPoints).clamp(0.0, 1.0);

  LoyaltyModel copyWith({
    String? userId,
    int? currentPoints,
    int? targetPoints,
    List<String>? activeRedeemCodes,
  }) {
    return LoyaltyModel(
      userId: userId ?? this.userId,
      currentPoints: currentPoints ?? this.currentPoints,
      targetPoints: targetPoints ?? this.targetPoints,
      activeRedeemCodes: activeRedeemCodes ?? this.activeRedeemCodes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'currentPoints': currentPoints,
      'targetPoints': targetPoints,
      'activeRedeemCodes': activeRedeemCodes,
    };
  }

  factory LoyaltyModel.fromJson(Map<String, dynamic> json) {
    return LoyaltyModel(
      userId: json['userId'] as String,
      currentPoints: json['currentPoints'] as int,
      targetPoints: json['targetPoints'] ?? 65,
      activeRedeemCodes: List<String>.from(json['activeRedeemCodes'] ?? []),
    );
  }
}
