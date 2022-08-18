import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:intl/intl.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/helpers/datetime_factory.dart';
import '../../../../core/pop_up/toast_message.dart';
import '../../../task/data/model/task_model.dart';
import '../../data/models/task_title.dart';
import '../../domain/usecases/create_task_usecase.dart';

part 'new_task_event.dart';
part 'new_task_state.dart';

class NewTaskBloc extends Bloc<NewTaskEvent, NewTaskState> {
  final CreateTaskUseCase createTask;
  NewTaskBloc({required this.createTask}) : super(NewTaskInitial()) {
    on<OnCreateTask>(_onCreateTask);
    on<OnVerifyNewTask>(_onVerifyNewTask);
    on<OnTaskTitleChanged>(_onTaskTitleChanged);
    on<OnTaskDescriptionChanged>(_onTaskDescriptionChanged);
    on<OnAddNewTask>(_onAddNewTask);
    on<OnDateSelected>(_onDateSelected);
    on<OnTimeSelected>(_onTimeSelected);
  }

  void _onCreateTask(
    OnCreateTask event,
    Emitter<NewTaskState> emit,
  ) async {
    emit(
      state.copyWith(
        status: NewTaskStatus.loading,
      ),
    );
    final res = await createTask(AddTaskParam(event.task));
    state.controller.stop();

    res.fold((failure) {
      failureMessage(event.context,
          AppLocalizations.of(event.context)!.errorCreatingNewTask);
      return emit(
          state.copyWith(status: NewTaskStatus.failure, failure: failure));
    }, (task) {
      successMessage(event.context,
          AppLocalizations.of(event.context)!.successCreatingNewTask);

      return emit(
        state.copyWith(
          status: NewTaskStatus.success,
          title: const TaskTitle.pure(),
          description: null,
        ),
      );
    });
  }

  void _onTaskTitleChanged(
    OnTaskTitleChanged event,
    Emitter<NewTaskState> emit,
  ) {
    final title = TaskTitle.dirty(event.title);
    emit(
      state.copyWith(
        title: title,
        formStatus: Formz.validate([
          title,
        ]),
      ),
    );
  }

  void _onTaskDescriptionChanged(
    OnTaskDescriptionChanged event,
    Emitter<NewTaskState> emit,
  ) {
    emit(
      state.copyWith(
        description: event.description,
      ),
    );
  }

  void _onVerifyNewTask(
    OnVerifyNewTask event,
    Emitter<NewTaskState> emit,
  ) {
    if (state.title.error == TitleValidationError.empty) {
      emit(
        state.copyWith(titleError: 'The title should not be empty'),
      );
    }
  }

  void _onAddNewTask(
    OnAddNewTask event,
    Emitter<NewTaskState> emit,
  ) {
    if (!state.formStatus!.isValidated) {
      state.controller.stop();
      return add(OnVerifyNewTask());
    } else {
      emit(state.copyWith(clearTitleError: true));
      final newTask = TaskModel(
        name: state.title.value,
        description: state.description ?? '',
        date: '${state.date} ${state.time}',
        isDone: false,
      );
      add(OnCreateTask(context: event.context, task: newTask));
    }
  }

  Future<void> _onDateSelected(
    OnDateSelected event,
    Emitter<NewTaskState> emit,
  ) async {
    final DateTime? picked = await showDatePicker(
      context: event.context,
      initialDate: DateTimeFactoryImp().stringToDateTime(state.date),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );
    emit(
      state.copyWith(
        date: DateTimeFactoryImp().dateTimeToString(picked!),
      ),
    );
  }

  Future<void> _onTimeSelected(
    OnTimeSelected event,
    Emitter<NewTaskState> emit,
  ) async {
    final TimeOfDay? picked = await showTimePicker(
        context: event.context, initialTime: TimeOfDay.now());

    final String time = generateTime(picked);

    emit(
      state.copyWith(
        time: time,
      ),
    );
  }
}

String generateTime(TimeOfDay? picked) {
  if (picked != null) {
    final String hour = picked.hour.toString();
    final String minute = picked.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  } else {
    return '${DateTime.now().hour.toString()}:${DateTime.now().minute.toString().padLeft(2, '0')}';
  }
}
