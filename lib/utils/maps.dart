import 'package:flutter/material.dart';
import 'package:sajha_bookstore/EasyConst/colors.dart';
import 'package:sajha_bookstore/EasyConst/styles.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class MapOpenPage extends StatelessWidget {
  final String destinationAddress;

  const MapOpenPage({super.key, required this.destinationAddress});

  Future<void> _openMaps() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permissions Denied');
      }
    }
    try {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      String googleMapsUrl =
          'https://www.google.com/maps/dir/?api=1&origin=${currentPosition.latitude},${currentPosition.longitude}&destination=$destinationAddress';

      final Uri url = Uri.parse(googleMapsUrl);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch Google Maps';
      }
    } catch (error) {
      print('Error opening Google Maps: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: color,
        title: Text(
          'Seller Address',
          style: TextStyle(fontFamily: regular, fontSize: 20, color: color1),
        ),
        leading: BackButton(
          color: color1,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _openMaps,
          child: Text(
            'Open Google Maps with Routes',
            style: TextStyle(fontFamily: regular, fontSize: 16, color: color),
          ),
        ),
      ),
    );
  }
}
