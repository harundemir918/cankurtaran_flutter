import 'dart:convert';
import 'dart:io';

import 'package:cankurtaran/models/earthquake_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user_model.dart';
import '../models/emergency_model.dart';
import '../constants.dart';

class Api {
  List<dynamic> _emergencyList = [];

  String token = '';

  _setToken(token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('token', token);
  }

  _getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    token = sharedPreferences.getString('token');
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };

  Future<bool> logIn({String email, String password}) async {
    var response = await http.post(
      apiLoginUrl,
      body: jsonEncode(
        {
          'email': email,
          'password': password,
        },
      ),
      headers: _setHeaders(),
    );
    if (response.statusCode == HttpStatus.ok &&
        jsonDecode(response.body)['token'] != null) {
      _setToken(jsonDecode(response.body)['token']);
      token = jsonDecode(response.body)['token'];
      return true;
    }
    return false;
  }

  Future<UserModel> fetchAuthUser(id) async {
    var response = await http.get('$apiUserUrl/$id');
    if (response.statusCode == HttpStatus.ok) {
      return UserModel.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }

  Future<List<EmergencyModel>> fetchEmergency() async {
    final response = await http.get(apiEmergencyUrl);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body) as Map;
      var values = jsonResponse['data'];
      if (values is List) {
        return values.map((e) => EmergencyModel.fromJson(e)).toList();
      }
    } else {
      print('Response code: ' + response.statusCode.toString());
      throw Exception('Fetch doesnt work');
    }
    // return null;
  }

  Future<List<EarthquakeModel>> fetchEarthquakes() async {
    final response = await http.get(apiQuakeUrl);
    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      // var values = jsonResponse;
      if (jsonResponse is List) {
        return jsonResponse.map((e) => EarthquakeModel.fromJson(e)).toList();
      }
    } else {
      print('Response code: ' + response.statusCode.toString());
      throw Exception('Fetch doesnt work');
    }
    // return null;
  }

  Future<void> sendMessage() async {
    var response = await http.get(apiSendMessageUrl);
    if (response.statusCode == 201) {
      print('Message sent');
    } else {
      throw Exception('Request failed with status: ${response.statusCode}.');
    }
  }
}
