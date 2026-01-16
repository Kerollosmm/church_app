/// Purpose:
/// This file is reserved for error handling dialogs (e.g., specific styling for app errors).
/// and it will be a branch from generic_dialog.dart
// for Example: show error dialog when error accure  
import 'package:csms/shared/widgets/dialogs/generic_dialog.dart';
import 'package:flutter/material.dart';
Future<void> showErrorDialog(BuildContext context, String text) {
  return showGenericDialog<void>(
    context: context,
    title: 'An Error Occurred',
    content: text,
    optionBuilder: () => {'OK': null},
  );
}