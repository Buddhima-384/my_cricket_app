import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const CricketApp());
}

class CricketApp extends StatelessWidget {
  const CricketApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Cricket',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CricketHomePage(),
    );
  }
}

class CricketHomePage extends StatefulWidget {
  const CricketHomePage({super.key});

  @override
  State<CricketHomePage> createState() => _CricketHomePageState();
}

class _CricketHomePageState extends State<CricketHomePage> {
  int runs = 0;
  int balls = 0;
  int lastRun = 0;

  final Random random = Random();

  void playBall() {
    setState((){
      lastRun = random.nextInt(7);
      runs += lastRun;
      balls++;
    });
  }

  void restartGame() {
    setState((){
      runs = 0;
      balls = 0;
      lastRun = 0;

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text(
          'Mini Cricket',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF064B91),
      ),
      backgroundColor: const Color(0xFF087ED1),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children:[
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.white,
                      child: const Icon(
                        Icons.sports_cricket,
                        size: 80,
                        color: Colors.brown,
                      ),
                    ),
                    const SizedBox(height:8),
                    const Text(
                      'Runs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      '$runs',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 120,
                      height: 120,
                      color: Colors.white,
                      child: const Icon(
                        Icons.sports_baseball,
                        size: 80,
                        color: Colors.red,
                      ),
                    ),
                      const SizedBox(height: 8),

                      const Text(
                        'Balls',
                        style: TextStyle(
                          color:Colors.white,
                          fontSize:14,
                        ),
                      ),
                      Text(
                        '$balls',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    
                  ],
                ),
                const SizedBox(height: 30),
                Text(
                  lastRun == 0
                  ? 'No Runs'
                  : '$lastRun Runs',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: playBall,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade900,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Bat'),
                
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: restartGame,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Restart'),
                ),
              ],
            ),
          ],
        ),
      ),
     );
     
    
  }
}
