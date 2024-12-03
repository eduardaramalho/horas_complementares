import 'package:flutter/material.dart';

import '../../../../core/mixins/validators/email_validator_mixin.dart';
import '../../../../core/mixins/validators/password_validator_mixin.dart';
import '../../../../core/routes/custom_navigator.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/auth_controller.dart';
import '../controllers/states/auth_state.dart';

class AuthPage extends StatefulWidget {
  final AuthController controller;

  const AuthPage({
    super.key,
    required this.controller,
  });

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with EmailValidatorMixin, PasswordValidatorMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_listenerState);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_listenerState);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.controller.isLogin,
      builder: (context, isLogin, child) {
        return Form(
          key: _formKey,
          child: Scaffold(
            backgroundColor: const Color(0xFF9B1536),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Color(0xFF9B1536),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.5, 0.5],
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Bem-vindo aluno!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF9B1536),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: 340,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/imgs/logo-catolica.png',
                            height: 60,
                          ),
                          const SizedBox(height: 20),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('E-mail:'),
                          ),
                          TextField(
                            decoration: InputDecoration(
                              hintText: 'seuemail@provedor.com.br',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                          const SizedBox(height: 15),
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Senha:'),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'Digite sua senha',
                              filled: true,
                              fillColor: Colors.grey[200],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide.none,
                              ),
                              suffixIcon: const Icon(Icons.visibility_off),
                            ),
                          ),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Align(
                                alignment: Alignment.centerRight,
                                child: TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Esqueci a senha',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 150,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF9B1536),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(vertical: 15),
                                  ),
                                  child: const Text(
                                    'Entrar',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  void _listenerState() {
    final state = widget.controller.state;

    if (state is ErrorAuthState) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(state.message),
          backgroundColor: Colors.red,
        ),
      );
    }

    if (state is SuccessAuthState) {
      CustomNavigator.of(context).push(Routes.home);
    }
  }
}
