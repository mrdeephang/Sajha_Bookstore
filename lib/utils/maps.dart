import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class MapOpenPage extends StatelessWidget {
  final String destinationAddress;

  MapOpenPage({required this.destinationAddress});

  Future<void> _openMaps() async {
    // Get the current device location
    Position currentPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    // Create the Google Maps URL with the starting and destination locations
    String googleMapsUrl = 'https://www.google.com/maps/dir/?api=1&origin=${currentPosition.latitude},${currentPosition.longitude}&destination=$destinationAddress';

    // Open Google Maps
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch Google Maps';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map Open Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openMaps,
          child: Text('Open Google Maps with Routes'),
        ),
      ),
    );
  }
}


