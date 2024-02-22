import '../../../core/file_util.dart';
import '../../../core/audio/audio_client.dart';

class HearUserInputController {

  static String? audioFilePath;
  static late AudioClient _audioClient;

  /// Actions
  static play(){
    _audioClient.play();
  }

  static stop(){
    _audioClient.stop();
  }


  /// Init
  // assign the path of audio file (don't forget)
  static initAudioFilePath() async {
    audioFilePath = await getAudioPath();

    _audioClient = AudioClient(filePath: audioFilePath!);
  }

  static Future<String> getAudioPath() async {
    String appPath = await FileUtil.getAppPath();
    String audioFilePath = '$appPath/audioFile.wav';

    return audioFilePath;
  }

}