import 'package:flutter/material.dart';

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
      entertainment = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                        Container(
                          width: 100.0,
                          margin: EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
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
                        Container(
                          width: 120.0,
                          margin: EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
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
                        Container(
                          width: 120.0,
                          margin: EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
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
                        Container(
                          width: 140.0,
                          margin: EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
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
                        Container(
                          width: 140.0,
                          margin: EdgeInsets.only(right: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)),
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
