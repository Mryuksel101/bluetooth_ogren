import 'package:bluetooth_ogren/scan/view_model/scan_view_model.dart';
import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScanView extends StatefulWidget {
  const ScanView({super.key});

  @override
  State<ScanView> createState() => _ScanViewState();
}

class _ScanViewState extends State<ScanView> {
  var _device;
  late final model; 
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    model = context.read<ScanViewModel>();
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<BluetoothDevice>>(
      stream: model.bluetoothPrint.scanResults,
      initialData: [],
      builder: (c, snapshot) => Column(
        children: snapshot.data!.map((d) => ListTile(
          title: Text(d.name??''),
          subtitle: Text(d.address!),
          onTap: () async {
            setState(() {
              _device = d;
            });
          },
          trailing: _device!=null && _device.address == d.address?Icon(
            Icons.check,
            color: Colors.green,
          ):null,
        )).toList(),
      ),
    );
  }
}