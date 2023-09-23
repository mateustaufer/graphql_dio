class UserModel {
  String? id;
  String? name;
  String? token;

  UserModel({this.id, this.name, this.token});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    if (id != null) data['id'] = id;
    if (name != null) data['name'] = name;
    if (token != null) data['token'] = token;

    return data;
  }
}
