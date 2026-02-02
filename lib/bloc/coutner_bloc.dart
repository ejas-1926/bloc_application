import 'package:flutter_bloc/flutter_bloc.dart';

//we are doing the same thing as bloc
//Bloc requires two arguments  the type of the state which we are managing similar to the cubit
//but here we need to pass the event as well
//bloc is event based

//if we part this we dont need to import from now onwards  all are under one unit aka one library 
part 'counterevents.dart';

class CounterBloc extends Bloc<CounterEvents, int> {
  CounterBloc() : super(0) {
    //on function is used to add the call back to an event
    on<CounterIncremented>((event, emit) {
      emit(state + 1);
    });
    on<CounterDecremented>((event, emit) {
      emit(state - 1);
    });
    //we are managing the state of an integer variable that is value of an integer variable
    //so when things change we are emitting the state of the variable ie value of that variable
    on<CounterRestored>((event, emit) {
      emit(0);
    });
  }
}




///what is event in bloc 
///events are input to the bloc 
///something like button click we can capture the button click event and pass to the bloc and using this event we can update the state
///in cubit we were creating the functions and calling it for updating the state
///in bloc we are creating events and when the event gets triggered ,we can update the state using the event handlers
///blocs are just event based ie whenever an event happens whenever we want, we can trigger the event then bloc will capture it and the on call back gets called 
///hence we can emit the state, once state is emitted all the notifiers will get to know
///
 

// ///class CounterBloc extends Bloc<CounterIncremented, int> {
//   CounterBloc() : super(0) {
//     //on function is used to add the call back to an event
//     on<CounterIncremented>((event, emit) {
//       emit(state + 1);
//     });
//   }
// }
//here one problem is that we can't configure for multiple events since it takes only one parameter
//inorder to configure one or more events , best practice is we will create a base class and from that we will inherit the events 
