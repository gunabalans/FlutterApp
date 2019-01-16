import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class Db {
  Future<Database> sembast() async {
    try {
      Directory appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      String dbPath = join(appDocPath, "me.db");
      DatabaseFactory dbFactory = databaseFactoryIo;
      return await dbFactory.openDatabase(dbPath);
    } catch (e) {
      //do a snake bar throw maningfull info to user
      //print(e.toString());
      return null;
    }
  }

  getData(String key) async {
    var dBCon = await this.sembast();

    if (dBCon == null) {
      return null;
    }

    var authenticated = await dBCon.containsKey(key);

    if (authenticated) {
      try {
        return await dBCon.get(key);
      } catch (e) {
        await dBCon.close();
        return null;
      } finally {
        await dBCon.close();
      }
    } else {
      await dBCon.close();
      return null;
    }
  }

  remData(String key) async {
    var dBCon = await this.sembast();

    if (dBCon == null) {
      return null;
    }

    var authenticated = await dBCon.containsKey(key);

    if (authenticated) {
      await dBCon.delete(key);
      return await dBCon.close();
    } else {
      return await dBCon.close();
    }
  }

  logout() async {
    return await this.remData("auth");
  }

  checkLogin({context, route}) {
    this.getData("auth").then((vl) {
      if (vl == null) {
        Navigator.of(context).pushNamed(route);
      }
    });
  }
}
