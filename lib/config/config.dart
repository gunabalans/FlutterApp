import 'package:flutter/material.dart';

class Config {
  //applcation title
  static const applicationTitle = "SeaFoods";

  static const String imageAssetPAth = "assets/images/";

  //static const ui_landing_page_background_image = imageAssetPAth + 'home.jpg';
  //font
  static const double ui_landing_page_icon_size = 100.0;
  static const double ui_landing_page_font_size = 25.0;

  //Colors
  //static const MaterialColor ui_color = Colors.red;

  //icons
  static const ui_full_screen_logo_icon = Icons.fastfood;

  static const langSupport = {"en": "English", "ta": "தமிழ்"};
//API call URLS
  static const String url_base = "http://ycstravel.whyceeyes.com/V1.0";

  static const String url_login_agent = url_base + "/login/agent";

  //customer- CRUD class example: customer + "/create", "/delete". "/view"
  static const String url_list = "/list";
  static const String url_add = "/create";
  static const String url_update = "/update";
  static const String url_del = "/delete";

  static const String url_customer = url_base + "/customer";

  static final Color primaryColor = const Color(0xFF66CCCC);
  static final Color accentColour = const Color(0xFFD39200);
  static final Color primaryColorDark = const Color(0xFF02577E);

  static final Color backgroundColor = const Color(0xFFF0EFEA);
  static final Color splashColor = const Color(0xFFF9E8A3);

  static final Color primaryColor100 = const Color(0xFF7BD3DD);
  static final Color warning = const Color(0xFF862400);

  static TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      title: base.title.copyWith(
        fontFamily: 'GoogleSans',
        color: primaryColor,
        letterSpacing: 1.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontSize: 20.0,
      ),
      body1: base.button.copyWith(
        fontFamily: 'GoogleSans',
        color: primaryColorDark,
        letterSpacing: 1.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontSize: 12.0,
      ),
      button: base.button.copyWith(
        fontFamily: 'GoogleSans',
        color: accentColour,
        letterSpacing: 1.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        fontSize: 14.0,
      ),
    );
  }

  static ButtonThemeData _buildButtonTheme(ButtonThemeData base) {
    return base.copyWith(
      padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
      height: 50.0,
      shape: OutlineInputBorder(
          borderSide: BorderSide(color: primaryColorDark),
          borderRadius: const BorderRadius.all(Radius.circular(20.0))),
    );
  }

  static final ThemeData myLightTheme = _buildLightTheme(
      primaryColour: Config.primaryColor,
      accentColour: Config.accentColour,
      backgroundColour: Config.backgroundColor,
      splashColour: Config.splashColor,
      errorColour: Config.warning);

  static ThemeData _buildLightTheme({
    Color primaryColour,
    Color accentColour,
    Color backgroundColour,
    Color splashColour,
    Color errorColour,
  }) {
    Color primaryColor = primaryColour;
    Color accentColor = accentColour;

    final ThemeData base = ThemeData.light();

    return base.copyWith(
      primaryColor: primaryColor,
      primaryColorDark: primaryColorDark,
      primaryColorLight: accentColour,
      buttonColor: primaryColor,
      indicatorColor: backgroundColour,
      splashColor: splashColour,
      splashFactory: InkRipple.splashFactory,
      accentColor: accentColor,
      canvasColor: backgroundColour,
      scaffoldBackgroundColor: Colors.white,
      backgroundColor: backgroundColour,
      errorColor: errorColour,
      buttonTheme: _buildButtonTheme(base.buttonTheme),
      // buttonTheme: const ButtonThemeData(
      //   textTheme: ButtonTextTheme.primary,
      // ),
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }

  ///class closinng here
}
