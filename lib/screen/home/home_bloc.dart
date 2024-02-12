import 'package:bloc_demo/screen/home/home_event.dart';
import 'package:bloc_demo/screen/home/home_repo.dart';
import 'package:bloc_demo/screen/home/home_state.dart';
import 'package:bloc_demo/utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeRepo repo = HomeRepo();

  HomeBloc() : super(Init()) {
    on<LoadProduct>((event, emit) async {
      emit(Loading());
      try {
        var response = await repo.fetchData();
        print('group_name: ${response['message']}');
        // print('group_name: ${response}');
        print('group_name: ${response['data'][0]['first_name']}');


        emit(Loaded(title: response['data'][0]['first_name']));
      } on DioException catch (e) {
        print("status Code ${e.response?.statusCode}");
        print('Error $e');
        throw DioExceptions.fromDioError(
                dioError: e, errorFrom: "getProfileData")
            .errorMessage();
      }catch (error){
        print("finally error $error");
      }
    });
  }
}
