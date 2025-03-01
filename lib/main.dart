import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios,color: Colors.white,),
        backgroundColor:Colors.orange.shade400,
        title:
           Row(

             children: [
               SizedBox(width: 120,),
               Text(
                "Curse",
                style: TextStyle(color: Colors.white, fontSize: 16),
                         ),
             ],
           ),

      ),
      body: Stack(
        children: [
          Column(
            children: [
              // Header Section
              Stack(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(30, 40, 30, 80), // Adjusted padding
                    decoration: BoxDecoration(
                      color: Colors.orange.shade400,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Spanish",
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Text("Beginner", style: TextStyle(color: Colors.orange.shade400)),
                                  Icon(Icons.arrow_drop_down, color: Colors.orange.shade400),
                                ],
                              ),
                            ),
                            Spacer(),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 80,
                                  height: 80,
                                  child: CircularProgressIndicator(
                                    value: 0.43,
                                    strokeWidth: 6,
                                    backgroundColor: Colors.white38,
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "43%",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Completed",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        // SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(Icons.diamond, color: Colors.red),
                            Icon(Icons.diamond, color: Colors.red),
                            SizedBox(width: 5),
                            Text("2 Milestones", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Grid Section inside Stack
          Positioned(
            top: 220,
            left: 20,
            right: 20,
            bottom: 20,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15,
              children: [
                courseCard("Basics", Icons.article, 4, 5, Colors.orange),
                courseCard("Occupations", Icons.work, 1, 5, Colors.red),
                courseCard("Conversation", Icons.chat, 3, 5, Colors.blue),
                courseCard("Places", Icons.place, 1, 5, Colors.green),
                courseCard("Family members", Icons.people, 3, 5, Colors.purple),
                courseCard("Foods", Icons.apple_rounded, 2, 5, Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget courseCard(String title, IconData icon, int completed, int total, Color color) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 2,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
                color: Colors.white,
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: color.withOpacity(0.0009),
                child: Icon(icon, color: color, size: 30),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Center(child: Text("$completed/$total", style: TextStyle(color: Colors.grey))),
          Spacer(),
          LinearProgressIndicator(
            value: completed / total,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(color),
          ),
          SizedBox(height: 5),
        ],
      ),
    );
  }
}
