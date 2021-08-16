part of 'infromation_bloc.dart';

@immutable 
abstract class InformationState {
  
}

class InformationInitial extends InformationState{}

class Informationloaded extends InformationState{}
class Informationloading extends InformationState{}
class InformationError extends InformationState{}