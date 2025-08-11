//santhosh 
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: mainpage()));
}

class mainpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.blueAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => gamepage()),
                  );
                },
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                child: Text("START"),
              ),
            ),
          ),
          Container(
            color: Colors.redAccent,
            height: MediaQuery.of(context).size.height / 2,
            width: double.infinity,
            child: Center(
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => gamepage()),
                  );
                },
                color: Colors.white,
                shape: CircleBorder(),
                height: 150,
                minWidth: 150,
                child: Text("START"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class gamepage extends StatefulWidget {
  @override
  State<gamepage> createState() => _gamepageState();
}

class _gamepageState extends State<gamepage> {
  double bluecardheight = 0;
  double redcardheight = 0;

  int player1score = 0;
  int player2score = 0;

  bool initlized = false;
  @override
  Widget build(BuildContext context) {
    if (initlized == false) {
      bluecardheight = MediaQuery.of(context).size.height / 2;
      redcardheight = MediaQuery.of(context).size.height / 2;

      initlized = true;
    }

    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () {
              setState(() {
                bluecardheight = bluecardheight + 30;
                redcardheight = redcardheight - 30;
                player1score = player1score + 5;
              });

              double bluewin = MediaQuery.of(context).size.height - 80;

              if (bluecardheight > bluewin) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultpage(player1score, "a"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              color: Colors.blueAccent,
              height: bluecardheight,
              width: double.infinity,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player 1",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    player1score.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              setState(() {
                bluecardheight = bluecardheight - 30;
                redcardheight = redcardheight + 30;
                player2score = player2score + 5;
              });

              double winingheight = MediaQuery.of(context).size.height - 80;

              if (redcardheight > winingheight) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => resultpage(player2score, "b"),
                  ),
                );
              }
            },
            padding: EdgeInsets.zero,
            child: Container(
              height: redcardheight,
              width: double.infinity,
              color: Colors.redAccent,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Player 2",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    player2score.toString(),
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class resultpage extends StatelessWidget {
  int score = 0;
  String player = "";

  resultpage(this.score, this.player);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: player == "a" ? Colors.blueAccent : Colors.redAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              score.toString(),
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              player == "a" ? "PLAYER 1 WON" : "PLAYER 2 WON",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              color: Colors.white,
              child: Text("Restart game"),
            ),
          ],
        ),
      ),
    );
  }
}
