package com.ziad.pluperfect.QuoteHandlers;

import android.app.Activity;
import android.content.Context;
import android.util.Log;
import android.view.View;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.ziad.pluperfect.Interfaces.QuoteApiInterface;
import com.ziad.pluperfect.R;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;

public class QuoteManager {

    QuoteApiInterface mQuoteApiInterface;

    ProgressBar mProgressBar;
    TextView mQuoteBodyTextView;

    public static String mQuoteBodyString, mQuoteAuthorString;

    public QuoteManager(Context context){ //todo ProgressBar progressBar, TextView quoteBodyTextView
        Retrofit retrofit = SetupRetrofit.getQuoteRetrofit();
        mQuoteApiInterface = retrofit.create(QuoteApiInterface.class); //instead of making a new instance of the interface and having to implement the methods, retrofit does the job for us and bring life to these methods


        mProgressBar = ((Activity)context).findViewById(R.id.progressBar);
        mQuoteBodyTextView = ((Activity)context).findViewById(R.id.quoteBodyTextView);
    }

    public void requestQuote(){
        mProgressBar.setVisibility(View.VISIBLE);
        mQuoteBodyTextView.setText("");

        Call<Quote> call = mQuoteApiInterface.getQuote(10000); //execute network request //idle length 60 //todo

        call.enqueue(new Callback<Quote>() { //to perform task in background
            @Override
            public void onResponse(Call<Quote> call, Response<Quote> response) {
                if(!response.isSuccessful()){
                    //things like HTTP 404
                    //mQuoteBodyTextView.setText("Code: " +response.code());
                    Log.i("QuotesHandler", "onResponse failed");
                    mQuoteBodyTextView.setText("Eror 404.. Can't connect to server! Come back another time ^_^"); //todo handle it better
                    return; //get out
                }

                if (response.body() != null) {
                    mProgressBar.setVisibility(View.GONE);


                    mQuoteBodyString = response.body().getQuoteBody();
                    mQuoteAuthorString = response.body().getAuthor();

                    Log.i("QuotesHandler", mQuoteBodyString);
                    mQuoteBodyTextView.setText(mQuoteBodyString);
                } else {
                    mQuoteBodyTextView.setText("Quote not found. Come back another time ^_^"); //todo handle it better
                }
            }

            @Override
            public void onFailure(Call<Quote> call, Throwable t) {
                //print error
                //mQuoteBodyTextView.setText(t.getMessage());
                Log.i("QuotesHandler", "onFailure");
                //todo do something
                mQuoteBodyTextView.setText("Error 404");
            }
        });
    }

    String getQuoteBodyString(){
        return mQuoteBodyString;
    }

    String getQuoteAuthorString(){
        return mQuoteAuthorString;
    }
}

