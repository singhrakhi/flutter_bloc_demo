import 'package:bloc/bloc.dart';

enum CounterEvents {increment, decrement}

class CounterBloc extends Bloc<CounterEvents, int>{
  int get initialState => 0;


  @override
  Stream<int> mapEventToState(CounterEvents event) async* {

    switch(event){
      case CounterEvents.increment:
        yield state + 1;
        break;

      case CounterEvents.decrement:
        if(state>1){
          yield state - 1;
        }
        break;
    }
  }

}