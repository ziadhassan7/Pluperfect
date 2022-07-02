package com.ziad.pluperfect.SpeechRecognitionHandlers;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.text.SpannableString;
import android.text.TextUtils;
import android.text.style.ForegroundColorSpan;
import android.util.Log;
import android.widget.ImageButton;
import android.widget.TextView;

import com.microsoft.cognitiveservices.speech.ResultReason;
import com.microsoft.cognitiveservices.speech.ServicePropertyChannel;
import com.microsoft.cognitiveservices.speech.SpeechConfig;
import com.microsoft.cognitiveservices.speech.SpeechRecognizer;
import com.microsoft.cognitiveservices.speech.audio.AudioConfig;
import com.ziad.pluperfect.QuoteHandlers.QuoteManager;
import com.ziad.pluperfect.R;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;

public class AzureSpeechRecognition {

    Context mContext; //todo where is mRecognizer.close

    // Replace below with your own subscription key
    private static String speechSubscriptionKey = "your-key";
    // Replace below with your own service region (e.g., "westus").
    private static String serviceRegion = "francecentral";
    com.microsoft.cognitiveservices.speech.SpeechRecognizer mRecognizer;


    private final ArrayList<String> textResultContent = new ArrayList<>();

    SpannableString mFullStyledSentence;
    String mResultSentenceWithNoPunct;

    double mSentenceConfidence;

    private TextView mQuoteBodyTextView, mNotifyUserTextView, mTestText, mSentenceConfidenceTextView;
    ImageButton mSpeakBtn;
    Boolean mWordIsEqual;

    boolean isButtonReleased = false;


    //Mic Button Click Listener
    public void onSpeechButtonClicked(Context context) { //todo do less on click
        mContext = context;

        mSpeakBtn = ((Activity) context).findViewById(R.id.speakBtn);

        mQuoteBodyTextView = ((Activity) context).findViewById(R.id.quoteBodyTextView);
        mTestText = ((Activity) context).findViewById(R.id.testText);

        mSentenceConfidenceTextView = ((Activity) context).findViewById(R.id.sentenceConfidenceTextView);
        //mNotifyUserTextView = notifyUserTextView; //todo
        //mNotifyUserTextView.setText("");

        try {
            SpeechConfig config = SpeechConfig.fromSubscription(speechSubscriptionKey, serviceRegion);

            config.setServiceProperty("wordLevelConfidence","true", ServicePropertyChannel.UriQueryParameter);
            config.setServiceProperty("format", "detailed", ServicePropertyChannel.UriQueryParameter);


            AudioConfig audioInput = AudioConfig.fromDefaultMicrophoneInput();
            mRecognizer = new SpeechRecognizer(config, audioInput);

            //Start Continuous Recognition
            final Future<Void> task = mRecognizer.startContinuousRecognitionAsync();
            setOnTaskCompletedListener(task, result -> {

                Log.i("Tiz", "start recognizing. (1)");

                ((Activity) mContext).runOnUiThread(() -> {
                    // PRESSED - Start animation
                    mSpeakBtn.setImageResource(R.drawable.ic_mic_recording);
                });
            });
            textResultContent.clear();
            mTestText.setText(null);

            //Callback to when the recognizing is finished
            mRecognizer.recognized.addEventListener((o, speechRecognitionResultEventArgs) -> {
                String text = speechRecognitionResultEventArgs.getResult().getText();

                textResultContent.add(text); //todo

                String textResult = TextUtils.join(" ", textResultContent);

                setTextResultContent(textResult);


            });

            //todo
            /*//inside setOnTaskCompletedListener. In open or close speech?
            if (result.getReason() != ResultReason.RecognizedSpeech) {
                String errorDetails = (result.getReason() == ResultReason.Canceled) ? CancellationDetails.fromResult(result).getErrorDetails() : "";
                s = "Recognition failed with " + result.getReason() + ". Did you enter your subscription?" + System.lineSeparator() + errorDetails;
            }

            //or
            if (result.getReason() == ResultReason.RecognizedSpeech) {
                txt.setText(result.toString());
            }
            else {
                txt.setText("Error recognizing. Did you update the subscription info?" + System.lineSeparator() + result.toString());
            }

            //or
            if(result != null){
                if (result.getReason() == ResultReason.RecognizedSpeech) {
                    Log.i("SpeechRecognition", result.toString());
                    return result;
                }
                else {
                    Log.e("SpeechRecognition", "Error recognizing. Did you update the subscription info?");
                }
            }*/

        } catch (Exception ex) {
            System.out.println(ex.getMessage());
            Log.i("Tiz", "Catch error");
            //todo catch errors for user
        }
    }


    public void onSpeechButtonReleased(){

        if (mRecognizer != null) {
            Log.i("Tiz", "button released (3)");

            mRecognizer.stopContinuousRecognitionAsync();

            isButtonReleased = true; //notify that the button is released
        }

    }




    private void setTextResultContent(String textResult){
        //check if user finished talking
        if (isButtonReleased){

            String quote = QuoteManager.mQuoteBodyString; //todo
            String quoteWithNoPunct = quote.replaceAll("\\p{Punct}", ""); // remove punctuation
            String resultSentenceWithNoPunct = textResult.replaceAll("\\p{Punct}", ""); // remove punctuation

            Log.i("AzureSpeechRecognition", resultSentenceWithNoPunct);

            String[] quoteWords = quote.split("\\s+"); // splits by whitespace
            String[] quoteWordsWithNoPunct = quoteWithNoPunct.split("\\s+"); // splits by whitespace, with no punctuation
            String[] resultWordsWithNoPunct = resultSentenceWithNoPunct.split("\\s+"); // splits by whitespace, with no punctuation
            List<String> resultWordsWithNoPunctMutableList = new ArrayList<>(Arrays.asList(resultWordsWithNoPunct));


            SpannableString fullStyledSentence = new SpannableString(quote);
            int start = 0;
            int wordCounter = 0;

            for (int i = 0; i < quoteWords.length; i++) {
                for (int x = i - 1; x <= i + 1; x++) {
                    wordCounter++;

                    try {
                        mWordIsEqual = quoteWordsWithNoPunct[i].equalsIgnoreCase(resultWordsWithNoPunctMutableList.get(x));
                    } catch (Exception e) {
                        continue; //go to next iteration
                    }

                    Log.i("AzureSpeechRecognition", "word is " + quoteWordsWithNoPunct[i]);
                    Log.i("AzureSpeechRecognition", "word is " + resultWordsWithNoPunctMutableList.get(x));
                    Log.i("AzureSpeechRecognition", "mWordIsEqual is " + mWordIsEqual);
                    if (mWordIsEqual) {
                        break;
                    } //exit loop
                }

                Log.i("AzureSpeechRecognition", "wordCounter is " + wordCounter);


                if (wordCounter == 1 && mWordIsEqual) {
                    //move array forward
                    resultWordsWithNoPunctMutableList.add(0, "");
                    Log.i("AzureSpeechRecognition", "move array forward");
                }
                if (wordCounter == 3 && mWordIsEqual) {
                    //move array backward
                    resultWordsWithNoPunctMutableList.remove(0);
                    Log.i("AzureSpeechRecognition", "move array backward");
                }

                fullStyledSentence.setSpan(
                        new ForegroundColorSpan(mWordIsEqual ? Color.GREEN : Color.RED),
                        start,
                        start + quoteWords[i].length(),
                        SpannableString.SPAN_INCLUSIVE_INCLUSIVE);

                start += quoteWords[i].length() + 1; // 1 for the space between words
                wordCounter = 0;
            }

            Log.i("AzureSpeechRecognition", resultSentenceWithNoPunct);
            mFullStyledSentence = fullStyledSentence;
            mResultSentenceWithNoPunct = resultSentenceWithNoPunct;

            ((Activity) mContext).runOnUiThread(() -> {
                mQuoteBodyTextView.setText(mFullStyledSentence);

                if (mResultSentenceWithNoPunct.equals("")){ //if recognized text is null
                    mTestText.setText("Didn't catch that! Say it again, please ^_^"); //todo handle it better
                } else {
                    mTestText.setText(mResultSentenceWithNoPunct);
                }
            });

        }

        isButtonReleased = false; //make it false again
    }


    private String ParseResultSentenceFromJson(String result){
        String resultText = null;
        try {
            //Parse json text and get the Confidence object (best results)
            JSONObject rootJson = new JSONObject(result);
            JSONArray bestResultArray = rootJson.getJSONArray("NBest");

            //Only get object with most confidence results (at index 0), and get result sentence
            JSONObject mostConfidentObject = bestResultArray.getJSONObject(0);
            resultText = mostConfidentObject.getString("Display");

            //Get the whole sentence confidence
            double sentenceConfidence = mostConfidentObject.getDouble("Confidence");
            Log.i("AzureSpeechRecognition", "sentence confidence is " + sentenceConfidence);

            //Get each word confidence
            JSONArray wordsConfidenceArray = mostConfidentObject.getJSONArray("Words");
            for(int i = 0; i < wordsConfidenceArray.length(); i++){
                JSONObject wordsObjects = wordsConfidenceArray.getJSONObject(i); //word objects
                double wordConfidence = wordsObjects.getDouble("Confidence"); //confidence of each word

                //Log.i("AzureSpeechRecognition", "word at " + i + "is " +wordConfidence);
            }

        } catch (JSONException e) {
            e.printStackTrace();
        }

        return resultText;
    }



    private <T> void setOnTaskCompletedListener(Future<T> task, OnTaskCompletedListener<T> listener) {
        s_executorService.submit(() -> {
            T result = task.get(30, TimeUnit.SECONDS); //this extra timeout code helps with latency
            listener.onCompleted(result);

            Log.i("Tiz", "Task complete listener. (2,7)");

            return null;
        });
    }

    private interface OnTaskCompletedListener<T> {
        void onCompleted(T taskResult);
    }

    private static ExecutorService s_executorService;
    static {
        s_executorService = Executors.newCachedThreadPool();
        Log.i("Tiz", "ExecutorService. //0");
    }
}
