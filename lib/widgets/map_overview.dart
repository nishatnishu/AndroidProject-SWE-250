import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trek_mate/models/homePage_model.dart';

class MapOverview extends StatelessWidget {
  final TravelDestination destination;
  final List<TravelDestination>? nearbyPlaces;

  const MapOverview({
    super.key,
    required this.destination,
    this.nearbyPlaces,
  });

  @override
  Widget build(BuildContext context) {
    if (destination.coordinates == null) {
      return const Center(child: Text("Location data not available"));
    }

    final CameraPosition initialPosition = CameraPosition(
      target: LatLng(
        destination.coordinates!.latitude,
        destination.coordinates!.longitude,
      ),
      zoom: 14,
    );

    final Set<Marker> markers = {};
    markers.add(
      Marker(
        markerId: MarkerId(destination.id.toString()),
        position: LatLng(
          destination.coordinates!.latitude,
          destination.coordinates!.longitude,
        ),
        infoWindow: InfoWindow(
          title: destination.name,
          snippet: destination.description, // Changed from shortDescription
        ),
      ),
    );

    nearbyPlaces?.forEach((place) {
      if (place.coordinates != null) {
        markers.add(
          Marker(
            markerId: MarkerId(place.id.toString()),
            position: LatLng(
              place.coordinates!.latitude,
              place.coordinates!.longitude,
            ),
            infoWindow: InfoWindow(
              title: place.name,
              snippet: place.category,
            ),
          ),
        );
      }
    });

    return SizedBox(
      height: 300,
      child: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: markers,
        myLocationEnabled: true,
      ),
    );
  }
}
