import 'dart:convert';

import 'package:for_work/model/contracts_model.dart';
import 'package:for_work/model/information_model.dart';
import 'package:http/http.dart';

class Network{
  static String BASE = "61cda3fd7067f600179c5b68.mockapi.io";
  static Map<String,String> headers = {'Content-Type':'application/json'};


  /* Http Apis */

  static String API_INFORMATION = "/informations";
  static String API_LIST = "/users";
  static String API_CREATE = "/users";
  static String API_UPDATE = "/users/"; //{id}
  static String API_DELETE = "/users/"; //{id}

  /* Http Request*/

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await get(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    print(params.toString());
    var uri = Uri.https(BASE, api); // http or https
    var response = await post(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api); // http or https
    var response = await put(uri, headers: headers,body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(BASE, api, params); // http or https
    var response = await delete(uri, headers: headers);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  /* Http Params */

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Contracts contracts) {
    Map<String, String> params = {};
    params.addAll({
      'fish': contracts.fish!,
      'amount': contracts.amount!,
      'lastInvoice' : contracts.lastInvoice!,
      'numInvoice' : contracts.numInvoice!,
      'turn' : contracts.turn!,
      'date' : contracts.date!,
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Contracts contracts) {
    Map<String, String> params = {};
    params.addAll({
      'id': contracts.id!,
      'fish': contracts.fish!,
      'amount': contracts.amount!,
      'lastInvoice' : contracts.lastInvoice!,
      'numInvoice' : contracts.numInvoice!,
      'turn' : contracts.turn!,
      'date' : contracts.date!,
    });
    return params;
  }

  /* HTTP Parsing */
  static List<Contracts> parsePostList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Contracts>.from(json.map((x) => Contracts.fromJson(x)));
    return data;
  }
  static List<Information> parseInformationList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Information>.from(json.map((x) => Information.fromJson(x)));
    return data;
  }
  static Contracts parsePost(String response) {
    dynamic json = jsonDecode(response);
    var data = Contracts.fromJson(json);
    return data;
  }
}