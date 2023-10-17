import 'package:json_annotation/json_annotation.dart';
part 'astro_model.g.dart';
@JsonSerializable()
class Astro {
  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  String? moonIllumination;
  int? isMoonUp;
  int? isSunUp;

  Astro(
      {this.sunrise,
      this.sunset,
      this.moonrise,
      this.moonset,
      this.moonPhase,
      this.moonIllumination,
      this.isMoonUp,
      this.isSunUp});
factory Astro.fromJson(Map<String, dynamic> json) =>
      _$AstroFromJson(json);

  Map<String, dynamic> toJson() => _$AstroToJson(this);
}
