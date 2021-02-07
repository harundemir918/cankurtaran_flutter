import 'user_model.dart';

class EmergencyModel {
  String message;
  double lng;
  double lat;
  UserModel user;

  EmergencyModel({this.message, this.lng, this.lat, this.user});

  EmergencyModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    lng = json['lng'];
    lat = json['lat'];
    user = json['user'] != null ? UserModel.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['message'] = message;
    data['lng'] = lng;
    data['lat'] = lat;
    if (user != null) {
      data['user'] = user.toJson();
    }
    return data;
  }
}