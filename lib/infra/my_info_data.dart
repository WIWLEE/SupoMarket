import '../entity/setting_entity.dart';
import '../entity/user_entity.dart';

var mySetting = Setting(
  chattingAlarm: false,
  categoryAlarms:
  {"냉장고" : true,
    "의류" : false,
    "자취방" : false,
    "모니터" : false,
    "책" : false,
    "기타" : false},
  selectedCategoryAlarm: "없음",
);

AUser myUserInfo = AUser(
  id: "",
  password : "",
  userName: "",
  imagePath: "https://firebasestorage.googleapis.com/v0/b/supomarket-b55d0.appspot.com/o/assets%2Fimages%2Fuser.png?alt=media&token=3b060089-e652-4e59-9900-54d59349af96",
  userSchoolNum: "",
  userGoodsNum: 0,
  isUserLogin: false,
  isMaster: true,
);
