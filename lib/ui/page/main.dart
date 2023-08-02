import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:supo_market/firebase_options.dart';
import 'package:supo_market/ui/page/splash_page.dart';
import 'package:supo_market/ui/page/welcome_page.dart';
import 'package:supo_market/view_model/user_view_model.dart';
import '../../infra/my_info_data.dart';
import '../../infra/users_info_data.dart';
import 'control_page.dart';
import 'log_in_page/log_in_page.dart';


Color postechRed = Color(0xffac145a);

void main() async {

  //firebase 사용을 위한 호출들
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserViewModel()),
        ],
        child: MyApp(),
      ),
  );
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        theme: ThemeData(
          fontFamily: 'Nanum',
        ),
        home:
          FutureBuilder(
            future: Future.delayed(
                const Duration(seconds: 3), () => "Intro Completed."),
            builder: (context, snapshot) {
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: SplashConditionWidget(snapshot, context),
              );
            },
        ),
        initialRoute: '/',
        routes: {'/control': (context) => ControlPage(),
          //'/subHome': (context) => const HomePage(),
        }
    );
  }
}

Widget SplashConditionWidget(AsyncSnapshot<Object?> snapshot, BuildContext context) {

  if(snapshot.hasError) {
    return const Text("Error!!");
  } else if(snapshot.hasData) {
    Provider.of<UserViewModel>(context).isUserLogin();
    Provider.of<UserViewModel>(context).fetchUserList();
    Provider.of<UserViewModel>(context).fetchMyUserInfo();
    Provider.of<UserViewModel>(context).getMyUserInfo();
    return Provider.of<UserViewModel>(context).myUserInfo.isUserLogin! ? ControlPage() : WelcomePage();
  } else {
    return SplashScreen();
  }
}
