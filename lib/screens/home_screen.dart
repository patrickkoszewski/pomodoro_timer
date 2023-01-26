import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pomodoro_timer/widget/progress_icons.dart';
import 'package:pomodoro_timer/widget/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

const _btnTextStart = 'START_POMODORO';
const _btnTextResumePomodoro = 'RESUME_POMODORO';
const _btnTextResumeBreak = 'RESUME_BREAK';
const _btnTextStartShortBreak = 'TAKE_SHORT_BREAK';
const _btnTextStartLongBreak = 'TAKE_LONG_BREAK';
const _btnTextStartNewSet = 'START_NEW_SET';
const _btnTextPause = 'PAUSE';
const _btnTextReset = 'RESET';

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text('Title'))),
      backgroundColor: Colors.grey[800],
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Pomodoro number: 2',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Set: 3',
              style: TextStyle(fontSize: 32, color: Colors.white),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularPercentIndicator(
                    radius: 220.0,
                    lineWidth: 15.0,
                    percent: 0.3,
                    //zaookrąglenie wewnąrz indikatora
                    circularStrokeCap: CircularStrokeCap.round,
                    center: const Text(
                      '13:42',
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                    progressColor: Colors.red,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ProgressIcons(
                    total: 4,
                    done: 3,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'status description',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 200,
                    child: CustomButton(
                      onTap: () {},
                      text: 'start',
                    ),
                  ),
                  SizedBox(
                    width: 200,
                    child: CustomButton(
                      onTap: () {},
                      text: 'Reset',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}