part of 'bloc.dart';

class ProfileEvent {}

class GetProfileEvent extends ProfileEvent {}

class EditProfileEvent extends ProfileEvent {
  ProfileData? profileData;
  final TextEditingController fullNameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  EditProfileEvent(
      {required this.phoneController, required this.passwordController, required this.fullNameController,});
}
