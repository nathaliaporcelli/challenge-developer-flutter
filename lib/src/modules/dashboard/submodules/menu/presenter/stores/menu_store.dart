import 'package:flutter/material.dart';

import '../../../../../../core/exceptions/cesla_exceptions.dart';
import '../../data/repositories/i_menu_repository.dart';
import '../../domain/dtos/student_dto.dart';
import '../../domain/entities/student_entity.dart';
import 'states/menu_state.dart';

class MenuStore extends ValueNotifier<MenuState> {
  final IMenuRepository menuRepository;

  MenuStore(this.menuRepository) : super(MenuInitialState());

  List<StudentEntity> students = [];

  void _setValue(MenuState state) {
    value = state;
  }

  Future<void> getAllStudents() async {
    try {
      _setValue(MenuLoadingState());

      students = await menuRepository.getAllStudents();

      _setValue(MenuSuccessState(students));
    } on CeslaException catch (e) {
      _setValue(MenuErrorState(e));
    }
  }

  Future<void> postStudent(StudentDTO dto) async {
    try {
      _setValue(MenuLoadingState());

      await menuRepository.postStudent(dto);

      _setValue(MenuSuccessState(students));
    } on CeslaException catch (e) {
      _setValue(MenuErrorState(e));
    }
  }

  Future<void> deleteStudentById(int id) async {
    try {
      _setValue(MenuLoadingState());

      await menuRepository.deleteStudentById(id);

      _setValue(MenuSuccessState(students));
    } on CeslaException catch (e) {
      _setValue(MenuErrorState(e));
    }
  }
}
