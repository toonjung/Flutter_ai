import 'package:equatable/equatable.dart';

class BlocTestModel {
  String fName;
  bool value;
  

  BlocTestModel(
    this.fName,
    this.value,
  );

  @override
  String toString() {
    return 'BlocTestModel{$fName}';
  }

  // @override
  // // TODO: implement props
  // List<Object?> get props => throw UnimplementedError();
}
