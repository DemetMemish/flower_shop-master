import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

import 'package:image_picker/image_picker.dart';

void main() {
  runApp(FlowerShopApp());
}

class FlowerShopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flower Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FlowerShopHomePage(),
    );
  }
}

class FlowerShopHomePage extends StatefulWidget {
  @override
  _FlowerShopHomePageState createState() => _FlowerShopHomePageState();
}

class _FlowerShopHomePageState extends State<FlowerShopHomePage> {
  List<Flower> flowers = [];
  LocationData? currentLocation;
  late ImagePicker _imagePicker;

  @override
  void initState() {
    super.initState();
    _fetchFlowers();
    _imagePicker = ImagePicker();
    _getCurrentLocation();
  }

  Future<void> _fetchFlowers() async {
    final response = await http.get(Uri.parse('https://api.example.com/flowers'));
    if (response.statusCode == 200) {
      setState(() {
        flowers = (jsonDecode(response.body) as List)
            .map((data) => Flower.fromJson(data))
            .toList();
      });
    }
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    final hasPermission = await location.requestPermission();
    if (hasPermission == PermissionStatus.granted) {
      final currentLocation = await location.getLocation();
      setState(() {
        this.currentLocation = currentLocation;
      });
    }
  }

  Future<void> _capturePhoto() async {
    final pickedImage = await _imagePicker.getImage(source: ImageSource.camera);
    if (pickedImage != null) {
      // Handle the captured image
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flower Shop'),
      ),
      body: ListView.builder(
        itemCount: flowers.length,
        itemBuilder: (context, index) {
          final flower = flowers[index];
          return ListTile(
            leading: Image.network(flower.imageUrl),
            title: Text(flower.name),
            subtitle: Text(flower.price.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _capturePhoto,
        child: Icon(Icons.camera_alt),
      ),
    );
  }
}

class Flower {
  final String name;
  final String imageUrl;
  final double price;

  Flower({
    required this.name,
    required this.imageUrl,
    required this.price,
  });

  factory Flower.fromJson(Map<String, dynamic> json) {
    return Flower(
      name: json['name'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
    );
  }
}
