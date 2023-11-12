import 'dart:async';

import 'package:flutter/material.dart';

class firstStream extends StatefulWidget {
  const firstStream({super.key});

  @override
  State<firstStream> createState() => _firstStreamState();
}

class _firstStreamState extends State<firstStream> {

  StreamController _controller =  StreamController();

  addData() async {
    for(int i=0; i<10; i++){
      await Future.delayed(Duration(seconds: 2));
      _controller.sink.add(i);
    }
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.close();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Stream"),
      ),
      body: Center(
        child: StreamBuilder(
            stream: _controller.stream,
            builder: (context, snapshot) {
              if(snapshot.hasError){
                return Text("Some errors are found");
              }
              if(snapshot.connectionState == ConnectionState.waiting){
                return CircularProgressIndicator.adaptive();
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'This Stream example is created using StreamController concept',
                  ),
                  Text(
                    '${snapshot.data}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              );
            }
        ),
      ),
    );
  }
}

