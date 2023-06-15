package com.example.ob_app.activity;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;

import com.example.ob_app.MyExtKt;
import com.example.ob_app.R;

public class TestActivity extends AppCompatActivity {
  

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        MyExtKt.applyNavigationBarColor(this, (R.color.color_151E25));
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_test2);
    }
}