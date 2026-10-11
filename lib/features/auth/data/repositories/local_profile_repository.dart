import '../../domain/entities/shopper_profile.dart';
import '../../domain/repositories/profile_repository.dart';

class LocalProfileRepository implements ProfileRepository {
  ShopperProfile _profile = const ShopperProfile();

  @override
  Future<ShopperProfile> save(ShopperProfile profile) async {
    _profile = profile;
    return _profile;
  }
}
