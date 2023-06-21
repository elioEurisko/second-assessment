import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:second_assessment/main.dart';
import 'package:second_assessment/screens/listScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  var degree = 'c';
  var items = ['c', 'f'];
  Widget build(BuildContext context) {
    if (context.watch<Weather>().weather.isEmpty) {
      context.read<Weather>().fetch('current');
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('today\'s weather'),
      ),
      body: Column(
        children: context.watch<Weather>().weather.isEmpty
            ? [const Text('loading')]
            : [
                // Image.network(
                //     'http:${context.watch<Weather>().weather['current']['icon']}'),
                Text(
                    '${context.watch<Weather>().weather['current']['feelslike_$degree']}'),
                DropdownButton(
                  value: degree,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      degree = newValue!;
                    });
                  },
                ),
                GestureDetector(
                  onTap: () {
                    context.read<Weather>().clear();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ListScreen(),
                      ),
                    );
                  },
                )
              ],
      ),
    );
  }
}
