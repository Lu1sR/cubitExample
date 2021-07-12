part of 'dashboard_cubit.dart';

@immutable
abstract class DashboardState {
  const DashboardState();
}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {
  const DashboardLoading();
}

class DashboardLanding extends DashboardState {
  const DashboardLanding();
}

class DashboardMain extends DashboardState implements Equatable {
  const DashboardMain();

  @override
  // TODO: implement props
  List<Object> get props => [];

  @override
  // TODO: implement stringify
  bool get stringify => false;
}
