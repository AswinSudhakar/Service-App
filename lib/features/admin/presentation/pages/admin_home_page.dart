import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/router/route_paths.dart';

class AdminHomePage extends StatelessWidget {
  const AdminHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Admin Panel')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Approve Providers'),
            onTap: () => context.push(RoutePaths.adminProviders),
          ),
          ListTile(
            title: const Text('Manage Services'),
            onTap: () => context.push(RoutePaths.adminServices),
          ),
          ListTile(
            title: const Text('Manage Bookings'),
            onTap: () => context.push(RoutePaths.adminBookings),
          ),
        ],
      ),
    );
  }
}
