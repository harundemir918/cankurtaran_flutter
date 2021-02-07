import 'dart:ffi';

import 'package:cankurtaran/api/api.dart';
import 'package:cankurtaran/models/earthquake_model.dart';
import 'package:cankurtaran/ui/screens/panel/earthquake_map.dart';
import 'package:flutter/material.dart';

class LastEarthquakesPanel extends StatefulWidget {
  static const routeName = '/last-earthquakes-panel';

  @override
  _LastEarthquakesPanelState createState() => _LastEarthquakesPanelState();
}

class _LastEarthquakesPanelState extends State<LastEarthquakesPanel> {
  Api api = Api();
  List<EarthquakeModel> _earthquakeList = [];

  void initState() {
    super.initState();
    _fetchEarthquakes();
  }

  _fetchEarthquakes() async {
    _earthquakeList = await api.fetchEarthquakes();
    setState(() {});
  }

  Widget _buildListElement({double latitude, longitude, name, magnitude, depth}) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EarthquakeMap(
                  latitude: latitude,
                  longitude: longitude,
                  name: name,
                  magnitude: magnitude,
                  depth: depth,
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  child: Text(depth.toString()),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  name,
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: _earthquakeList.length,
        itemBuilder: (context, index) {
          return _buildListElement(
            latitude: _earthquakeList[index].lat,
            longitude: _earthquakeList[index].lng,
            name: _earthquakeList[index].locationName,
            magnitude: _earthquakeList[index].mag,
            depth: _earthquakeList[index].depth,
          );
        },
      ),
    );
  }
}
