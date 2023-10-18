
import 'astro_model.dart';
import 'day_model.dart';
import 'hour_model.dart';

class Forecastday {
  String? date;
  int? dateEpoch;
  Day? day;
  Astro? astro;
  List<Hour>? hour;

  Forecastday({this.date, this.dateEpoch, this.day, this.astro, this.hour});

  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? Day?.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro?.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = <Hour>[];
      json['hour'].forEach((v) {
        hour?.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['date'] = date;
    data['date_epoch'] = dateEpoch;
    if (day != null) {
      data['day'] = day?.toJson();
    }
    if (astro != null) {
      data['astro'] = astro?.toJson();
    }
    if (hour != null) {
      data['hour'] = hour?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}