//state management
//state of an object means what is the value inside that instance
import 'package:flutter_bloc/flutter_bloc.dart';

//Counter cubit manages the state of an integer value..this means(atleast for now understand like this)
class CounterCubit extends Cubit<int> {
  //initial value of
  CounterCubit() : super(0);
  void increment() {
    ///we are trying to update the state so that all the places where this is used being automatically,gets notified
    ///when ever change the state, automatically where all we used this will get notified
    ///state = state + 1;
    ///this is not a the way of updating the state of the value
    ///for this purpose we use the emit function
    ///emit function emits to the notifiers that  the current state has changed to this new state
    print(state);
    emit(state + 1);
    print(state);
  }

  void decrement() {
    print(state);
    emit(state - 1);
    print(state);
  }
}


//now we need to create a function to manipulate the state ie current value that CounterCubit manages
//ie integer value;

//so this is a counter application 
//we are managing the state ie the value of the counter variable 
//intially it will be zero
//whenever we create a cubit,we need to pass the initial state 
//initial state means the initial value of the  counter variable 
//it can be anything it can be an instance or a regular int or string or anything 
//generally when we do the set state in stateful widget we are changing the state ie value of the object using
///using this thing now 
///we are using the bloc to do the same 
///
///
///emit function can only be used inside the bloc or cubit classes because this is a protected function there fore only the subclasses of the cubit or bloc can call this
///