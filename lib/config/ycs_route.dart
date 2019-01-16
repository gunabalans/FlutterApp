import 'package:me_arun/page/customer_page.dart';
import 'package:me_arun/page/dashboard_page.dart';
import 'package:me_arun/page/enquiry_page.dart';
import 'package:me_arun/page/language_selection_page.dart';
import 'package:me_arun/page/login_page.dart';

class YcsRoute {
  static String home = "/";
  static String login = "/login";
  static String customer = "/customer";
  static String enquiry = "/enquiry";
  static String language = "/language";
  static String dashboard = "/dashboard";

//configured with main routes: YcsRoute.init,
  static final init = {
    login: (context) => LoginPage(),
    customer: (context) => CustomerPage(),
    enquiry: (context) => EnquiryPage(),
    language: (context) => LanguageSelectionPage(),
    dashboard: (context) => DashboardPage(),
  };
}
