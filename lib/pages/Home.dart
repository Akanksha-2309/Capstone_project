import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_signup/DatabaseManager/DatabaseManager.dart';
import 'package:flutter_login_signup/Service/AuthenticationService.dart';
import 'package:flutter_login_signup/main.dart';
import 'package:flutter_login_signup/pages/AddMoney.dart';
import 'package:flutter_login_signup/pages/moneyWallet.dart';
import 'ProfileUI1.dart';
import'package:flutter_login_signup/pages/ProfileUI1.dart';
import 'package:flutter_login_signup/pages/barcode_scanner.dart';
// import 'package:provider/provider.dart';
import 'package:flutter_login_signup/pages/provider.dart';

import 'barcode_scanner.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => new _HomeState();
}

class _HomeState extends State<Home> {
  String uid;

  final AuthenticationService _auth = AuthenticationService();

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<AuthenticationService>(context);
    // final uid = user.uid;


    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          RaisedButton(
            onPressed: () async {
              // getUID();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings1()));
            },
            child: Icon(
              Icons.account_circle_sharp,
              size: 50,
              color: Colors.white,
            ),
            color: Colors.black,
          ),
        ],
      ),

      body: new Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[

            //First container
            new Container(
                padding: EdgeInsets.only(left: 100, top: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    new Column(
                      children: <Widget>[
                        new Text("I-Pay",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 50.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        new Padding(padding: EdgeInsets.all(5.0)),
                        new Text("Our very own wallet",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white
                          ),
                        )
                      ],
                    ),

                  ],
                )
            ), //first container end

            //Second Container start
            new Container(
              padding: EdgeInsets.only(
                  left: 30, top: 50, right: 30, bottom: 50),
              margin: EdgeInsets.all(10.0),
              child: new Column(
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[


                      new Container(
                        height: 150.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: InkWell(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              new Icon(
                                Icons.search,
                                size: 50.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 15.0,),
                              new Text("MONEY IN WALLET",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => WalletApp()));
                          },
                        ),
                      ), //first item container
                      SizedBox(width: 10.0,),
                      new Container(
                        height: 150.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: InkWell(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              new Icon(
                                Icons.pages,
                                size: 50.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 15.0,),
                              new Text("ADD MONEY",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => AddMoney()));
                          },
                        ),
                      ), //second item container


                    ],
                  ), //First Row End

                  //Second Row Start
                  SizedBox(height: 15.0,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Container(
                        height: 150.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.purple,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: InkWell(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              new Icon(
                                Icons.print,
                                size: 50.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 15.0,),
                              new Text("RECEIVE MONEY",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) => bc()));

                          },
                        ),
                      ),


                      SizedBox(width: 10.0,),
                      new Container(
                        height: 150.0,
                        width: 160.0,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(15.0)
                        ),
                        child: InkWell(
                          child: new Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[

                              new Icon(
                                Icons.chat,
                                size: 50.0,
                                color: Colors.white,
                              ),
                              SizedBox(height: 15.0,),
                              new Text("DASHBOARD",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                          onTap: () {

                          },
                        ),
                      ), //second item container


                    ],
                  ), //second Row End


                ],
              ),
            ),
          ],
        ),
      ), //end container
    );
  }

  // Future<void> getUID() async {
  //   dynamic uid = await _auth.getCurrentUID();
  //   if (uid == null) {
  //     print("UID is NULL");
  //   }
  //   else {
  //     print("uid-$uid");
  //     DatabaseManager databaseManager = DatabaseManager(uid: uid);
  //     DocumentSnapshot resultant = await databaseManager.getUsersList();
  //
  //     if (resultant == null) {
  //       print('Unable to retrieve');
  //     } else {
  //       setState(() {
  //         print(resultant.get('name'));
  //         print(resultant.get('rollNo'));
  //        // String name = resultant.g;
  //        // String rollNo = resultant[1];
  //        // print("name = $name");
  //        // print("rollNor = $rollNo");
  //       });
  //     }
  //   }
  // }
}