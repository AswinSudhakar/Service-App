import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/widgets/primary_button.dart';
import '../../domain/entities/city.dart';
import '../bloc/location_bloc.dart';
import '../bloc/location_event.dart';

class SelectLocationPage extends StatelessWidget {
  const SelectLocationPage({super.key});

  static const City city = City(
    id: 'city_1',
    name: 'Your City',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Location')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              title:  Text(city.name),
              leading: const Icon(Icons.location_city),
            ),
            const Spacer(),
            PrimaryButton(
              label: 'Continue',
              onPressed: () {
                context.read<LocationBloc>().add(SelectCity(city));
              },
            ),
          ],
        ),
      ),
    );
  }
}
