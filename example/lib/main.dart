import 'package:example/controller.dart';
import 'package:flutter/material.dart';
import 'package:depin/depin.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _modules = Modules();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorObservers: [_modules.routeObserver],
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
  final _controller = Inject.instance<View1Controller>([
    'Teste',
    'teste2',
    {
      'i': 457,
      'd': 4.14,
    }
  ]);

  late final int _counter = 0;

  void _incrementCounter() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const View2(),
        settings: const RouteSettings(
          arguments: {
            'i': 457,
            'd': 4.14,
            's': 'String!!!',
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(_controller.text2),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _controller.text,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
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

class Modules extends Injection {
  @override
  List<InjectionModule> get injectionModules => [
        MovieModule(),
      ];
}

class MovieModule implements InjectionModule {
  @override
  List<Injector> get injections => [
        Injector<View1Controller>(View1Controller.new),
        Injector<View2Controller>(View2Controller.new),
      ];
}

class View2 extends StatefulWidget {
  const View2({super.key});

  @override
  State<View2> createState() => _View2State();
}

class _View2State extends State<View2> {
  final _controller = Inject.instance<View2Controller>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_controller.s ?? ''),
      ),
    );
  }
}
