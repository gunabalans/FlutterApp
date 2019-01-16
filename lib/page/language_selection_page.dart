import 'package:flutter/material.dart';
import 'package:me_arun/config/config.dart';
import 'package:me_arun/page/tpl/common_drawer.dart';
import 'package:me_arun/util/translations.dart';

class LanguageSelectionPage extends StatefulWidget {
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String _lang;
  Locale locale;

  @override
  Widget build(BuildContext context) {
    if (_lang == null) {
      _lang = Translations.of(context).currentLanguage;
      print(_lang);
    }
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Text(
              Translations.of(context).text("Language"),
              style: TextStyle(color: Theme.of(context).backgroundColor),
            )),
            //this is to avoid keyboad overlay and crash with the input boxes
            resizeToAvoidBottomPadding: false,
            drawer: CommonDrawer(),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  RadioListTile(
                    title: Text(Config.langSupport["en"]),
                    value: "en",
                    groupValue: _lang,
                    onChanged: (value) {
                      changeLanguage(value);
                      setState(() {
                        _lang = value;
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text(Config.langSupport["ta"]),
                    value: "ta",
                    groupValue: _lang,
                    onChanged: (value) {
                      changeLanguage(value);
                      setState(() {
                        _lang = value;
                      });
                    },
                  ),
                ],
              ),
            )));
  }

  changeLanguage(String val) {
    TranslationsDelegate x = new TranslationsDelegate();
    if (x.isSupported(Locale(val))) {
      setState(() {
        locale = Locale(val);
      });
    } else {
      setState(() {
        locale = Locale("en");
      });
    }
    x.load(locale);
  }
}
