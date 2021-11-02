import 'package:bloc_5/capitalize.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cubit Capitalize',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
          create: (context) => Capitalize(),
          child: const MyHomePage(title: 'Flutter Cubit Capitalize')),
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
  var textInput;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter a string',
                ),
                onChanged: (String text) {
                  setState(() {
                    textInput = text;
                  });
                },
              ),
            ),
            ElevatedButton(
                onPressed: () => context.read<Capitalize>().capIt(textInput),
                child: const Text('to caps')),
            BlocBuilder<Capitalize, MyState>(
              builder: (context, caps) => Center(
                child: Container(
                  color: Colors.blue[50],
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(caps.capString()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
