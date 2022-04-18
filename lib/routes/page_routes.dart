
import 'package:covidfo/pages/bottom_nav.dart';
import 'package:covidfo/pages/detail_prov.dart';
import 'package:covidfo/pages/detail_screen.dart';
import 'package:covidfo/pages/home_screen.dart';
import 'package:covidfo/pages/login_screen.dart';
import 'package:covidfo/pages/profile_screen.dart';
import 'package:covidfo/pages/register_screen.dart';
import 'package:covidfo/pages/splash_screen.dart';
import 'package:covidfo/routes/route_name.dart';
import 'package:get/get.dart';

class pageRouteApp{
  static final pages=[
    GetPage(
      name: RouteName.splash, 
      page: () => SplashScreen()),
    GetPage(
      name: RouteName.login,
      page: () => LoginScreen()
    ),
    GetPage(
      name: RouteName.register, 
      page: () => RegisterScreen()
    ),
    GetPage(
      name: RouteName.homepage,
      page: () => BottomNav()
    ),
    GetPage(
      name: RouteName.detailProv, 
      page: () => DetailProvinsi()
    ),
  ];
}