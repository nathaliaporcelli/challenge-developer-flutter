// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../../../../../../core/exceptions/cesla_exceptions.dart';
import '../../../domain/entities/student_entity.dart';

sealed class MenuState {
  bool get isLoading => this is MenuLoadingState;
  bool get isError => this is MenuErrorState;
  MenuErrorState get asError => this as MenuErrorState;
  bool get isSuccess => this is MenuSuccessState;
}

class MenuInitialState extends MenuState {}

class MenuLoadingState extends MenuState {}

class MenuErrorState extends MenuState {
  final CeslaException exception;

  MenuErrorState(this.exception);
}

class MenuSuccessState extends MenuState {
  final List<StudentEntity> students;

  MenuSuccessState(this.students);
}
