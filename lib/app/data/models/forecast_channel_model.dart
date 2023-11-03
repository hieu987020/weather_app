
class ForecastChannel {
  int? id;
  String? name;
  String? latitude;
  String? longitude;
  String? field1;
  String? field2;
  String? field3;
  String? field4;
  String? createdAt;
  String? updatedAt;
  int? lastEntryId;

  ForecastChannel(
      {this.id,
      this.name,
      this.latitude,
      this.longitude,
      this.field1,
      this.field2,
      this.field3,
      this.field4,
      this.createdAt,
      this.updatedAt,
      this.lastEntryId,});

  ForecastChannel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    field1 = json['field1'];
    field2 = json['field2'];
    field3 = json['field3'];
    field4 = json['field4'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    lastEntryId = json['last_entry_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['field1'] = field1;
    data['field2'] = field2;
    data['field3'] = field3;
    data['field4'] = field4;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['last_entry_id'] = lastEntryId;
    return data;
  }
}