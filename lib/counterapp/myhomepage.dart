import 'package:bloc_app/bloc/coutner_bloc.dart';
import 'package:bloc_app/counterapp/secondpage.dart';
import 'package:bloc_app/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///so when we use this bloc/ cubit, there is no need of stateful widget
///instead we can use the stateless widget itself

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  /////
  /// the value is given by the variable state
  ///
  ///
  final cubit = CounterCubit();

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

  ///there is a problem the UI is not rebuilding even though valuw is keep on changing
  ///because we are not getting notified once the state is changing
  @override
  Widget build(BuildContext context) {
    final cbt = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            const Text('You have pushed the button this many times:'),
            //here the thing is we need to tell the Blocbuilder which is the listener getting notified that we are listening to what type of cubit or bloc ///
            //(both can be put here as both coming from the same parent class)
            //the builder function will return an int variable which we are listening. this will be getting called on state changes
            //bloc and builder are the parameters needed
            BlocBuilder<CounterBloc, int>(
              bloc: cbt,
              builder: (context, counter) {
                return Text(
                  '$counter has been pressed',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => Secondpage()));
        },
      ),
    );
  }
}

//what if the floating buttons are on some other page and we need to update the state 
//if we create another instance, it would be same as the previous 
//because if we create new instance it will 
//start with initial value as zero and increments from there 



/////////------------------------------------------
///General cubit logic
///any part of the application if you want to access, get the instance using the bloc provider
///