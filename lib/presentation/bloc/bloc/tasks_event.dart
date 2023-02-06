// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'tasks_bloc.dart';

abstract class TasksEvent extends Equatable {
  const TasksEvent();

  @override
  List<Object> get props => [];
}

class AddTask extends TasksEvent {
  final Task tasks;
  const AddTask({
    required this.tasks,
  });
  @override
  List<Object> get props => [tasks];
}

class UpdateTask extends TasksEvent {
  final Task tasks;
  const UpdateTask({
    required this.tasks,
  });
  @override
  List<Object> get props => [tasks];
}

class RemoveTask extends TasksEvent {
  final Task tasks;
  const RemoveTask({
    required this.tasks,
  });
  @override
  List<Object> get props => [tasks];
}

class DeleteTask extends TasksEvent {
  final Task tasks;
  const DeleteTask({
    required this.tasks,
  });
  @override
  List<Object> get props => [tasks];
}
