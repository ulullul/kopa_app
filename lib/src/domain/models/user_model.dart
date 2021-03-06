class UserModel {
  String? id;
  String? phone;
  String? firstName;
  String? lastName;
  String? city;

  UserModel({
    this.id,
    this.phone,
    this.firstName,
    this.lastName,
    this.city,
  });

  UserModel.fromJson(dynamic json) {
    id = json['id'];
    phone = json['phone'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    city = json['city'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = this.id;
    map['phone'] = this.phone;
    map['firstName'] = this.firstName;
    map['lastName'] = this.lastName;
    map['city'] = this.city;
    return map;
  }
}
