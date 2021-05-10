import 'package:get_it/get_it.dart';
import 'package:music_app/service/mini_player.dart';

GetIt locator = new GetIt.asNewInstance();

void setupLocator() {
  locator.registerSingleton(MiniPlayerService());
}