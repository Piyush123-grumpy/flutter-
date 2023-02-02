import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreenState extends StatefulWidget {
  const GoogleMapScreenState({super.key});

  static const String route = "googleMapScreenState";


  @override
  State<GoogleMapScreenState> createState() => _GoogleMapScreenStateState();
}

class _GoogleMapScreenStateState extends State<GoogleMapScreenState> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  LatLng myLocation = const LatLng(27.7047139, 85.3295421);

  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId(myLocation.toString()),
      position: myLocation,
      infoWindow: const InfoWindow(
        title: 'Gopal Dai ko chatamari',
        snippet: 'Chatamari',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Map in Flutter'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(target: myLocation, zoom: 10),
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController=controller;
          });
        },
      ),
    );
  }
}
