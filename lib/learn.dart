import 'package:flutter/material.dart';

class LearnView extends StatelessWidget {
  const LearnView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn'),
      ),
      body: const Center(
        child: Text('Learn'),
      ),
    );
  }
}
