import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../widgets//appbar_with_back.dart';

class FindMe extends StatefulWidget {
  final latitude;
  final longitude;

  FindMe({
    @required this.latitude,
    @required this.longitude,
});

  @override
  _FindMeState createState() => _FindMeState();
}

class _FindMeState extends State<FindMe> {
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    LatLng _pinPosition = LatLng(widget.latitude,widget.longitude);

    return Scaffold(
      appBar: AppBarWithBack(),
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
          ],
        ),
      ),
    );
  }
}
