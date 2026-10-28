class NationalAddressModel {
  final String buildingNumber;
  final String shortCode;
  final String floorNumber;
  final String apartmentNumber;
  final String? doorImagePath;
  final String? deliveryNotes;

  const NationalAddressModel({
    required this.buildingNumber,
    required this.shortCode,
    required this.floorNumber,
    required this.apartmentNumber,
    this.doorImagePath,
    this.deliveryNotes,
  });

  NationalAddressModel copyWith({
    String? buildingNumber,
    String? shortCode,
    String? floorNumber,
    String? apartmentNumber,
    String? doorImagePath,
    String? deliveryNotes,
  }) {
    return NationalAddressModel(
      buildingNumber: buildingNumber ?? this.buildingNumber,
      shortCode: shortCode ?? this.shortCode,
      floorNumber: floorNumber ?? this.floorNumber,
      apartmentNumber: apartmentNumber ?? this.apartmentNumber,
      doorImagePath: doorImagePath ?? this.doorImagePath,
      deliveryNotes: deliveryNotes ?? this.deliveryNotes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buildingNumber': buildingNumber,
      'shortCode': shortCode,
      'floorNumber': floorNumber,
      'apartmentNumber': apartmentNumber,
      'doorImagePath': doorImagePath,
      'deliveryNotes': deliveryNotes,
    };
  }

  factory NationalAddressModel.fromJson(Map<String, dynamic> json) {
    return NationalAddressModel(
      buildingNumber: json['buildingNumber'] as String,
      shortCode: json['shortCode'] as String,
      floorNumber: json['floorNumber'] as String,
      apartmentNumber: json['apartmentNumber'] as String,
      doorImagePath: json['doorImagePath'] as String?,
      deliveryNotes: json['deliveryNotes'] as String?,
    );
  }
}
