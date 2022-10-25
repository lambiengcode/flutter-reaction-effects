import 'package:flutter/material.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';
import 'package:reaction_askany/reaction_askany.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ReactionWrapper(
              boxParamenters: ReactionBoxParamenters(
                brightness: Brightness.light,
                iconSize: 26,
                iconSpacing: 10,
                paddingHorizontal: 30,
                radiusBox: 40,
                quantityPerPage: 6,
              ),
              buttonReaction: const Padding(
                padding: EdgeInsets.only(top: 2.0),
                child: Icon(
                  Icons.face_outlined,
                  size: 20.0,
                  color: Colors.grey,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 12.0,
                  horizontal: 20.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.greenAccent.shade100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Text(
                  'Message from lambiengcode <3',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
