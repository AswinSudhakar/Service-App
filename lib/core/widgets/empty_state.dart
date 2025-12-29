import 'package:flutter/material.dart';
import '../constants/app_strings.dart';

class EmptyState extends StatelessWidget {
  final String? message;

  const EmptyState({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(message ?? AppStrings.noData),
    );
  }
}
