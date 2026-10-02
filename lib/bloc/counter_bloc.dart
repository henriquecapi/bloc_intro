import 'package:bloc_intro/provider/counter_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum CounterEvent { increment, decrement }

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterProvider provider = CounterProvider();

  CounterBloc() : super(0) {
    // Reação a eventos
    provider.controller.stream.listen((bool evento) {
      if (evento) {
        add(CounterEvent.increment);
      } else {
        add(CounterEvent.decrement);
      }
    });

    on<CounterEvent>(
      // Função
      ((CounterEvent event, Emitter emit) {
        switch (event) {
          case CounterEvent.increment:
            emit(state + 1);
            break;
          case CounterEvent.decrement:
            emit(state - 1);
            break;
        }
      }),
    );
  }
}
