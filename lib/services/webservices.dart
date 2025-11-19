import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lagostv/models/noa_model.dart';

Future<List> fetchWpPost() async {
  final response = await http.get(Uri.parse("https://www.lagostelevision.com/wp-json/wp/v2/posts?_embed"), headers: {"Accept":"application/json"});
  var convertDataToJson = jsonDecode(response.body);
  return convertDataToJson;
}

Future<Welcome> nowOnAirData() async {
  final response = await http.get(Uri.parse("http://159.89.137.63/api/get_current_program?businessLocation=Lagos"), headers: {"Accept":"application/json"});
  var convertDataToJson = jsonDecode(response.body);
  return Welcome.fromJson(convertDataToJson);
}

