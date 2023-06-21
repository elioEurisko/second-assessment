import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:second_assessment/main.dart';
import 'package:flutter/material.dart';
import 'package:second_assessment/screens/detailsScreen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    if (context.watch<Weather>().weather.isEmpty) {
      context.read<Weather>().fetch('forecast');
    }
    return Scaffold(
        appBar: AppBar(
          title: const Text('weather list'),
        ),
        body: Center(
          child: context.watch<Weather>().weather.isNotEmpty
              ? RefreshIndicator(
                  onRefresh: () async {
                    context.read<Weather>().fetch('forecast');
                    setState(() {});
                  },
                  child: ListView.builder(
                    itemCount: context
                        .watch<Weather>()
                        .weather['forecast']['forecastday']
                        .length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(
                                  data: context
                                          .watch<Weather>()
                                          .weather['forecast']['forecastday']
                                      [index]),
                            ),
                          );
                        },
                        child: ListTile(
                            title: Text(
                                context.watch<Weather>().weather['forecast']
                                        ['forecastday'][index]['date'] ??
                                    '')),
                      );
                    },
                  ),
                )
              : const Text('loading'),
        ));
  }
}
