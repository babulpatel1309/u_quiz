import 'package:flutter/cupertino.dart';
import 'package:u_quiz/ui/DashboardScreen.dart';
import 'package:u_quiz/ui/QuizScreen.dart';
import 'package:u_quiz/ui/SplashScreen.dart';
import 'package:u_quiz/utils/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp>{

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'U-Quize',
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.activeBlue,
      ),
      home: SplashScreen(),
      routes: <String,WidgetBuilder> {
        splashScreen:(ctx) => SplashScreen(),
        dashboardScreen:(ctx) => DashboardScreen(),
        quizScreen:(ctx) => QuizScreen(),
      },
    );
  }

}
