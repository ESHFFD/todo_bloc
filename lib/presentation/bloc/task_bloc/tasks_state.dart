// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> allTask;
  final List<Task> removeTask;
  const TasksState(
      {this.allTask = const <Task>[], this.removeTask = const <Task>[]});

  @override
  List<Object> get props => [allTask, removeTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'allTask': allTask.map((x) => x.toMap()).toList(),
      'removeTask': removeTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
        allTask: List<Task>.from(
          (map['allTask'] as List<int>).map<Task>(
            (x) => Task.fromMap(x as Map<String, dynamic>),
          ),
        ),
        removeTask: List<Task>.from(
          (map['removeTask'] as List<int>).map<Task>(
            (x) => Task.fromMap(x as Map<String, dynamic>),
          ),
        ));
  }
}

class TasksInitial extends TasksState {}
