class TaskModel {
   final String taskName;
  final String taskContent;
  final String startTime;
  final String endTime;
  final DateTime? startDate;
  final DateTime? endDate;
  final bool isDone;
  final String? id;
  final String uid;

  TaskModel(   {
    required this.uid,
    required this.startTime,
    required  this.endTime,
    this.id,
    required this.taskName,
    required this.taskContent,  
    required this.startDate,
    required this.endDate,
    required this.isDone,
  });
  factory TaskModel.fromJson( json) {
    return TaskModel(
      taskName: json['taskName'],
      taskContent: json['taskContent'],
      startDate:   json['startDate'].toDate(),
      endDate:json['endDate'].toDate(),
      isDone: json['isDone'],
      id: json.id,
       startTime: json['startTime'], 
       endTime: json['endTime'], 
       uid: json['uid'],
    );
  }
}