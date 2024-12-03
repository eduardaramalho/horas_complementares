import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/custom_navigator.dart';
import '../../../../core/routes/routes.dart';
import '../controllers/splash_controller.dart';

class SplashPage extends StatefulWidget {
  final SplashController controller;

  const SplashPage({
    super.key,
    required this.controller,
  });

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    widget.controller.isAuthenticated().then((isAuthenticated) {
      if (isAuthenticated) {
        return CustomNavigator.of(context).go(Routes.home);
      }

      CustomNavigator.of(context).go(Routes.auth);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: const Center(),
    );
  }
}
