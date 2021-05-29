import 'package:bloc_api/bloc/get/cubit/getcontact_cubit.dart';
import 'package:bloc_api/bloc/get/put/delete/post/cubit/postcontact_cubit.dart';
import 'package:bloc_api/data/api/apiservice.dart';
import 'package:bloc_api/data/contact_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

var getIt = GetIt.I;
void locator() {
  Dio dio = Dio();
  getIt.registerLazySingleton(() => dio);

  ApiService apiService = ApiService(getIt.call());
  getIt.registerLazySingleton(() => apiService);

  ContactRespository contactRespository = ContactRespository(getIt.call());
  getIt.registerLazySingleton(() => contactRespository);

  GetcontactCubit getcontactCubit = GetcontactCubit(getIt.call());
  getIt.registerLazySingleton(() => getcontactCubit);

  PostcontactCubit postcontactCubit = PostcontactCubit(getIt.call());
  getIt.registerLazySingleton(() => postcontactCubit);
}
