import '../../../../../../../core/exceptions/cesla_exceptions.dart';

sealed class DeleteStudentsState {
  bool get isLoading => this is DeleteStudentsLoadingState;
  bool get isError => this is DeleteStudentsErrorState;
  DeleteStudentsErrorState get asError => this as DeleteStudentsErrorState;
  bool get isSuccess => this is DeleteStudentsSuccessState;
}

class DeleteStudentsInitialState extends DeleteStudentsState {}

class DeleteStudentsLoadingState extends DeleteStudentsState {}

class DeleteStudentsErrorState extends DeleteStudentsState {
  final CeslaException exception;

  DeleteStudentsErrorState(this.exception);
}

class DeleteStudentsSuccessState extends DeleteStudentsState {
  DeleteStudentsSuccessState();
}
