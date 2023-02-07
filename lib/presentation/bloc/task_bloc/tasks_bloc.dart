import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/presentation/bloc/bloc_exports.dart';

import 'package:todo_app_bloc/presentation/models/task.dart';
part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends HydratedBloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
  }

  void _onAddTask(AddTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
      pendingTask: List.from(state.pendingTask)..add(event.tasks),
      compeletedTask: state.compeletedTask,
      favoriteTask: state.favoriteTask,
      removeTask: state.removeTask,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final state = this.state;
    final task = event.tasks;
    List<Task> pendingList = state.pendingTask;
    List<Task> completedList = state.compeletedTask;
    // List<Task> allTask = List.from(state.pendingTask)..remove(task);
    task.isDone == false
        ? {
            pendingList = List.from(pendingList)..remove(task),
            completedList = List.from(completedList)
              ..insert(0, task.copyWith(isDone: true))
          }
        : {
            completedList = List.from(completedList)..remove(task),
            pendingList = List.from(pendingList)
              ..insert(0, task.copyWith(isDone: false)),
          };

    emit(TasksState(
        pendingTask: pendingList,
        removeTask: state.removeTask,
        compeletedTask: completedList,
        favoriteTask: state.favoriteTask));
  }

  void _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTask: state.pendingTask,
        compeletedTask: state.compeletedTask,
        favoriteTask: state.favoriteTask,
        removeTask: List.from(state.removeTask)..remove(event.tasks)));
  }

  void _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    final state = this.state;
    emit(TasksState(
        pendingTask: List.from(state.pendingTask)..remove(event.tasks),
        compeletedTask: List.from(state.compeletedTask)..remove(event.tasks),
        favoriteTask: List.from(state.favoriteTask)..remove(event.tasks),
        removeTask: List.from(state.removeTask)
          ..add(event.tasks.copyWith(isDeleted: true))));
  }

  @override
  TasksState? fromJson(Map<String, dynamic> json) {
    return TasksState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TasksState state) {
    return state.toMap();
  }
}
