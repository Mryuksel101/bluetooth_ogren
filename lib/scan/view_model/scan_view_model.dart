import 'package:bluetooth_print/bluetooth_print.dart';
import 'package:flutter/material.dart';

class ScanViewModel extends ChangeNotifier{
  BluetoothPrint bluetoothPrint = BluetoothPrint.instance;
  ScanViewModel();
  // begin scan
  
  void beginScan(){
    bluetoothPrint.startScan(timeout: const Duration(seconds: 4));
  }

  get scanResults => bluetoothPrint.scanResults;
}