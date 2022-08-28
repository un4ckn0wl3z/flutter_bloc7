import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc7/bloc/counter_bloc.dart';
import 'package:flutter_bloc7/screen/second_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter BLoC'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc, CounterState>(builder: (context, state) {
              return Text(
                state.value.toString(),
                style: Theme.of(context).textTheme.headline1,
              );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: 'dec1',
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterEvent.decrement);
                  },
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: 'add1',
                  onPressed: () {
                    context.read<CounterBloc>().add(CounterEvent.increment);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SecondScreen();
                  }));
                },
                child: Text('Next'))
          ],
        ),
      ),
    );
  }
}
