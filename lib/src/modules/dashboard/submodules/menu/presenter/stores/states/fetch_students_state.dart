import '../../../../../../../core/exceptions/cesla_exceptions.dart';
import '../../../domain/entities/student_entity.dart';

sealed class FetchStudentsState {
  bool get isLoading => this is FetchStudentsLoadingState;
  bool get isError => this is FetchStudentsErrorState;
  FetchStudentsErrorState get asError => this as FetchStudentsErrorState;
  FetchStudentsSuccessState get asSuccess => this as FetchStudentsSuccessState;
  bool get isSuccess => this is FetchStudentsSuccessState;
}

class FetchStudentsInitialState extends FetchStudentsState {}

class FetchStudentsLoadingState extends FetchStudentsState {}

class FetchStudentsErrorState extends FetchStudentsState {
  final CeslaException exception;

  FetchStudentsErrorState(this.exception);
}

class FetchStudentsSuccessState extends FetchStudentsState {
  final List<StudentEntity> students;

  FetchStudentsSuccessState(this.students);
}
