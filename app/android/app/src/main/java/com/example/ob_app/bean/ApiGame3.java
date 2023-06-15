package com.example.ob_app.bean;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class ApiGame3 {
    @SerializedName("gameId")
    @Expose
    public int gameId;
    @SerializedName("venueCode")
    @Expose
    public String venueCode;
    @SerializedName("gameName")
    @Expose
    public String gameName;
    @SerializedName("accessInfo")
    @Expose
    public String accessInfo;
    @SerializedName("iconStatus")
    @Expose
    public int iconStatus;
    @SerializedName("supportTerminals")
    @Expose
    public String supportTerminals;
    @SerializedName("iconUrl")
    @Expose
    public String iconUrl;
    @SerializedName("description")
    @Expose
    public String description;
    @SerializedName("remark")
    @Expose
    public String remark;
    @SerializedName("status")
    @Expose
    public int status;
    @SerializedName("createdBy")
    @Expose
    public String createdBy;
    @SerializedName("createdAt")
    @Expose
    public String createdAt;
    @SerializedName("updatedBy")
    @Expose
    public String updatedBy;
    @SerializedName("updatedAt")
    @Expose
    public String updatedAt;
}