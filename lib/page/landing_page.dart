import 'package:flutter/material.dart';
import 'package:me_arun/config/config.dart';
import 'package:me_arun/config/ycs_route.dart';
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

    return Scaffold(
        body: Stack(children: <Widget>[
      Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // color: Theme.of(context).primaryColor,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: AssetImage("assets/images/fish_background.jpg"),
              alignment: FractionalOffset(0.0, 1.0),
              fit: BoxFit.cover,
              matchTextDirection: true,
              colorFilter: new ColorFilter.mode(
                  Theme.of(context).primaryColor.withOpacity(0.1),
                  BlendMode.color),
            )),
        // child: Column(
        //     mainAxisSize: MainAxisSize.max,
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     crossAxisAlignment: CrossAxisAlignment.center,
        //     children: <Widget>[
        //       Icon(
        //         Config.ui_full_screen_logo_icon,
        //         color: Theme.of(context).backgroundColor,
        //         size: Config.ui_landing_page_icon_size,
        //       ),
        //       SizedBox(height: 40.0),
        //       Text(
        //         Translations.of(context).text("title"),
        //         style: TextStyle(
        //             color: Theme.of(context).backgroundColor,
        //             fontSize: Config.ui_landing_page_font_size),
        //       ),
        //       SizedBox(height: 60.0),
        //       ff.formButton(
        //           context: context,
        //           label: "Get In",
        //           color: Theme.of(context).backgroundColor,
        //           textColor: Theme.of(context).primaryColor,
        //           onPressed: () {
        //             Navigator.of(context).pushNamed(YcsRoute.dashboard);
        //           }),
        //       SizedBox(height: 20.0),
        //       new SelectBox(
        //         isExpanded: false,
        //         map: Config.langSupport,
        //         label: "Language",
        //         onChangeSelectMap: changeLanguage,
        //       )
        //     ])
      ),
      Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Theme.of(context).primaryColor.withOpacity(0.8),

          // decoration: BoxDecoration(
          //     color: Theme.of(context).primaryColor,
          //     image: DecorationImage(
          //       image: AssetImage("assets/images/fish_background.jpg"),
          //       alignment: FractionalOffset(0.0, 1.0),
          //       fit: BoxFit.cover,
          //       matchTextDirection: true,
          //       colorFilter: new ColorFilter.mode(
          //           Theme.of(context).primaryColor.withOpacity(0.1),
          //           BlendMode.screen),
          //     )),
          child: Column(
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
                    label: Translations.of(context).text("GetIn"),
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
              ])),
    ]));
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
