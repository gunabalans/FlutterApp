import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:me_arun/config/config.dart' show Config;
import 'package:me_arun/config/ycs_route.dart';
import 'package:me_arun/page/landing_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:me_arun/util/translations.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //systemNavigationBarColor: Colors.white,
    statusBarColor: Config.primaryColorDark,
  ));

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      //title: Config.applicationTitle,

      locale: Locale("en"),
      onGenerateTitle: (BuildContext context) =>
          Translations.of(context).text("title"),

      debugShowCheckedModeBanner: false, //pro
      //showPerformanceOverlay: true, //dev
      //debugShowMaterialGrid: true,
      home: new LandingPage(),

      localizationsDelegates: [
        const TranslationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      initialRoute: YcsRoute.home,
      routes: YcsRoute.init,
      theme: Config.myLightTheme, //Config.myTheme,
    );
  }
}
