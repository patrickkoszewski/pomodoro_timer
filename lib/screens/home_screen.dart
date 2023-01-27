import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pomodoro_timer/model/pomodoro_status.dart';
import 'package:pomodoro_timer/utils/constants.dart';
import 'package:pomodoro_timer/widget/progress_icons.dart';
import 'package:pomodoro_timer/widget/custom_button.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

const _btnTextStart = 'START POMODORO';
const _btnTextResumePomodoro = 'RESUME POMODORO';
const _btnTextResumeBreak = 'RESUME BREAK';
const _btnTextStartShortBreak = 'TAKE SHORT BREAK';
const _btnTextStartLongBreak = 'TAKE LONG BREAK';
const _btnTextStartNewSet = 'START NEW SET';
const _btnTextPause = 'PAUSE';
const _btnTextReset = 'RESET';

class _HomePageState extends State<HomePage> {
  int remainingTime = pomodoroTotalTime;
  String mainBtnText = _btnTextStart;

  Timer _timer = Timer.periodic(Duration(seconds: 1), (timer) {
    // code to be executed every second
  });
  int pomodoroNum = 0;
  int setNum = 0;
  PomodoroStatus pomodoroStatus = PomodoroStatus.pausedPomodoro;

  @override
  void dispose() {
    _cancelTimer();
    super.dispose();
  }

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
            Text(
              'Pomodoro number: $pomodoroNum',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Set: $setNum',
              style: const TextStyle(fontSize: 24, color: Colors.white),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                CircularPercentIndicator(
                  radius: 140.0,
                  lineWidth: 15.0,
                  percent: _getPomodoroPercentage(),
                  //zaookrąglenie wewnąrz indikatora
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Text(
                    _secondsToFormatedString(remainingTime),
                    style: const TextStyle(fontSize: 40, color: Colors.white),
                  ),
                  progressColor: statusColor[pomodoroStatus],
                ),
                const SizedBox(
                  height: 40,
                ),
                ProgressIcons(
                  total: pomodoroPerSet,
                  done: pomodoroNum - (setNum * pomodoroPerSet),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  statusDescription[pomodoroStatus]!,
                  style: const TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 250,
                  child: CustomButton(
                    onTap: _mainButtonPressed,
                    text: mainBtnText,
                  ),
                ),
                SizedBox(
                  width: 250,
                  child: CustomButton(
                    onTap: _resetButtonPressed,
                    text: _btnTextReset,
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

//Method to convert sec to min
  _secondsToFormatedString(int seconds) {
    // ~ - rounded
    int roundedMinutes = seconds ~/ 60;
    int remainingSeconds = seconds - (roundedMinutes * 60);
    String remainingSecondsFormated;

    if (remainingSeconds < 10) {
      remainingSecondsFormated = '0$remainingSeconds';
    } else {
      remainingSecondsFormated = remainingSeconds.toString();
    }

    return '$roundedMinutes:$remainingSecondsFormated';
  }

// Method
  _getPomodoroPercentage() {
    int totalTime;
    switch (pomodoroStatus) {
      case PomodoroStatus.runingPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.pausedPomodoro:
        totalTime = pomodoroTotalTime;
        break;
      case PomodoroStatus.runningShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.pausedShortBreak:
        totalTime = shortBreakTime;
        break;
      case PomodoroStatus.runningLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.pausedLongBreak:
        totalTime = longBreakTime;
        break;
      case PomodoroStatus.setFinished:
        totalTime = pomodoroTotalTime;
        break;
    }

    double percentage = (totalTime - remainingTime) / totalTime;
    return percentage;
  }

// Method for onTap<MainButton>
  _mainButtonPressed() {
    switch (pomodoroStatus) {
      case PomodoroStatus.pausedPomodoro:
        _startPomodoroCountdown();
        break;
      case PomodoroStatus.runingPomodoro:
        _pausePomodoroCountdown();
        break;
      case PomodoroStatus.runningShortBreak:
        // TODO: Handle this case.
        break;
      case PomodoroStatus.pausedShortBreak:
        // TODO: Handle this case.
        break;
      case PomodoroStatus.runningLongBreak:
        // TODO: Handle this case.
        break;
      case PomodoroStatus.pausedLongBreak:
        // TODO: Handle this case.
        break;
      case PomodoroStatus.setFinished:
        // TODO: Handle this case.
        break;
    }
  }

  _startPomodoroCountdown() {
    pomodoroStatus = PomodoroStatus.runingPomodoro;
    _cancelTimer();

    _timer = Timer.periodic(
        Duration(seconds: 1),
        (timer) => {
              if (remainingTime > 0)
                {
                  setState(() {
                    remainingTime--;
                    mainBtnText = _btnTextPause;
                  })
                }
              else
                {
                  //to do playSound(),
                  pomodoroNum++,
                  _cancelTimer(),
                  if (pomodoroNum % pomodoroPerSet == 0)
                    {
                      pomodoroStatus = PomodoroStatus.pausedLongBreak,
                      setState(() {
                        remainingTime = longBreakTime;
                        mainBtnText = _btnTextStartLongBreak;
                      }),
                    }
                  else
                    {
                      pomodoroStatus = PomodoroStatus.pausedShortBreak,
                      setState(() {
                        remainingTime = shortBreakTime;
                        mainBtnText = _btnTextStartShortBreak;
                      }),
                    }
                }
            });
  }

  _pausePomodoroCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    _cancelTimer();
    setState(() {
      mainBtnText = _btnTextResumePomodoro;
    });
  }

  _resetButtonPressed() {
    pomodoroNum = 0;
    setNum = 0;
    _cancelTimer();
    _stopCountdown();
  }

  _stopCountdown() {
    pomodoroStatus = PomodoroStatus.pausedPomodoro;
    setState(() {
      mainBtnText = _btnTextStart;
      remainingTime = pomodoroTotalTime;
    });
  }

  _cancelTimer() {
    if (_timer != null) {
      _timer.cancel();
    }
  }
}
