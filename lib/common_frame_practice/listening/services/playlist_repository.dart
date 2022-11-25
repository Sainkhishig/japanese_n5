import 'package:hishig_erdem/common_frame_practice/listening/test/model/listening_test.dart';

abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist(
      List<ListeningQuestion> lstPlaylist);
  Future<Map<String, String>> fetchAnotherSong(ListeningQuestion s);
}

class DemoPlaylist extends PlaylistRepository {
  @override
  Future<List<Map<String, String>>> fetchInitialPlaylist(List lst,
      {int length = 3}) async {
    return List.generate(lst.length, (index) => _nextSong(lst[index]));
  }

  @override
  Future<Map<String, String>> fetchAnotherSong(songPath) async {
    return _nextSong(songPath);
  }

  var _songIndex = 0;
  static const _maxSongNumber = 16;

  Map<String, String> _nextSong(ListeningQuestion fileName) {
    print("fileName:$fileName");
    _songIndex = (_songIndex % _maxSongNumber) + 1;
    return {
      'id': _songIndex.toString().padLeft(3, '0'),
      'title': _songIndex.toString(),
      'album': 'SoundHelix',
      'url': fileName.audioUrl //'asset:$fileName'
      // 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-$_songIndex.mp3',
    };
  }
}
