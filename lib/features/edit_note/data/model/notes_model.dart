class NotesModel{
  late dynamic notes;
  late String title;
  late String imageUrl,imageName;
  late String userUid;
  late String id;
  NotesModel({required this.notes,required this.title,required this.imageUrl,required this.imageName,required this.userUid,required this.id});
  factory NotesModel.fromJson(json) {
    return NotesModel(
      notes: json['note'],
      title: json['title'],
      imageUrl: json['imageURL'],
      imageName: json['imageName'],
      userUid: json['userUid'],
      id: json.id,
    );
  }
  @override
  String toString() {
    return 'title: $title ,notes: $notes ,imageURL: $imageUrl ,userUid: $userUid ,id: $id .';
  }
}