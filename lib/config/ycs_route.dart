import 'package:me_arun/page/dashboard_page.dart';
import 'package:me_arun/page/fish_page.dart';
import 'package:me_arun/page/prawn_page.dart';
import 'package:me_arun/page/language_selection_page.dart';
import 'package:me_arun/page/login_page.dart';

class YcsRoute {
  static String home = "/";
  static String dashboard = "/dashboard";
  static String prawn = "/prawn";
  static String fish = "/fish";
  static String crab = "/crab";
  static String cart = "/cart";

  static String language = "/language";
  static String login = "/login";
//configured with main routes: YcsRoute.init,
  static final init = {
    dashboard: (context) => DashboardPage(),
    prawn: (context) => PrawnPage(),
    fish: (context) => FishPage(),
    // crab: (context) => CrabPage(),
    login: (context) => LoginPage(),
    language: (context) => LanguageSelectionPage(),
  };
}
