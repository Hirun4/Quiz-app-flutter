import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/pages/service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool music = true,
      geography = false,
      fooddrink = false,
      sciencenature = false,
      entertainment = false,
      answernow = false;

  String? question, answer;

  List<String> option = [];

  @override
  void initState() {
    super.initState();
    fetchQuiz("music");
    ResOption();
  }

  Future<void> fetchQuiz(String category) async {
    final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/trivia?category=$category'),
        headers: {
          'Content-Type': 'application/json',
          'X-Api-Key': APIKEY,
        });

    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      if (jsonData.isNotEmpty) {
        Map<String, dynamic> quiz = jsonData[0];
        question = quiz["question"];
        answer = quiz["answer"];
      } else {
        print("no quiz found");
      }
      setState(() {});
    }
  }

  // Future<void> ResOption() async {
  //   final response = await http
  //       .get(Uri.parse('https://api.api-ninjas.com/v1/randomword'), headers: {
  //     'Content-Type': 'application/json',
  //     'X-Api-Key': APIKEY,
  //   });

  //   if (response.statusCode == 200) {
  //     Map<String, dynamic> jsonData = jsonDecode(response.body);
  //     if (jsonData.isNotEmpty) {
  //       String word = jsonData["word"].toString();
  //       option.add(word);
  //     }
  //     if (option.length < 3) {
  //       ResOption();
  //     }
  //     print(option);
  //     setState(() {});
  //   }
  // }
  Future<void> ResOption() async {
    while (option.length < 3) {
      final response = await http.get(
        Uri.parse('https://api.api-ninjas.com/v1/randomword'),
        headers: {
          'Content-Type': 'application/json',
          'X-Api-Key': APIKEY,
        },
      );

      if (response.statusCode == 200) {
        Map<String, dynamic> jsonData = jsonDecode(response.body);
        if (jsonData.isNotEmpty) {
          String word = jsonData["word"].toString();
          if (!option.contains(word)) {
            // Avoid duplicate words
            option.add(word);
          }
        }
      }
    }
    print(option);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: option.length != 3
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      "images/background.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 50.0, left: 20.0),
                    child: Column(
                      children: [
                        Container(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              music
                                  ? Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: 100.0,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Music",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        music = true;
                                        geography = false;
                                        fooddrink = false;
                                        sciencenature = false;
                                        entertainment = false;
                                        await ResOption();
                                        option = [];
                                        await fetchQuiz("music");
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 100.0,
                                        margin: EdgeInsets.only(right: 20.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            "Music",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                              geography
                                  ? Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Geography",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        music = false;
                                        geography = true;
                                        fooddrink = false;
                                        sciencenature = false;
                                        entertainment = false;
                                        await ResOption();
                                        option = [];
                                        await fetchQuiz("geography");
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 120.0,
                                        margin: EdgeInsets.only(right: 20.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            "Geography",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                              fooddrink
                                  ? Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: 120.0,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Fooddrink",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        music = false;
                                        geography = false;
                                        fooddrink = true;
                                        sciencenature = false;
                                        entertainment = false;
                                        await ResOption();
                                        option = [];
                                        await fetchQuiz("fooddrink");
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 120.0,
                                        margin: EdgeInsets.only(right: 20.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            "Fooddrink",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                              sciencenature
                                  ? Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: 150.0,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Sciencenature",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        music = false;
                                        geography = false;
                                        fooddrink = false;
                                        sciencenature = true;
                                        entertainment = false;
                                        await ResOption();
                                        option = [];
                                        await fetchQuiz("sciencenature");
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 150.0,
                                        margin: EdgeInsets.only(right: 20.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            "Sciencenature",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                              entertainment
                                  ? Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      child: Material(
                                        elevation: 5.0,
                                        borderRadius: BorderRadius.circular(20),
                                        child: Container(
                                          width: 150.0,
                                          decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "Entertainment",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : GestureDetector(
                                      onTap: () async {
                                        music = false;
                                        geography = false;
                                        fooddrink = false;
                                        sciencenature = false;
                                        entertainment = true;
                                        await ResOption();
                                        option = [];
                                        await fetchQuiz("entertainment");
                                        setState(() {});
                                      },
                                      child: Container(
                                        width: 150.0,
                                        margin: EdgeInsets.only(right: 20.0),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        child: Center(
                                          child: Text(
                                            "Entertainment",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.0,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(right: 20.0),
                          height: MediaQuery.of(context).size.height / 1.3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width / 1.6,
                                child: Text(
                                  question!,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  answernow = true;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50.0,
                                  margin:
                                      EdgeInsets.only(left: 20.0, right: 20.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Text(
                                      option[0]
                                          .replaceAll(RegExp(r'[\[\]]'), ""),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  answernow = true;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50.0,
                                  margin:
                                      EdgeInsets.only(left: 20.0, right: 20.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Text(
                                      option[1]
                                          .replaceAll(RegExp(r'[\[\]]'), ""),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  answernow = true;
                                  setState(() {});
                                },
                                child: Container(
                                  height: 50.0,
                                  margin:
                                      EdgeInsets.only(left: 20.0, right: 20.0),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Center(
                                    child: Text(
                                      option[2]
                                          .replaceAll(RegExp(r'[\[\]]'), ""),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                              Container(
                                height: 50.0,
                                margin:
                                    EdgeInsets.only(left: 20.0, right: 20.0),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    border: Border.all(width: 2.0),
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Center(
                                  child: Text(
                                    answer!,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
