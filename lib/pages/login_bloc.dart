import 'package:bloc/bloc.dart';
import 'package:neon_banking/data/apis/auth_apis.dart';
import 'package:neon_banking/data/model/auth_request.dart';
import 'package:neon_banking/data/model/auth_response.dart';
import 'package:neon_banking/data/shared_preference/preference_repository.dart';
import 'package:neon_banking/pages/login_event.dart';
import 'package:neon_banking/pages/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PreferenceRepository preferenceRepository;

  LoginBloc({required this.preferenceRepository}) : super(LoginInitial()) {
    on<LoginEvent>((event, state) async {
      if (event is LoginClicked) {
        emit(LoginLoading());
        AuthRequest authRequest = AuthRequest(int.parse(event.phone), int.parse(event.password));
        var loginResponse = await loginUser(authRequest);
        if (loginResponse is Success) {
          AuthResponse authResponse = loginResponse.response!;
          preferenceRepository.saveUserAccessToken(authResponse.access);
          emit(LoginSuccess());
        }
        if (loginResponse is Error) {
          emit(LoginError(errorMessage: loginResponse.errorMessage!));
        }
      }
    });
  }
}
