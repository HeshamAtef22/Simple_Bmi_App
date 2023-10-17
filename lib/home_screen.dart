import 'dart:math';

import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //هعمل متغير علشان احدد الميل والفيميل
  bool ismale = true;

  //متغير للسليدر علشان اتحكم في رقم السليدر
  double height = 120.0;

  //متغير للعمر
  int age = 20;

  //متغير للوزن
  double weight = 50.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          //مش هحدد للكونتينر طول لكن هعمله ىاكسباند علشان ياخد الطول الباقي من الشاشه
          //Male Or Female Choose
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  //male
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: ismale ? Colors.lightBlue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.male, size: 90),
                              SizedBox(height: 15),
                              Text(
                                "male",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  //female
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          ismale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color:
                                !ismale ? Colors.lightBlue : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.female, size: 90),
                              SizedBox(height: 15),
                              Text(
                                "Female",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )
                            ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Hight Slider
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hight",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      //علشان اخلي كلمة السانتي حلي نفس الخط من الرقم هستخدم حاجه اسمها  textBaseline
                      //وهعمل الكروس اكسس يبقي بيزلين بمعني اني بحددله النقطه الخيره في التيكسن وبقوله اعملي محاذاة علي نفس السطر
                      textBaseline: TextBaseline.alphabetic,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${height.toInt()}",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.w900),
                        ),
                        SizedBox(width: 5),
                        Text(
                          "cm",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    //سليدر
                    Slider(
                      //value رقم البداية اوالنطقة اللي واقف عندها السليدر ف البداية
                      value: height,
                      //max اعلي رقم
                      max: 220,
                      //min اقل رقم
                      min: 50,
                      onChanged: (value) {
                        //roundبستخدمها مع الارقام الكسريه علشان تقربيها لرقم صحيح
                        //print(value.round());
                        setState(() {
                          height = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          //Age And Weight
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Weight",
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${weight.toInt()}",
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.w900),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                heroTag: "weight--",
                                onPressed: () {
                                  setState(() {
                                    if (weight <= 0) {
                                      weight = 0;
                                    } else {
                                      weight--;
                                    }
                                  });
                                },
                                child: Icon(Icons.remove),
                                //mini: استخدمت الخاصية دي علشان اسخلي الايقون بحجم صغير
                                mini: true,
                              ),
                              FloatingActionButton(
                                heroTag: "weight++",
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                child: Icon(Icons.add),
                                mini: true,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Age",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${age}",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  //لما بستخدم اكتر من قلوت اكشن بوتن بيحصل ايرور لان الهو في العادي بيبقي متوقع ان الشاشه كلها فيها
                                  //فلوت اكشن واحد بس علشان استخدم اكتر من فلوت باستخدام هيرو تاج ودي زي عنوان للبوتن كدا بفرق بيها بين البوتن والتاني
                                  heroTag: "age--",
                                  onPressed: () {
                                    setState(() {
                                      if (age <= 0) {
                                        weight = 0;
                                      } else {
                                        age--;
                                      }
                                    });
                                  },
                                  child: Icon(Icons.remove),
                                  //mini: استخدمت الخاصية دي علشان اسخلي الايقون بحجم صغير
                                  mini: true,
                                ),
                                FloatingActionButton(
                                  heroTag: "age++",
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  child: Icon(Icons.add),
                                  mini: true,
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Calculate button
          Container(
            height: 60,
            width: double.infinity,
            color: Colors.lightBlue,
            child: MaterialButton(
              onPressed: () {
                var result = weight / pow(height / 100, 2);
                print(result.round());

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ResultScrren(
                    age: age,
                    result: result.round(),
                    isMale: ismale,
                  ),
                  ),
                );
              },
              child: Text(
                'Calculate',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/*
var result =weight/pow(height/100,2);
Print(result.round());*/
