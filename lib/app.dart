// import 'package:flutter/material.dart';
// import 'config/router/app_router.dart';
// import 'config/theme/app_theme.dart';

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Hyperlocal Booking',
//       debugShowCheckedModeBanner: false,
//       theme: AppTheme.light,
//       routerConfig: AppRouter.router,
//     );
//   }
// }

// // import 'package:flutter/material.dart';
// // import 'package:go_router/go_router.dart';

// // class App extends StatelessWidget {
// //   const App({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final router = GoRouter(
// //       routes: [
// //         GoRoute(
// //           path: '/',
// //           builder: (_, __) => const Scaffold(
// //             body: Center(
// //               child: Text(
// //                 'ROUTER OK',
// //                 style: TextStyle(fontSize: 24),
// //               ),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );

// //     return MaterialApp.router(
// //       routerConfig: router,
// //     );
// //   }
// // }

import 'package:flutter/material.dart';
import 'config/router/app_router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Hyperlocal Booking',
      routerConfig: AppRouter.router,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
        scaffoldBackgroundColor: Colors.white,
      ),
    );
  }
}
