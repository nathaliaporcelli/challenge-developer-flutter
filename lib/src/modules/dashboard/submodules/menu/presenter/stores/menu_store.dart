import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../../../core/exceptions/cesla_exceptions.dart';
import '../../domain/dtos/post_student_dto.dart';
import '../../domain/dtos/put_student_dto.dart';
import '../../domain/repositories/i_menu_repository.dart';
import 'states/create_students_state.dart';
import 'states/delete_students_state.dart';
import 'states/edit_students_state.dart';
import 'states/fetch_students_state.dart';

class MenuStore {
  final IMenuRepository menuRepository;

  final fetchStudents = ValueNotifier<FetchStudentsState>(FetchStudentsInitialState());
  final createStudents = ValueNotifier<CreateStudentsState>(CreateStudentsInitialState());
  final editStudents = ValueNotifier<EditStudentsState>(EditStudentsInitialState());
  final deleteStudents = ValueNotifier<DeleteStudentsState>(DeleteStudentsInitialState());

  MenuStore({required this.menuRepository});

  Future<void> getAllStudents() async {
    try {
      fetchStudents.value = FetchStudentsLoadingState();

      final students = await menuRepository.getAllStudents();

      fetchStudents.value = FetchStudentsSuccessState(students);
    } on CeslaException catch (e) {
      fetchStudents.value = FetchStudentsErrorState(e);
    }
  }

  Future<void> createStudent(PostStudentDTO dto) async {
    try {
      createStudents.value = CreateStudentsLoadingState();

      await menuRepository.postStudent(dto);

      createStudents.value = CreateStudentsSuccessState();

      await getAllStudents();
    } on CeslaException catch (e) {
      createStudents.value = CreateStudentsErrorState(e);
    }
  }

  Future<void> editStudent(PutStudentDTO dto) async {
    try {
      editStudents.value = EditStudentsLoadingState();

      await menuRepository.putStudent(dto);

      editStudents.value = EditStudentsSuccessState();
      await getAllStudents();
    } on CeslaException catch (e) {
      editStudents.value = EditStudentsErrorState(e);
    }
  }

  Future<void> deleteStudentById(int id) async {
    try {
      deleteStudents.value = DeleteStudentsLoadingState();

      await menuRepository.deleteStudentById(id);

      deleteStudents.value = DeleteStudentsSuccessState();

      await getAllStudents();
    } on CeslaException catch (e) {
      deleteStudents.value = DeleteStudentsErrorState(e);
    }
  }
}
