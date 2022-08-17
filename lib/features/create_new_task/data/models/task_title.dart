import 'package:formz/formz.dart';

enum TitleValidationError {
  empty,
}

class TaskTitle extends FormzInput<String, TitleValidationError> {
  const TaskTitle.pure() : super.pure('');
  const TaskTitle.dirty([String value = '']) : super.dirty(value);

  @override
  TitleValidationError? validator(String? value) {
    if (value?.isEmpty == true || value == null) {
      return TitleValidationError.empty;
    } else {
      return null;
    }
  }
}
