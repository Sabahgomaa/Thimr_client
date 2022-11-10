class StatesLogin {}

class StateLoginInitial extends StatesLogin {}

class StateLoginLoading extends StatesLogin {}

class StateLoginSuccess extends StatesLogin {
  // final String msg,devCode;
  // final bool isActive;
  // final String registerStep;
  // final String? phoneCode, phone, userType;
  //
  // final int? userId;
  // StateLoginSuccess({
  //   required this.msg,
  //   required this.devCode,
  //   required this.userType,
  //   required this.isActive,
  //   required this.registerStep,
  //   this.userId,
  //   this.phoneCode,
  //   this.phone,
  // });
}

class StateLoginFailed extends StatesLogin {
  String msg;

  StateLoginFailed({
    required this.msg,
  });
}