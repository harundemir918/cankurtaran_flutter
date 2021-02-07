import 'package:cankurtaran/ui/screens/panel/earthquake_map.dart';
import 'package:flutter/material.dart';

class LastEarthquakesPanel extends StatefulWidget {
  static const routeName = '/last-earthquakes-panel';

  @override
  _LastEarthquakesPanelState createState() => _LastEarthquakesPanelState();
}

class _LastEarthquakesPanelState extends State<LastEarthquakesPanel> {
  Widget _buildListElement({latitude, longitude}) {
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
                  child: Text('5.5'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Deprem Bölgesi',
                  style: Theme.of(context).textTheme.headline6,
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
      child: ListView(
        children: [
          _buildListElement(
            latitude: 37.0664094,
            longitude: 37.3826504,
          ),
          _buildListElement(
            latitude: 37.0664094,
            longitude: 37.3826504,
          ),
          _buildListElement(
            latitude: 37.0664094,
            longitude: 37.3826504,
          ),
          _buildListElement(
            latitude: 37.3826504,
            longitude: 37.0664094,
          ),
          _buildListElement(
            latitude: 37.3826504,
            longitude: 37.0664094,
          ),
        ],
      ),
    );
  }
}
