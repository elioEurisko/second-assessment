import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class DetailsScreen extends StatelessWidget {
  final data;

  const DetailsScreen({super.key, required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('weather of ${data['date']}')),
      body: Row(children: [Text('maxtemp_c ${data['day']['maxtemp_c']}'),]),
    );
  }
}
