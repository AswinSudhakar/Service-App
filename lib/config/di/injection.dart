// import 'package:get_it/get_it.dart';
// import 'package:hyperlocal_booking_app/features/location/data/datasources/location_local_datasource.dart';
// import 'package:hyperlocal_booking_app/features/location/data/repositories/location_repository_impl.dart';
// import 'package:hyperlocal_booking_app/features/location/domain/usecases/get_selected_city.dart';
// import 'package:hyperlocal_booking_app/features/location/domain/usecases/save_selected_city.dart';
// import 'package:hyperlocal_booking_app/features/location/presentation/bloc/location_bloc.dart';
// import 'package:hyperlocal_booking_app/features/services/data/datasources/service_remote_datasource.dart';
// import 'package:hyperlocal_booking_app/features/services/data/repositories/service_repository_impl.dart';
// import 'package:hyperlocal_booking_app/features/services/domain/usecases/get_categories.dart';
// import 'package:hyperlocal_booking_app/features/services/domain/usecases/get_service_detail.dart';
// import 'package:hyperlocal_booking_app/features/services/domain/usecases/get_services_by_category.dart';
// import 'package:hyperlocal_booking_app/features/services/presentation/bloc/service_bloc.dart';
// import '../../features/auth/data/datasources/auth_remote_datasource.dart';
// import '../../features/auth/data/repositories/auth_repository_impl.dart';
// import '../../features/auth/domain/usecases/send_otp.dart';
// import '../../features/auth/domain/usecases/verify_otp.dart';
// import '../../features/auth/presentation/bloc/auth_bloc.dart';
// import '../../features/providers/data/datasources/provider_remote_datasource.dart';
// import '../../features/providers/data/repositories/provider_repository_impl.dart';
// import '../../features/providers/domain/usecases/get_providers_by_service.dart';
// import '../../features/providers/domain/usecases/get_pending_providers.dart';
// import '../../features/providers/domain/usecases/approve_provider.dart';
// import '../../features/providers/presentation/bloc/provider_bloc.dart';
// import '../../features/booking/data/datasources/booking_remote_datasource.dart';
// import '../../features/booking/data/repositories/booking_repository_impl.dart';
// import '../../features/booking/domain/usecases/create_booking.dart';
// import '../../features/booking/domain/usecases/get_user_bookings.dart';
// import '../../features/booking/domain/usecases/update_booking_status.dart';
// import '../../features/booking/presentation/bloc/booking_bloc.dart';
// import '../../features/admin/domain/usecases/is_admin.dart';

// final getIt = GetIt.instance;

// void configureDependencies() {
//   getIt.registerLazySingleton<AuthRemoteDataSource>(
//     () => AuthRemoteDataSource(),
//   );

//   getIt.registerLazySingleton(
//     () => AuthRepositoryImpl(getIt()),
//   );

//   getIt.registerLazySingleton(() => SendOtp(getIt()));
//   getIt.registerLazySingleton(() => VerifyOtp(getIt()));

//   getIt.registerFactory(
//     () => AuthBloc(
//       sendOtp: getIt(),
//       verifyOtp: getIt(),
//     ),
//   );

//   getIt.registerLazySingleton<LocationLocalDataSource>(
//     () => LocationLocalDataSource(),
//   );

//   getIt.registerLazySingleton(
//     () => LocationRepositoryImpl(getIt()),
//   );

//   getIt.registerLazySingleton(() => GetSelectedCity(getIt()));
//   getIt.registerLazySingleton(() => SaveSelectedCity(getIt()));

//   getIt.registerFactory(
//     () => LocationBloc(
//       getSelectedCity: getIt(),
//       saveSelectedCity: getIt(),
//     ),
//   );

//   getIt.registerLazySingleton<ServiceRemoteDataSource>(
//     () => ServiceRemoteDataSource(),
//   );

//   getIt.registerLazySingleton(
//     () => ServiceRepositoryImpl(getIt()),
//   );

//   getIt.registerLazySingleton(() => GetCategories(getIt()));
//   getIt.registerLazySingleton(() => GetServicesByCategory(getIt()));
//   getIt.registerLazySingleton(() => GetServiceDetail(getIt()));

//   getIt.registerFactory(
//     () => ServiceBloc(
//       getCategories: getIt(),
//       getServicesByCategory: getIt(),
//       getServiceDetail: getIt(),
//     ),
//   );

//   getIt.registerLazySingleton<ProviderRemoteDataSource>(
//     () => ProviderRemoteDataSource(),
//   );

//   getIt.registerLazySingleton(
//     () => ProviderRepositoryImpl(getIt()),
//   );

//   getIt.registerLazySingleton(() => GetProvidersByService(getIt()));
//   getIt.registerLazySingleton(() => GetPendingProviders(getIt()));
//   getIt.registerLazySingleton(() => ApproveProvider(getIt()));

//   getIt.registerFactory(
//     () => ProviderBloc(
//       getProvidersByService: getIt(),
//       getPendingProviders: getIt(),
//       approveProvider: getIt(),
//     ),
//   );

//   getIt.registerLazySingleton<BookingRemoteDataSource>(
//     () => BookingRemoteDataSource(),
//   );

//   getIt.registerLazySingleton(
//     () => BookingRepositoryImpl(getIt()),
//   );

//   getIt.registerLazySingleton(() => CreateBooking(getIt()));
//   getIt.registerLazySingleton(() => GetUserBookings(getIt()));
//   getIt.registerLazySingleton(() => UpdateBookingStatus(getIt()));

//   getIt.registerFactory(
//     () => BookingBloc(
//       createBooking: getIt(),
//       getUserBookings: getIt(),
//       updateBookingStatus: getIt(),
//     ),
//   );

//   // getIt.registerLazySingleton(() => IsAdmin(getIt()));
// }

import 'package:get_it/get_it.dart';

// =======================
// AUTH
// =======================
import '../../features/auth/data/datasources/auth_remote_datasource.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/send_otp.dart';
import '../../features/auth/domain/usecases/verify_otp.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';

// =======================
// LOCATION
// =======================
import '../../features/location/data/datasources/location_local_datasource.dart';
import '../../features/location/data/repositories/location_repository_impl.dart';
import '../../features/location/domain/repositories/location_repository.dart';
import '../../features/location/domain/usecases/get_selected_city.dart';
import '../../features/location/domain/usecases/save_selected_city.dart';
import '../../features/location/presentation/bloc/location_bloc.dart';

// =======================
// SERVICES
// =======================
import '../../features/services/data/datasources/service_remote_datasource.dart';
import '../../features/services/data/repositories/service_repository_impl.dart';
import '../../features/services/domain/repositories/service_repository.dart';
import '../../features/services/domain/usecases/get_categories.dart';
import '../../features/services/domain/usecases/get_services_by_category.dart';
import '../../features/services/domain/usecases/get_service_detail.dart';
import '../../features/services/presentation/bloc/service_bloc.dart';

// =======================
// PROVIDERS
// =======================
import '../../features/providers/data/datasources/provider_remote_datasource.dart';
import '../../features/providers/data/repositories/provider_repository_impl.dart';
import '../../features/providers/domain/repositories/provider_repository.dart';
import '../../features/providers/domain/usecases/get_providers_by_service.dart';
import '../../features/providers/domain/usecases/get_pending_providers.dart';
import '../../features/providers/domain/usecases/approve_provider.dart';
import '../../features/providers/presentation/bloc/provider_bloc.dart';

// =======================
// BOOKINGS
// =======================
import '../../features/booking/data/datasources/booking_remote_datasource.dart';
import '../../features/booking/data/repositories/booking_repository_impl.dart';
import '../../features/booking/domain/repositories/booking_repository.dart';
import '../../features/booking/domain/usecases/create_booking.dart';
import '../../features/booking/domain/usecases/get_user_bookings.dart';
import '../../features/booking/domain/usecases/update_booking_status.dart';
import '../../features/booking/presentation/bloc/booking_bloc.dart';

final getIt = GetIt.instance;

void configureDependencies() {
  // =======================
  // AUTH
  // =======================
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSource(),
  );

  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(getIt<AuthRemoteDataSource>()),
  );

  // getIt.registerLazySingleton<SendOtp>(
  //   () => SendOtp(getIt<AuthRepository>()),
  // );

  // getIt.registerLazySingleton<VerifyOtp>(
  //   () => VerifyOtp(getIt<AuthRepository>()),
  // );

  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
        // sendOtp: getIt<SendOtp>(),
        // verifyOtp: getIt<VerifyOtp>(),
        ),
  );

  // =======================
  // LOCATION
  // =======================
  getIt.registerLazySingleton<LocationLocalDataSource>(
    () => LocationLocalDataSource(),
  );

  getIt.registerLazySingleton<LocationRepository>(
    () => LocationRepositoryImpl(getIt<LocationLocalDataSource>()),
  );

  getIt.registerLazySingleton<GetSelectedCity>(
    () => GetSelectedCity(getIt<LocationRepository>()),
  );

  getIt.registerLazySingleton<SaveSelectedCity>(
    () => SaveSelectedCity(getIt<LocationRepository>()),
  );

  getIt.registerFactory<LocationBloc>(
    () => LocationBloc(
      getSelectedCity: getIt<GetSelectedCity>(),
      saveSelectedCity: getIt<SaveSelectedCity>(),
    ),
  );

  // =======================
  // SERVICES
  // =======================
  getIt.registerLazySingleton<ServiceRemoteDataSource>(
    () => ServiceRemoteDataSource(),
  );

  getIt.registerLazySingleton<ServiceRepository>(
    () => ServiceRepositoryImpl(getIt<ServiceRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetCategories>(
    () => GetCategories(getIt<ServiceRepository>()),
  );

  getIt.registerLazySingleton<GetServicesByCategory>(
    () => GetServicesByCategory(getIt<ServiceRepository>()),
  );

  getIt.registerLazySingleton<GetServiceDetail>(
    () => GetServiceDetail(getIt<ServiceRepository>()),
  );

  getIt.registerFactory<ServiceBloc>(
    () => ServiceBloc(
      getCategories: getIt<GetCategories>(),
      getServicesByCategory: getIt<GetServicesByCategory>(),
      getServiceDetail: getIt<GetServiceDetail>(),
    ),
  );

  // =======================
  // PROVIDERS
  // =======================
  getIt.registerLazySingleton<ProviderRemoteDataSource>(
    () => ProviderRemoteDataSource(),
  );

  getIt.registerLazySingleton<ProviderRepository>(
    () => ProviderRepositoryImpl(getIt<ProviderRemoteDataSource>()),
  );

  getIt.registerLazySingleton<GetProvidersByService>(
    () => GetProvidersByService(getIt<ProviderRepository>()),
  );

  getIt.registerLazySingleton<GetPendingProviders>(
    () => GetPendingProviders(getIt<ProviderRepository>()),
  );

  getIt.registerLazySingleton<ApproveProvider>(
    () => ApproveProvider(getIt<ProviderRepository>()),
  );

  getIt.registerFactory<ProviderBloc>(
    () => ProviderBloc(
      getProvidersByService: getIt<GetProvidersByService>(),
      getPendingProviders: getIt<GetPendingProviders>(),
      approveProvider: getIt<ApproveProvider>(),
    ),
  );

  // =======================
  // BOOKINGS
  // =======================
  getIt.registerLazySingleton<BookingRemoteDataSource>(
    () => BookingRemoteDataSource(),
  );

  getIt.registerLazySingleton<BookingRepository>(
    () => BookingRepositoryImpl(getIt<BookingRemoteDataSource>()),
  );

  getIt.registerLazySingleton<CreateBooking>(
    () => CreateBooking(getIt<BookingRepository>()),
  );

  getIt.registerLazySingleton<GetUserBookings>(
    () => GetUserBookings(getIt<BookingRepository>()),
  );

  getIt.registerLazySingleton<UpdateBookingStatus>(
    () => UpdateBookingStatus(getIt<BookingRepository>()),
  );

  getIt.registerFactory<BookingBloc>(
    () => BookingBloc(
      createBooking: getIt<CreateBooking>(),
      getUserBookings: getIt<GetUserBookings>(),
      updateBookingStatus: getIt<UpdateBookingStatus>(),
    ),
  );
}
