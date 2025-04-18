import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String task2Result = task2();
  task3(task2Result);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String> task2() async {
  String? result;
  Duration delayDuration = Duration(seconds: 3);
  await Future.delayed(delayDuration, () {
    result  = 'task 2 data';
    print('Task 2 complete');
  });

  return result!;
}

void task3(Future<String> task2Result) {
  String result = 'task 3 data';
  print('Task 3 complete with $task2Result');
}