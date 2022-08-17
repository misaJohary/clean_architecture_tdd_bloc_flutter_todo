part of 'new_task_bloc.dart';

enum NewTaskStatus { loading, success, failure }

class NewTaskState extends Equatable {
  const NewTaskState({
    required this.status,
    this.failure,
    required this.title,
    this.description,
    required this.date,
    required this.time,
    this.formStatus,
    this.titleError,
    required this.controller,
  });
  final NewTaskStatus status;
  final Failure? failure;
  final TaskTitle title;
  final String? description;
  final String date;
  final String time;
  final FormzStatus? formStatus;
  final String? titleError;
  final RoundedLoadingButtonController controller;

  NewTaskState copyWith({
    NewTaskStatus? status,
    Failure? failure,
    TaskTitle? title,
    String? description,
    String? date,
    String? time,
    FormzStatus? formStatus,
    String? titleError,
    RoundedLoadingButtonController? controller,
  }) =>
      NewTaskState(
        status: status ?? this.status,
        failure: failure ?? this.failure,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        time: time ?? this.time,
        formStatus: formStatus ?? this.formStatus,
        titleError: titleError ?? this.titleError,
        controller: controller ?? this.controller,
      );
  @override
  List<Object?> get props => [
        status,
        failure,
        title,
        description,
        date,
        time,
        formStatus,
        titleError,
        controller,
      ];
}

class NewTaskInitial extends NewTaskState {
  NewTaskInitial({
    super.status = NewTaskStatus.loading,
    super.formStatus = FormzStatus.pure,
    super.title = const TaskTitle.pure(),
  }) : super(
          date: DateFormat('yyyy-MM-dd').format(DateTime.now()),
          time: DateFormat('HH:mm').format(DateTime.now()),
          controller: RoundedLoadingButtonController(),
        );
}
