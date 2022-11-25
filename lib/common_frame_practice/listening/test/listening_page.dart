import 'package:hishig_erdem/common_frame_practice/listening/notifiers/play_button_notifier.dart';
import 'package:hishig_erdem/common_frame_practice/listening/notifiers/progress_notifier.dart';
import 'package:hishig_erdem/common_frame_practice/listening/notifiers/repeat_button_notifier.dart';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:hishig_erdem/common_frame_practice/listening/services/service_locator.dart';

import 'package:hishig_erdem/common_frame_practice/listening/test/model/listening_test.dart';

import 'listening_manager.dart';

class ListeningPage extends StatefulWidget {
  const ListeningPage({required this.testItem});
  final ListeningTest testItem;
  @override
  _ListeningPage createState() => _ListeningPage();
}

class _ListeningPage extends State<ListeningPage> {
  _ListeningPage();
  // ListeningTest? testItem;
  @override
  void initState() {
    super.initState();
    // _initImages();
    getIt<ListeningPageManager>().init(widget.testItem.exercises);
  }

  @override
  void dispose() {
    getIt<ListeningPageManager>().dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // CurrentSongTitle(),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child:
                    Text(widget.testItem.name, style: TextStyle(fontSize: 40)),
              ),
              CurrentQuestion(questions: widget.testItem.exercises),
              // Playlist(),

              // AddRemoveSongButtons(),
              AudioProgressBar(),
              AudioControlButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

class CurrentQuestion extends StatelessWidget {
  CurrentQuestion({Key? key, required this.questions}) : super(key: key);
  List<ListeningQuestion> questions;
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return ValueListenableBuilder<String>(
      valueListenable: pageManager.currentSongTitleNotifier,
      builder: (_, titleIndex, __) {
        return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: StatefulBuilder(builder: (context, setState) {
              print("titleIndex::" + titleIndex);
              var questionIndex = titleIndex.isEmpty
                  ? 0
                  : int.parse(titleIndex.replaceAll("0", "")) - 1;
              var test = questions[questionIndex];
              print("imageUrl:" + test.imageUrl);
              return ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${questionIndex + 1}. ${test.question}"),
                    Image.network(
                      test.imageUrl,
                      height: MediaQuery.of(context).size.height / 2.5,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ],
                ),
                subtitle: ListView.builder(
                    itemCount: test.answers.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      var answerItem = test.answers[index];
                      return RadioListTile(
                        title: Text(answerItem.answer),
                        value: answerItem.answer,
                        groupValue: test.selectedAnswer,
                        onChanged: (value) {
                          setState(() {
                            test.selectedAnswer = value.toString();
                            print("radioSelection$value");
                          });
                        },
                      );
                    }),
              );
            }));
      },
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return Expanded(
      child: ValueListenableBuilder<List<String>>(
        valueListenable: pageManager.playlistNotifier,
        builder: (context, playlistTitles, _) {
          return ListView.builder(
            itemCount: playlistTitles.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('${playlistTitles[index]}'),
              );
            },
          );
        },
      ),
    );
  }
}

class AddRemoveSongButtons extends StatelessWidget {
  const AddRemoveSongButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: pageManager.add,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: pageManager.remove,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: pageManager.seek,
        );
      },
    );
  }
}

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          RepeatButton(),
          PreviousSongButton(),
          PlayButton(),
          NextSongButton(),
          ShuffleButton(),
        ],
      ),
    );
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return ValueListenableBuilder<RepeatState>(
      valueListenable: pageManager.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.off:
            icon = Icon(Icons.repeat, color: Colors.grey);
            break;
          case RepeatState.repeatSong:
            icon = Icon(Icons.repeat_one);
            break;
          case RepeatState.repeatPlaylist:
            icon = Icon(Icons.repeat);
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: pageManager.repeat,
        );
      },
    );
  }
}

class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: Icon(Icons.skip_previous),
          onPressed: (isFirst) ? null : pageManager.previous,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return ValueListenableBuilder<ButtonState>(
      valueListenable: pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 32.0,
              height: 32.0,
              child: CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 32.0,
              onPressed: pageManager.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: Icon(Icons.pause),
              iconSize: 32.0,
              onPressed: pageManager.pause,
            );
        }
      },
    );
  }
}

class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: Icon(Icons.skip_next),
          onPressed: (isLast) ? null : pageManager.next,
        );
      },
    );
  }
}

class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageManager = getIt<ListeningPageManager>();
    return ValueListenableBuilder<bool>(
      valueListenable: pageManager.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return IconButton(
          icon: (isEnabled)
              ? const Icon(Icons.shuffle)
              : const Icon(Icons.shuffle, color: Colors.grey),
          onPressed: pageManager.shuffle,
        );
      },
    );
  }
}
