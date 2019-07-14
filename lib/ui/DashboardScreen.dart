import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:u_quiz/utils/colors.dart';
import 'package:u_quiz/utils/routes.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DashboardState();
  }
}

class DashboardState extends State<DashboardScreen> {
  TextEditingController nameController = TextEditingController();
  GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Center(child: Text("U-Quiz")),
        ),
        child: Container(
          child: Center(
            child: _dashboard(),
          ),
        ),
        backgroundColor: blueThemeColor,
      ),
    );
  }

  _dashboard() {
    return Column(
      children: <Widget>[
        SizedBox(
          height: 100,
        ),
        Text(
          "Personality Quiz",
          style: TextStyle(
              fontSize: 20, color: blueTextColor, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "What's your\nAccomodations\nProgram Spirit\nAnimal?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50,
            color: blueTextColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "Enter You Name",
          style: TextStyle(
              fontSize: 20, color: blueTextColor, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5,
        ),
        SizedBox(
          width: 200,
          child: CupertinoTextField(
            decoration: BoxDecoration(
              border: Border.all(color: CupertinoColors.black,width: 1),
              color: CupertinoColors.white
            ),
            textInputAction: TextInputAction.done,
            placeholder: "Name",
            style: TextStyle(
                fontSize: 20,
                color: blueTextColor,
                fontWeight: FontWeight.w600),
            controller: nameController,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        CupertinoButton(
          child: Text("START QUIZ",style: TextStyle(
               color: blueTextColor, fontWeight: FontWeight.w600),),
          onPressed: () => {_startQuiz()},
          color: buttonColor,
        )
      ],
    );
  }

  _startQuiz(){
    if(nameController.text.isEmpty){
      _showError(context);
      return;
    }
    
    Navigator.pushNamed(context, quizScreen);
  }

  _showError(context){
    showCupertinoDialog(context: context, builder: (ctx)=> CupertinoAlertDialog(
      actions: <Widget>[
        CupertinoButton(
          child: Text("Ok"),
          onPressed: () => {
            Navigator.pop(context)
          },
        )
      ],
      title: Text("Error"),
      content: Text("Pleasee enter valid name."),
    ));
  }
}
