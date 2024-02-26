import '../../../../../../../core/exceptions/cesla_exceptions.dart';

sealed class CreateStudentsState {
  bool get isLoading => this is CreateStudentsLoadingState;
  bool get isError => this is CreateStudentsErrorState;
  CreateStudentsErrorState get asError => this as CreateStudentsErrorState;
  bool get isSuccess => this is CreateStudentsSuccessState;
}

class CreateStudentsInitialState extends CreateStudentsState {}

class CreateStudentsLoadingState extends CreateStudentsState {}

class CreateStudentsErrorState extends CreateStudentsState {
  final CeslaException exception;

  CreateStudentsErrorState(this.exception);
}

class CreateStudentsSuccessState extends CreateStudentsState {}
