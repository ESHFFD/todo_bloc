// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'tasks_bloc.dart';

class TasksState extends Equatable {
  final List<Task> pendingTask;
  final List<Task> compeletedTask;
  final List<Task> favoriteTask;
  final List<Task> removeTask;
  const TasksState(
      {this.pendingTask = const <Task>[],
      this.removeTask = const <Task>[],
      this.compeletedTask = const <Task>[],
      this.favoriteTask = const <Task>[]});

  @override
  List<Object> get props =>
      [pendingTask, removeTask, compeletedTask, favoriteTask];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pendingTask': pendingTask.map((x) => x.toMap()).toList(),
      'compeletedTask': compeletedTask.map((x) => x.toMap()).toList(),
      'favoriteTask': favoriteTask.map((x) => x.toMap()).toList(),
      'removeTask': removeTask.map((x) => x.toMap()).toList(),
    };
  }

  factory TasksState.fromMap(Map<String, dynamic> map) {
    return TasksState(
      pendingTask: List<Task>.from(
        (map['allTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      removeTask: List<Task>.from(
        (map['removeTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      favoriteTask: List<Task>.from(
        (map['removeTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
      compeletedTask: List<Task>.from(
        (map['removeTask'] as List<int>).map<Task>(
          (x) => Task.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}

class TasksInitial extends TasksState {}
