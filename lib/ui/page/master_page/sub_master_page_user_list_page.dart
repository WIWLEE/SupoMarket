import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../entity/goods_entity.dart';
import '../log_in_page/log_in_page.dart';
import '../my_page/sub_my_info_page_change_password_page.dart';

Color postechRed = Color(0xffac145a);

class SubMasterPageUserListPage extends StatefulWidget {
  final List<Goods> list;
  const SubMasterPageUserListPage({super.key, required this.list});

  @override
  State<StatefulWidget> createState() {
    return _SubMasterPageUserListPageState();
  }
}

class _SubMasterPageUserListPageState extends State<SubMasterPageUserListPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar : AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 60,
        leading: Padding(padding: const EdgeInsets.only(top:10, left: 10),
            child: IconButton (onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.arrow_back, color: Colors.black45), iconSize: 30)
        ),
      ),
      body: Column(
        children: [
          //const Text(환경 설정)
          const SizedBox(width: 500, child: Divider(color: Colors.black, thickness: 0.1)),
          Expanded(child:
          ListView(
            children: [
              SizedBox(
                  height: 50,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => SubMyInfoPageChangePasswordPage()));
                    },
                    child: const Align(
                      alignment: Alignment.center,
                      child:
                          Column(
                            children: [
                              Text("유저를 저장하는 리스트가 firebase 함수에 없음.", style: TextStyle(fontSize: 12), textAlign: TextAlign.left),
                              Text("따로 User + UserCredential 저장하는 서버 구현해야할듯", style: TextStyle(fontSize: 12), textAlign: TextAlign.left),
                            ],
                      ),
                    ),
                  )
              ),
            ],
          ),
          )
        ],
      ),
    );
  }

}
