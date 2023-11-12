import 'dart:async';

import 'package:flutter/material.dart';

class secondStream extends StatefulWidget {
  const secondStream({super.key});

  @override
  State<secondStream> createState() => _secondStreamState();
}

class _secondStreamState extends State<secondStream> {


  Stream<int> addData1() async* {
    for(int i=0; i<10; i++){
      await Future.delayed(Duration(seconds: 2));
      yield i;
    }
  }

  Stream<String> addData2() async*{
    yield "This is a very simple example for Stream concept";
    await Future.delayed(Duration(seconds: 5));
    yield "First example is used StreamController concept. It can be customized more than this Stream Class concept. But when We use more Streams, we need to close the current stream to go to next stream";
    await Future.delayed(Duration(seconds: 10));
    yield "But Using this Stream Class concept, we won't close stream. we can add Streams as we need. Also no need to create StreamControllers for controlling Streams. ";
    await Future.delayed(Duration(seconds: 10));
    yield "I commented some codes in this second example. You can see it in my code";
    await Future.delayed(Duration(seconds: 5));
    yield "You can refer my Github repository for understanding this Stream concept.";
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData1();
    addData2();
  }

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
          children: [
            // StreamBuilder(
            //   stream: addData1().where((event) => event.isEven),
            //   builder: (context, snapshot) {
            //     if(snapshot.hasError){
            //       return Text("Some errors are found");
            //     }
            //     if(snapshot.connectionState == ConnectionState.waiting){
            //       return CircularProgressIndicator.adaptive();
            //     }
            //     return Column(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children: <Widget>[
            //         const Text(
            //           'This Stream example is created using Stream class concept. I add a filter for showing only even numbers ',
            //         ),
            //         Text(
            //           '${snapshot.data}',
            //           style: Theme.of(context).textTheme.headlineMedium,
            //         ),
            //       ],
            //     );
            //   }
            // ),
            // Container(
            //   height: 100,
            // ),
            StreamBuilder(
              stream: addData2(),
              builder: (context, snapshot) {
                  if(snapshot.hasError){
                    return Text("some error occoured");
                  }
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator.adaptive();
                  }
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        '${snapshot.data}',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: Colors.blue,
                        )
                      )
                    ],
                  );
              },
            )
          ],
        ),
      ),
    );
  }
}
