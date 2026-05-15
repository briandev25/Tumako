import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart' as pl;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  final googleMapsApiKey = dotenv.env["MAPS_API_KEY"];
  final dio = Dio();
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(37.773972, -122.431297),
    zoom: 10.0,
  );
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  Marker? _pickupLocationMarker;
  Marker? _dropLocationMarker;

  LatLng? origin;
  LatLng? destination;

  final Set<Polyline> _polylines = {};

  Future<List<LatLng>> fetchPolylinePoints() async {
    final polylinePoints = pl.PolylinePoints(apiKey: googleMapsApiKey!);

    pl.RoutesApiRequest request = pl.RoutesApiRequest(
      origin: pl.PointLatLng(origin!.latitude, origin!.longitude),
      destination: pl.PointLatLng(
        destination!.latitude,
        destination!.longitude,
      ),
      travelMode: pl.TravelMode.driving,
      routingPreference: pl.RoutingPreference.trafficAware,
    );

    pl.RoutesApiResponse response = await polylinePoints
        .getRouteBetweenCoordinatesV2(request: request);

    if (response.routes.isNotEmpty) {
      pl.Route route = response.routes.first;

      print('Duration: ${route.durationMinutes} minutes');
      print('Distance: ${route.distanceKm} km');

      return route.polylinePoints!
          .map((point) => LatLng(point.latitude, point.longitude))
          .toList();
    } else {
      print("No polyline points fetched");
      return [];
    }
  }

  Future<void> _drawPolyline() async {
    if (_pickupLocationMarker != null && _dropLocationMarker != null) {
      List<LatLng> points = await fetchPolylinePoints();
      setState(() {
        _polylines.clear();
        _polylines.add(
          Polyline(
            polylineId: PolylineId("route"),
            points: points,
            color: Colors.blue,
            width: 5,
          ),
        );
      });
    }
  }

  void _addMarker(LatLng position) {
    if (_pickupLocationMarker == null ||
        (_pickupLocationMarker != null && _dropLocationMarker != null)) {
      setState(() {
        origin = position;
        _pickupLocationMarker = Marker(
          markerId: MarkerId("pickup"),
          infoWindow: InfoWindow(title: "Pickup"),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueGreen,
          ),
          position: position,
        );
        _dropLocationMarker = null;
        print("Pickup Location: ${position.latitude}, ${position.longitude}");
      });
    } else {
      setState(() {
        destination = position;
        _dropLocationMarker = Marker(
          markerId: MarkerId("drop"),
          infoWindow: InfoWindow(title: "Drop"),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          position: position,
        );

        print("Drop Location: ${position.latitude}, ${position.longitude}");
      });
    }
    if (_pickupLocationMarker != null && _dropLocationMarker != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _drawPolyline();
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        title: Container(
          height: 40.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white,
          ),
          child: TextField(
            controller: _searchController,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              hintText: "Search for a Location",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search),
            ),
            onChanged: (value) async {
              if (value.isEmpty) return;
              final String autoSearchURL =
                  "https://maps.googleapis.com/maps/api/place/autocomplete/json"
                  "?input=$value&key=$googleMapsApiKey";

              final response = await dio.get(autoSearchURL);
              print(response.data);
            },
          ),
        ),
      ),
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
        polylines: _polylines,
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
