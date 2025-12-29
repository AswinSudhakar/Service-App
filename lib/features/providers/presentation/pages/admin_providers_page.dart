import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/provider_bloc.dart';
import '../bloc/provider_event.dart';
import '../bloc/provider_state.dart';

class AdminProvidersPage extends StatelessWidget {
  const AdminProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProviderBloc>().add(LoadPendingProviders());

    return Scaffold(
      appBar: AppBar(title: const Text('Approve Providers')),
      body: BlocBuilder<ProviderBloc, ProviderState>(
        builder: (_, state) {
          if (state is ProvidersLoaded) {
            return ListView.builder(
              itemCount: state.providers.length,
              itemBuilder: (_, i) {
                final p = state.providers[i];
                return ListTile(
                  title: Text(p.name),
                  trailing: ElevatedButton(
                    onPressed: () {
                      context
                          .read<ProviderBloc>()
                          .add(ApproveProviderEvent(p.id));
                    },
                    child: const Text('Approve'),
                  ),
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
