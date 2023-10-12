import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class TodoModel extends Equatable {
  String? id;
  String? title;
  String? subTitle;
  bool? isCompleted;
  TodoModel({this.id, this.title, this.subTitle, this.isCompleted = false});

  @override

  List<Object?> get props => [id, title, subTitle, isCompleted];
}
