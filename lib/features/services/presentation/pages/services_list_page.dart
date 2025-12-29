import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/service_bloc.dart';
import '../bloc/service_state.dart';
import '../widgets/service_tile.dart';

class ServicesListPage extends StatelessWidget {
  const ServicesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Available Services')),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (_, state) {
          if (state is ServicesLoaded) {
            return ListView.builder(
              itemCount: state.services.length,
              itemBuilder: (_, i) =>
                  ServiceTile(service: state.services[i]),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
