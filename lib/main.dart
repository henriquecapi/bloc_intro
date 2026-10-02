import 'package:bloc_intro/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'view/counter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return CounterBloc();
      },
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text("CET0390"),
              bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.access_time_filled)),
                  Tab(icon: Icon(Icons.one_x_mobiledata)),
                  Tab(icon: Icon(Icons.zoom_in)),
                ],
              ),

              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),

            body: TabBarView(
              children: [
                CounterScreen(title: 'Flutter Demo Home Page'),
                Container(color: Colors.red),
                Container(color: Colors.blue),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
