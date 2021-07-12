import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_example/dashboard/cubit/dashboard_cubit.dart';
import 'package:loading_animation_example/dashboard/pages/color_loader_1.dart';
import 'package:loading_animation_example/dashboard/pages/main_splash_screen.dart';
import 'package:loading_animation_example/side_menu/mude_dashboard_layout/menu_dashboard_layout.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  @override
  void initState() {
    super.initState();
    configureMessaging();
  }

  Future<void> configureMessaging() async {
    String token = await _firebaseMessaging.getToken();

    // Save the initial token to the database
    await saveTokenToDatabase(token);

    // Any time the token refreshes, store this in the database too.
    _firebaseMessaging.onTokenRefresh.listen(saveTokenToDatabase);
  }

  Future<void> saveTokenToDatabase(String token) async {
    print(token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          if (state is DashboardLoading) {
            return Center(child: ColorLoader3());
          } else if (state is DashboardLanding) {
            return Container(
              child: SignUpWidget(),
            );
          } else if (state is DashboardMain) {
            return MenuDashboardLayout();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
