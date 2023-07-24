import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../infra/users_info_data.dart';
import 'auth_email_page.dart';
import 'log_in_page.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:html';

Color postechRed = Color(0xffac145a);

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _RegisterPageState();
  }
}

class _RegisterPageState extends State<RegisterPage> {

  bool isChecked = false;
  TextEditingController id = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password2 = TextEditingController();
  TextEditingController userName = TextEditingController();
  TextEditingController userSchoolNum = TextEditingController();

  String newID = "";
  String newPassword = "";
  String newPassword2 = "";
  String newUserName = "";
  String newUserSchoolNum = "";
  bool checkForArrive = false;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    newID = "";
    newPassword = "";
    newPassword2 = "";
    newUserName = "";
    newUserSchoolNum = "";
    checkForArrive = false;
  }

  //비밀번호 7자리 이상, 아이디는 이메일 폼
  Future<void> createEmailAndPassword(String id, String password, String userName, String newUserSchoolNum) async {
    try {
      final credential = await firebaseAuth.createUserWithEmailAndPassword(
        email: id,
        password: password,
      );
      if(credential.user != null){
        allUserIDPWList.add(credential);
        credential.user?.updateDisplayName(newUserName);
        //학번
        checkForArrive = true;
        return;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        _weakPasswordPopUp();
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        _alreadyExistPopUp();
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    checkForArrive = false;
    return;
  }

  // Future _uploadImage() async {
  //
  //   Reference _ref = http.get(Uri.parse("https://picsum.photos/seed/picsum/200/300");
  //
  //   if(_ref != null) {
  //     // 업로드 완료되면 데이터의 주소를 얻을수 있음, future object
  //     var downloadUrl = await _ref.getDownloadURL();
  //
  //     // post collection 만들고, 하위에 문서를 만든다
  //     var doc = FirebaseFirestore.instance.collection('images').doc();
  //     doc.set({
  //       'id': doc.id,
  //       'datetime' : DateTime.now().toString(),
  //       'displayName': firebaseAuth.currentUser?.displayName,
  //       'userPhotoUrl': "https://images.chosun.com/resizer/dP9UUdi85WMXOMeeedo_N8SjGsQ=/574x749/smart/cloudfront-ap-northeast-1.images.arcpublishing.com/chosun/PBP3VTZFSA3FLQAEYKMXPD7LQE.jpg",
  //     }).then((onValue) {
  //       //정보 인서트후, 상위페이지로 이동
  //       Navigator.pop(context);
  //     });
  //   }
  // }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/main_logo.jpg'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: postechRed.withOpacity(0.9),
        body: Stack(
          children: [
            isPressed == true?
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ) : const SizedBox(width: 0, height: 0),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                '회원가입', style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: id,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "이메일",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              suffixText: "@postech.ac.kr",
                            ),
                            onChanged: (text){
                              setState(() {
                                newID = "$text@postech.ac.kr";
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: password,
                            style: const TextStyle(),
                            obscureText: true, //패스워드 별표 처리
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "비밀번호",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (text){
                              setState(() {
                                newPassword = text;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: password2,
                            style: const TextStyle(),
                            obscureText: true, //패스워드 별표 처리
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "비밀번호 재입력",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (text){
                              setState(() {
                                newPassword2 = text;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: userName,
                            style: const TextStyle(),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "이름",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (text){
                              setState(() {
                                newUserName = text;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            controller: userSchoolNum,
                            style: const TextStyle(),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "학번",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onChanged: (text){
                              setState(() {
                                newUserSchoolNum = text;
                              });
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Text(
                                'Sign Up', style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700, color: Colors.black45),
                              ),
                              const SizedBox(width: 15),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () async {

                                      if(newPassword.compareTo(newPassword2)==0) {
                                        setState(() {
                                          isPressed = true;
                                        });

                                        await createEmailAndPassword(newID, newPassword, newUserName, newUserSchoolNum);

                                        setState(() {
                                          isPressed = false;

                                          if (checkForArrive) {
                                            //로그인 되어있으면 넘어가기
                                            //_uploadImage();
                                            Navigator.pushAndRemoveUntil(
                                                context, MaterialPageRoute(
                                                builder: (BuildContext context) => AuthEmailPage()), (route) => false);
                                          }
                                        });
                                      } else{
                                        _differentPasswordPopUp();
                                      };
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                left: 10, top : 30,
                child: IconButton (onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: Colors.white54), iconSize: 30)
            ),
          ],
        ),
      ),
    );
  }

  void _differentPasswordPopUp() {
    showDialog(
      context: context,
      barrierDismissible: false, //여백을 눌러도 닫히지 않음
      builder: (BuildContext context) {
        return AlertDialog(
          content: const SingleChildScrollView(child: Text("비밀번호가 다릅니다")),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: const Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _alreadyExistPopUp(){
    showDialog(
      context: context,
      barrierDismissible: false, //여백을 눌러도 닫히지 않음
      builder: (BuildContext context) {
        return AlertDialog(
          content: const SingleChildScrollView(child: Text("이미 존재하는 계정입니다")),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: const Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _weakPasswordPopUp(){
    showDialog(
      context: context,
      barrierDismissible: false, //여백을 눌러도 닫히지 않음
      builder: (BuildContext context) {
        return AlertDialog(
          content: const SingleChildScrollView(child: Text("너무 비밀번호가 약합니다")),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: const Text("확인"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
