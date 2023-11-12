import 'package:flutter/material.dart';

import 'firstStreamMethod.dart';
import 'secondStreamMethod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      routes: {
        '/firstStream': (context) => firstStream(),
        '/secondStream': (context) => secondStream()
      }
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text("Stream"),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'this is untitled 20 project for',
            ),
            Text(
              'Stream',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/firstStream');
                },
                child: Icon(Icons.forward)
            ),
            TextButton(
                onPressed: (){
                  Navigator.pushNamed(context, '/secondStream');
                },
                child: Icon(Icons.forward)
            ),
          ],
        ),
      ),
    );
  }
}
