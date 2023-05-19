import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gym_app/Application/Login/login_state.dart';
import 'package:gym_app/Data/Repository/login_repo.dart';

class EmailSignInCubit extends Cubit<EmailState> {
  EmailSignInCubit() : super(InitialEmailSigIn());

  Future<void> emailLogin(email) async {
    emit(LoadingEmailSigIn());
    await AuthRepo().login(email).then((value) async {
      //   log('value ${value}');

      final userProfile = value.firstWhere(
        (profile) => profile['email'] == email,
      );
      log('$userProfile');
      emit(LoadedEmailSigIn(userProfile));
    }).catchError((error) {
      log('error');
      emit(ErrorEmailSigIn(error: error.toString()));
    });
  }
}
