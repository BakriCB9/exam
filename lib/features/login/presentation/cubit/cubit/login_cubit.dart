import 'package:exam_app/core/api_manager/api_request.dart';
import 'package:exam_app/core/api_manager/api_result.dart';

import 'package:exam_app/features/login/data/model/loginModel.dart';
import 'package:exam_app/features/login/data/model/login_response/login_response.dart';
import 'package:exam_app/features/login/domain/usecase/loginUseCase.dart';
import 'package:exam_app/features/login/presentation/cubit/cubit/login_state.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginusecase) : super(LoginStateInit());
  Loginusecase loginusecase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login(ApiRequestModel<LoginRequestModel> requestBody) async {
    emit(LoginStateLoading());
    ApiResult<LoginResponse> result = await loginusecase(requestBody);
    switch (result) {
      case SuccessApiResult<LoginResponse>():
        emit(LoginStateSuccess(result.data!.message!));
      case ErrorApiResult<LoginResponse>():
        emit(LoginStateError(
          result.exception.toString().replaceFirst('Exception: ', ''),
        ));
    }
  }
}
