part of 'information_bloc.dart';

@immutable
abstract class InformationEvent {}

class LoadInformation extends InformationEvent {}

//class Selectlist extends InformationEvent {}

// class SelectlistTrue extends InformationEvent {}
//  class SelectlistFalse extends InformationEvent {}
// class Addlist extends InformationEvent {
//   final BlocTestModel fname;
//   Addlist(this.fname);
//   @override
//   String toString() {
//     return 'Addlist}';
//   }
// }

// class Removelist extends InformationEvent {
//   final String fname;
//   Removelist(this.fname);
//   @override
//   String toString() {
//     return 'Removelist';
//   }
// }
// class ListCheck extends InformationEvent {
//   ListCheck(bool payload);
// }
class SelectCheckList extends InformationEvent {
  String data;
  bool status;
  SelectCheckList({required this.data, required this.status});
  @override
  String toString() {
    return 'SelectCheckList';
  }
}

class Showname extends InformationEvent {}
