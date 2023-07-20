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

var myUserInfo = User(
    id: "io0818",
    password : "12345678",
    userName: "이지현",
    imagePath: "assets/images/user.png",
    userSchoolNum: "20210207",
    userGoodsNum: 0,
    isUserLogin: false,
    isMaster: true,
);
