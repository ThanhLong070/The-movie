import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_movie/repository/auth_repo.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepo authRepo;

  AuthBloc(AuthState initialState, this.authRepo) : super(initialState) {
    on<AppStart>((event, emit) async {
      emit(LoginInitial());
    });
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      try {
        var session = await authRepo.login(event.username, event.password);
        if (session['success'] == true) {
          final prefs = await SharedPreferences.getInstance();
          prefs.setString('sessionId', session['session_id']);
          emit(LoginSuccess());
        } else {
          emit(LoginFailed(message: 'User not found'));
        }
      } catch (e) {
        emit(LoginFailed(message: 'Server disconnect'));
      }
    });
  }
}
