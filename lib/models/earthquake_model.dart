class EarthquakeModel {
  int id;
  double lat;
  double lng;
  double mag;
  double depth;
  String time;
  String locationName;
  Null createdAt;
  Null updatedAt;

  EarthquakeModel({
    this.id,
    this.lat,
    this.lng,
    this.mag,
    this.depth,
    this.time,
    this.locationName,
    this.createdAt,
    this.updatedAt,
  });

  EarthquakeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lat = json['lat'];
    lng = json['lng'];
    mag = json['mag'];
    depth = json['depth'];
    time = json['time'];
    locationName = json['location_name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['mag'] = this.mag;
    data['depth'] = this.depth;
    data['time'] = this.time;
    data['location_name'] = this.locationName;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
