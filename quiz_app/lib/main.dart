import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 241, 3, 3),
        ),
      ),
      home: const MyHomePage(title: 'This is my first app'),
    );
  }
}



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 5;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text('$_counter', style: Theme.of(context).textTheme.headlineLarge),
            ElevatedButton(
              onPressed: () {},
              child: const Text('This button for child one call'),
            ),
            ChildOne(childData: _counter, onIncrease: _incrementCounter),
            SecondChild(childData: _counter),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ChildOne extends StatelessWidget {
  const ChildOne({
    super.key,
    required this.childData,
    required this.onIncrease,
  });

  final int childData;
  final VoidCallback onIncrease;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: onIncrease, // 🔥 call parent function
          child: const Text('Increase from child'),
        ),
        Text(childData.toString()),
      ],
    );
  }
}

class SecondChild extends StatefulWidget {
  const SecondChild({super.key, required this.childData});

  final int childData;
  @override
  State<SecondChild> createState() => _SecondChild();
}

class _SecondChild extends State<SecondChild> {
  late int data;

  @override
  void initState() {
    super.initState();
    data = widget.childData;
  }

  void _increase() {
    setState(() {
      data++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(onPressed: _increase, child: Text('press for child 1')),

        Text(data.toString()),
      ],
    );
  }
}

















// class SecondChild extends StatefulWidget{
// const SecondChild({super.key,required this.childData});

//  final int childData;

// @override
//   State<SecondChild>createState() => _SecondChild();
// }
// class _SecondChild extends State<SecondChild>{

//  late int _data;
 
//   @override
//   void initState() {
//     super.initState();
//     _data = widget.childData;
//   }


//   void _increase(_data){
//     setState(() {
//     _data++;   
//     });
//   }
//  @override
//   Widget build(BuildContext context) {
//    return Row(children: [
//     ElevatedButton(onPressed: () {
//       _increase(_data);
//     }, child: Text('button 2')),
//     Text(_data.toString())
//    ],);
//   }
// }