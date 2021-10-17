import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:news_ok/login/login_service.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> signInWithGoogle() async {
    try {
      emit(LoggingInState());
      final user = await LoginService().signInWithGoogle();
      if (user.user != null) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailed(message: 'Failed to Login'));
      }
    } on FirebaseAuthException {
      emit(LoginFailed(message: 'Failed to Login'));
    } catch (e) {
      emit(LoginFailed(message: 'Failed to Login'));
    }
  }
}
