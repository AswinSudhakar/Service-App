import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/service_bloc.dart';
import '../bloc/service_event.dart';
import '../bloc/service_state.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Services')),
      body: BlocBuilder<ServiceBloc, ServiceState>(
        builder: (context, state) {
          if (state is CategoriesLoaded) {
            return ListView.builder(
              itemCount: state.categories.length,
              itemBuilder: (_, i) {
                final c = state.categories[i];
                return ListTile(
                  title: Text(c.name),
                  onTap: () {
                    context
                        .read<ServiceBloc>()
                        .add(LoadServices(c.id));
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
