import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets//appbar_with_menu.dart';

class EarthquakeMap extends StatefulWidget {
  final latitude;
  final longitude;

  EarthquakeMap({
    @required this.latitude,
    @required this.longitude,
});

  @override
  _EarthquakeMapState createState() => _EarthquakeMapState();
}

class _EarthquakeMapState extends State<EarthquakeMap> {
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    LatLng _pinPosition = LatLng(widget.latitude,widget.longitude);

    return Scaffold(
      appBar: AppBarWithMenu(
        title: 'cankurtaran',
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              child: GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: _pinPosition,
                  zoom: 11,
                  bearing: 15
                ),
                markers: _markers,
                onMapCreated: (GoogleMapController controller) {;
                  _controller.complete(controller);
                  setState(
                    () {
                      _markers.add(
                        Marker(
                          markerId: MarkerId('<MARKER_ID>'),
                          position: _pinPosition,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Şehir: Antalya'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Bölge: Merkez'),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Şiddet: 0.0'),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Derinlik: 0.0'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
