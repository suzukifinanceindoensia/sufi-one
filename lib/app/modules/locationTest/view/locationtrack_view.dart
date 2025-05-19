import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:sufi_one/app/modules/locationTest/controller/locationtrack_controller.dart';
import 'package:sufi_one/app/modules/public/widgets/appbarWsidebar.dart';
import 'package:sufi_one/app/modules/public/widgets/sidebar.dart';

class LocationTrackView extends StatelessWidget {
  final LocationTrackController locationController = Get.find<LocationTrackController>();
  LocationTrackView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SuzukiFinanceAppBarWsidebar(),
      drawer: Drawer(
        child: AppSidebar(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Current Coordinates:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Obx(() => Text(
                    'Latitude: ${locationController.latitude.value}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Obx(() => Text(
                    'Longitude: ${locationController.longitude.value}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Obx(() => Text(
                    'Timestamp: ${locationController.timestamp.value}',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Obx(()=> Text(
                'Device ID: ${locationController.deviceId.value}',
              )),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  locationController.getLocation();
                },
                child: const Text('Get Current Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}