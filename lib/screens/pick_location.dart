import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  late GoogleMapController _mapController;
  Marker? _pickupLocationMarker;
  Marker? _dropLocationMarker;
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 10.0,
  );

  void _addMarker(LatLng position) {
    if (_pickupLocationMarker == null ||
        (_pickupLocationMarker != null && _dropLocationMarker != null)) {
      setState(() {
        _pickupLocationMarker = Marker(
          markerId: MarkerId("pickup"),
          infoWindow: InfoWindow(title: "Pickup"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          position: position,
        );
      });
    } else {
      setState(() {
        _dropLocationMarker = Marker(
          markerId: MarkerId("drop"),
          infoWindow: InfoWindow(title: "Drop"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: position,
        );
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
      body: GoogleMap(
        zoomControlsEnabled: false,
        myLocationButtonEnabled: false,
        initialCameraPosition: _initialCameraPosition,
        onMapCreated: (controller) => _mapController = controller,
        onLongPress: _addMarker,
        markers: {
          if (_pickupLocationMarker != null) _pickupLocationMarker!,
          if (_dropLocationMarker != null) _dropLocationMarker!,
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _mapController.animateCamera(
          CameraUpdate.newCameraPosition(_initialCameraPosition),
        ),
        child: const Icon(Icons.center_focus_strong),
      ),
    );
  }
}
