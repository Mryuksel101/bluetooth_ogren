import 'dart:developer';

import 'package:bluetooth_ogren/scan/view_model/scan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  late final ScanViewModel model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = context.read<ScanViewModel>();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: TextButton(
            onPressed: () {
             
            },
            child: Text("Bluetooth öğren")
          ),
          leading: TextButton(
            onPressed: ()async{
              await model.permissions();
              model.openBluetooth();
              await model.startScan();
            },
            child: Text("Scan")
          ),
        ),
        body: StreamBuilder(
        stream: model.listenToResults(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            log("yeni: ${snapshot.data!.length.toString()}");
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) => Text(snapshot.data![index].device.name),
            );
          }

          else{
            return Text("bekleee");
          }
        },
      ),
    );
  }
}