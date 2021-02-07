class UserModel {
  int id;
  String name;
  String email;
  String profilePicture;
  String address;
  String blood;
  String token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.profilePicture,
    this.address,
    this.blood,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    profilePicture = json['profile_picture'];
    address = json['address'];
    blood = json['blood'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['profile_picture'] = profilePicture;
    data['address'] = address;
    data['blood'] = blood;
    data['token'] = token;
    return data;
  }
}
