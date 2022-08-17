import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsDemo extends StatefulWidget {
  const MapsDemo({Key? key}) : super(key: key);

  @override
  State<MapsDemo> createState() => _MapsDemoState();
}

class _MapsDemoState extends State<MapsDemo> {
  static const CameraPosition _otusPosition = CameraPosition(
    target: LatLng(55.797205, 37.552831),
    zoom: 14.4746,
  );

  late GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          FlatButton(
            onPressed: () {},
            child: Text('2314123'),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}

void main() {
  // if (defaultTargetPlatform == TargetPlatform.android) {
  //   AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  // }
  runApp(const MaterialApp(home: MapsDemo()));
}
