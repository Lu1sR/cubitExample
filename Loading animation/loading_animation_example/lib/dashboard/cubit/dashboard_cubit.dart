import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit() : super(DashboardInitial());
  Future<void> getStates() async {
    emit(DashboardLoading());
    await Future.delayed(Duration(seconds: 5));
    emit(DashboardLanding());
    await Future.delayed(Duration(seconds: 5));
    emit(DashboardMain());
  }
}
