import 'package:equatable/equatable.dart';
import 'package:yogaapp/blocs/bloc_status.dart';
import 'package:yogaapp/network/service/home/model/home_card_model.dart';

class HomeState extends Equatable {
  const HomeState({this.homeCardModel, this.appStatus = const InitialStatus()});

  final HomeCardModel? homeCardModel;
  final AppSubmissionStatus appStatus;

  HomeState copyWith(
      {HomeCardModel? homeCardModel, AppSubmissionStatus? appStatus}) {
    return HomeState(
      homeCardModel: homeCardModel ?? this.homeCardModel,
      appStatus: appStatus ?? this.appStatus,
    );
  }

  @override
  List<Object?> get props => [homeCardModel, appStatus];
}
