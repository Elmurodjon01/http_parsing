import 'dart:convert';

import 'package:http/http.dart';
import 'package:http_parsing/model/emplist.dart';

import '../model/empOne.dart';
import '../model/user.dart';

class Net {
  static String base = 'dummy.restapiexample.com';
  static Map<String, String> headers = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  static String Api_get = '/api/v1/employees';
  static String Api_getSingle = '/api/v1/employee/1';
  static String Api_post = '/api/v1/create';
  static String Api_put = '/public/api/v1/update/21';

  //http requests
  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api, params);
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }
  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api);
    var response = await post(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api);
    var response = await put(uri, headers: headers, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(base, api, params);
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    null;
  }

  //http params
  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(User user) {
    //try to convert empty map type to map literal, not params = Map(), but just {} is fine,
    //defining the map type with params = Map() may cause a null
    Map<String, String> params = {};
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(User user) {
    Map<String, String> params = {};
    params.addAll({
      'name': user.name,
      'salary': user.salary,
      'age': user.age.toString(),
    });
    return params;
  }

  //parsing
  static EmpList parseEmpList(String response){
    dynamic json=jsonDecode(response);
    var data = EmpList.fromJson(json);
    return data;
  }
  static EmpOne parseEmpOne(String response){
    dynamic json=jsonDecode(response);
    var data = EmpOne.fromJson(json);
    return data;
  }
}

