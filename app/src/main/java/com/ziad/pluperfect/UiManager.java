package com.ziad.pluperfect;

import android.app.Activity;
import android.content.Context;
import android.graphics.Color;
import android.view.View;

import static com.ziad.pluperfect.QuotesActivity.COLOR_ORANGE;

public class UiManager {

    Context mContext;

    View view1, view2, view3, view4, view5, view6, view7;

    UiManager(Context context){
        mContext = context;

        //Initialize Views
        view1 = ((Activity)context).findViewById(R.id.view1);
        view2 = ((Activity)context).findViewById(R.id.view2);
        view3 = ((Activity)context).findViewById(R.id.view3);
        view4 = ((Activity)context).findViewById(R.id.view4);
        view5 = ((Activity)context).findViewById(R.id.view5);
        view6 = ((Activity)context).findViewById(R.id.view6);
        view7 = ((Activity)context).findViewById(R.id.view7);
    }



    void colorCorrespondingView(int quizIndex){
        switch (quizIndex){
            case 1:
                view1.setBackgroundColor(COLOR_ORANGE);
                break;

            case 2:
                view2.setBackgroundColor(COLOR_ORANGE);
                break;

            case 3:
                view3.setBackgroundColor(COLOR_ORANGE);
                break;

            case 4:
                view4.setBackgroundColor(COLOR_ORANGE);
                break;

            case 5:
                view5.setBackgroundColor(COLOR_ORANGE);
                break;

            case 6:
                view6.setBackgroundColor(COLOR_ORANGE);
                break;

            case 7:
                view7.setBackgroundColor(COLOR_ORANGE);
                break;

        }
    }
}
