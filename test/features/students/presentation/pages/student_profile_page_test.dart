import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:csms/features/students/presentation/pages/student_profile_page.dart';
import 'package:csms/features/students/domain/entities/student.dart';

void main() {
  final testStudent = Student(
    id: '123',
    name: 'John Doe',
    grade: '10th',
    group: 'A',
    createdAt: DateTime.now(),
  );

  testWidgets('StudentProfilePage shows basic info for Student role', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: StudentProfilePage(student: testStudent, isAdmin: false),
    ));

    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('10th - A'), findsOneWidget);
    expect(find.text('Delete Student'), findsNothing); // Admin only
  });

  testWidgets('StudentProfilePage shows admin actions for Admin role', (tester) async {
    await tester.pumpWidget(MaterialApp(
      home: StudentProfilePage(student: testStudent, isAdmin: true),
    ));

    expect(find.text('Delete Student'), findsOneWidget);
    expect(find.byIcon(Icons.edit), findsOneWidget);
  });
}
