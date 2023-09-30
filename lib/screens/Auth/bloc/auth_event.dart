part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthStartedEvent extends AuthEvent {}

class AuthBottomIsClickedEvent extends AuthEvent {
  final String usrName;
  final String password;

  const AuthBottomIsClickedEvent(this.usrName, this.password);
}

class AuthChangedClickedEvnet extends AuthEvent {}
