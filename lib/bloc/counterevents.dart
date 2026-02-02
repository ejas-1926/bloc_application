//Name of the bloc and the action it is doing ---> general naming convention of events eg CounterIncremented

//For using bloc, first we need to tell it all the bloc is trying to capture and the type of the state we are trying to manage
//event means just a class

//we do the parting means all of this will be on one unit
//main adavantage of parting is we cant counterevents outside this but if we extend this can be done
part of 'coutner_bloc.dart';

sealed class CounterEvents {}

class CounterDecremented extends CounterEvents {}

class CounterRestored extends CounterEvents {}

class CounterIncremented extends CounterEvents {}



//why are we using the sealed class here??
//because even if we miss a condition in switch case, this will helpful 


//PART OF
///PART OF USED TO SPLIT A SINGLE PAGE/LIBRARY INTO MULTIPLE PAGES 
///EVEN THOUGH THEY ARE IN MULTIPLE FILE, LOGICALLY ALL OF THEM ARE CONNECTED AS ONE UNIT
///THIS ENHANCES READABILITY
///AVOID IMPORTING DIFFERENT DIFFERENT THINS 
///SHARE PRIVATE VARIBALES AND METHODS ACROSS MULTIPLE FILE
///