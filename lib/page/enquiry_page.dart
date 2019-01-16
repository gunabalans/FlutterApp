/*
* @author Gunalan@whyceeyes.com
* @desc Crud class suppored page
* @version 1.0 
*/
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:me_arun/config/config.dart';
import 'package:me_arun/page/formClass/enquiry.dart';
import 'package:me_arun/page/tpl/common_drawer.dart';
import 'package:me_arun/page/tpl/template.dart';
import 'package:me_arun/util/form_factory.dart';
import 'package:me_arun/util/http_client.dart';
import 'package:loader_search_bar/loader_search_bar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:me_arun/util/translations.dart';
import 'package:me_arun/config/ycs_route.dart';
import 'package:me_arun/util/crud4.dart';

class EnquiryPage extends StatefulWidget {
  @override
  EnquiryPageState createState() => new EnquiryPageState();
}

class EnquiryPageState extends State<EnquiryPage> {
  static var myroute = YcsRoute.enquiry;
  var url = Config.url_base + myroute + Config.url_list;

  //botom tray clieck event
  int _selectedIndex = 0;
  var _currentViewData; //for building view and edit form

  //to store response data
  var data;

  //list query mode//enable when onchage that do local search
  bool listQueryMode =
      false; //True make a query on existing data so no http request required

  ///active on [listQueryMode] true
  Map localListSearchData = {};
  var formClass;
  FormFactory ff;

  var textEditingControllerMap;

  HttpClient myhttp = new HttpClient();

  var c4;

  EnquiryPageState() {
    //get customer form class - this is actual form class
    formClass = new Enquiry();
    //form factory class
    ff = new FormFactory(formClass: formClass, myhttp: myhttp, route: myroute);
    //generate text editing controller map

    textEditingControllerMap = FormFactory.tec(formClass: formClass);

    c4 =
        new Crud4(ff: ff, myhttp: myhttp, route: myroute, formClass: formClass);
  }

  responseDecodeAndMakeList(var response) {
    if (response != null && response.statusCode == 200) {
      Map responceToJson = jsonDecode(response.body);

      if (responceToJson == null) {
        return Text(Translations.of(context).text("BadResponse"));
      }

      if (responceToJson["status"] != 200 && responceToJson["data"] != null) {
        return Text(Translations.of(context).text("BadResponse"));
      } else {
        data = responceToJson["data"]; //store data for search
        return listBuilder(responceToJson["data"]);
      }
    } else {
      return Text(Translations.of(context).text("NoDataFound"));
    }
  }

  //list builder - Crud list builder
  listBuilder(var items) {
    var itemsCount = 0;

    if (items != null) {
      itemsCount = items.length;
    }

    return Builder(builder: (BuildContext context) {
      if (itemsCount > 0) {
        return Container(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: ListView.builder(
                itemCount: itemsCount,
                itemBuilder: (context, index) {
                  return slidableListBuilder(context, items, index);
                }));
      } else {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Text(Translations.of(context)
              .text("NoDataFound")), //translation required
        );
      }
    });
  }

  Slidable slidableListBuilder(BuildContext context, var items, int index) {
    return new Slidable(
      delegate: new SlidableDrawerDelegate(),
      actionExtentRatio: 0.25,
      child:
          new ListViewWidget(formClass: formClass, items: items, index: index),
      actions: <Widget>[
        new IconSlideAction(
          caption: 'View',
          color: Config.primaryColor100,
          icon: Icons.view_agenda,
          onTap: () {
            setState(() {
              _selectedIndex = 2;
              _currentViewData = items[index];
            });
            return Template.sb(context, "View");
          },
        ),
        new IconSlideAction(
          caption: 'Edit',
          color: Config.primaryColor,
          icon: Icons.edit,
          onTap: () {
            var formClassMap = formClass.form;
            formClassMap.forEach((k, v) {
              textEditingControllerMap[k] =
                  new TextEditingController(text: items[index][k]);
              //textEditingControllerMap[k].text = items[index][k];
            });
            setState(() {
              _selectedIndex = 3;
              _currentViewData = items[index];
            });
            return Template.sb(context, "Edit");
          },
        ),
      ],
      secondaryActions: <Widget>[
        new IconSlideAction(
          caption: 'Delete',
          color: Config.warning,
          icon: Icons.delete,
          onTap: () async {
            c4.listElementDelete(
                context: context, id: items[index][formClass.primaryKey]);
          },
        ),
      ],
    );
  }

  callWidget({int index}) {
    switch (index) {
      case 3:
        return c4.updateBuilder(
          textEditingControllerMap: textEditingControllerMap,
          viewData: _currentViewData,
        );
        break;
      case 2:
        return c4.viewBuilder(
          viewData: _currentViewData,
        );
        break;
      case 1:
        return fb();
        break;
      case 0:
        return c4.frmBuilder(
            textEditingControllerMap: textEditingControllerMap);
        break;
      default:
        return fb();
        break;
    }
  }
//////////////////////////////////////////////

  fb() {
    if (listQueryMode && data != null) {
      return Container(
        child: listBuilder(localListSearchData),
      );
    } else {
      //search on http

      var fx = Container(
        child: FutureBuilder(
          future: myhttp.getNewHttpData(specificUrl: url),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Text(
                    Translations.of(context).text("NothingToLoading") + "...");
              case ConnectionState.waiting:
                return Text(Translations.of(context).text("Loading") + "...");
              case ConnectionState.done:
              default:
                if (snapshot.hasError && !snapshot.hasData) {
                  return Text(Translations.of(context).text("BadResponse"));
                }
                return responseDecodeAndMakeList(snapshot.data);
            }
          },
        ),
      );

      setState(() {
        data = data;
      });

      return fx;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      //this is to avoid keyboad overlay and crash with the input boxes
      resizeToAvoidBottomPadding: false,

      drawer: CommonDrawer(),

      appBar: crudAppbarTitle(_selectedIndex, context),

      body: Center(
        child: callWidget(index: _selectedIndex),
      ),

      //same _selectedIndex i use for view and edit, del buttons them are not part of bottomNavigationBar
      //bottomNavigationBar contain only two buttons they are add - 0 and list - 1;
      //that is why i made currentIndex: _selectedIndex > 1 ? 1 : _selectedIndex,
      bottomNavigationBar: Template.bottomNav(
          context: context,
          currentIndex: _selectedIndex > 1 ? 1 : _selectedIndex,
          onTapped: _onItemTapped),
    ));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  crudAppbarTitle(int x, BuildContext context) {
    var title;

    switch (x) {
      case 0:
        title = AppBar(
          title: Text(
            Translations.of(context).text("Create") +
                " " +
                Translations.of(context).text(formClass.title),
            style: TextStyle(color: Theme.of(context).backgroundColor),
          ),
        );
        break;
      case 2:
        title = AppBar(
          title: Text(
            Translations.of(context).text("View") +
                " " +
                Translations.of(context).text(formClass.title),
            style: TextStyle(color: Theme.of(context).backgroundColor),
          ),
        );
        break;

      case 3:
        title = AppBar(
          title: Text(
            Translations.of(context).text("Update") +
                " " +
                Translations.of(context).text(formClass.title),
            style: TextStyle(color: Theme.of(context).backgroundColor),
          ),
        );
        break;

      case 1:
      default:
        title = SearchBar(
          defaultBar: AppBar(
            title: Text(
              Translations.of(context).text(formClass.title) +
                  " " +
                  Translations.of(context).text("List"),
              style: TextStyle(color: Theme.of(context).backgroundColor),
            ),
          ),
          onQueryChanged: (query) => _handleQueryChanged(query),
          onQuerySubmitted: (query) => _handleQuerySubmitted(query),
        );

        break;
    }

    return title;
  }

  // Unless you override noSuchMethod, using a
  // non-existent member results in a NoSuchMethodError.
  @override
  void noSuchMethod(Invocation invocation) {}

  _handleQueryChanged(String query) {
    if (data != null) {
      //pattern match element inn a map
      var pattern = query;

      RegExp regExp = new RegExp(
        pattern,
        caseSensitive: false,
      );

      Map localmap = {};

      if (data != null) {
        int i = 0;
        for (final v in data) {
          String line = v.toString();

          if (regExp.hasMatch(line)) {
            localmap[i] = v;
            i++;
          }
        }

        setState(() {
          listQueryMode = true;
          localListSearchData = localmap;
        });
      }
    }
  }

  _handleQuerySubmitted(String query) {
    //always gen new url with  query
    var nq = Config.url_base + myroute + Config.url_list + "?q=" + query;
//print(url);
//print(nq);
    if (url == nq) {
      setState(() {
        //print("local search");
        listQueryMode = true; //only local search
      });
    } else {
      //print("http serch");
      setState(() {
        listQueryMode = false;
      });
    }
    url = nq;
  }
}
