import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supo_market/firebase_options.dart';
import '../../infra/my_info_data.dart';
import '../../infra/users_info_data.dart';
import 'control_page.dart';
import 'log_in_page/log_in_page.dart';


Color postechRed = Color(0xffac145a);


class WelcomePage extends StatelessWidget {

  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          fontFamily: 'Nanum'
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body : Center(
          child : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child : Image.asset('assets/images/main_logo.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child : MaterialButton(
                    height: 60,
                    minWidth: 180,
                    shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20.0)),
                    color: const Color(0xffac145a),
                    elevation: 5,
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LogInPage()));
                    },
                    child: const Text("시작하기", textScaleFactor: 2.0, textAlign: TextAlign.center, style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
