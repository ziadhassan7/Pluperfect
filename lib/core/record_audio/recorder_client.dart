import 'package:pluperfect/core/file_util.dart';
import 'package:record/record.dart';
import '../custom_log.dart';

class RecorderClient {

  static final _record = AudioRecorder();


  static Future<bool> checkPermission() async {
    return await _record.hasPermission();
  }

  static start() async {

    String appPath = await FileUtil.getAppPath();
    String audioFilePath = '$appPath/audioFile.wav';

    if (await checkPermission()) {
      //remove old file
      await FileUtil.deleteFile(audioFilePath);
      // Start recording to file
      await _record.start(const RecordConfig( //configuration for Azure
        encoder: AudioEncoder.wav,
        numChannels: 1,  // Mono
        sampleRate: 16000,

      ), path: audioFilePath);

    } else {
      Log('Audio Recorder', "Request isn't granted");
    }
  }

  static Future<String?> stop() async {
    String? path = await _record.stop();
    print("recorder: $path");
    return path;
  }


  static disposeRecorder(){
    _record.dispose(); // As always, don't forget this one.
  }

}