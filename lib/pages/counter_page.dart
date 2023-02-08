import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_bloc_example/bloc/counter_bloc.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed with Bloc'),
        centerTitle: true,
      ),
      body: Center(child: _CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(const CounterEvent.increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(const CounterEvent.reset()),
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterBloc>().state;
    return state.when(
      initial: () => const FlutterLogo(size: 120),
      loading: () => const CircularProgressIndicator(),
      loaded: (counter) => Text('$counter', style: Theme.of(context).textTheme.displayMedium),
    );
    // if (state is CounterInitialState) {
    //   return const FlutterLogo(size: 120);
    // } else if (state is CounterLoadingState) {
    //   return const CircularProgressIndicator();
    // } else if (state is CounterLoadedState) {
    //   return Text('${state.counter}', style: Theme.of(context).textTheme.displayMedium);
    // }
    // return const SizedBox.shrink();
  }
}
