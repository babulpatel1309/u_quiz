import 'package:flutter/cupertino.dart';
import 'package:u_quiz/utils/colors.dart';
import 'package:u_quiz/utils/routes.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _redirectToDashboard(context);

    return CupertinoPageScaffold(
      child: Container(
        child: Center(
          child: Text(
            "Let's begin",
            style: TextStyle(fontSize: 30, color: blueTextColor),
          ),
        ),
      ),
      backgroundColor: blueThemeColor,
    );
  }

  _redirectToDashboard(context) async {
    await Future.delayed(Duration(milliseconds: 2000));
    Navigator.pushReplacementNamed(context, dashboardScreen);
  }
}
