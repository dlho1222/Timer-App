import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const fifTeenMinute = 900;
  static const twentyMinute = 1200;
  static const twentyFiveMinute = 1500;
  static const thirtyMinute = 1800;
  static const thirtyFiveMinute = 2100;

  int totalGOAL = 0;
  int totalROUND = 0;
  int totalSeconds = 1500;
  int seconds = twentyFiveMinute;
  bool isRunning = false;
  late Timer timer;
  onStart() {
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    setState(() {
      isRunning = true;
    });
  }

  onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalROUND++;
        totalSeconds = 1;
        if (totalROUND == 4) {
          // 4라운드 후 5분 휴식
          setState(() {
            totalROUND = 0;
            totalGOAL++;
            totalSeconds = 300;
          });
          if (totalGOAL == 12) {
            //12회 목표 달성 이후 작동 정지
            timer.cancel();
            setState(() {
              isRunning = false;
              totalSeconds = seconds;
            });
          }
        }
      });
    } else {
      setState(() {
        totalSeconds--;
      });
    }
  }

  onPause() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  onReset() {
    timer.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = seconds;
    });
  }

  String formatM(int seconds) {
    //분 표시
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(2, 4);
  }

  String formatS(int seconds) {
    // 초 표시
    var duration = Duration(seconds: seconds);
    return duration.toString().split('.').first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).textTheme.displayLarge!.color,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).textTheme.displayMedium!.color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'POMOTIMER',
                      style: TextStyle(
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      width: 120,
                      height: 150,
                      child: Text(
                        formatM(totalSeconds), //minute
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .color),
                      ),
                    ),
                    Text(
                      ':',
                      style: TextStyle(
                          color:
                              Theme.of(context).textTheme.displaySmall!.color,
                          fontSize: 80),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                          borderRadius: BorderRadius.circular(10)),
                      alignment: Alignment.center,
                      width: 120,
                      height: 150,
                      child: Text(
                        formatS(totalSeconds), //seconds
                        style: TextStyle(
                            fontSize: 70,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .color),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.6)
                        ]),
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            totalSeconds = fifTeenMinute;
                            seconds = fifTeenMinute;
                          });
                        },
                        child: Text(
                          '15',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.8)
                        ]),
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            totalSeconds = twentyMinute;
                            seconds = twentyMinute;
                          });
                        },
                        child: Text(
                          '20',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            totalSeconds = twentyFiveMinute;
                            seconds = twentyFiveMinute;
                          });
                        },
                        child: Text(
                          '25',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.6),
                          Colors.white.withOpacity(0.8)
                        ]),
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            totalSeconds = thirtyMinute;
                            seconds = thirtyMinute;
                          });
                        },
                        child: Text(
                          '30',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Colors.white.withOpacity(0.4),
                          Colors.white.withOpacity(0.6)
                        ]),
                        color: Theme.of(context).textTheme.displayLarge!.color,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            totalSeconds = thirtyFiveMinute;
                            seconds = thirtyFiveMinute;
                          });
                        },
                        child: Text(
                          '35',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 80,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: isRunning ? onPause : onStart,
                      icon: isRunning
                          ? Icon(
                              Icons.pause_circle_outline_outlined,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .color,
                            )
                          : Icon(
                              Icons.play_circle_outline,
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .color,
                            ),
                      iconSize: 100,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: onReset,
                      child: Text(
                        'RESET',
                        style: TextStyle(
                          color:
                              Theme.of(context).textTheme.displayLarge!.color,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          '$totalROUND/4',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .color,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'ROUND',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          '$totalGOAL/12',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .color,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'GOAL',
                          style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
