import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:loading_animation_example/dashboard/pages/dashboard_main.dart';
import 'package:loading_animation_example/side_menu/pages/messages_page.dart';
import 'package:loading_animation_example/side_menu/pages/utility_bills_page.dart';

enum NavigationEvents {
  DashboardClickedEvent,
  MessagesClickedEvent,
  UtilityClickedEvent
}

abstract class SidemenuState {}

class StateA extends SidemenuState {}

class SidemenuBloc extends Bloc<NavigationEvents, SidemenuState> {
  final Function onMenuTap;

  SidemenuBloc({this.onMenuTap})
      : super(MainDashboard(
          onMenuTap: onMenuTap,
        ));

  @override
  Stream<SidemenuState> mapEventToState(
    NavigationEvents event,
  ) async* {
    switch (event) {
      case NavigationEvents.DashboardClickedEvent:
        yield MainDashboard(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.MessagesClickedEvent:
        yield MessagesPage(
          onMenuTap: onMenuTap,
        );
        break;
      case NavigationEvents.UtilityClickedEvent:
        yield UtilityBillsPage(
          onMenuTap: onMenuTap,
        );
        break;
    }
  }
}
