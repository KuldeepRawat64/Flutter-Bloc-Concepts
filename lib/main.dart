// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Column(
              children: [
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if (state.isIncremented == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 100),
                          content: Text('Incremented!')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 100),
                          content: Text('Decremented!')));
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      '${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      heroTag: 'FA1',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      heroTag: 'FA2',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => BlocProvider.value(
                                    value:
                                        BlocProvider.of<CounterCubit>(context),
                                    child: const NewScreen(title: 'New Screen'),
                                  )));
                    },
                    child: const Text('Go to Second screen'))
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewScreen extends StatefulWidget {
  final String title;
  const NewScreen({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
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
            const Text(
              'You have pushed the button this many times:',
            ),
            Column(
              children: [
                BlocConsumer<CounterCubit, CounterState>(
                  listener: (context, state) {
                    if (state.isIncremented == true) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 100),
                          content: Text('Incremented!')));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          duration: Duration(milliseconds: 100),
                          content: Text('Decremented!')));
                    }
                  },
                  builder: (context, state) {
                    return Text(
                      '${state.counterValue}',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      heroTag: 'FA3',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      heroTag: 'FA4',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).increment();
                      },
                      tooltip: 'Increment',
                      child: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
