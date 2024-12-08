import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/mixins/validators/email_validator_mixin.dart';
import '../../../../core/mixins/validators/password_validator_mixin.dart';
import '../../../../core/routes/custom_navigator.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/auth_controller.dart';
import '../controllers/states/auth_state.dart';
import '../resources/auth_resources.dart';

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
    return Form(
      key: _formKey,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                CatolicaColors.white,
                CatolicaColors.primary700,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.5, 0.5],
            ),
          ),
          child: Center(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    AuthResources.welcomeStudent,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: CatolicaColors.primary700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Container(
                    width: 340,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 4,
                          blurRadius: 8,
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
                        const SizedBox(height: 16),
                        CatolicaTextFormField(
                          onChanged: widget.controller.setEmail,
                          label: AuthResources.email,
                          hint: AuthResources.typeEmail,
                          isRequired: true,
                          validator: isValidEmail,
                        ),
                        const SizedBox(height: 16),
                        CatolicaTextFormField(
                          onChanged: widget.controller.setPassword,
                          label: AuthResources.password,
                          hint: AuthResources.typePassword,
                          isRequired: true,
                          validator: isValidPassword,
                        ),
                        const SizedBox(height: 16),
                        CatolicaPrimaryButton(
                          label: AuthResources.enter,
                          onPressed: () async {
                            if (!_formKey.currentState!.validate()) return;

                            await widget.controller.login();
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
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
