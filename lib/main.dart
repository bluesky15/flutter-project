import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:resturan_selector/counter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final counterBloc = CounterBloc();
  @override
  void dispose() {
    counterBloc.dispose();
    super.dispose();
  }

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    developer.log('app-log', name: '---debug called----');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            StreamBuilder(
                stream: counterBloc.counterStream,
                initialData: 0,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headline4,
                  );
                }),
          ],
        ),
      ),
      floatingActionButton: Row(children: [
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(CounterAction.increment);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(CounterAction.decrement);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () {
            counterBloc.eventSink.add(CounterAction.reset);
          },
          tooltip: 'Increment',
          child: const Icon(Icons.repeat),
        ),
      ]), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
