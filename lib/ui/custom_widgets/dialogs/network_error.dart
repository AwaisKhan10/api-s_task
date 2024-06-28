// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class NetworkErrorDialog extends StatelessWidget {
  const NetworkErrorDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      title: Text("Your network is not available"),
      content: Text('Network is not available'),
    );
  }
}
