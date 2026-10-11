import '../entities/shopper_profile.dart';
import '../repositories/profile_repository.dart';

class UpdateProfileUseCase {
  final ProfileRepository _repository;

  const UpdateProfileUseCase(this._repository);

  Future<ShopperProfile> call(ShopperProfile profile) =>
      _repository.save(profile);
}
