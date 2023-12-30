import 'package:flutter/material.dart';

class ToolsView extends StatelessWidget {
  const ToolsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tools'),
      ),
      body: const Center(
        child: Text('Tools'),
      ),
    );
  }
}
