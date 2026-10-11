import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/shopper_profile.dart';
import '../../domain/usecases/update_profile_use_case.dart';
import 'auth_flow_state.dart';

class AuthFlowCubit extends Cubit<AuthFlowState> {
  final UpdateProfileUseCase _updateProfile;

  AuthFlowCubit(this._updateProfile)
    : super(const AuthFlowInitial(ShopperProfile()));

  Future<void> selectShopper(ShopperType type) async {
    final profile = state.profile.copyWith(shopperType: type);
    emit(AuthFlowProfileUpdated(await _updateProfile(profile)));
  }

  Future<void> selectAgeRange(String ageRange) async {
    final profile = state.profile.copyWith(ageRange: ageRange);
    emit(AuthFlowProfileUpdated(await _updateProfile(profile)));
  }
}
