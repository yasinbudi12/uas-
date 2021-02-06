import 'package:flutter/material.dart';
import 'package:flutter_uas_pam/main.dart';

class Utama extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Center(
                    child: Container(
                        // margin: EdgeInsets.fromLTRB(
                        //     20,
                        //     10 + MediaQuery.of(context).size.height * 0.25,
                        //     20,
                        //     0),
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "UAS PAM",
                          style:
                              TextStyle(fontSize: 35, color: Color(0XFFF56D5F)),
                        ),
                        Text(
                          "Teguh Prasetyo\n20180801160",
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          color: Color(0XFFF56D5F),
                          child: Text(
                            "Selanjutnya",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginAja()));
                          },
                        )
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }
}
