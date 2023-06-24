import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';
class ScanViewModel extends ChangeNotifier{
  /// Obtain an instance
  final FlutterBluePlus _flutterBlue = FlutterBluePlus.instance;

  /// Listen to scan results
  Stream<List<ScanResult>> listenToResults(){
    return _flutterBlue.scanResults;
  }

  Future permissions()async{
    PermissionStatus permissionStatusBluetooth = await Permission.bluetooth.request();
    PermissionStatus permissionStatusBluetoothScan = await Permission.bluetoothScan.request();
    PermissionStatus permissionStatusBluetoothConnect = await Permission.bluetoothConnect.request();
    
    log("bluetooth izni ${permissionStatusBluetooth.isGranted}");
    log("bluetooth izni2 ${permissionStatusBluetoothScan.isGranted}");
    log("bluetooth izni3 ${permissionStatusBluetoothConnect.isGranted}");
  }

  void openBluetooth()async{
    try{
      bool isOn = await _flutterBlue.turnOn();
      log("bluetooth acildi öi $isOn");
    }
    catch(e){
      log("hata: $e");
    }
  }

  /// Start scanning
  Future startScan()async{
    try{
      await _flutterBlue.startScan(timeout: const Duration(seconds: 4));
    }

    catch(e){
      log("hata: ${e.toString()}");
    }
  }
}