import 'package:exam_app/core/api_manager/api_result.dart';
import 'package:exam_app/features/auth/data/model/loginModel.dart';
import 'package:exam_app/features/auth/domain/usecase/loginUseCase.dart';
import 'package:exam_app/features/auth/presentation/cubit/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.loginusecase) : super(LoginStateInit());
  Loginusecase loginusecase;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<void> login(LoginRequestModel requestBody) async {
    emit(LoginStateLoading());
    ApiResult<String> result = await loginusecase(requestBody);
    switch (result) {
      case ApiResultSuccess<String>():
        emit(LoginStateSuccess(result.data));
      case ApiResultError<String>():
        emit(LoginStateError(result.error));
    }
  }
}
