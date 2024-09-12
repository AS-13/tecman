import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tecman/blocs/auth_event.dart';
import '../services/auth_service.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthService authService;

  AuthBloc(this.authService) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final message = await authService.login(event.email, event.password);
        emit(AuthSuccess(message));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });
  }
}
