import 'package:flutter/material.dart';
import 'package:me_arun/config/config.dart';
import 'package:me_arun/config/ycs_route.dart';
import 'package:me_arun/page/tpl/full_screen_background_image.dart';
import 'package:me_arun/util/form_factory.dart';
import 'package:me_arun/util/translations.dart';

class LandingPage extends StatefulWidget {
  @override
  LandingPageState createState() => new LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  final FormFactory ff = new FormFactory();
  var locale;

  @override
  Widget build(BuildContext context) {
    //print(Translations.of(context).toString());

    return FullScreenBackgroundImage(
      backgroundImage: "assets/images/fish_background.jpg",
      child: test(context),
    );
  }

  Column test(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            Config.ui_full_screen_logo_icon,
            color: Theme.of(context).backgroundColor,
            size: Config.ui_landing_page_icon_size,
          ),
          SizedBox(height: 40.0),
          Text(
            Translations.of(context).text("title"),
            style: TextStyle(
                color: Theme.of(context).backgroundColor,
                fontSize: Config.ui_landing_page_font_size),
          ),
          SizedBox(height: 60.0),
          ff.formButton(
              context: context,
              label: "Get In",
              color: Theme.of(context).backgroundColor,
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).pushNamed(YcsRoute.dashboard);
              }),
          SizedBox(height: 20.0),
          new SelectBox(
            isExpanded: false,
            map: Config.langSupport,
            label: "Language",
            onChangeSelectMap: changeLanguage,
          )
        ]);
  }

  changeLanguage(String val) {
    Locale(val);

    TranslationsDelegate x = new TranslationsDelegate();
    if (x.isSupported(Locale(val))) {
      locale = Locale(val);
    } else {
      locale = Locale("en");
    }
    x.load(locale);
  }
}
