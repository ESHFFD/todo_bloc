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

  _onAddTask(AddTask event, Emitter<TasksState> emit) {
    emit(TasksState(
        allTask: List.from(state.allTask)..add(event.tasks),
        removeTask: state.removeTask));
  }

  _onUpdateTask(UpdateTask event, Emitter<TasksState> emit) {
    final task = event.tasks;
    final int index = state.allTask.indexOf(task);
    List<Task> allTask = List.from(state.allTask)..remove(task);
    task.isDone == false
        ? allTask.insert(index, task.copyWith(isDone: true))
        : allTask.insert(
            index,
            task.copyWith(isDone: false),
          );
    emit(TasksState(allTask: allTask, removeTask: state.removeTask));
  }

  _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    emit(TasksState(
        allTask: state.allTask,
        removeTask: List.from(state.removeTask)..remove(event.tasks)));
  }

  _onRemoveTask(RemoveTask event, Emitter<TasksState> emit) {
    emit(TasksState(
        allTask: List.from(state.allTask)..remove(event.tasks),
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
