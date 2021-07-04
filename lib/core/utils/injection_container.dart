import 'package:SchoolManagementSystem/core/network/network_info.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/data_sources/login_local_data_source.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/data_sources/login_remote_data_source.dart';
import 'package:SchoolManagementSystem/feature/sign_in/data/repositories/login_repository_impl.dart';
import 'package:SchoolManagementSystem/feature/sign_in/domain/repositories/login_repository.dart';
import 'package:SchoolManagementSystem/feature/sign_in/domain/usecases/get_current_user.dart';
import 'package:SchoolManagementSystem/feature/sign_in/domain/usecases/post_login.dart';
import 'package:SchoolManagementSystem/feature/sign_in/presentation/manager/login_bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  ///
  //login
  sl.registerFactory(
        () => LoginBloc(
      lg: sl(),
      cu: sl(),
    ),
  );
  // //register
  // sl.registerFactory(() => RegisterBloc(lg: sl()));
  // //product
  // sl.registerLazySingleton(() => ProductBloc(pr: sl()));
  //
  // //product1

  //
  // //cart
  // sl.registerLazySingleton(() => CartBloc(pr: sl()));
  // //profile
  // sl.registerLazySingleton(() => ProfileBloc(pr: sl(),cu: sl()));
  //
  //
  ///use case
  //login
  sl.registerLazySingleton(() => PostLogin(loginRepository: sl()));
  sl.registerLazySingleton(() => GetCurrentUser(loginRepository: sl()));

  // //register
  // sl.registerLazySingleton(() => PostRegister(registerRepository: sl()));
  // //product
  // sl.registerLazySingleton(() => GetProduct(sl()));
  // //product1
  // sl.registerLazySingleton(() => GetProduct1(sl()));
  // //product2

  // //cart
  // sl.registerLazySingleton(() => GetCart(sl()));
  // //profile
  // sl.registerLazySingleton(() => GetProfile(sl()));
  // sl.registerLazySingleton(() => GetCurrentProfile(profileRepository:  sl()));
  //
  //
  ///repo
  //login
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(
      networkInfo: sl(),
      loginLocalDataSource: sl(),
      loginRemoteDataSource: sl()));
  // //register
  // sl.registerLazySingleton<RegisterRepository>(() => RegisterRepositoryImpl(
  //     networkInfo: sl(), registerRemoteDataSource: sl()));
  // //product
  // sl.registerLazySingleton<ProductRepository>(() =>
  //     ProductRepositoryImpl(networkInfo: sl(), productRemoteDataSource: sl()));
  //
  // //product1
  // sl.registerLazySingleton<Product1Repository>(() => Product1RepositoryImpl(
  //     networkInfo: sl(), product1RemoteDataSource: sl()));

  // sl.registerLazySingleton<Product7Repository>(() => Product7RepositoryImpl(
  //     networkInfo: sl(), product7RemoteDataSource: sl()));
  //
  // //cart
  // sl.registerLazySingleton<CartRepository>(
  //         () => CartRepositoryImpl(networkInfo: sl(), cartRemoteDataSource: sl()));
  // //profile
  // sl.registerLazySingleton<ProfileRepository>(() =>
  //     ProfileRepositoryImpl(networkInfo: sl(), profileRemoteDataSource: sl(),profileLocalDataSource: sl()));
  //
  ///data source
  //login
  sl.registerLazySingleton<LoginRemoteDataSource>(
          () => LoginRemoteDataSourceImpl(client: sl()));
  sl.registerLazySingleton<LoginLocalDataSource>(
          () => LoginLocalDataSourceImpl(sharedPreferences: sl()));
  // //register
  // sl.registerLazySingleton<RegisterRemoteDataSource>(
  //         () => RegisterRemoteDataSourceImpl(client: sl()));
  // //product
  // sl.registerLazySingleton<ProductRemoteDataSource>(
  //         () => ProductRemoteDataSourceImpl(client: sl()));
  // //product1
  // sl.registerLazySingleton<Product1RemoteDataSource>(
  //         () => Product1RemoteDataSourceImpl(client: sl()));

  // //cart
  // sl.registerLazySingleton<CartRemoteDataSource>(
  //         () => CartRemoteDataSourceImpl(client: sl()));
  // //profile
  // sl.registerLazySingleton<ProfileRemoteDataSource>(
  //         () => ProfileRemoteDataSourceImpl(client: sl()));
  // sl.registerLazySingleton<ProfileLocalDataSource>(
  //         () => ProfileLocalDataSourceImpl(sharedPreferences: sl()));

  ///core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  ///external
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
