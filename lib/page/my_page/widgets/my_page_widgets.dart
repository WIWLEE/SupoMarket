import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supo_market/page/my_page/usecases/my_page_usecases.dart';

import '../../../entity/item_entity.dart';
import '../../../entity/util_entity.dart';
import '../../../infra/my_info_data.dart';
import '../sub_my_info_page_change_password_page.dart';
import '../sub_my_info_page_change_profile_page.dart';
import '../sub_my_page_buying_page.dart';
import '../sub_my_page_my_info_page.dart';
import '../sub_my_page_qna_page.dart';
import '../sub_my_page_selling_page.dart';
import '../sub_my_page_settings_page.dart';

class SettingButton extends StatefulWidget {
  @override
  SettingButtonState createState() => SettingButtonState();
}

class SettingButtonState extends State<SettingButton> {
  // 여기에 상태를 나타내는 변수들을 선언하세요.

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          SubMyPageSettingPage(user: myUserInfo!)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/setting.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '  환경설정',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 17),
                )
              ],
            )));
  }
}

class LogoutButton extends StatefulWidget {
  @override
  LogoutButtonState createState() => LogoutButtonState();
}

class LogoutButtonState extends State<LogoutButton> {
  // 여기에 상태를 나타내는 변수들을 선언하세요.

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: InkWell(
            onTap: () {
              _LogOutPopUp(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/log-out.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '  로그아웃',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 17),
                )
              ],
            )));
  }

  void _LogOutPopUp(BuildContext context) {
    myPageUsecase.logOutPopUp(context);
  }
}

class QnAButton extends StatefulWidget {
  @override
  QnAButtonState createState() => QnAButtonState();
}

class QnAButtonState extends State<QnAButton> {
  // 여기에 상태를 나타내는 변수들을 선언하세요.

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SubMyPageQnAPage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/comment.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '  Q&A 게시판',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 17),
                )
              ],
            )));
  }
}

class MySoldButton extends StatefulWidget {
  final List<Item> list;

  const MySoldButton(this.list, {super.key});

  @override
  MySoldButtonState createState() => MySoldButtonState();
}

class MySoldButtonState extends State<MySoldButton> {
  // 여기에 상태를 나타내는 변수들을 선언하세요.

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubMyPageSellingPage(
                          list: widget.list, user: myUserInfo!)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/product.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '  판매 내역',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 17),
                )
              ],
            )));
  }
}


class MyBoughtButton extends StatefulWidget {
  final List<Item> list;

  const MyBoughtButton(this.list, {super.key});

  @override
  MyBoughtButtonState createState() => MyBoughtButtonState();
}

class MyBoughtButtonState extends State<MyBoughtButton> {
  // 여기에 상태를 나타내는 변수들을 선언하세요.

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubMyPageBuyingPage(
                          list: widget.list, user: myUserInfo!)));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/product.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '  구입 내역',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 17),
                )
              ],
            )));
  }
}


class MyInfoChangeButton extends StatefulWidget {
  @override
  MyInfoChangeButtonState createState() => MyInfoChangeButtonState();
}

class MyInfoChangeButtonState extends State<MyInfoChangeButton> {
  // 여기에 상태를 나타내는 변수들을 선언하세요.

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: InkWell(
            onTap: () async {
              await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubMyPageMyInfoPage()));
              setState(() {});
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/icons/user.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '  내 정보 변경',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 17),
                )
              ],
            )));
  }
}

class PlusButton extends StatefulWidget {
  @override
  PlusButtonState createState() => PlusButtonState();
}

class PlusButtonState extends State<PlusButton> {
  // 여기에 상태를 나타내는 변수들을 선언하세요.

  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      borderRadius: BorderRadius.circular(10.0),
      onTap: () {
        // + 버튼 동작 기능 넣기
      },
      // child: Image.asset('assets/images/icons/plus.png',
      //   width: 55,
      //   height: 55,),
    ));
  }
}

class NameNumber extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Text('${myUserInfo.userStudentNumber!}\n${myUserInfo.userName!}',
          // 여기 정보는 받아서 알아서 넣어줘
          style: const TextStyle(
              color: Colors.black,
              fontFamily: 'KBO-B',
              fontWeight: FontWeight.w300,
              fontSize: 20)),
    );
  }
}


class UserGrade extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset("assets/images/${myUserInfo.userGrade??"F"}.jpeg", scale: 10),
    );
  }
}

class ProfileImage extends StatefulWidget {
  @override
  ProfileImageState createState() => ProfileImageState();
}

class ProfileImageState extends State<ProfileImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: InkWell(
      onTap: () {
        // 프로필 사진 수정기능?? 그런거 넣자
      },
      child: Container(
        width: 80, // 박스의 너비
        height: 80, // 박스의 높이
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          image: DecorationImage(
            image: NetworkImage(myUserInfo.imagePath!),
            // 이미지 경로
            fit: BoxFit.cover, // 이미지가 박스에 꽉 차도록 설정
          ),
        ),
        //  실제로는 서버에서 받아와야함
      ),
    ));
  }
}

class Back extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: Icon(
          CupertinoIcons.back,
          size: 30,
        ));
  }
}

class PasswordChange extends StatefulWidget {
  @override
  PasswordChangeState createState() => PasswordChangeState();
}

class PasswordChangeState extends State<PasswordChange> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubMyInfoPageChangePasswordPage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/key.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '  비밀번호 변경', style: TextStyle(fontFamily: 'Arial', fontSize: 17),
                )
              ],
            )));
  }
}

class ProfileChange extends StatefulWidget {
  @override
  ProfileChangeState createState() => ProfileChangeState();
}

class ProfileChangeState extends State<ProfileChange> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        width: 350,
        child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SubMyInfoPageChangeProfilePage()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/icons/user.png',
                  width: 25,
                  height: 25,
                ),
                Text(
                  '  프로필 변경',
                  style: TextStyle(fontFamily: 'Arial', fontSize: 17),
                )
              ],
            )));
  }
}

class AlarmTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('키워드 알림',
          style: TextStyle(
              color: Colors.black,
              fontFamily: 'KBO-M',
              fontWeight: FontWeight.bold,
              fontSize: 18)),
    );
  }
}

class KeywordAlarm extends StatefulWidget {
  final bool isClicked;
  final String text;

  const KeywordAlarm({Key? key, required this.isClicked, required this.text})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return KeywordAlarmState();
  }
}

class KeywordAlarmState extends State<KeywordAlarm> {
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    isClicked = widget.isClicked;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.25,
      height: 100,
      decoration: isClicked!
          ? null
          : BoxDecoration(
              border: Border.all(color: Color(0xFFB70001), width: 4)),
      child: MaterialButton(
        color: isClicked! ? mainColor : Colors.white,
        onPressed: () {
          setState(() {
            isClicked = !isClicked!;
          });

          if (isClicked!) {
            myPageUsecase.postKeyword(widget.text);
          } else {
            myPageUsecase.patchKeyword(widget.text);
          }
        },
        child: Center(
          child: Text("#${widget.text}",
              overflow: TextOverflow.clip,
              maxLines: 1,
              style: TextStyle(
                  color: isClicked! ? Colors.white : mainColor,
                  fontFamily: 'KBO-M',
                  fontWeight: FontWeight.w700,
                  fontSize: 16)),
        ),
      ),
    );
  }
}

class MyItemCard extends StatefulWidget {
  final Image image;
  final String title;
  final String date;
  final int price;

  final Function() modify;
  final Function(int) stateChange;

  final String stateText;
  final bool isFastSell;

  MyItemCard({Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.price,
    required this.modify,
    required this.stateChange,
    required this.stateText,
    required this.isFastSell})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyItemCardState();
  }

}

class MyItemCardState extends State<MyItemCard>{

  FixedExtentScrollController? firstController;
  int initialIndex= 0;

  @override
  void initState() {
    super.initState();
    initialIndex = widget.stateText == "거래 중"? 0 : widget.stateText == "예약 중"? 1 : widget.stateText == "급처분 중"? 2 : 3;
    firstController = FixedExtentScrollController(initialItem: initialIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Card(
        margin: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.grey[200],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 125,
                        width: 125,
                        child: widget.image,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                    fontFamily: 'KBO-B', fontSize: 40),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '등록일시',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'KBO-B',
                                        fontSize: 15),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    widget.date,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'KBO-M',
                                        fontSize: 15),
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '가격',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontFamily: 'KBO-B',
                                      fontSize: 15),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${f.format(widget.price)}원",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontFamily: 'KBO-M',
                                      fontSize: 15),
                                )
                              ],
                            )
                          ]),
                    ),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: TextButton(
                      onPressed: widget.modify,
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          )),
                      child: const Center(
                        child: Text(
                          '수정하기',
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 150,
                        child: CupertinoButton(
                          minSize: 0,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 0),
                          color: mainColor,
                          onPressed: () {
                            showCupertinoModalPopup(
                                context: context,
                                builder: (context) {
                                  return SizedBox(
                                    height: 400,
                                    width: 400,
                                    child: Column(
                                      children: [
                                        Expanded(
                                          child: CupertinoPicker(
                                            itemExtent: 50,
                                            backgroundColor: Colors.white,
                                            scrollController: firstController,
                                            onSelectedItemChanged: (index) {
                                              widget.stateChange(index);
                                            },
                                            children: List<Widget>.generate(4, (index) {
                                              return Center(
                                                child: TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      index == 0
                                                          ? "판매 중"
                                                          : index == 1
                                                              ? "예약 중"
                                                              : index == 2
                                                                  ? "급처분 중"
                                                                  : "판매 완료",
                                                      style: const TextStyle(
                                                          fontSize: 15,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              );
                                            }),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                });
                          },
                          child: Text(
                            widget.stateText,
                            // "상품 종류 : ${newItem.itemType == ItemType.REFRIGERATOR ? "냉장고" : newItem.itemType == ItemType.MONITOR ? "모니터" : newItem.itemType == ItemType.BOOK ? "책" : newItem.itemType == ItemType.ROOM ? "자취방" : newItem.itemType == ItemType.CLOTHES ? "의류" : "기타"}",
                            textScaleFactor: 1.0,
                            style: const TextStyle(
                                fontFamily: 'KBO-B', fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MyItemCard2 extends StatefulWidget {
  final Image image;
  final String title;
  final String date;
  final int price;
  final String buyingDate;


  MyItemCard2({Key? key,
    required this.image,
    required this.title,
    required this.date,
    required this.price,
    required this.buyingDate,})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyItemCard2State();
  }

}

class MyItemCard2State extends State<MyItemCard2>{

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Card(
        margin: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.grey[200],
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 125,
                        width: 125,
                        child: widget.image,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                widget.title,
                                style: const TextStyle(
                                    fontFamily: 'KBO-B', fontSize: 40),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '등록일시',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'KBO-B',
                                        fontSize: 15),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    widget.date,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'KBO-M',
                                        fontSize: 15),
                                  )
                                ]),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  '가격',
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontFamily: 'KBO-B',
                                      fontSize: 15),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "${f.format(widget.price)}원",
                                  style: TextStyle(
                                      color: Colors.grey[600],
                                      fontFamily: 'KBO-M',
                                      fontSize: 15),
                                )
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    '구입일시',
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'KBO-B',
                                        fontSize: 15),
                                  ),
                                  const SizedBox(width: 10),
                                  Text(
                                    widget.buyingDate,
                                    style: TextStyle(
                                        color: Colors.grey[600],
                                        fontFamily: 'KBO-M',
                                        fontSize: 15),
                                  )
                                ]),
                          ]),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
