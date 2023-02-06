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
    emit(TasksState(allTask: allTask));
  }

  _onDeleteTask(DeleteTask event, Emitter<TasksState> emit) {
    emit(TasksState(allTask: List.from(state.allTask)..remove(event.tasks)));
  }
}
