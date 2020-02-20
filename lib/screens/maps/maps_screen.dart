import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:steve_beaudoin/components/permission_checker.dart';
import 'package:steve_beaudoin/database/database.dart';
import 'package:steve_beaudoin/models/locations.dart';
import 'package:steve_beaudoin/utils/colors.dart';

class MapsScreen extends StatefulWidget {
  MapsScreen({Key key}) : super(key: key);

  @override
  _MapsScreenState createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  Completer<GoogleMapController> _controller = Completer();

  Stream<List<LocationInfo>> getAllLocationMarkers =
      DatabaseService().getAllLocations;

  bool hasLocationPermission;
  Position position;
  Set<Marker> markers;

  @override
  void initState() {
    checkLocationPermission();
    super.initState();
  }

  checkLocationPermission() async {
    hasLocationPermission =
        await PermissionChecker.hasLocationPermission(context);

    if (hasLocationPermission) {
      try {
        final currentLocation = await Geolocator()
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        setState(() {
          position = currentLocation;
        });
      } on PlatformException catch (e) {
        if (e.code == 'PERMISSION_DENIED') {
          print(e.message);
        }
      }
    } else {
      PermissionHandler permissionHandler = PermissionHandler();
      permissionHandler.requestPermissions([
        PermissionGroup.location,
        PermissionGroup.locationAlways,
        PermissionGroup.locationWhenInUse
      ]);
    }
  }

  Set<Marker> _createMarker(List<LocationInfo> data) {
    final marker = data.map((e) => Marker(
        markerId: MarkerId(e.id.toString()),
        position: LatLng(e.latitude, e.longitude)));

    return marker.toSet();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text("Nearby Maps"),
        backgroundColor: Color(0x44000000),
      ),
      body: Stack(
        children: <Widget>[
          StreamBuilder<List<LocationInfo>>(
              stream: getAllLocationMarkers,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text(snapshot.error.toString()));
                } else if (!snapshot.hasData) {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  print(snapshot.data);
                  return Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: position != null
                          ? GoogleMap(
                              mapType: MapType.normal,
                              myLocationEnabled: true,
                              markers: _createMarker(snapshot.data),
                              myLocationButtonEnabled: false,
                              initialCameraPosition: CameraPosition(
                                  zoom: 14,
                                  target: LatLng(
                                      position != null
                                          ? position.latitude
                                          : 27.7172,
                                      position != null
                                          ? position.longitude
                                          : 85.3240)),
                              onMapCreated: (GoogleMapController controller) {
                                _controller.complete(controller);
                              },
                            )
                          : Center(child: CircularProgressIndicator()));
                }
              }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: UIColors.white,
        onPressed: goToCurrentLocation,
        child: Icon(
          Icons.my_location,
          color: UIColors.black,
        ),
      ),
    );
  }

  Future<void> goToCurrentLocation() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(
          position.latitude,
          position.longitude,
        ),
        zoom: 14)));
  }
}
