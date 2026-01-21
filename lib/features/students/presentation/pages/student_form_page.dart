import 'package:flutter/material.dart';
import '../../domain/entities/student.dart';

class StudentFormPage extends StatefulWidget {
  final Student? student; // If null, we are in "Add" mode

  const StudentFormPage({super.key, this.student});

  @override
  State<StudentFormPage> createState() => _StudentFormPageState();
}

class _StudentFormPageState extends State<StudentFormPage> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  late TextEditingController _nameController;
  late TextEditingController _gradeController;
  late TextEditingController _groupController;
  late TextEditingController _phoneController;
  late TextEditingController _parentNameController;
  late TextEditingController _parentPhoneController;
  late TextEditingController _addressController;

  @override
  void initState() {
    super.initState();
    final s = widget.student;
    _nameController = TextEditingController(text: s?.name ?? '');
    _gradeController = TextEditingController(text: s?.grade ?? '');
    _groupController = TextEditingController(text: s?.group ?? '');
    _phoneController = TextEditingController(text: s?.phoneNumber ?? '');
    _parentNameController = TextEditingController(text: s?.parentName ?? '');
    _parentPhoneController = TextEditingController(text: s?.parentPhone ?? '');
    _addressController = TextEditingController(text: s?.address ?? '');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _gradeController.dispose();
    _groupController.dispose();
    _phoneController.dispose();
    _parentNameController.dispose();
    _parentPhoneController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _saveStudent() {
    if (_formKey.currentState!.validate()) {
      // Create updated/new student object
      // In a real app, you'd call the Bloc/Cubit here
      final studentData = Student(
        id: widget.student?.id ?? DateTime.now().millisecondsSinceEpoch.toString(),
        name: _nameController.text,
        grade: _gradeController.text,
        group: _groupController.text,
        phoneNumber: _phoneController.text,
        parentName: _parentNameController.text,
        parentPhone: _parentPhoneController.text,
        address: _addressController.text,
        createdAt: widget.student?.createdAt ?? DateTime.now(),
        photoUrl: widget.student?.photoUrl,
      );

      // Simulate save
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Student Saved (Simulation)')),
      );

      Navigator.pop(context); // Go back
    }
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.student != null;
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Student' : 'Add Student'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
                validator: (value) => value!.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _gradeController,
                      decoration: const InputDecoration(labelText: 'Grade'),
                      validator: (value) => value!.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _groupController,
                      decoration: const InputDecoration(labelText: 'Group'),
                      validator: (value) => value!.isEmpty ? 'Required' : null,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
              ),
              const SizedBox(height: 24),
              Text('Parent Information', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              TextFormField(
                controller: _parentNameController,
                decoration: const InputDecoration(labelText: 'Parent Name'),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _parentPhoneController,
                decoration: const InputDecoration(labelText: 'Parent Phone'),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _saveStudent,
                child: Text(isEditing ? 'Update Student' : 'Create Student'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
