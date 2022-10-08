package com.examples.epub_book;

import android.content.res.Resources;
import android.util.DisplayMetrics;
import android.util.Log;

import androidx.annotation.NonNull;

import java.util.Locale;

import io.flutter.embedding.android.FlutterActivity;

import io.flutter.embedding.engine.FlutterEngine;

public  class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        Log.i("log","log");
        Locale.setDefault(Locale.ENGLISH);

    }
}
