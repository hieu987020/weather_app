// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Day _$DayFromJson(Map<String, dynamic> json) => Day(
      maxtempC: (json['maxtempC'] as num?)?.toDouble(),
      maxtempF: (json['maxtempF'] as num?)?.toDouble(),
      mintempC: (json['mintempC'] as num?)?.toDouble(),
      mintempF: (json['mintempF'] as num?)?.toDouble(),
      avgtempC: (json['avgtempC'] as num?)?.toDouble(),
      avgtempF: (json['avgtempF'] as num?)?.toDouble(),
      maxwindMph: (json['maxwindMph'] as num?)?.toDouble(),
      maxwindKph: (json['maxwindKph'] as num?)?.toDouble(),
      totalprecipMm: (json['totalprecipMm'] as num?)?.toDouble(),
      totalprecipIn: (json['totalprecipIn'] as num?)?.toDouble(),
      totalsnowCm: (json['totalsnowCm'] as num?)?.toDouble(),
      avgvisKm: (json['avgvisKm'] as num?)?.toDouble(),
      avgvisMiles: (json['avgvisMiles'] as num?)?.toDouble(),
      avghumidity: (json['avghumidity'] as num?)?.toDouble(),
      dailyWillItRain: json['dailyWillItRain'] as int?,
      dailyChanceOfRain: json['dailyChanceOfRain'] as int?,
      dailyWillItSnow: json['dailyWillItSnow'] as int?,
      dailyChanceOfSnow: json['dailyChanceOfSnow'] as int?,
      condition: json['condition'] == null
          ? null
          : Condition.fromJson(json['condition'] as Map<String, dynamic>),
      uv: (json['uv'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DayToJson(Day instance) => <String, dynamic>{
      'maxtempC': instance.maxtempC,
      'maxtempF': instance.maxtempF,
      'mintempC': instance.mintempC,
      'mintempF': instance.mintempF,
      'avgtempC': instance.avgtempC,
      'avgtempF': instance.avgtempF,
      'maxwindMph': instance.maxwindMph,
      'maxwindKph': instance.maxwindKph,
      'totalprecipMm': instance.totalprecipMm,
      'totalprecipIn': instance.totalprecipIn,
      'totalsnowCm': instance.totalsnowCm,
      'avgvisKm': instance.avgvisKm,
      'avgvisMiles': instance.avgvisMiles,
      'avghumidity': instance.avghumidity,
      'dailyWillItRain': instance.dailyWillItRain,
      'dailyChanceOfRain': instance.dailyChanceOfRain,
      'dailyWillItSnow': instance.dailyWillItSnow,
      'dailyChanceOfSnow': instance.dailyChanceOfSnow,
      'condition': instance.condition,
      'uv': instance.uv,
    };
