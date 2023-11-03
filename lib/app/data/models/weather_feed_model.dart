class WeatherFeed {
  String? createdAt;
  int? entryId;
  String? field1;
  String? field2;
  String? field3;

  WeatherFeed({
    this.createdAt,
    this.entryId,
    this.field1,
    this.field2,
    this.field3,
  });

  WeatherFeed.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    entryId = json['entry_id'];
    field1 = json['field1'];
    field2 = json['field2'];
    field3 = json['field3'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['created_at'] = createdAt;
    data['entry_id'] = entryId;
    data['field1'] = field1;
    data['field2'] = field2;
    data['field3'] = field3;
    return data;
  }
}
