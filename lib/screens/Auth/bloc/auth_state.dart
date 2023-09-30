part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final bool isLoginMode;
  const AuthState(this.isLoginMode);

  @override
  List<Object> get props => [isLoginMode];
}

final class AuthInitial extends AuthState {
  const AuthInitial(super.isLoginMode);
}

class AuthError extends AuthState {
  final AppExption exption;
  const AuthError(super.isLoginMode, this.exption);
}

class AuthSuccses extends AuthState {
  const AuthSuccses(super.isLoginMode);
}

class AuthLoading extends AuthState {
  const AuthLoading(super.isLoginMode);
}
