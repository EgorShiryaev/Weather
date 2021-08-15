import 'package:weather_mobile_app/features/weather_info/domain/entities/weather_entity.dart';

class WeatherModel extends WeatherEntity {
  WeatherModel({
    required id,
    required main,
    required description,
    required icon,
  }) : super(
          id: id,
          main: main,
          description: description,
          icon: icon,
        );

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['main'] = this.main;
    data['description'] = this.description;
    data['icon'] = this.icon;
    return data;
  }
}
