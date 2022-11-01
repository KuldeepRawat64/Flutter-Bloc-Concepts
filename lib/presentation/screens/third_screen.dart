import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';

class ThirdScreen extends StatefulWidget {
  final String title;
  final Color color;
  const ThirdScreen({
    Key? key,
    required this.title,
    required this.color,
  }) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
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
                      heroTag: 'FA5',
                      onPressed: () {
                        BlocProvider.of<CounterCubit>(context).decrement();
                      },
                      tooltip: 'Decrement',
                      child: const Icon(Icons.remove),
                    ),
                    FloatingActionButton(
                      heroTag: 'FA6',
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
