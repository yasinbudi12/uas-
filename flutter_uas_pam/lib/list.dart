import 'package:flutter/material.dart';
import 'package:flutter_uas_pam/main.dart';
import 'package:flutter_uas_pam/post_result_model.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBerhasil extends StatefulWidget {
  @override
  _LoginBerhasilState createState() => _LoginBerhasilState();
}

class _LoginBerhasilState extends State<LoginBerhasil> {
  List data;

  final String apiUrl =
      "https://mg-indonesia.co.id/api/v1/opname/2020-11-26/2020-11-27";
  Future<String> getData() async {
    String initoken;
    SharedPreferences pref = await SharedPreferences.getInstance();
    initoken = pref.getString("token");
    print(initoken);
    print("initoken yang di get Dta");
    // getToken().then((value) => initoken = value);

    var res = await http.get(apiUrl, headers: {
      "Authorization": "Bearer " + initoken,
      "Content-Type": "application/json"
    });
    setState(() {
      var content = json.decode(res.body);
      List listdata = content['result'][0];
      data = listdata;
    });
    return 'success';
  }

  void initState() {
    // postResult = LoginPage().;
    super.initState();
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(appBarTheme: AppBarTheme(color: Color(0xFFFE5788))),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Dashboard"),
          ),
          body: data == null
              ? Center(
                  child: Container(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [Color(0xFFFE5788), Color(0XFFF56D5D)],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter)),
                    ),
                    ListView.builder(
                        itemCount: data != null ? (data?.length ?? 0) : 0,
                        itemBuilder: (context, index) {
                          return Card(
                            //                           <-- Card widget
                            clipBehavior: Clip.antiAlias,
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 10.0),
                                  // leading: Icon(icons[index]),
                                  title: Text(
                                    data[index]['name'],
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  subtitle: Text("Qt: " +
                                      data[index]['product_qty'].toString() +
                                      "\nCategoty: " +
                                      data[index]['category'].toString()),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(data[index]['product_id'],
                                      style: TextStyle(
                                          color:
                                              Colors.black.withOpacity(0.6))),
                                )
                              ],
                            ),
                          );
                        }),
                    Align(
                      // alignment: Alignment.bottomCenter,
                      alignment: Alignment.bottomCenter,
                      child: Text("By Teguh Prasetyo 20180801160"),
                    )
                  ],
                ),
        ));
  }
}
