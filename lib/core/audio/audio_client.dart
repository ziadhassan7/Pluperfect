import 'package:just_audio/just_audio.dart';


class AudioClient {
  AudioClient({required String filePath}) : _filePath = filePath;

  final _player = AudioPlayer();
  final String _filePath;


  play() async {

    await _player.setFilePath(_filePath);

    // Play while waiting for completion
    await _player.play();
  }

  stop() async {
    await _player.stop();
  }
}