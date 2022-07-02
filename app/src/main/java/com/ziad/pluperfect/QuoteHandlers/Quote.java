package com.ziad.pluperfect.QuoteHandlers;

import com.google.gson.annotations.SerializedName;

public class Quote {
    private String author;
    @SerializedName("content") //annotation is used to specify the name of the field that’s in the JSON Response; So, you can name your variables anything
    private String quoteBody;

    public String getAuthor() {
        return author;
    }

    public String getQuoteBody() {
        return quoteBody;
    }
}
