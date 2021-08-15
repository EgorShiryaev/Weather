import 'package:weather_mobile_app/features/weather_info/domain/entities/temp_entity.dart';

class TempModel extends TempEntity {
  TempModel({
    required day,
    required min,
    required max,
    required night,
    required eve,
    required morn,
  }) : super(
          day: day,
          min: min,
          max: max,
          night: night,
          eve: eve,
          morn: morn,
        );

  factory TempModel.fromJson(Map<String, dynamic> json) {
    return TempModel(
      day: json['day'].toDouble(),
      min: json['min'].toDouble(),
      max: json['max'].toDouble(),
      night: json['night'].toDouble(),
      eve: json['eve'].toDouble(),
      morn: json['morn'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['min'] = this.min;
    data['max'] = this.max;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}
