
import 'package:yogaapp/network/service/home/home_service.dart';

import '../../service/home/model/home_card_model.dart';

class HomeRepository {
  HomeRepository({required this.service});
  final HomeService service;

  Future<HomeCardModel?> getHomeCard() async {
    return service.getHomeCard();
  }
}
