import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/provider_bloc.dart';
import '../bloc/provider_event.dart';
import '../bloc/provider_state.dart';
import '../widgets/provider_tile.dart';

class SelectProviderPage extends StatelessWidget {
  final String serviceId;

  const SelectProviderPage({
    super.key,
    required this.serviceId,
  });

  @override
  Widget build(BuildContext context) {
    context.read<ProviderBloc>().add(LoadProviders(serviceId));

    return Scaffold(
      appBar: AppBar(title: const Text('Select Provider')),
      body: BlocBuilder<ProviderBloc, ProviderState>(
        builder: (_, state) {
          if (state is ProvidersLoaded) {
            return ListView.builder(
              itemCount: state.providers.length,
              itemBuilder: (_, i) =>
                  ProviderTile(provider: state.providers[i]),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
