import 'package:weather_mobile_app/features/weather_info/domain/entities/minutely_entity.dart';

class MinutelyModel extends MinutelyEntity {
  MinutelyModel({
    required dt,
    required precipitation,
  }) : super(
          dt: dt,
          precipitation: precipitation,
        );

  factory MinutelyModel.fromJson(Map<String, dynamic> json) {
    return MinutelyModel(
      dt: json['dt'],
      precipitation: json['precipitation'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dt'] = this.dt;
    data['precipitation'] = this.precipitation;
    return data;
  }
}
