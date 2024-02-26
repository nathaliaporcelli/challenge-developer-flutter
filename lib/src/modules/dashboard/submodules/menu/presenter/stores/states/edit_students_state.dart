import '../../../../../../../core/exceptions/cesla_exceptions.dart';

sealed class EditStudentsState {
  bool get isLoading => this is EditStudentsLoadingState;
  bool get isError => this is EditStudentsErrorState;
  EditStudentsErrorState get asError => this as EditStudentsErrorState;
  bool get isSuccess => this is EditStudentsSuccessState;
}

class EditStudentsInitialState extends EditStudentsState {}

class EditStudentsLoadingState extends EditStudentsState {}

class EditStudentsErrorState extends EditStudentsState {
  final CeslaException exception;

  EditStudentsErrorState(this.exception);
}

class EditStudentsSuccessState extends EditStudentsState {}
