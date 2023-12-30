import 'package:flutter/material.dart';

class LogsView extends StatelessWidget {
  const LogsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logs'),
      ),
      body: const Center(
        child: Text('Logs'),
      ),
    );
  }
}
