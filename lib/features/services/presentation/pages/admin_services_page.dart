import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/service_bloc.dart';
import '../bloc/service_event.dart';
import '../bloc/service_state.dart';

class AdminServicesPage extends StatelessWidget {
  const AdminServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ServiceBloc>().add(LoadCategories());

    return Scaffold(
      appBar: AppBar(title: const Text('Manage Services')),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (_, state) {
          if (state is ServicesLoaded) {
            return ListView.builder(
              itemCount: state.services.length,
              itemBuilder: (_, i) {
                final s = state.services[i];
                return SwitchListTile(
                  title: Text(s.name),
                  value: s.isActive,
                  onChanged: (value) {
                    // call updateServiceStatus
                  },
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
