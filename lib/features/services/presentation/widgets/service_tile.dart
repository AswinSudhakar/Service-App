import 'package:flutter/material.dart';
import '../../domain/entities/service.dart';

class ServiceTile extends StatelessWidget {
  final Service service;

  const ServiceTile({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(service.name),
      subtitle: Text(service.description),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
