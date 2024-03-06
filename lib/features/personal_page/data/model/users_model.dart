class UsersModel{
  late String name;
  late String address;
  late num age;
  late List? lang;
  UsersModel({required this.name, required this.address, required this.age, required  this.lang});

  factory UsersModel.fromJson(json){
    return UsersModel(
      name: json['name'],
      address: json['address'],
      age: json['age'],
      lang: json['lang'],
    );
  }
  Map<String,dynamic> toJson() {
    return {
      'age': age,
      'address': address,
      'name': name,
      'lang': lang,
    };
  }
  factory UsersModel.empty(){
    return UsersModel(
      name:'' ,
      address:'',
      age: 0,
      lang: [],
    );
  }
  @override
  String toString(){
    return 'userInfo:( $name , $address , $age , $lang)';
  }
}