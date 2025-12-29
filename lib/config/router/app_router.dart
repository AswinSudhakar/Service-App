// import 'package:go_router/go_router.dart';
// import 'package:hyperlocal_booking_app/config/di/injection.dart';
// import 'package:hyperlocal_booking_app/core/usecase/usecase.dart';
// import 'package:hyperlocal_booking_app/features/auth/presentation/login_page.dart';
// import 'package:hyperlocal_booking_app/features/auth/presentation/otp_page.dart';
// import 'package:hyperlocal_booking_app/features/auth/presentation/splash_page.dart';
// import 'package:hyperlocal_booking_app/features/location/domain/usecases/get_selected_city.dart';
// import 'package:hyperlocal_booking_app/features/location/presentation/pages/select_location_page.dart';
// import '../../features/admin/presentation/pages/admin_home_page.dart';
// import '../../features/providers/presentation/pages/admin_providers_page.dart';
// import '../../features/booking/presentation/pages/admin_bookings_page.dart';
// import '../../features/services/presentation/pages/admin_services_page.dart';
// import 'route_paths.dart';

// class AppRouter {
//   static final router = GoRouter(
//       routes: [
//         GoRoute(
//           path: RoutePaths.splash,
//           builder: (_, __) => const SplashPage(),
//         ),
//         GoRoute(
//           path: RoutePaths.login,
//           builder: (_, __) => const LoginPage(),
//         ),
//         GoRoute(
//           path: RoutePaths.otp,
//           builder: (_, __) => const OtpPage(),
//         ),
//         GoRoute(
//           path: RoutePaths.location,
//           builder: (_, __) => const SelectLocationPage(),
//         ),
//         GoRoute(
//           path: RoutePaths.admin,
//           builder: (_, __) => const AdminHomePage(),
//         ),
//         GoRoute(
//           path: RoutePaths.adminProviders,
//           builder: (_, __) => const AdminProvidersPage(),
//         ),
//         GoRoute(
//           path: RoutePaths.adminBookings,
//           builder: (_, __) => const AdminBookingsPage(),
//         ),
//         GoRoute(
//           path: RoutePaths.adminServices,
//           builder: (_, __) => const AdminServicesPage(),
//         ),
//       ],
//       redirect: (context, state) async {
//         final getCity = getIt<GetSelectedCity>();
//         final city = await getCity(const NoParams());

//         final isOnLocation = state.matchedLocation == RoutePaths.location;

//         if (city == null && !isOnLocation) {
//           return RoutePaths.location;
//         }

//         if (city != null && isOnLocation) {
//           return RoutePaths.home;
//         }

//         return null;
//       });
// }

// import 'package:go_router/go_router.dart';
// import '../../features/auth/presentation/splash_page.dart';
// import '../../features/auth/presentation/login_page.dart';
// import '../../features/auth/presentation/otp_page.dart';
// import '../../features/location/presentation/pages/select_location_page.dart';
// import '../../features/admin/presentation/pages/admin_home_page.dart';
// import 'route_paths.dart';

// class AppRouter {
//   static final router = GoRouter(
//     initialLocation: RoutePaths.splash,
//     routes: [
//       GoRoute(
//         path: RoutePaths.splash,
//         builder: (_, __) => const SplashPage(),
//       ),
//       GoRoute(
//         path: RoutePaths.login,
//         builder: (_, __) => const LoginPage(),
//       ),
//       GoRoute(
//         path: RoutePaths.otp,
//         builder: (_, __) => const OtpPage(),
//       ),
//       GoRoute(
//         path: RoutePaths.location,
//         builder: (_, __) => const SelectLocationPage(),
//       ),
//       GoRoute(
//         path: RoutePaths.admin,
//         builder: (_, __) => const AdminHomePage(),
//       ),
//     ],
//   );
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../di/injection.dart';

import '../../features/auth/presentation/splash_page.dart';
import '../../features/auth/presentation/login_page.dart';
import '../../features/auth/presentation/otp_page.dart';
import '../../features/location/presentation/pages/select_location_page.dart';
import '../../features/admin/presentation/pages/admin_home_page.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

import 'route_paths.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutePaths.splash,
    routes: [
      GoRoute(
        path: RoutePaths.splash,
        builder: (_, __) => const SplashPage(),
      ),

      GoRoute(
        path: RoutePaths.login,
        builder: (_, __) => BlocProvider<AuthBloc>(
          create: (_) => getIt<AuthBloc>(),
          child: const LoginPage(),
        ),
      ),

      // GoRoute(
      //   path: RoutePaths.otp,
      //   builder: (context, state) => BlocProvider<AuthBloc>(
      //     create: (_) => getIt<AuthBloc>(),
      //     child: OtpPage(
      //       email: state.extra as String,
      //     ),
      //   ),
      // ),

      GoRoute(
        path: RoutePaths.location,
        builder: (_, __) => const SelectLocationPage(),
      ),

      GoRoute(
        path: RoutePaths.admin,
        builder: (_, __) => const AdminHomePage(),
      ),
    ],
  );
}
