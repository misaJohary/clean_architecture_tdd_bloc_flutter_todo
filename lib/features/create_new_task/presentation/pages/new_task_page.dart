import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../core/helpers/unfocus_keyboard.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../core/widgets/m_rounded_loading_button.dart';
import '../../../task/presentation/bloc/task_bloc.dart';
import '../bloc/new_task_bloc.dart';

class NewTask extends StatelessWidget {
  const NewTask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        appBar: CustomAppBar(
          onPressed: () {
            Navigator.of(context).pop();
            context.read<TaskBloc>()
              ..add(OnFindTasks())
              ..add(OnFindTodayAndFutureTasks());
          },
          title: AppLocalizations.of(context)!.addNewTask,
          actions: [
            BlocBuilder<NewTaskBloc, NewTaskState>(
              builder: (context, state) {
                return MRoundedLoadingButton(
                  width: 40,
                  height: 40,
                  elevation: 0,
                  controller: state.controller,
                  onPressed: () {
                    unfocusKeyboard();
                    context.read<NewTaskBloc>().add(OnAddNewTask(context));
                  },
                  child: const Icon(
                    Icons.add_circle_outline_rounded,
                  ),
                );
              },
            )
          ],
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _InputDate(),
                    _InputTime(),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const _InputName(),
                const _InputDescription(),
              ],
            ),
          ),
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
      heroTag: null,
      icon: const Icon(Icons.calendar_month_rounded),
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
      heroTag: null,
      onPressed: () {
        context.read<NewTaskBloc>().add(OnTimeSelected(context));
      },
      icon: const Icon(Icons.access_time_rounded),
      label: BlocBuilder<NewTaskBloc, NewTaskState>(
        builder: (context, state) {
          return Text(state.time);
        },
      ),
    );
  }
}
