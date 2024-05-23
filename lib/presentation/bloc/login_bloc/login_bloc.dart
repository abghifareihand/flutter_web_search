import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wifipos_web/data/models/login_request_model.dart';
import 'package:wifipos_web/data/models/login_response_model.dart';

import '../../../data/datasources/auth_remote_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginUser>((event, emit) async {
      emit(LoginLoading());
      final result = await AuthRemoteDatasource().login(event.loginRequest);
      result.fold(
        (error) => emit(LoginError(message: error)),
        (success) => emit(LoginLoaded(loginResponse: success)),
      );
    });
  }
}
