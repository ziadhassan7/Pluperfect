package com.ziad.pluperfect.QuoteHandlers;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

/*
* Class to set up and instantiate Retrofit
*/

public class SetupRetrofit { //APIClient

    private static final String BASE_URL = "https://api.quotable.io/"; //https://favqs.com/api/

    static Retrofit getQuoteRetrofit(){ //getClient
        return new Retrofit.Builder()
                .baseUrl(BASE_URL)
                .addConverterFactory(GsonConverterFactory.create())
                .build();
    }
}
