// import 'dart:async';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AudioPlayers extends StatefulWidget {
//   const AudioPlayers({Key? key}) : super(key: key);

//   @override
//   State<AudioPlayers> createState() => _AudioPlayersState();
// }

// class _AudioPlayersState extends State<AudioPlayers> {
//   Timer? timer2;
//   Duration _position = Duration(seconds: 0);
//   AudioPlayer? player;
//   var _progress = 0.0;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           LinearProgressIndicator(
//             value: _progress,
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     player!.setAsset('assets/mb3.mp3').then((value) {
//                       return {
//                         _position = value!,
//                         player!.playerStateStream.listen((state) {
//                           if (state.playing) {
//                             setState(() {
//                               _progress = .1;
//                             });
//                           } else
//                             switch (state.processingState) {
//                               case ProcessingState.idle:
//                                 break;
//                               case ProcessingState.loading:
//                                 break;
//                               case ProcessingState.buffering:
//                                 break;
//                               case ProcessingState.ready:
//                                 setState(() {
//                                   _progress = 0;
//                                   timer2!.cancel();
//                                 });
//                                 break;
//                               case ProcessingState.completed:
//                                 setState(() {
//                                   _progress = 1;
//                                 });
//                                 break;
//                             }
//                         }),
//                         player!.play(),
//                         timer2 =
//                             Timer.periodic(new Duration(seconds: 1), (timer) {
//                           setState(() {
//                             _progress += .05;
//                           });
//                         })
//                       };
//                     });
//                   },
//                   icon: Icon(
//                     _progress > 0 ? Icons.pause : Icons.play_circle_fill,
//                     size: 45,
//                   )),
//               SizedBox(
//                 width: 45,
//               ),
//               IconButton(
//                   onPressed: () {
//                     player!.stop();
//                     timer2!.cancel();
//                   },
//                   icon: Icon(
//                     Icons.stop,
//                     size: 45,
//                   )),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
