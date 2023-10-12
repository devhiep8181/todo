import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  toggleHidePassword() {
    //nham mat mo mat
    final bool currentValue =
        (state as LoginInitial).obscureText; //lay ra gia tri hien tai
    emit(LoginInitial(
      obscureText: !currentValue,
    )); //ban thong bao
  }
}
