import 'package:flutter/cupertino.dart';
import 'package:u_quiz/utils/colors.dart';
import 'package:u_quiz/utils/images.dart';

class QuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return QuizScreenState();
  }
}

class QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int selectedIndex = -1;
  List<Map<String, List<String>>> questions = List<Map<String, List<String>>>();
  var answersSelection = List<int>();

  @override
  void initState() {
    super.initState();
    var options1 = [
      'Mature, globally consolidated, well-established, sophisticated',
      'Regionally consolidated, evolving, under construction',
      'Partially managed with a goal of greater maturity',
      'Newly managed',
      'Unmanaged'
    ];

    var options2 = [
      'Early adopter of new technologies',
      'Receptive to new technologies, but not early adopter',
      'Comfortable with technology used today, but not looking at new technology',
      'Comfortable with long-established practices, not looking at new technology',
    ];

    var options3 = [
      'Very important, equal to savings',
      'A major focus, but less important than savings',
      'The top priority',
    ];

    var options4 = [
      'Traditional Hotels',
      'Alternative Accommodations',
      'Extended Stay',
      'Temporary Housing',
    ];

    var options5 = [
      'Less than 7 nights',
      '7-14 nights',
      '15-29 nights',
      '30+ nights',
      'Other'
    ];

    questions.add({
      'Which option below best describes your current accommodations program?':
          options1
    });

    questions.add({
      'Which of the following best characterizes your accommodations program?':
          options2
    });

    questions.add({
      'In my accommodations program today, traveler safety and security is':
          options3
    });

    questions.add({
      'What area do you believe is your accommodations program’s largest opportunity for new savings?':
          options4
    });

    questions
        .add({'How do you define an Extended Stay at your company?': options5});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: GestureDetector(
              onTap: () => {Navigator.pop(context)},
              child: Row(
                children: <Widget>[
                  Icon(
                    CupertinoIcons.back,
                    color: blueTextColor,
                  ),
                  Center(
                    child: Text(
                      "Back",
                      style: TextStyle(
                        color: blueTextColor,
                      ),
                    ),
                  ),
                ],
              )),
          middle: Text(showResult ? "Result" : "Survey"),
        ),
        child: SingleChildScrollView(
          child: Container(
            child: Center(
              child: _buildQuiz(),
            ),
          ),
        ),
        backgroundColor: blueThemeColor,
      ),
    );
  }

  _buildQuiz() {
    return Column(
      children: showResult ? _showResult() : _getQuestionsLayout(),
    );
  }

  _getQuestionsLayout() {
    var widget = List<Widget>();

    widget.add(SizedBox(
      height: 100,
    ));

    widget.add(Text(
      "Questions ${currentIndex + 1} of 5",
      style: TextStyle(
          fontSize: 20, color: blueTextColor, fontWeight: FontWeight.w600),
    ));
    widget.add(SizedBox(
      height: 20,
    ));
    widget.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        questions[currentIndex].entries.toList()[0].key,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30, color: blueTextColor, fontWeight: FontWeight.w800),
      ),
    ));
    widget.add(Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: _getOptions(questions[currentIndex]
            [questions[currentIndex].entries.toList()[0].key]),
      ),
    ));
    widget.add(CupertinoButton(
      child: Text(
        "NEXT",
        style: TextStyle(color: blueTextColor, fontWeight: FontWeight.w600),
      ),
      onPressed: () => {_nextQuestion()},
      color: buttonColor,
    ));

    return widget;
  }

  _getOptions(List<String> options) {
    var widget = List<Widget>();

    for (int i = 0; i < options.length; i++) {
      widget.add(GestureDetector(
        onTap: () => {
          setState(() {
            selectedIndex = i;
          })
        },
        child: Row(
          children: <Widget>[
            Icon(
              (selectedIndex == i)
                  ? CupertinoIcons.check_mark_circled_solid
                  : CupertinoIcons.check_mark_circled,
              color: (selectedIndex == i) ? blueTextColor : greyColor,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                options[i],
                style: TextStyle(
                    fontSize: 20,
                    color: blueTextColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ));

      widget.add(SizedBox(
        height: 10,
      ));
    }

    return widget;
  }

  var showResult = false;

  _nextQuestion() {

    if(selectedIndex>=0){
      setState(() {
        answersSelection.add(selectedIndex);
        selectedIndex = -1;
        if (currentIndex < 4) {
          currentIndex++;
        } else {
          //Finish
          showResult = true;
        }
      });
    }else{
      _showError(context);
    }

  }

  _showResult() {
    var widget = List<Widget>();

    widget.add(SizedBox(
      height: 100,
    ));

    widget.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Image.asset(
        resultImage,
        height: 200,
      ),
    ));

    widget.add(Text(
      "Your Result",
      style: TextStyle(
          fontSize: 20, color: blueTextColor, fontWeight: FontWeight.w600),
    ));

    widget.add(Text(
      "Lion",
      style: TextStyle(
          fontSize: 30, color: blueTextColor, fontWeight: FontWeight.w600),
    ));

    for (int i = 0; i < questions.length; i++) {
      widget.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: RichText(
          text: TextSpan(
            style: TextStyle(color: blueTextColor, fontSize: 16),
            children: <TextSpan>[
              TextSpan(
                  text: "Q${i + 1}.",
                  style: TextStyle(
                      fontSize: 25,
                      color: blueTextColor,
                      fontWeight: FontWeight.w900)),
              TextSpan(
                  text: " ${questions[currentIndex].entries.toList()[0].key} ",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ));

      widget.add(Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          color: lightGreenColor,
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: blueTextColor, fontSize: 16),
              children: <TextSpan>[
                TextSpan(
                    text: "A${i + 1}.",
                    style: TextStyle(
                        fontSize: 25,
                        color: blueTextColor,
                        fontWeight: FontWeight.w900)),
                TextSpan(
                    text: " ${questions[currentIndex][questions[currentIndex].entries.toList()[0].key][answersSelection[i]]}",
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
        ),
      ));
    }

    return widget;
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
      content: Text("Pleasee choose valid option."),
    ));
  }
}
