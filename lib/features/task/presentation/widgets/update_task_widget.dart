import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

import '../../../../core/widgets/m_rounded_loading_button.dart';
import '../../../create_new_task/presentation/bloc/new_task_bloc.dart';
import '../../domain/entity/task_entity.dart';
import '../bloc/task_bloc.dart';

class UpdateTaskWidget extends StatelessWidget {
  const UpdateTaskWidget({Key? key, this.task}) : super(key: key);

  final TaskEntity? task;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: const [
            //     _InputDate(),
            //     SizedBox(width: 10),
            //     _InputTime(),
            //   ],
            // ),
            _InputDate(),
            SizedBox(height: 10),
            _InputTime(),
            SizedBox(
              height: 10,
            ),
            _InputName(),
            _InputDescription(),
            SizedBox(height: 10),
            _UpdateButton(task: task),
          ],
        ),
      ),
    );
  }
}

class _InputName extends StatelessWidget {
  const _InputName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskBloc, NewTaskState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.title.value,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.inputTaskName,
            errorText: state.titleError,
          ),
          onChanged: (title) {
            context.read<NewTaskBloc>().add(
                  OnTaskTitleChanged(title),
                );
          },
        );
      },
    );
  }
}

class _InputDescription extends StatelessWidget {
  const _InputDescription({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTaskBloc, NewTaskState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.description,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.inputTaskDescription,
          ),
          maxLines: 5,
          onChanged: (description) {
            context
                .read<NewTaskBloc>()
                .add(OnTaskDescriptionChanged(description));
          },
        );
      },
    );
  }
}

class _InputDate extends StatelessWidget {
  const _InputDate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.read<NewTaskBloc>().add(OnDateSelected(context));
      },

      icon: const Icon(Icons.calendar_month_rounded),
      // SizedBox(
      //   width: 5,
      // ),
      label: BlocBuilder<NewTaskBloc, NewTaskState>(
        builder: (context, state) {
          return Text(state.date);
        },
      ),
    );
  }
}

class _InputTime extends StatelessWidget {
  const _InputTime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {
        context.read<NewTaskBloc>().add(OnTimeSelected(context));
      },
      // child: Row(
      //   children: [
      icon: const Icon(Icons.access_time_rounded),
      // SizedBox(
      //   width: 4,
      // ),
      label: BlocBuilder<NewTaskBloc, NewTaskState>(
        builder: (context, state) {
          return Text(state.time);
        },
        //   ),
        // ],
      ),
    );
  }
}

class _UpdateButton extends StatelessWidget {
  const _UpdateButton({Key? key, this.task}) : super(key: key);

  final TaskEntity? task;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, taskState) {
        return BlocBuilder<NewTaskBloc, NewTaskState>(
          builder: (context, state) {
            return MRoundedLoadingButton(
                width: 100,
                controller: taskState.updateButtonController,
                onPressed: () {
                  context.read<TaskBloc>().add(
                        UpdateTask(
                          TaskEntity(
                            id: task!.id,
                            name: state.title.value,
                            description: state.description ?? '',
                            date: '${state.date} ${state.time}',
                            isDone: task!.isDone,
                          ),
                        ),
                      );
                },
                child: const Text('Update'));
          },
        );
      },
    );
  }
}
