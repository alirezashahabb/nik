import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nikeshop/data/repositroy/auth_repositroy.dart';
import 'package:nikeshop/utils/exaption.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepositry repositry;
  bool isLoginMode;
  AuthBloc(this.repositry, {this.isLoginMode = true})
      : super(AuthInitial(isLoginMode)) {
    on<AuthEvent>(
      (event, emit) async {
        try {
          if (event is AuthBottomIsClickedEvent) {
            emit(AuthLoading(isLoginMode));
            if (isLoginMode) {
              await repositry.login(event.usrName, event.password);
              emit(AuthSuccses(isLoginMode));

              emit(AuthSuccses(isLoginMode));
            } else {
              await repositry.signUp(event.usrName, event.password);
              emit(AuthSuccses(isLoginMode));
            }
          } else if (event is AuthChangedClickedEvnet) {
            isLoginMode = !isLoginMode;
            emit(
              AuthInitial(isLoginMode),
            );
          }
        } catch (e) {
          emit(
            AuthError(
              isLoginMode,
              AppExption(),
            ),
          );
        }
      },
    );
  }
}
