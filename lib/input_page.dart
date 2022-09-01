import 'package:bmicalc/custom_page_route.dart';
import 'package:bmicalc/icon_content1.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'widget_content.dart';
import 'icon_content.dart';
import 'constaints.dart';
import 'package:bmicalc/functionality.dart';
import 'package:bmicalc/Result_page.dart';

enum gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  gender selectedGender=gender.male;
  int height = 150;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Center(
          child: Text(
            'BMI CALCULATOR',
            style: TextStyle(letterSpacing: 2,fontSize: 30),
          ),
        ),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Containerstyle(
                    selectedGender == gender.male
                        ? kActivecontainerGround
                        : kInactivecontainerGround,
                    const ColumnDesign(
                        icone: FontAwesomeIcons.mars,
                        texte: 'MALE',
                        color1: Color(0xFFFFFFFF)),
                        () {
                      setState(() {
                        selectedGender = gender.male;
                      });
                    },
                  ),
                  flex: 1,
                ),
                Expanded(
                  child: Containerstyle(
                    selectedGender == gender.female
                        ? kActivecontainerGround
                        : kInactivecontainerGround,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ColumnDesign1(
                          icone: FontAwesomeIcons.venus,
                          texte: 'FEMALE',
                          color1: Color(0xFFFFFFFF),
                        ),
                      ],
                    ),
                        () {
                      setState(() {
                        selectedGender = gender.female;
                      });
                    },
                  ),
                  flex: 1,
                ),
              ],
            ),
            flex: 1,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Expanded(
            child: Containerstyle(
                kActivecontainerGround,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 3),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0),
                      child: const Text('HEIGHT (cm)', style: kLabelTextStyle,),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(width: 20),
                        Text(height.toString(), style: kNumbStyle),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        trackHeight: 2,
                        thumbColor: const Color(0xFFEB1555),
                        thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 10.0),
                        activeTrackColor: kBottomColorContainer,
                        overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 35.0),
                        overlayColor: const Color(0x30EB1555),
                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 100.0,
                          max: 220.0,
                          inactiveColor: const Color(0xFF8D8E98),
                          onChanged: (double newValue) {
                            setState(() {
                              height = newValue.round();
                            });
                          }),
                    )
                  ],
                ),
                    () {}),
            flex: 1,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Containerstyle(
                      kActivecontainerGround,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT (kg)',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kNumbStyle2,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundWidget(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      weight = weight - 1;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundWidget(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        weight = weight + 1;
                                      });
                                    }),
                              ])
                        ],
                      ),
                          () {}),
                  flex: 1,
                ),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                Expanded(
                  child: Containerstyle(
                      kActivecontainerGround,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumbStyle2,
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundWidget(
                                  icon: FontAwesomeIcons.minus,
                                  onPressed: () {
                                    setState(() {
                                      age = age - 1;
                                    });
                                  },
                                ),
                                const SizedBox(
                                  width: 10.0,
                                ),
                                RoundWidget(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: () {
                                      setState(() {
                                        age = age + 1;
                                      });
                                    }),
                              ])
                        ],
                      ),
                          () {}),
                ),
              ],
            ),
            flex: 1,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          Container(
            child: BottomButton(
                texte: "CALCULATE YOUR BMI",
                onTap: () {
                  FuncCalculator c =
                  FuncCalculator(height: height, weight: weight);
                  c.calculateBMI() + c.getResult() + c.getInterparation();
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => ResultPage(
                  //         bmi: c.calculateBMI(),
                  //         result: c.getResult(),
                  //         interpretation: c.getInterparation()),
                  //   ),
                  // );
                  Navigator.of(context).push(
                    CustomPageRoute(child: ResultPage(
                             bmi: c.calculateBMI(),
                             result: c.getResult(),
                             interpretation: c.getInterparation()
                    ),
                      direction: AxisDirection.down
                       ),
                  );
                }),
            height: kBottomHeightContainer,
            color: kBottomColorContainer,
          )
        ],
      ),
    );
  }
}

class BottomButton extends StatelessWidget {
  final void Function()? onTap;
  final String texte;

  const BottomButton({Key? key, required this.texte, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states){
          if(states.contains(MaterialState.pressed)){
            return Colors.redAccent.shade400;
          }
          return Colors.redAccent;
        }),
        textStyle: MaterialStateProperty.resolveWith((states) {

          if(states.contains(MaterialState.pressed)){
          return const TextStyle(fontSize: 2);}
          return const TextStyle(fontSize: 20);
  }),
      ),
      onPressed: onTap,
      child: Center(
        child: Text(
          texte,
          style: const TextStyle(letterSpacing: 2,fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

class RoundWidget extends StatelessWidget {
  const RoundWidget({Key? key, required this.icon, required this.onPressed}) : super(key: key);
  final IconData icon;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 0.00,
      onPressed: onPressed,
      shape: const CircleBorder(),
      constraints: const BoxConstraints.tightFor(width: 45.0, height: 45.0),
      fillColor: const Color(0x305F616E),
    );
  }
}
