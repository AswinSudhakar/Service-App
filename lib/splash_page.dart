import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/di/injection.dart';
import '../../core/usecase/usecase.dart';
import '../../features/location/domain/usecases/get_selected_city.dart';
import '../../config/router/route_paths.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  Future<void> _decideNavigation(BuildContext context) async {
    final getCity = getIt<GetSelectedCity>();
    final city = await getCity(const NoParams());

    if (city == null) {
      context.go(RoutePaths.location);
    } else {
      context.go(RoutePaths.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    Future.microtask(() => _decideNavigation(context));

    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
