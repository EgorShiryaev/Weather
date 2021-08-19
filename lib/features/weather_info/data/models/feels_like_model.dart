import 'package:weather_mobile_app/features/weather_info/domain/entities/feelsLike.dart';

class FeelsLikeModel extends FeelsLikeEntity {
  FeelsLikeModel({
    required day,
    required night,
    required eve,
    required morn,
  }) : super(
          day: day,
          night: night,
          eve: eve,
          morn: morn,
        );

  factory FeelsLikeModel.fromJson(Map<String, dynamic> json) {
    return FeelsLikeModel(
      day: json['day'].toDouble(),
      night: json['night'].toDouble(),
      eve: json['eve'].toDouble(),
      morn: json['morn'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    data['night'] = this.night;
    data['eve'] = this.eve;
    data['morn'] = this.morn;
    return data;
  }
}
