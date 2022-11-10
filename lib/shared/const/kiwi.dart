import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory((c) => HomeBloc());

}