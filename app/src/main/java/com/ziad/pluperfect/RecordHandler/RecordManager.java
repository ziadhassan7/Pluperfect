package com.ziad.pluperfect.RecordHandler;

import java.io.IOException;

import android.media.MediaPlayer;
import android.media.MediaRecorder;
import android.util.Log;


public class RecordManager {

    private MediaRecorder mRecorder = null;
    private MediaPlayer mPlayer = null;

    private String mFileName;

    public RecordManager(String fileName){
        mFileName = fileName;
    }

    public void startRecording() {
        mRecorder = new MediaRecorder();
        mRecorder.setAudioSource(MediaRecorder.AudioSource.MIC);
        mRecorder.setOutputFormat(MediaRecorder.OutputFormat.THREE_GPP);
        mRecorder.setOutputFile(mFileName);
        mRecorder.setAudioEncoder(MediaRecorder.AudioEncoder.AMR_NB);

        try {
            mRecorder.prepare();
        } catch (IOException e) {
            Log.e("RecordManager", "prepare() failed");
        }

        mRecorder.start();
    }

    public void stopRecording(){
        mRecorder.stop();
        mRecorder.release();
        mRecorder = null;
    }


    public void onPlay(){
        if(mPlayer != null && mPlayer.isPlaying()){ //todo check only if it isn't null
            stopPlaying();
        } else {
            startPlaying();
        }
    }

    public void startPlaying() {
        mPlayer = new MediaPlayer();
        try {
            mPlayer.setDataSource(mFileName);
            mPlayer.prepare();
            mPlayer.start();
        } catch (IOException e) {
            Log.e("RecordManager", "prepare() failed");
        }
    }

    public void stopPlaying() {
        mPlayer.reset();
        mPlayer = null;
    }
}
