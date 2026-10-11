import '../entities/shopper_profile.dart';

abstract interface class ProfileRepository {
  Future<ShopperProfile> save(ShopperProfile profile);
}
