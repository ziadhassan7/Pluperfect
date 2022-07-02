package com.ziad.pluperfect;

import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.media.AudioManager;
import android.net.Uri;
import android.os.Bundle;
import android.speech.tts.TextToSpeech;
import android.speech.tts.UtteranceProgressListener;
import android.util.Log;
import android.view.MotionEvent;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.TextView;
import android.widget.Toast;

import com.google.android.material.dialog.MaterialAlertDialogBuilder;
import com.ziad.pluperfect.NetworkHandlers.NetworkManager;
import com.ziad.pluperfect.QuoteHandlers.QuoteManager;
import com.ziad.pluperfect.RecordHandler.RecordManager;
import com.ziad.pluperfect.SpeechRecognitionHandlers.AzureSpeechRecognition;
import com.ziad.pluperfect.SpeechRecognitionHandlers.AzureSpeechRecognitionForPronunciation;

import java.util.Locale;

public class QuotesActivity extends AppCompatActivity implements TextToSpeech.OnInitListener {

    QuoteManager mQuoteManager;

    TextToSpeech textToSpeech;

    Button mHearBtn, mNextBtn;

    boolean isVoicePlaying = false;
    boolean mIsTTSInstalled;


    // Quiz Progress Variables
    UiManager uiManager;

    Helper mHelper;

    AlertDialog installTTSDialog;

    int mQuizCounter = 0;

    final static int COLOR_ORANGE = Color.rgb(253, 100, 34);


    //onSavedInstanceState
    @Override
    protected void onSaveInstanceState(Bundle outState) {
        super.onSaveInstanceState(outState);
        outState.putInt("quizCounter", mQuizCounter);
    }


    //onCreate
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quotes);
        setVolumeControlStream(AudioManager.STREAM_MUSIC);


        //Initializing TextViews
        TextView mTestText = findViewById(R.id.testText);

        //Initialize QuoteHandler class
        mQuoteManager = new QuoteManager(this); //todo progressBar, mQuoteBodyTextView

        //Initialize UiManger
        uiManager = new UiManager(this);

        requestAndSetQuote(); //Request and set the new quote

        //If there is a saved instance
        if (savedInstanceState != null) {
            mQuizCounter = savedInstanceState.getInt("quizCounter");
            uiManager.colorCorrespondingView(mQuizCounter);
        }

        //Initialize Helper class
        mHelper = new Helper(this);


        //Initializing Buttons
        mHearBtn = findViewById(R.id.hearBtn);
        mNextBtn = findViewById(R.id.nextBtn);
        ImageButton closeBtn = findViewById(R.id.closeBtn);
        ImageButton speakBtn = findViewById(R.id.speakBtn);
        ImageButton sayItBtn = findViewById(R.id.sayItBtn);
        ImageButton translateBtn = findViewById(R.id.translateBtn);

        // create external cache directory for records
        String fileName = getExternalCacheDir().getAbsolutePath();
        fileName += "/audiorecordtest.3gp";

        //Initialize Record Manager and Azure recognition
        final RecordManager recordManager = new RecordManager(fileName);
        final AzureSpeechRecognition azureSpeechRecognition = new AzureSpeechRecognition();
        final AzureSpeechRecognitionForPronunciation azureSpeechRecognitionPron = new AzureSpeechRecognitionForPronunciation();

        //button click listeners
        closeBtn.setOnClickListener(view -> finish());
        speakBtn.setOnTouchListener((v, event) -> {
            switch(event.getAction()) {
                case MotionEvent.ACTION_DOWN:
                    // PRESSED
                    recordManager.startRecording();
                    azureSpeechRecognition.onSpeechButtonClicked(this);

                    return true; // if you want to handle the touch event
                case MotionEvent.ACTION_UP:
                    // RELEASED
                    speakBtn.setImageResource(R.drawable.ic_mic);

                    try { //todo is this right?
                        recordManager.stopRecording();
                        azureSpeechRecognition.onSpeechButtonReleased();

                    } catch (Exception e) {
                        Log.e("RecordManager", "prepare() failed");
                    }

                    return true; // if you want to handle the touch event
            }
            return false;
        });

        mNextBtn.setOnClickListener(view -> {

            if (mQuizCounter == 7) {
                finish();

            } else { //wrapped in else statement to not run any unnecessary code

                if(NetworkManager.isNetworkAvailable(this)){
                    requestAndSetQuote();
                    mTestText.setText(null);
                }else{
                    Intent intent = new Intent(this, NoInternetActivity.class);
                    startActivity(intent);
                }
            }
        });

        /*mHearBtn.setOnClickListener(view -> {
            if(!isPlaying){
                recordManager.startPlaying();
                isPlaying = true;
            } else {
                recordManager.stopPlaying();
                isPlaying = false;
            }

        });*/
        mHearBtn.setOnClickListener(view -> recordManager.onPlay()); //todo

        sayItBtn.setOnClickListener(view -> sayIt());

        translateBtn.setOnClickListener(view -> {

            if(isGoogleTranslateInstalled()){
                mHelper.translateIntent(QuoteManager.mQuoteBodyString);
            } else {
                openTranslateInstallDialog();
            }

        });
    }

    //                                      ________<<onStart()>>________
    @Override
    protected void onStart() {
        super.onStart();

        //Initializing TTS
        textToSpeech = new TextToSpeech(this, this); setupUtteranceProgressListener();
    }

    //                                      ________<<onPause()>>________
    @Override
    public void onPause(){
        if(textToSpeech !=null){
            textToSpeech.stop();
            isVoicePlaying = false;
        }

        super.onPause();
    }

    //                                      ________<<onDestroy()>>________
    @Override
    public void onDestroy(){
        if(textToSpeech !=null){
            textToSpeech.stop();
            textToSpeech.shutdown();
            isVoicePlaying = false;
        }

        super.onDestroy();
    }

    //-------------------------------------------------

    void requestAndSetQuote(){ //todo: null exception
        mQuoteManager.requestQuote();

        mQuizCounter++;
        uiManager.colorCorrespondingView(mQuizCounter);
    }

    //-------------------------------------------------


    //-------------------------------------------------
    @Override
    public void onInit(int status) {
        //todo
        if (status == TextToSpeech.SUCCESS) {
            textToSpeech.setLanguage(Locale.ENGLISH);

        } else {
            Toast.makeText(this, "TTS Initialization failed", Toast.LENGTH_LONG);
        }
    }

    void setupUtteranceProgressListener(){
        textToSpeech.setOnUtteranceProgressListener(new UtteranceProgressListener() {
            @Override
            public void onStart(String utteranceId) {
                // Speaking started.
                isVoicePlaying = true;
            }

            @Override
            public void onDone(String utteranceId) {
                // Speaking stopped.
                isVoicePlaying = false;
            }

            @Override
            public void onError(String utteranceId) {
            isVoicePlaying = false;
            }
        });
    }

    private void sayIt(){

        //Check if Google tts is installed
        checkIfGoogleTTSIsInstalled(); //Check if Google tts is installed
        //-


        if(textToSpeech != null && mIsTTSInstalled) {

            if(isVoicePlaying){
                textToSpeech.stop(); //stop current sound
                isVoicePlaying = false;
            } else {
                //textToSpeech.stop(); //stop current sound
                if (mHelper.isVoiceAudible()) {
                    textToSpeech.speak(QuoteManager.mQuoteBodyString, TextToSpeech.QUEUE_FLUSH, null, "SAYIT_UtteranceID");

                    if (Helper.firstOpen) {
                        this.runOnUiThread(() -> {
                            Toast.makeText(this, "Pronouncing...", Toast.LENGTH_LONG).show();
                        });

                        Helper.firstOpen = false;
                    }

                } else {
                    Toast.makeText(this, "Volume is muted", Toast.LENGTH_SHORT).show();
                }
            }

        }
    }

    //--------------------------------------------

    //--------------------------------------------

    boolean isGoogleTranslateInstalled(){
        try {
            ApplicationInfo ai = this.getPackageManager().getApplicationInfo("com.google.android.apps.translate",0);

            boolean isEnabled = ai.enabled;

            if(!isEnabled){  // Not Enabled
                return false;
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();

            boolean isInstalled = Helper.isPackageInstalled("com.google.android.apps.translate", this.getPackageManager());
            if(!isInstalled){  // Not Installed
                return false;
            }
        }

        return true;
    }

    void openTranslateInstallDialog(){
        installTTSDialog = new MaterialAlertDialogBuilder(this)
                .setTitle("Install Google Translate")
                .setMessage("You need to install Google Translate to use this feature.")
                .setPositiveButton("Install", (dialog, which) -> {
                    try {
                        startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + "com.google.android.apps.translate")));
                    } catch (ActivityNotFoundException anfe) {
                        startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=" + "com.google.android.apps.translate")));
                    }
                })
                .show();
    }

    //---------------------------------------


    //                                ----------Check For Google TTS----------
    void checkIfGoogleTTSIsInstalled(){
        try {
            ApplicationInfo ai = this.getPackageManager().getApplicationInfo("com.google.android.tts",0);

            mIsTTSInstalled = ai.enabled;

            if(!mIsTTSInstalled){  // Not Installed
                openTTSInstallDialog();
                Helper.firstOpen = true; //make it as first open again

            } else if (installTTSDialog != null){
                installTTSDialog.dismiss();
            }
        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();

            mIsTTSInstalled = Helper.isPackageInstalled("com.google.android.tts", this.getPackageManager());
            if(!mIsTTSInstalled){  // Not Installed
                openTTSInstallDialog();
            } else if (installTTSDialog != null){
                installTTSDialog.dismiss();
            }
        }
    }

    void openTTSInstallDialog(){
        installTTSDialog = new MaterialAlertDialogBuilder(this)
                .setTitle("Install Google Text-To-Speech")
                .setMessage("You need Google Text-To-Speech installed to use this feature.")
                .setPositiveButton("Dismiss", (dialog, which) -> {
                    dialog.dismiss();
                })
                .setNegativeButton("Install", (dialog, which) -> {
                    try {
                        startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=" + "com.google.android.tts")));
                    } catch (ActivityNotFoundException anfe) {
                        startActivity(new Intent(Intent.ACTION_VIEW, Uri.parse("https://play.google.com/store/apps/details?id=" + "com.google.android.tts")));
                    }
                })
                .setCancelable(false)
                .show();
    }
    //----------------------------------------------------------------------------------------------

}