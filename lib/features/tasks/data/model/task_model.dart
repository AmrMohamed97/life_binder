class TaskModel {
   final String taskName;
  final String taskContent;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isDone;

  TaskModel({
    required this.taskName,
    required this.taskContent,  
    required this.startDate,
    required this.endDate,
    required this.isDone,
  });
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json['taskName'],
      taskContent: json['taskContent'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      isDone: json['isDone'],
    );
  }
}