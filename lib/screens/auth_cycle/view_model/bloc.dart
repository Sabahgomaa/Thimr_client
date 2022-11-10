import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thimar_client/screens/auth_cycle/view_model/states.dart';
import 'package:thimar_client/shared/core/dio_helper.dart';


part 'events.dart';


class BlocSignIn extends Bloc<EventsLogin, StatesLogin> {
  // final RepoAuthImp repo = RepoAuthImp();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String? selectedCountyCodeText, selectedCountyCodeImage;
  final dioHelper = ServerGate();
  BlocSignIn() : super(StateLoginInitial()) {
    on<EventLogin>(_login);
  }

  void _login(EventLogin event, Emitter<StatesLogin> emit) async {

  }
  }
