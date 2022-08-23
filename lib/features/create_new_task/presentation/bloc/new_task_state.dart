part of 'new_task_bloc.dart';

enum NewTaskStatus { loading, success, failure }

class NewTaskState extends Equatable {
  const NewTaskState({
    this.status,
    this.failure,
    required this.title,
    this.description,
    required this.date,
    required this.time,
    this.formStatus,
    this.titleError,
    this.controller,
    this.updateButtonController,
    this.updateStatus,
  });
  final NewTaskStatus? status;
  final NewTaskStatus? updateStatus;
  final Failure? failure;
  final TaskTitle title;
  final String? description;
  final String date;
  final String time;
  final FormzStatus? formStatus;
  final String? titleError;
  final RoundedLoadingButtonController? controller;
  final RoundedLoadingButtonController? updateButtonController;

  NewTaskState copyWith({
    NewTaskStatus? status,
    NewTaskStatus? updateStatus,
    Failure? failure,
    TaskTitle? title,
    String? description,
    String? date,
    String? time,
    FormzStatus? formStatus,
    String? titleError,
    bool clearTitleError = false,
    RoundedLoadingButtonController? controller,
    RoundedLoadingButtonController? updateButtonController,
  }) =>
      NewTaskState(
        status: status ?? this.status,
        updateStatus: updateStatus ?? this.updateStatus,
        failure: failure ?? this.failure,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        time: time ?? this.time,
        formStatus: formStatus ?? this.formStatus,
        titleError: clearTitleError ? null : titleError ?? this.titleError,
        controller: controller ?? this.controller,
        updateButtonController:
            updateButtonController ?? this.updateButtonController,
      );
  @override
  List<Object?> get props => [
        status,
        updateStatus,
        failure,
        title,
        description,
        date,
        time,
        formStatus,
        titleError,
        controller,
        updateButtonController,
      ];
}

class NewTaskInitial extends NewTaskState {
  NewTaskInitial({
    super.status = NewTaskStatus.loading,
    super.updateStatus = NewTaskStatus.loading,
    super.formStatus = FormzStatus.pure,
    super.title = const TaskTitle.pure(),
  }) : super(
          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          time: DateFormat('HH:mm').format(DateTime.now()),
          controller: RoundedLoadingButtonController(),
          updateButtonController: RoundedLoadingButtonController(),
        );
}
