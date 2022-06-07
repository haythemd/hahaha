import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({Key? key}) : super(key: key);

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late GoogleMapController controller;
  late FormFieldValidator
  formFieldValidator;

  @override
  Widget build(BuildContext context) {

    return Container(
        margin: EdgeInsets.only(top: 5),
      child: GoogleMap(initialCameraPosition: CameraPosition(target: LatLng(47.997748413792266, 2.7286015925903238),zoom: 16),
        onMapCreated: (ctrl){
        controller= ctrl;
        },
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        mapType: MapType.satellite,
        onCameraMove: (CameraPosition pos){
        print(pos);
        },
      ),
    );
  }
}

