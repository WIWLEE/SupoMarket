import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../entity/user_entity.dart';
import '../infra/users_info_data.dart';

class UserViewModel with ChangeNotifier {

  List<AUser> _allUserList = [];
  AUser _myUserInfo = AUser(
    id: "",
    password : "",
    userName: "",
    imagePath: "https://firebasestorage.googleapis.com/v0/b/supomarket-b55d0.appspot.com/o/assets%2Fimages%2Fuser.png?alt=media&token=3b060089-e652-4e59-9900-54d59349af96",
    userSchoolNum: "",
    userGoodsNum: 0,
    isUserLogin: false,
    isMaster: true,
  );

  List<AUser> get allUserList => _allUserList;
  AUser get myUserInfo => _myUserInfo;

  Future<void> fetchUserList() async {
    //유저리스트 받아와서 toList로 _allUserList에 넣기

  }

  Future<void> fetchMyUserInfo() async {
    //유저 정보 받아오기

  }

  void isUserLogin() {

    //로그인 여부 판단
    if(firebaseAuth.currentUser != null){
      _myUserInfo.isUserLogin = true;
      debugPrint("로그인 상태입니다");
    }
    else{
      debugPrint("로그아웃 상태입니다");
    }

  }

  Future<void> getMyUserInfo() async{
    _myUserInfo.id = firebaseAuth.currentUser?.email;
    _myUserInfo.userName = firebaseAuth.currentUser?.displayName;

    Reference ref = FirebaseStorage.instance.ref().child('users').child(firebaseAuth.currentUser!.uid).child("profile"+".jpg");
    if(ref!=null) {
      try{
        String url = await ref.getDownloadURL();
        _myUserInfo.imagePath = url;
        debugPrint("프로필 사진 가져오기");
      } catch (e, stack) {
        debugPrint("업로드된 이미지가 아직 없습니다");
      }
    }

    ref = FirebaseStorage.instance.ref().child("users").child(firebaseAuth.currentUser!.uid).child("userSchoolNum"+".txt");
    if(ref!= null) {
      debugPrint("학번 가져오기");
      _myUserInfo.userSchoolNum= ref.name;
    }

    ref = FirebaseStorage.instance.ref().child("users").child(firebaseAuth.currentUser!.uid).child("password"+".txt");
    if(ref!= null) {
      debugPrint("비밀번호 가져오기");
      _myUserInfo.password= ref.name;
    }
  }
}
