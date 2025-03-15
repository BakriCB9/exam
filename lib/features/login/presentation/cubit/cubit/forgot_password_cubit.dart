import 'package:exam_app/features/login/domain/usecase/reset_code_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/api_manager/api_result.dart';
import '../../../domain/usecase/forget_password_usecase.dart';
import 'forgot_password_state.dart';
import 'package:flutter/material.dart';
@injectable
class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final TextEditingController emailController = TextEditingController();
  final ResetCodeUsecase resetCodeUsecase;
  ForgotPasswordCubit(this.resetCodeUsecase, {required this.forgotPasswordUseCase})
      : super(ForgotPasswordState(status: StatusForgetPassword.init));

  Future<void> forgotPassword(String email) async {
    emit(ForgotPasswordState(status: StatusForgetPassword.loading));
    final result = await forgotPasswordUseCase.execute(email);
    switch (result) {
      case SuccessApiResult():
        {
          Future.delayed(Duration(seconds: 1), () {
            emit(state.copyWith(
              status: StatusForgetPassword.success,
              successMessage: "Registration successful",));
          });
        }
      case ErrorApiResult():
        {Future.delayed(Duration(seconds: 1), () {
          emit(state.copyWith(
            status: StatusForgetPassword.error,
            error:
            result.exception.toString().replaceFirst('Exception: ', ''),
          ));
        });
        }
    }
  }
}