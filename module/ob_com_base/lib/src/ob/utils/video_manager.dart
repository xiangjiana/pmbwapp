// import 'package:fijkplayer/fijkplayer.dart';
// import 'package:ob_com_login/src/utils/extension.dart';
//
// class VideoManager {
//   static late final FijkPlayer _fijkPlayer = FijkPlayer();
//
//   VideoManager._privateConstructor();
//
//   static final VideoManager _instance = VideoManager._privateConstructor();
//
//   static VideoManager get instance {
//     return _instance;
//   }
//
//   FijkPlayer get fijkPlayer => _fijkPlayer;
//
//   Future<void> setVideo() async {
//     await fijkPlayer.setDataSource(
//       'asset:///packages/ob_com_login/assets/video/login.mp4',
//       autoPlay: true,
//     );
//     await fijkPlayer.setLoop(0);
//   }
//
//   Future<void> safePause() async {
//     if (VideoManager.instance.fijkPlayer.isPlayable() &&
//         VideoManager.instance.fijkPlayer.state == FijkState.started) {
//       await fijkPlayer.safePause();
//     }
//   }
//
//   Future<void> safeStart() async {
//     if (fijkPlayer.isPlayable()) {
//       await fijkPlayer.safeStart();
//     }
//   }
// }
