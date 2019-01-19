import 'package:flutter/material.dart';
import 'package:me_arun/util/translations.dart';

class Template {
  /*
  * BottomNavigationBar auto generation method
  */
  static BottomNavigationBar bottomNav(
      {BuildContext context,
      int currentIndex,
      var onTapped,
      Map<String, Icon> navItemList}) {
    //navigation icon and title map
    //if this data passed to thid funtion that will h=be taken
    //else defaulat map will be used
    Map<String, Icon> navList = navItemList ??
        {
          "Add": Icon(Icons.add_circle, semanticLabel: "Add"),
          "List": Icon(Icons.format_list_bulleted, semanticLabel: "List"),
        };

//actual generate BottomNavigationBarItem array
    List<BottomNavigationBarItem> navItems = [];
    navList.forEach((k, v) {
      navItems.add(BottomNavigationBarItem(
          icon: v,
          //backgroundColor: Theme.of(context).primaryColor,
          title: Text(Translations.of(context).text(k))));
    });

    return BottomNavigationBar(
      //fixedColor: Theme.of(context).backgroundColor,
      type: BottomNavigationBarType.fixed,
      items: navItems,
      currentIndex: currentIndex,
      onTap: onTapped,
    );
  }

  static Widget listView({BuildContext context, List<Widget> children}) {
    return myContainer(
      context: context,
      child: SingleChildScrollView(
        // controller: controller,
        child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: children),
      ),
    );
  }

/*
* Single colum frame
*/
  static Widget singleColumn({BuildContext context, List<Widget> children}) {
    return myContainer(
      context: context,
      child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children),
    );
  }

//container
  static Widget myContainer({BuildContext context, Widget child}) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      //color: Theme.of(context).backgroundColor,
      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: child,
    );
  }

//snake bar gen
  static sb(BuildContext context, String value) async {
    var val = Translations.of(context).text(value);
    return Scaffold.of(context).showSnackBar(SnackBar(
      backgroundColor: Theme.of(context).primaryColor,
      content: Text(val),
    ));
  }

  static Text textTitle({BuildContext context, String title}) => Text(
        Translations.of(context).text(title),
        style: Theme.of(context).textTheme.title,
        textAlign: TextAlign.center,
      );

  static sizeBox({double height}) => SizedBox(
        height: height,
      );

  static borderBottom(BuildContext context) {
    return BoxDecoration(
        border: new Border(
            bottom: BorderSide(
      color: Theme.of(context).dividerColor,
    )));
  }
} //templte
