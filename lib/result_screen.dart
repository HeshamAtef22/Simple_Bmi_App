import 'package:flutter/material.dart';

class ResultScrren extends StatefulWidget {
 final int result;
 final bool isMale;
 final int age;
  const ResultScrren({
    super.key,
    required this.result,
    required this.isMale,
    required this.age,
  });

  @override
  State<ResultScrren> createState() => _ResultScrrenState();
}

class _ResultScrrenState extends State<ResultScrren> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Gender : ${widget.isMale ? "Male" : "Female"}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "ٌResult : ${widget.result}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Age : ${widget.age}",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
