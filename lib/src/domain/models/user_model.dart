
class UserModel {

  String? id;
  String? phone;
  String? firstName;
  String? lastName;
  String? email;

  UserModel({
    this.id,
    this.phone,
    this.firstName,
    this.lastName,
    this.email,

  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = this.id;
    map['phone'] = this.phone;
    map['firstName'] = this.firstName;
    map['lastName'] = this.lastName;
    map['email'] = this.email;
    return map;
  }

}

