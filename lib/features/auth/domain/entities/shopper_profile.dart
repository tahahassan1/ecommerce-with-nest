enum ShopperType { men, women }

class ShopperProfile {
  final ShopperType shopperType;
  final String? ageRange;

  const ShopperProfile({this.shopperType = ShopperType.men, this.ageRange});

  ShopperProfile copyWith({ShopperType? shopperType, String? ageRange}) =>
      ShopperProfile(
        shopperType: shopperType ?? this.shopperType,
        ageRange: ageRange ?? this.ageRange,
      );
}
