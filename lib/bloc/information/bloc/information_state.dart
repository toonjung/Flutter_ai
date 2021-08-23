// import 'package:equatable/equatable.dart';
// import 'package:flutter_new/model/blocTestModel.dart';
part of 'information_bloc.dart';

@immutable
abstract class InformationState {}
// abstract class InformationState extends Equatable{
//   InformationState([List props = const []]) : super(props);
// }

class InformationInitial extends InformationState {}

class Informationloaded extends InformationState {}

class Informationloading extends InformationState {}

class InformationError extends InformationState {}

// class SelectlistState extends InformationState {
//   bool isChecklist = false;
// }

// class SelectlistFalse extends InformationState {}
//  class CheckStateSelectlist extends InformationState {}
// class SelectlistAdd extends InformationState {
//   @override
//   String toString() {
//     return 'SelectlistAdd';
//   }
// }

// class SelectlistRemove extends InformationState {
//   @override
//   String toString() {
//     return 'SelectlistRemove';
//   }
// }

