package com.Kelompok5.foodro;

import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.AppCompatButton;

import android.app.AlertDialog;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.AutoCompleteTextView;
import android.widget.Toast;

import com.google.android.material.textfield.TextInputLayout;

import java.util.ArrayList;

public class Signup extends AppCompatActivity {

    //
    AppCompatButton signupBTN;
    //

    //Dialog
    AlertDialog.Builder builderDialog;
    AlertDialog alertDialog;


    TextInputLayout selectroles;
    AutoCompleteTextView roles;

    ArrayList<String> arrayList_roles;
    ArrayAdapter<String> arrayAdapter_roles;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_signup);

        selectroles = (TextInputLayout) findViewById(R.id.selectroles);
        roles = (AutoCompleteTextView) findViewById(R.id.roles);

        arrayList_roles = new ArrayList<>();
        arrayList_roles.add("Admin");
        arrayList_roles.add("Merchant");
        arrayList_roles.add("User");

        arrayAdapter_roles = new ArrayAdapter<>(getApplication(), androidx.appcompat.R.layout.support_simple_spinner_dropdown_item, arrayList_roles);
        roles.setAdapter(arrayAdapter_roles);;

        roles.setThreshold(1);

        //
        signupBTN = (AppCompatButton) findViewById(R.id.signupBtn2page);

        signupBTN.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                showAlertDialog(R.layout.custom_dialog);
            }
        });

    }

    private void showAlertDialog(int duar) {
        builderDialog = new AlertDialog.Builder(this);
        View layoutview = getLayoutInflater().inflate(duar, null);

        AppCompatButton dialogButton = layoutview.findViewById(R.id.btnstatusok);
        builderDialog.setView(layoutview);
        alertDialog = builderDialog.create();
        alertDialog.show();

        dialogButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(getApplicationContext(),"Data Succesfully saved",Toast.LENGTH_SHORT).show();
                alertDialog.dismiss();

                startActivity(new Intent(Signup.this, AccountSetup.class));
                overridePendingTransition(R.anim.slide_in_left,R.anim.slide_out_right);
            }
        });
    }
}