import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;

  const HomePage({
    super.key,
    required this.controller,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.colors.surface,
        surfaceTintColor: context.colors.surface,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
            SizedBox(height: 24),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
