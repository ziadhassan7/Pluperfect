package com.ziad.pluperfect;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.ImageButton;
import android.widget.ProgressBar;
import android.widget.TextView;

import com.ziad.pluperfect.NetworkHandlers.NetworkManager;

public class NoInternetActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_no_internet);

        TextView textView = findViewById(R.id.textView);

        //Initialize ProgressBar
        ProgressBar progressBar = findViewById(R.id.progressBar);
        progressBar.setVisibility(View.INVISIBLE);

        //Buttons Instantiations
        ImageButton cancelBtn = findViewById(R.id.cancelBtn);
        Button retryBtn = findViewById(R.id.retryBtn);
        Button openWifiBtn = findViewById(R.id.openWifiBtn);

        cancelBtn.setOnClickListener(view -> finish());
        retryBtn.setOnClickListener(view -> {
            //show ProgressBar
            progressBar.setVisibility(View.VISIBLE);
            textView.setVisibility(View.INVISIBLE);

            if(NetworkManager.isNetworkAvailable(this)){
                finish(); //Exit Activity
            } else {
                new Handler(Looper.getMainLooper()).postDelayed(() -> {
                    //execute after a short time
                    progressBar.setVisibility(View.INVISIBLE);
                    textView.setVisibility(View.VISIBLE);
                }, 100);
            }
        });
        openWifiBtn.setOnClickListener(view -> {
            NetworkManager.turnWifiOn(this);

            Intent intent = new Intent(this, QuotesActivity.class);
            startActivity(intent);
        });
    }
}