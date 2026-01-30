//Name of the bloc and the action it is doing ---> general naming convention of events eg CounterIncremented

//For using bloc, first we need to tell it all the bloc is trying to capture and the type of the state we are trying to manage
//event means just a class

sealed class CounterEvents {}

class CounterDecremented extends CounterEvents {}

class CounterRestored extends CounterEvents {}

class CounterIncremented extends CounterEvents {}
