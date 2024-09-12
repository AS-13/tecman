import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tecman/blocs/register_event.dart';
import '../services/auth_service.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService authService;

  RegisterBloc(this.authService) : super(RegisterInitial()) {
    on<RegisterSubmit>((event, emit) async {
      emit(RegisterLoading());
      try {
        final message = await authService.register(event.email, event.password);
        emit(RegisterSuccess(message));
      } catch (e) {
        emit(RegisterError(e.toString()));
      }
    });
  }
}
