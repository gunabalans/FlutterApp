import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:me_arun/page/tpl/template.dart';
import 'package:me_arun/util/db.dart';

class HttpClient {
  var data;

  var postResponseMessage;

  getNewHttpData({String specificUrl}) async {
    var db = new Db();
    var authInfo = await db.getData("auth");
    String accessTocken;
    if (authInfo != null) {
      accessTocken = authInfo["AccessToken"];
      return this.getData(url: specificUrl, authString: accessTocken);
    } else {
      return null;
    }
  }

  postHttpData({String specificUrl, Map body}) {
    var db = new Db();
    db.getData("auth").then((authInfo) {
      String accessTocken = authInfo["AccessToken"];
      this
          .postData(url: specificUrl, authString: accessTocken, body: body)
          .then((response) {
        if (response.statusCode == 200) {
          postResponseMessage = this.httpResponseDecode(response: response);
        } else {
          postResponseMessage = null;
        }
      }).catchError((_) {
        postResponseMessage = null;
      });
    }).catchError((_) {
      postResponseMessage = null;
    });
  }

  getHttpData({String specificUrl}) {
    var db = new Db();
    db.getData("auth").then((authInfo) {
      String accessTocken = authInfo["AccessToken"];
      this.getData(url: specificUrl, authString: accessTocken).then((response) {
        if (response.statusCode == 200) {
          data = this.httpResponseDecode(response: response);
        } else {
          data = null;
        }
      }).catchError((_) {
        data = null;
      });
    }).catchError((_) {
      data = null;
    });
  }

  httpResponseDecode({BuildContext context, var response}) {
    if (response == null) {
      Template.sb(context, "NoResponse");
      return null;
    }

    var responceToJson;
    try {
      responceToJson = jsonDecode(response.body);

      /// print(responceToJson.toString());

      if (response.statusCode == 200) {
        return responceToJson;
      } else {
        if (context != null) {
          Template.sb(context, "BadRequest");
        }

        return null;
      }
    } catch (e) {
      if (context != null) {
        Template.sb(context, "NoResponse");
      }
      return null;
    }
  }

//post data
  Future<http.Response> getData({String url, String authString}) async {
    var headerMap = setHttpHeaders(addAuthorizationHeader: authString);

    try {
      final response = await http.get(url, headers: headerMap);

      return response;
    } catch (e) {
      //do a snake bar throw maningfull info to user
      //print(e.toString());
      return null;
    }
  } //get method

//post data
  Future<http.Response> postData(
      {String url, var body, String authString}) async {
    var headerMap = setHttpHeaders(addAuthorizationHeader: authString);

    try {
      final response = await http.post(url, body: body, headers: headerMap);

      return response;
    } catch (e) {
      //do a snake bar throw maningfull info to user
      //print(e.toString());
      return null;
    }
  } //post method

  //set headers
  Map setHttpHeaders({String addAuthorizationHeader}) {
    var headerMap = {
      HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
    };
    print(addAuthorizationHeader);
    if (addAuthorizationHeader != null) {
      headerMap[HttpHeaders.authorizationHeader] =
          "Bearer " + addAuthorizationHeader;
    }
    return headerMap;
  }
} //HttpClient class closing brace
