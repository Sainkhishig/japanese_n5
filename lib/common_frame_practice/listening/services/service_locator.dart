import 'package:hishig_erdem/common_frame_practice/listening/player/page_manager.dart';
import 'package:audio_service/audio_service.dart';
import 'package:hishig_erdem/common_frame_practice/listening/test/listening_manager.dart';

import 'audio_handler.dart';
import 'playlist_repository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // services
  getIt.registerSingleton<AudioHandler>(await initAudioService());
  getIt.registerLazySingleton<PlaylistRepository>(() => DemoPlaylist());
  // page state
  getIt.registerLazySingleton<PageManager>(() => PageManager());
  getIt.registerLazySingleton<ListeningPageManager>(
      () => ListeningPageManager());
}
