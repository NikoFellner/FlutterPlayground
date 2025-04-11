class Task{
  final String taskDescription;
  bool isDone;

  Task({this.isDone=false, required this.taskDescription});

  void toggleDone(){
    isDone = !isDone;
}

}