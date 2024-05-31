import 'package:intl/intl.dart';

class NotesModel {
  late dynamic notes;
  late String title;
  late String imageUrl, imageName;
  late String userUid;
  late String date;
  late String id;
  NotesModel(
      {required this.notes,
      required this.title,
      required this.imageUrl,
      required this.imageName,
      required this.userUid,
      required this.date,
      required this.id});
  factory NotesModel.fromJson(json) {
    return NotesModel(
      notes: json['note']??'',
      title: json['title']??'',
      imageUrl: json['imageURL']??'',
      imageName: json['imageName']??'',
      userUid: json['userUid'],
      date: DateFormat('yyyy/MM/dd').format(json['date'].toDate()).toString(),
      id: json.id,
    );
  }
  @override
  String toString() {
    return 'title: $title ,notes: $notes ,imageURL: $imageUrl ,userUid: $userUid ,id: $id .';
  }
}
