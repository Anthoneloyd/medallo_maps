import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MapPage());
  }
}

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo del openestremaps")),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(6.2442, -75.5812), // Medellín de ejemplo
          initialZoom: 13,
          maxZoom: 19,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.tuempesa.miapp',
            additionalOptions: const {
              'User-Agent': 'MiAppMapa/1.0 (agarcesb@unal.edu.co)',
            },
          ),

          RichAttributionWidget(
            attributions: [
              TextSourceAttribution('© OpenStreetMap contributors'),
            ],
          ),
        ],
      ),
    );
  }
}
