// ignore_for_file: dangling_library_doc_comments
import 'package:bloc_app/bloc/counterevents.dart';
import 'package:bloc_app/bloc/coutner_bloc.dart';
import 'package:bloc_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///if we have the increment and decrement button on some other page

/////how will update on the main page
//////Creating another Cubit will result in the issue that we faced earlier value will start from zero again and starts couting
//we cant pass the cubit from one class to another class also we are not planning to do that

//for this purpose we use provider
//we let the provider to give the instance of cubit so that it can be accessed from any part of the application
//bloc has a class named bloc_provider which will help us to do it.
//this will provide the instance from one page to another. anywhere in the application, the instance of bloc can be accessed
//we need to register it at where material app starts
//remember only instance of bloc can be accessed like this
class Secondpage extends StatelessWidget {
  Secondpage({super.key});
  late CounterCubit cubit;
  late CounterBloc cbloc;
  void _incrementCounter() {
    //each time we are creating a new cubit with 0 as initial value and gets incremented to 1
    //that is why we can see the state changed in the print but not in the UI
    //Cubit().increment();
    // so we need to use a listener object that will rebuild the UI once state changes
    //something like set state
    //set state also works here but we dont want to use that we are using something that bloc provides
    //Bloc builder that will build automatically once the state is getting changed
    //it will listen to the notifications
    //we only want the text to rebuild all other remains same before and after the rebuild
    cubit.increment();
  }

  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<CounterCubit>(context);
    cbloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      body: SafeArea(child: Center()),
      floatingActionButton: Column(
        children: [
          FloatingActionButton(
            onPressed: () => cbloc.add(CounterDecremented()),
            tooltip: 'Increment',
            child: const Icon(Icons.reddit),
          ),

          FloatingActionButton(
            onPressed: () => cbloc.add(CounterIncremented()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
