import '../../domain/entities/shopper_profile.dart';

sealed class AuthFlowState {
  final ShopperProfile profile;
  const AuthFlowState(this.profile);
}

class AuthFlowInitial extends AuthFlowState {
  const AuthFlowInitial(super.profile);
}

class AuthFlowProfileUpdated extends AuthFlowState {
  const AuthFlowProfileUpdated(super.profile);
}
