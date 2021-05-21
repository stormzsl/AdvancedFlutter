package com.example.myapp;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.annotation.Nullable;

public class SecondActivity  extends Activity {

    private Button btJumpWidget;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.second_activity_layout);
        btJumpWidget=findViewById(R.id.bt_jumop_widget);
        btJumpWidget.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });
    }
}
