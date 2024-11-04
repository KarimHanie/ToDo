class UserModel {
  String id;
  String name;
  String email;

  UserModel({required this.id, required this.name, required this.email});

  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'email': email};

  UserModel.fromJson(Map<String, dynamic> json)
      : this(id: json['id'], email: json['email'], name: json['name']);
}
