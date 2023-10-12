part of 'login_cubit.dart';

sealed class LoginState extends Equatable {}

final class LoginInitial extends LoginState {
  LoginInitial({
    this.obscureText = true,
  });
  final bool obscureText;

  @override
  List<Object?> get props => [obscureText];
}
