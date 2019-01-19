import 'package:flutter/material.dart';
import 'dart:io';

import 'package:me_arun/config/config.dart';
import 'package:me_arun/config/ycs_route.dart';
import 'package:me_arun/page/tpl/template.dart';
import 'package:me_arun/util/db.dart';
import 'package:me_arun/util/form_factory.dart';

import 'package:me_arun/util/http_client.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  FormFactory ff = new FormFactory();

  var cont1 = new TextEditingController();

  var cont2 = new TextEditingController();

  HttpClient myhttp = new HttpClient();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            //this is to avoid keyboad overlay and crash with the input boxes
            resizeToAvoidBottomPadding: false,
            body: Builder(builder: (BuildContext context) {
              return Template.singleColumn(
                context: context,
                children: <Widget>[
                  Template.textTitle(context: context, title: "title"),
                  Template.sizeBox(height: 5.0),
                  ff.textFormField(
                      context: context,
                      //key: Key("mobile"),
                      inputType: "NUMBER",
                      label: "MobileNo",
                      //mask: "YYYY/MM/DD",
                      //maskSeperator: "/",
                      min: 10,
                      max: 10,
                      hint: "MobileNoRequired",
                      controller: cont1,
                      required: true),
                  Template.sizeBox(height: 5.0),
                  ff.textFormField(
                    context: context,
                    //key: Key("password"),
                    inputType: "PASSWORD",
                    label: "EnterPassword",
                    min: 8,
                    hint: "Minimum8CharLength",
                    controller: cont2,
                  ),
                  Template.sizeBox(height: 25.0),
                  ff.formButton(
                      //key: Key("loginSubmit"),
                      //color: Theme.of(context).primaryColor,
                      label: "login",
                      context: context,
                      //textColor: Theme.of(context).backgroundColor,
                      onPressed: () async {
                        var db = new Db();
                        var dbCon;
                        try {
                          dbCon = await db.sembast();
                        } catch (e) {
                          Template.sb(context, "IssueWithLogin");
                          return;
                        }

                        if (dbCon == null) {
                          Template.sb(context, "IssueWithLogin");
                          return;
                        }

                        try {
                          var url = Config.url_login_agent;
                          var response = await myhttp.postData(url: url, body: {
                            "UserID": cont1.text,
                            "PassWord": cont2.text
                          });

                          var auth = myhttp.httpResponseDecode(
                              context: context, response: response);

                          //print("test" + auth.toString());

                          if (auth != null) {
                            await dbCon.put(auth["data"], "auth");

                            dbCon.containsKey("auth").then((bool val) {
                              if (val) {
                                Navigator.of(context).pushNamed(YcsRoute.prawn);

                                //print("after customer page navigation");
                              } else {
                                Template.sb(context, "BadRequest");
                              }
                            });
                          } //for all null responce already given
                        } catch (e) {
                          Template.sb(context, "NoResponse");
                        } finally {
                          //print("on the try finally block");
                          dbCon.close();
                        }
                      }),
                ],
              );
            })));
  }
}
