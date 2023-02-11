import 'package:kiwi/kiwi.dart';
import 'package:thimar_client/screens/nav_bar/pages/favorites/bloc/bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/home/bloc/bloc.dart';
import 'package:thimar_client/screens/nav_bar/pages/orders/bloc/bloc.dart';
import 'package:thimar_client/screens/show_product/bloc/bloc.dart';
import '../../screens/auth_cycle/confirm_code/bloc/bloc.dart';
import '../../screens/auth_cycle/forget_password/bloc/bloc.dart';
import '../../screens/auth_cycle/log_in/bloc/bloc.dart';
import '../../screens/auth_cycle/register/bloc/bloc.dart';
import '../../screens/auth_cycle/verify/bloc/bloc.dart';
import '../../screens/cart/bloc/bloc.dart';
import '../../screens/my_account_pages/about_app/bloc/bloc.dart';
import '../../screens/my_account_pages/addresses/bloc/bloc.dart';
import '../../screens/my_account_pages/contact_us/bloc/bloc.dart';
import '../../screens/my_account_pages/faqs/boc/bloc.dart';
import '../../screens/my_account_pages/personal_info/bloc/bloc.dart';
import '../../screens/my_account_pages/privacy_policy/bloc/bloc.dart';
import '../../screens/my_account_pages/suggestions_and_ complaints/bloc/bloc.dart';
import '../../screens/nav_bar/pages/Search/bloc/bloc.dart';
import '../../screens/nav_bar/pages/notifications/bloc/bloc.dart';
import '../../screens/nav_bar/pages/profile/bloc/bloc.dart';
import '../../screens/order_details/bloc/bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();
  container.registerFactory(
    (c) => RegisterBloc(),
  );
  container.registerFactory(
    (c) => VerifyBloc(),
  );
  container.registerFactory(
    (c) => LogInBloc(),
  );
  container.registerFactory(
    (c) => ForgetPasswordBloc(),
  );
  container.registerFactory(
    (c) => ConfirmCodeBloc(),
  );
  container.registerFactory(
    (c) => HomeBloc(),
  );
  container.registerFactory(
    (c) => OrdersBloc(),
  );
  container.registerFactory(
    (c) => ShowProductBloc(),
  );
  container.registerFactory(
    (c) => FavoriteBloc(),
  );
  container.registerFactory(
    (c) => NotificationBloc(),
  );
  container.registerFactory(
    (c) => ProfileBloc(),
  );
  container.registerFactory(
    (c) => CartBloc(),
  );
  container.registerFactory(
    (c) => AddressesBloc(),
  );
  container.registerFactory(
    (c) => LogoutBloc(),
  );
  container.registerFactory(
    (c) => AboutAppBloc(),
  );
  container.registerFactory(
    (c) => ContactUsBloc(),
  );
  container.registerFactory(
    (c) => FAQSBloc(),
  );
  container.registerFactory(
    (c) => PrivacyPolicyBloc(),
  );
  container.registerFactory(
    (c) => SuggestionsAndComplaintsBloc(),
  );
  container.registerFactory(
    (c) => SearchBloc(),
  );
  container.registerFactory(
    (c) => ShowOrderBloc(),
  );
}
