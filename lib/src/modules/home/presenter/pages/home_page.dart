import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

import '../../../../core/routes/custom_navigator.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/states/current_user_state.dart';
import '../controllers/home_controller.dart';
import '../controllers/states/home_content_state.dart';
import '../resources/home_resources.dart';
import '../widgets/activitie_card_widget.dart';

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

    widget.controller.getAllActivities();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.colors.surface,
        title: Image.asset(
          'assets/imgs/logo-catolica.png',
          height: 48,
        ),
        actions: [
          IconButton(
            onPressed: () {
              widget.controller.signOut();
              CustomNavigator.of(context).push(Routes.auth);
            },
            icon: const Icon(
              Icons.logout,
              color: CatolicaColors.primary700,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6AC973),
        onPressed: () => CustomNavigator.of(context).push(Routes.activitiesForm).then((value) {
          if (value != null) widget.controller.getAllActivities();
        }),
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              Text(
                HomeResources.welcomeStudent(CurrentUserState.userName),
                style: context.texts.headingH6.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                HomeResources.activitiesComplementary,
                style: context.texts.paragraphMedium,
              ),
              SizedBox(height: 24),
              ValueListenableBuilder(
                valueListenable: HomeContentState.activities,
                builder: (context, activities, child) {
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: activities.length,
                    itemBuilder: (context, index) {
                      final activity = activities[index];

                      return ActivitieCardWidget(
                        activity: activity,
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
