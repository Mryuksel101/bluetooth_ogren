import 'package:bluetooth_ogren/scan/scan_view.dart';
import 'package:bluetooth_ogren/scan/view_model/scan_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ScanViewModel(),
      child: const ScanView(),
    );
  }
}