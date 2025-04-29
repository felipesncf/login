import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login/Store/login_store.dart';
import 'package:login/widgets/button.dart';
import 'package:login/widgets/flush_bar.dart';
import 'package:login/widgets/text_input.dart';

class Login extends StatelessWidget {
  Login({super.key});

  final LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      backgroundColor: primaryColor,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.2,
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Image.asset(
                    'lib/src/img.png',
                  ),
                ),
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                  child: Column(
                    children: [
                      Observer(
                        builder: (_) => TextInput(
                          'E-mail',
                          type: TextInputType.emailAddress,
                          onChanged: loginStore.setEmail,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 13),
                        child: Observer(
                          builder: (_) => TextInput(
                            'Senha',
                            isObscure: true,
                            onChanged: loginStore.setPassword,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Observer(
                          builder: (ctxt) => Button(
                            textButton: 'Entrar',
                            color: Colors.black,
                            width: double.infinity,
                            height: 50,
                            isLoading: loginStore.loading,
                            onPress: loginStore.invokeButton
                                ? () async => {
                                      loginStore.login().then((response) {
                                        if (response.messageError != null) {
                                          toast(
                                              ctxt,
                                              response.typeToast!,
                                              null,
                                              response.messageError,
                                              response.iconToast);
                                        } else {
                                          //logica aq
                                        }
                                      })
                                    }
                                : null,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Não possui uma conta?'),
                    TextButton(
                      child: Text(
                        'Cadastrar-se',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () => {},
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () => {},
                    child: const Text(
                      'Esqueceu sua senha?',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
