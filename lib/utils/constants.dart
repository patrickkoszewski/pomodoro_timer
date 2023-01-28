// everything that should be avaible for app

import 'package:flutter/material.dart';
import 'package:pomodoro_timer/model/pomodoro_status.dart';

const pomodoroTotalTime = 5; // <-test 25 * 60;
const shortBreakTime = 3;
const longBreakTime = 6;
const pomodoroPerSet = 4;

//so we can pass the pomodoroStatus and create description
const Map<PomodoroStatus, String> statusDescription = {
  PomodoroStatus.runingPomodoro: 'Pomodoro is running, time to be focused',
  PomodoroStatus.pausedPomodoro: 'Ready for a focused pomodoro?',
  PomodoroStatus.runningShortBreak: 'Short break running, time to relax',
  PomodoroStatus.pausedShortBreak: 'Let\'s have a short break?',
  PomodoroStatus.runningLongBreak: 'Pomodoro is running, time to be focused',
  PomodoroStatus.pausedLongBreak: 'Long break running, time to relax',
  PomodoroStatus.setFinished:
      'Congratulation! You deserve a long break, ready to start?',
};

//map for Colors
const Map<PomodoroStatus, MaterialColor> statusColor = {
  PomodoroStatus.runingPomodoro: Colors.green,
  PomodoroStatus.pausedPomodoro: Colors.orange,
  PomodoroStatus.runningShortBreak: Colors.red,
  PomodoroStatus.pausedShortBreak: Colors.orange,
  PomodoroStatus.runningLongBreak: Colors.red,
  PomodoroStatus.pausedLongBreak: Colors.orange,
  PomodoroStatus.setFinished: Colors.orange,
};
