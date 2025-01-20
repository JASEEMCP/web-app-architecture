// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class GoogleMapScreen extends StatefulWidget {
//   const GoogleMapScreen(
//       {super.key, required this.latitude, required this.longitude});

//   final double latitude;
//   final double longitude;

//   @override
//   State<GoogleMapScreen> createState() => _GoogleMapScreenState();
// }

// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   // Initial Camera Position
//   // final CameraPosition _initialPosition =
//   //     const CameraPosition(target: LatLng(67.7749, -122.4194), zoom: 10.0);

//   // Map Controller
//   GoogleMapController? _mapController;

//   // Markers Set
//   final Set<Marker> _markers = {};

//   @override
//   void initState() {
//     super.initState();
//     _addMarker(LatLng(widget.latitude, widget.longitude));
//   }

//   @override
//   void dispose() {
//     _mapController?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GoogleMap(
//       mapType: MapType.terrain,
//       initialCameraPosition: CameraPosition(
//           target: LatLng(widget.latitude, widget.longitude), zoom: 15.0),
//       onMapCreated: (controller) {
//         _mapController = controller;
//       },
//       markers: _markers,
//     );
//   }

//   // Add Marker Function
//   void _addMarker(LatLng position) {
//     final markerId = MarkerId(position.toString());
//     final marker = Marker(
//       markerId: markerId,
//       position: position,
//       infoWindow: InfoWindow(
//         title: 'Selected Location',
//         snippet: '${position.latitude}, ${position.longitude}',
//       ),
//     );

//     setState(() {
//       _markers.add(marker);
//     });
//   }
// }
