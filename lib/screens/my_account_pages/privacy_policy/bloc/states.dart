part of 'bloc.dart';

class PrivacyPolicyStates {}

class GetPolicyLoadingState extends PrivacyPolicyStates {}

class GetPolicySuccessState extends PrivacyPolicyStates {
}

class GetPolicyFailedState extends PrivacyPolicyStates {
  final String error;

  GetPolicyFailedState(this.error);
}