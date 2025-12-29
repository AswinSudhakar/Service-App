import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hyperlocal_booking_app/config/di/injection.dart';
import 'package:hyperlocal_booking_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:hyperlocal_booking_app/features/location/presentation/bloc/location_bloc.dart';
import 'package:hyperlocal_booking_app/features/providers/presentation/bloc/provider_bloc.dart';
import 'package:hyperlocal_booking_app/features/services/presentation/bloc/service_bloc.dart';
import 'bootstrap/app_initializer.dart';
import 'app.dart';
import 'features/booking/presentation/bloc/booking_bloc.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppInitializer.init();
  runApp(
  MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => getIt<LocationBloc>()),
      BlocProvider(create: (_) => getIt<ServiceBloc>()),
      BlocProvider(create: (_) => getIt<ProviderBloc>()),
      BlocProvider(create: (_) => getIt<BookingBloc>()),
    ],
    child: const App(),
  ),
);

}
