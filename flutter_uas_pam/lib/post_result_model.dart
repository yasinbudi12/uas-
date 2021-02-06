import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getToken() async {
  String token = await FlutterSecureStorage().read(key: "jwt").toString();
  return token;
}

class PostResult {
  String nama;
  String token;

  PostResult({
    // this.id,
    this.nama,
    this.token,
  });

  String ambilToken() {
    return this.token;
  }

  factory PostResult.createPostResult(Map<String, dynamic> object) {
    try {
      return PostResult(
        nama: object['result']['res_user']['name'],
        token: object['result']['token'],
      );
    } catch (e) {
      return PostResult(
        nama: "error",
        token: "kosong",
      );
    }
  }

  static Future<PostResult> connectToAPI(
      String username, String password) async {
    String apiURL = "https://mg-indonesia.co.id/api/v1/login";

    var apiResult = await http.post(apiURL,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(
            <String, String>{'username': username, "password": password}));

    var jsonObject = json.decode(apiResult.body);
    // Create storage
    // final storage = new FlutterSecureStorage();
    // await storage.write(key: "jwt", value: "123456");
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("token", jsonObject['result']['token']);
    print(pref.getString("token"));
    print("ini yang di post result");

    return PostResult.createPostResult(jsonObject);
  }
}
