abstract class PlaylistRepository {
  Future<List<Map<String, String>>> fetchInitialPlaylist(
      List<String> lstPlaylist);
  Future<Map<String, String>> fetchAnotherSong(String s);
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

  Map<String, String> _nextSong(String fileName) {
    print("fileName:$fileName");
    _songIndex = (_songIndex % _maxSongNumber) + 1;
    return {
      'id': _songIndex.toString().padLeft(3, '0'),
      'title': 'Song $_songIndex',
      'album': 'SoundHelix',
      'url': 'asset:$fileName'
      // 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-$_songIndex.mp3',
    };
  }
}
