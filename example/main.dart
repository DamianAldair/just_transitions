import 'package:flutter/material.dart';
import 'package:just_transitions/just_transitions.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'just_transitions_example_app',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const page = SecondPage();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              'Go to the Second Page',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextButton(
            child: const Text('None'),
            onPressed: () {
              JustTransitions.goTo(
                context: context,
                page: page,
                type: JustTransitionType.none(),
              );
            },
          ),
          TextButton(
            child: const Text('Material'),
            onPressed: () {
              JustTransitions.goTo(
                context: context,
                page: page,
                type: JustTransitionType.material(),
              );
            },
          ),
          TextButton(
            child: const Text('Cupertino'),
            onPressed: () {
              JustTransitions.goTo(
                context: context,
                page: page,
                type: JustTransitionType.cupertino(),
              );
            },
          ),
          TextButton(
            child: const Text('Fade'),
            onPressed: () {
              JustTransitions.goTo(
                context: context,
                page: page,
                type: JustTransitionType.fade(),
              );
            },
          ),
          TextButton(
            child: const Text('Size'),
            onPressed: () {
              JustTransitions.goTo(
                context: context,
                page: page,
                type: JustTransitionType.size(),
              );
            },
          ),
          TextButton(
            child: const Text('Scale'),
            onPressed: () {
              JustTransitions.goTo(
                context: context,
                page: page,
                type: JustTransitionType.scale(),
              );
            },
          ),
          TextButton(
            child: const Text('Slide'),
            onPressed: () {
              JustTransitions.goTo(
                context: context,
                page: page,
                type: JustTransitionType.slide(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      backgroundColor: Colors.cyan,
      body: const Center(child: Text('This is the second page')),
    );
  }
}
