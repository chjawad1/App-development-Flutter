import 'package:audioplayers/audioplayers.dart';

class SoundManager {
  final AudioPlayer _player = AudioPlayer();

  Future<void> playSoundFromPath(String filePath) async {
    await _player.play(DeviceFileSource(filePath));
  }
}
