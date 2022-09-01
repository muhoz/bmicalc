import 'package:bmicalc/constaints.dart';
import 'package:bmicalc/input_page.dart';
import 'package:bmicalc/widget_content.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:simple_animations/simple_animations.dart';


class ResultPage extends StatelessWidget {
  final String bmi;
  final String result;
  final String interpretation;

  const ResultPage({Key? key, required this.bmi, required this.interpretation, required this.result}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.only(left: 40.0),
          child: Text('BMI RESULT',style: TextStyle(fontSize: 30,letterSpacing: 2,),),
        ),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 25),
          Expanded(
            flex: 5,
            child: Containerstyle(
                kActivecontainerGround,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Center(
                        child:TextLiquidFill(
                          text: result,
                          waveColor: Colors.green,
                          loadDuration: Duration(seconds: 3),
                          boxBackgroundColor: kActivecontainerGround,
                          textStyle: TextStyle(
                            fontSize: 50.0,
                            fontWeight: FontWeight.bold,
                          ),
                          boxHeight: 100.0,
                        )
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: PlayAnimation<double>(
                          tween: Tween(begin: 0,end: double.parse(bmi)),
                          duration: Duration(seconds: 3),
                          curve: Curves.easeIn,
                          builder: (context, child, value) {
                            return Text(
                              "$value",
                              style: const TextStyle(
                                  fontSize: 130.0, fontWeight: FontWeight.bold),
                            );
                          }),
                        ),
                      ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center(child: Text(interpretation,style: const TextStyle(fontSize: 25),textAlign: TextAlign.center,)),
                      ),
                    ),
                  ],
                ),
                () {}),
          ),
          const SizedBox(height: 25),
          Hero(
            tag: "bott",
            child: Container(
              height: kBottomHeightContainer,
              color: kBottomColorContainer,
              child: BottomButton(
                texte: "RE-CALCULATE",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
