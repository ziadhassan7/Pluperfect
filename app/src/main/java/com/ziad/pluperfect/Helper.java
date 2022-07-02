package com.ziad.pluperfect;

import android.annotation.SuppressLint;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.media.AudioManager;
import android.os.Build;
import android.widget.Toast;

public class Helper {

    protected static boolean firstOpen = true;

    private Context mContext;
    private Toast mToast;
    //~ Variables End

    @SuppressLint("ShowToast")
    Helper(Context context){

        mContext = context;
        mToast = Toast.makeText(context, "", Toast.LENGTH_SHORT);
    }



    boolean isVoiceAudible(){
        AudioManager audio = (AudioManager) mContext.getSystemService(Context.AUDIO_SERVICE);
        int musicVolume = audio.getStreamVolume(AudioManager.STREAM_MUSIC);

        return musicVolume > 1;
    }


    void translateIntent(String text){
        mToast.setText("translating..."); mToast.setDuration(Toast.LENGTH_LONG);
        mToast.show();

        Intent intent = new Intent();
        intent.setType("text/plain");

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            intent.setAction(Intent.ACTION_PROCESS_TEXT);
            intent.putExtra(Intent.EXTRA_PROCESS_TEXT, text);

        }else{
            intent.setAction(Intent.ACTION_SEND);
            intent.putExtra(Intent.EXTRA_TEXT, text);

        }

        //This code is essential for api less than android.M
        for (ResolveInfo resolveInfo : mContext.getPackageManager().queryIntentActivities(intent, 0)) {

            if( resolveInfo.activityInfo.packageName.contains("com.google.android.apps.translate")){
                intent.setComponent(new ComponentName(
                        resolveInfo.activityInfo.packageName,
                        resolveInfo.activityInfo.name));

                mContext.startActivity(intent);
            }

        }
    }

    static boolean isPackageInstalled(String packageName, PackageManager packageManager) {
        try {
            packageManager.getPackageInfo(packageName, 0);
            return true;
        } catch (PackageManager.NameNotFoundException e) {
            return false;
        }
    }
}
