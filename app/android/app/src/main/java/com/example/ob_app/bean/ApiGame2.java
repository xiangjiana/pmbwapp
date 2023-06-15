package com.example.ob_app.bean;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

import java.util.List;

public class ApiGame2 {

    @SerializedName("list")
    @Expose
    private List<ApiGame3> data = null;

    public List<ApiGame3> getData() {
        return data;
    }

    public void setData(List<ApiGame3> data) {
        this.data = data;
    }

}