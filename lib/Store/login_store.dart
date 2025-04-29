import 'package:flutter/material.dart';
import 'package:login/models/response_action_button.dart';
import 'package:login/models/user.dart';
import 'package:login/services/user_service.dart';
import 'package:login/validations.dart';
import 'package:login/widgets/flush_bar.dart';
import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  //login
  @observable
  String? email;

  @action
  void setEmail(String value) => {email = value};

  @computed
  bool get emailValid => email != null && email != '';

  //password
  @observable
  String? password;

  @action
  void setPassword(String value) => {password = value};

  @computed
  bool get passwordValid => password != null && password != '';

  //button
  @computed
  bool get invokeButton => emailValid && passwordValid && !loading;

  @observable
  bool loading = false;

  @action
  Future<ResponseActionButton> login() async {
    loading = true;

    if (!Validations.isEmailValid(email)) {
      loading = false;
      return ResponseActionButton(
          null,
          'Favor inserir um e-mail válido.',
          TypeToast.warning,
          const Icon(
            Icons.warning_amber_rounded,
          ));
    } else {
      final service = UserService();

      try {
        User? user = await service.login(email!, password!);
        loading = false;
        return ResponseActionButton(user, null, null, null);
      } on Exception catch (e) {
        loading = false;
        return ResponseActionButton(
            null,
            e.toString(),
            TypeToast.error,
            const Icon(
              Icons.info,
              color: Colors.white,
            ));
      }
    }
  }
}
