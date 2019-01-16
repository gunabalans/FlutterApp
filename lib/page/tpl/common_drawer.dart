import 'package:flutter/material.dart';
import 'package:me/config/ycs_route.dart';
import 'package:me/util/db.dart';
import 'package:me/util/translations.dart';

class CommonDrawer extends StatefulWidget {
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  var db = new Db();
  Map authInfo;
  Widget mywidget;
  Widget img;

  _CommonDrawerState() {
    getDbData();
  }

  getDbData() {
    if (authInfo == null) {
      db.getData("auth").then((vl) {
        if (vl == null) {
          Navigator.popUntil(context, ModalRoute.withName(YcsRoute.home));
        } else {
          setState(() {
            authInfo = vl;
            img = Image.network(
                'http://ycsnew.whyceeyes.com/wp-content/uploads/2018/09/YCSLOGO_150x-2.png');
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: (authInfo != null && authInfo.containsKey('UserName'))
                ? Text(authInfo['UserName'])
                : Text(""),
            accountEmail: (authInfo != null && authInfo.containsKey('Role'))
                ? Text(authInfo['Role'])
                : Text(""),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Theme.of(context).backgroundColor,
              child: img,
            ),
          ),
          Container(
              decoration: BoxDecoration(
                  border: new Border(
                      bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ))),
              child: ListTile(
                leading: Icon(
                  Icons.dashboard,
                ),
                title: Text(Translations.of(context).text("Dashboard")),
                onTap: () {
                  Navigator.of(context).pushNamed(YcsRoute.dashboard);
                },
              )),
          Container(
              decoration: BoxDecoration(
                  border: new Border(
                      bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ))),
              child: ListTile(
                leading: Icon(
                  Icons.person,
                ),
                title: Text(Translations.of(context).text("Customer")),
                onTap: () {
                  Navigator.of(context).pushNamed(YcsRoute.customer);
                },
              )),
          // Container(
          //     decoration: BoxDecoration(
          //         border: new Border(
          //             bottom: BorderSide(
          //       color: Theme.of(context).dividerColor,
          //     ))),
          //     child: ListTile(
          //       leading: Icon(
          //         Icons.input,
          //       ),
          //       title: Text(Translations.of(context).text("Enquiry")),
          //       onTap: () {
          //         Navigator.of(context).pushNamed(YcsRoute.enquiry);
          //       },
          //     )),
          Container(
              decoration: BoxDecoration(
                  border: new Border(
                      bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ))),
              child: ListTile(
                leading: Icon(
                  Icons.language,
                ),
                title: Text(Translations.of(context).text("Language")),
                onTap: () {
                  Navigator.of(context).pushNamed(YcsRoute.language);
                },
              )),
          Container(
              decoration: BoxDecoration(
                  border: new Border(
                      bottom: BorderSide(
                color: Theme.of(context).dividerColor,
              ))),
              child: ListTile(
                leading: Icon(
                  Icons.exit_to_app,
                ),
                title: Text(Translations.of(context).text("Logout")),
                onTap: () {
                  db.logout(); //logout
                  Navigator.popUntil(
                      context, ModalRoute.withName(YcsRoute.home));
                },
              ))
        ],
      ),
    ));
  }
}
