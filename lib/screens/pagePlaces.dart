import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PagePlaces extends StatefulWidget {  
  @override  
  _PagePlacesState createState() => _PagePlacesState();  
}  
  
class _PagePlacesState extends State<PagePlaces> {  
  GoogleMapController mapController;  
  static final LatLng _center = const LatLng(4.6121728, 12.5316997);  
  final Set<Marker> _markers = {};  
  LatLng _currentMapPosition = _center;  
  
  void _onAddMarkerButtonPressed() {  
    setState(() {  
      _markers.add(Marker(  
        markerId: MarkerId(_currentMapPosition.toString()),  
        position: _currentMapPosition,  
        infoWindow: InfoWindow(  
          title: 'Nice Place',  
          snippet: 'Welcome to Nkoabang'  
        ),  
        icon: BitmapDescriptor.defaultMarker,  
      ));  
    });  
  }  

  MapType _currentMapType = MapType.normal;  
  
  void _onMapTypeButtonPressed() {  
    setState(() {  
      _currentMapType = _currentMapType == MapType.normal  
          ? MapType.satellite  
          : MapType.normal;  
    });  
  }  
  
  void _onCameraMove(CameraPosition position) {  
    _currentMapPosition = position.target;  
  }  
  
  void _onMapCreated(GoogleMapController controller) {  
    mapController = controller;  
  }  
  
  @override  
  Widget build(BuildContext context) {  
    return MaterialApp(  
      home: Scaffold(  
        appBar: AppBar(  
          title: Text('Flutter Maps Demo'),  
          backgroundColor: Colors.green,  
        ),  
        body: Stack(  
          children: <Widget>[  
            GoogleMap(  
              onMapCreated: _onMapCreated,  
              mapType: _currentMapType,
              initialCameraPosition: CameraPosition(  
                target: _center,  
                zoom: 10.0,  
              ),  
              markers: _markers,  
              onCameraMove: _onCameraMove  
            ),  
            Padding(  
              padding: const EdgeInsets.all(14.0),  
              child: Align(  
                alignment: Alignment.topRight,  
                child: Column(
                  children: [
                    FloatingActionButton(  
                      onPressed: _onAddMarkerButtonPressed,  
                      materialTapTargetSize: MaterialTapTargetSize.padded,  
                      backgroundColor: Colors.green,  
                      child: const Icon(Icons.map, size: 30.0),  
                    ),
                     FloatingActionButton(  
                      onPressed: _onMapTypeButtonPressed,  
                      materialTapTargetSize: MaterialTapTargetSize.padded,  
                      backgroundColor: Colors.pink,  
                      child: const Icon(Icons.satellite, size: 30.0),  
                    ),
                  ],
                ),  
              ),  
            ),  
          ],  
        ),  
      ),  
    );  
  }  
}  