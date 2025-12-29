import 'package:flutter/material.dart';
import '../../domain/entities/provider.dart';

class ProviderTile extends StatelessWidget {
  final Provider provider;

  const ProviderTile({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(provider.name),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
