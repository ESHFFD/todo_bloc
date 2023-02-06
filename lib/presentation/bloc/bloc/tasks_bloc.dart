import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_app_bloc/presentation/models/task.dart';

part 'tasks_event.dart';
part 'tasks_state.dart';

class TasksBloc extends Bloc<TasksEvent, TasksState> {
  TasksBloc() : super(const TasksState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
  }

  _onAddTask(AddTask event, Emitter<TasksState> emit) {
    emit(TasksState(allTask: List.from(state.allTask)..add(event.tasks)));
  }

  _onUpdateTask(UpdateTask event, Emitter<TasksState> emitter) {}
  _onDeleteTask(DeleteTask event, Emitter<TasksState> emitter) {}
}
