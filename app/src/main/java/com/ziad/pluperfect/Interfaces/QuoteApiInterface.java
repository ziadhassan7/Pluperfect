package com.ziad.pluperfect.Interfaces;

import com.ziad.pluperfect.QuoteHandlers.Quote;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface QuoteApiInterface {

    @GET("random") //url
    Call<Quote> getQuote(@Query("maxLength") int maxLength);
}
