import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_place/google_place.dart';
import 'package:weather_mobile_app/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:weather_mobile_app/features/weather_info/presentation/cubit/weather_info_cubit.dart';

class EndDrawer extends StatefulWidget {
  @override
  _EndDrawerState createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  GooglePlace googlePlace = GooglePlace(Constants.googleApiKey);
  List<AutocompletePrediction> predictions = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        margin: EdgeInsets.only(
            right: 20, left: 20, top: MediaQuery.of(context).padding.top),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                labelText: "Search",
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black54,
                    width: 2.0,
                  ),
                ),
              ),
              onChanged: (value) {
                if (value.isNotEmpty) {
                  autoCompleteSearch(value);
                } else {
                  if (predictions.length > 0 && mounted) {
                    setState(() {
                      predictions = [];
                    });
                  }
                }
              },
            ),
            SizedBox(height: 20),
            Expanded(
              child: Column(
                  children: List<Widget>.generate(
                predictions.length,
                (index) => ListTile(
                  leading: CircleAvatar(
                    child: Icon(
                      Icons.pin_drop,
                      color: Colors.white,
                    ),
                  ),
                  title: Text(predictions[index].description!),
                  onTap: () async {
                    var uri = Uri.parse(Constants.geocodeSputnikBaseUrl +
                        '${predictions[index].description}');
                    log(uri.toString());
                    var response = await http.get(uri);
                    if (response.statusCode == 200) {
                      var body = json.decode(response.body);
                      var coordinates = body['result']['address'][0]['features']
                          [0]['geometry']['geometries'][0]['coordinates'];
                      Constants.lat = coordinates[1];
                      Constants.long = coordinates[0];
                      Constants.placeName = predictions[index].description!;
                      Constants.useGeolocator = false;
                      BlocProvider.of<WeatherInfoCubit>(context)
                          .loadWeatherInfo(Constants.lat, Constants.long);
                      Navigator.pop(context);
                    }
                  },
                ),
              )),
            ),
            Container(
              child: Image.asset("assets/images/powered_by_google.png"),
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            ),
          ],
        ),
      ),
    );
  }

  void autoCompleteSearch(String value) async {
    var result = await googlePlace.autocomplete.get(value, language: 'ru');
    if (result != null && result.predictions != null && mounted) {
      setState(() {
        predictions = result.predictions!;
      });
    }
  }
}
