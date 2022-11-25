import 'package:firebase_storage/firebase_storage.dart';
import 'package:hishig_erdem/common_frame_practice/listening/test/model/listening_test.dart';
import 'package:hishig_erdem/n5/test/pages/listening/listening_test_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final listeningPageProvider =
    StateNotifierProvider<ListeningPageController, ListeningTestState>((ref) {
  return ListeningPageController(widgetRef: ref);
});

class ListeningPageController extends StateNotifier<ListeningTestState> {
  ListeningPageController({required this.widgetRef})
      : super(const ListeningTestState());

  final StateNotifierProviderRef widgetRef;
  List lstAudioUrl = [];
  List lstImageUrl = [];
  @override
  ListeningTestState get state;
  void setModelListenable(WidgetRef ref) {
    ref.watch(listeningPageProvider);
  }

  getUrlData(ListeningTest? testItem) async {
    if (testItem == null) return;
    final storageRef = FirebaseStorage.instance.ref();

    for (var test in testItem.exercises) {
      var audioUrl = await storageRef.child(test.audioUrl).getDownloadURL();
      lstAudioUrl.add(audioUrl);
      var imageUrl = await storageRef.child(test.imageUrl).getDownloadURL();
      lstImageUrl.add(imageUrl);
    }
    state = state.copyWith(audioSource: lstAudioUrl, imageSource: lstImageUrl);
    // var preferences = widgetRef.read(sharedPreferencesProvider);
    // await preferences.setInt("tableServingLocation", selectedPlaceId);
  }

  // setSelectedIndex(int index) async {
  //   state = state.copyWith(selectedIndex: index);
  // }

  // setGameMode(bool isGameMode) async {
  //   state = state.copyWith(isGameMode: isGameMode);
  // }
}
