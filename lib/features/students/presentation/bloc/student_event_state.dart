import 'package:equatable/equatable.dart';
import '../../domain/entities/student.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();
  @override
  List<Object?> get props => [];
}

class LoadStudents extends StudentEvent {
  final String grade;
  final String group;

  const LoadStudents(this.grade, this.group);

  @override
  List<Object?> get props => [grade, group];
}

class SearchStudents extends StudentEvent {
  final String query;
  const SearchStudents(this.query);

  @override
  List<Object?> get props => [query];
}

abstract class StudentState extends Equatable {
  const StudentState();
  @override
  List<Object?> get props => [];
}

class StudentInitial extends StudentState {}

class StudentLoading extends StudentState {}

class StudentLoaded extends StudentState {
  final List<Student> students;
  const StudentLoaded(this.students);

  @override
  List<Object?> get props => [students];
}

class StudentError extends StudentState {
  final String message;
  const StudentError(this.message);

  @override
  List<Object?> get props => [message];
}
