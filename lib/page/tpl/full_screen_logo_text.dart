import 'package:flutter/material.dart';
import 'package:me/config/config.dart';
import 'package:me/util/form_factory.dart';
import 'package:me/util/translations.dart';

class FullScreenLogoText extends StatelessWidget {
  final IconData icon;
  final double iconSize;
  final double textFontSize;

  final FormFactory ff = new FormFactory();

  FullScreenLogoText(
      {this.icon = Icons.drive_eta,
      this.iconSize = 100.0,
      this.textFontSize = 50.0});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).primaryColor,
            child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Theme.of(context).backgroundColor,
                    size: iconSize,
                  ),
                  SizedBox(height: 40.0),
                  Text(
                    Translations.of(context).text("title"),
                    style: TextStyle(
                        color: Theme.of(context).backgroundColor,
                        fontSize: textFontSize),
                  ),
                  SizedBox(height: 60.0),
                  ff.formButton(
                      context: context,
                      label: "login",
                      color: Theme.of(context).backgroundColor,
                      textColor: Theme.of(context).primaryColor,
                      onPressed: () {
                        Navigator.of(context).pushNamed("/login");
                      }),
                  SizedBox(height: 20.0),
                  new SelectMap(
                    map: Config.langSupport,
                    label: "Language",
                    onChangeSelectMap: () {},
                  )
                ])));
  }

//class close here
}
