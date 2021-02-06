import 'package:flutter/material.dart';
import 'package:flutter_uas_pam/list.dart';
import 'package:flutter_uas_pam/logingagal.dart';
import 'package:flutter_uas_pam/pageawal.dart';
import 'package:flutter_uas_pam/post_result_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Utama(),
    );
  }
}

class LoginAja extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  PostResult postResult = null;
  var jikaeror;
  TextEditingController text_username = TextEditingController();
  TextEditingController text_password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Logon"),
      // ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFFFE5788), Color(0XFFF56D5D)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
          ),
          Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              child: Card(
                child: Stack(
                  children: [
                    Opacity(
                      opacity: 0.7,
                      child: Container(
                          decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        image: DecorationImage(
                            image: NetworkImage(
                                "https://www.toptal.com/designers/subtlepatterns/patterns/memphis-mini.png"),
                            fit: BoxFit.cover),
                      )),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.person,
                              size: MediaQuery.of(context).size.height * 0.2,
                              color: Color(0xFFFE5799),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(
                          20,
                          10 + MediaQuery.of(context).size.height * 0.25,
                          20,
                          0),
                      child: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(
                                labelText: "Username",
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            controller: text_username,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          TextField(
                            decoration: InputDecoration(
                                labelText: "Password",
                                suffix: Icon(Icons.remove_red_eye_sharp),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            controller: text_password,
                            obscureText: true,
                          ),
                          Spacer(
                            flex: 1,
                          ),
                          Container(
                            width: double.infinity,
                            height: 60,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Color(0XFFF56D5F),
                              child: Text(
                                "Masuk",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              onPressed: () {
                                // print(text_username.text);
                                // print(text_password.text);
                                PostResult.connectToAPI(
                                        text_username.text, text_password.text)
                                    .then((value) {
                                  postResult = value;
                                  postResult.nama == "error"
                                      ? Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginGagal()))
                                      : Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginBerhasil()));
                                });
                              },
                            ),
                          ),
                          Spacer(
                            flex: 12,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
