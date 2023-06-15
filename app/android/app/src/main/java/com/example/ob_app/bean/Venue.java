
package com.example.ob_app.bean;

import com.example.ob_app.event.EventUpdateGameWebView;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Venue {

    @SerializedName("venueCode")
    @Expose
    private String venueCode;
    @SerializedName("venueName")
    @Expose
    private String venueName;
    @SerializedName("venueType")
    @Expose
    private String venueType;
    @SerializedName("venueTypeName")
    @Expose
    private String venueTypeName;
    @SerializedName("isOb")
    @Expose
    private int isOb;
    @SerializedName("status")
    @Expose
    private int status;
    @SerializedName("currencyTypes")
    @Expose
    private String currencyTypes;
    @SerializedName("languageTypes")
    @Expose
    private String languageTypes;
    @SerializedName("venueIconUrlApp")
    @Expose
    private String venueIconUrlApp;
    @SerializedName("venueIconUrlPc")
    @Expose
    private String venueIconUrlPc;
    @SerializedName("venueTransferIconUrlApp")
    @Expose
    private String venueTransferIconUrlApp;
    @SerializedName("venueTransferIconUrlPc")
    @Expose
    private String venueTransferIconUrlPc;
    @SerializedName("walletNamesObject")
    @Expose
    private WalletNamesObject walletNamesObject;

    public String getVenueCode() {
        return venueCode;
    }

    public void setVenueCode(String venueCode) {
        this.venueCode = venueCode;
    }

    public String getVenueName() {
        return venueName;
    }

    public void setVenueName(String venueName) {
        this.venueName = venueName;
    }

    public String getVenueType() {
        return venueType;
    }

    public void setVenueType(String venueType) {
        this.venueType = venueType;
    }

    public String getVenueTypeName() {
        return venueTypeName;
    }

    public void setVenueTypeName(String venueTypeName) {
        this.venueTypeName = venueTypeName;
    }

    public int getIsOb() {
        return isOb;
    }

    public void setIsOb(int isOb) {
        this.isOb = isOb;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getCurrencyTypes() {
        return currencyTypes;
    }

    public void setCurrencyTypes(String currencyTypes) {
        this.currencyTypes = currencyTypes;
    }

    public String getLanguageTypes() {
        return languageTypes;
    }

    public void setLanguageTypes(String languageTypes) {
        this.languageTypes = languageTypes;
    }

    public String getVenueIconUrlApp() {
        return venueIconUrlApp;
    }

    public void setVenueIconUrlApp(String venueIconUrlApp) {
        this.venueIconUrlApp = venueIconUrlApp;
    }

    public String getVenueIconUrlPc() {
        return venueIconUrlPc;
    }

    public void setVenueIconUrlPc(String venueIconUrlPc) {
        this.venueIconUrlPc = venueIconUrlPc;
    }

    public String getVenueTransferIconUrlApp() {
        return venueTransferIconUrlApp;
    }

    public void setVenueTransferIconUrlApp(String venueTransferIconUrlApp) {
        this.venueTransferIconUrlApp = venueTransferIconUrlApp;
    }

    public String getVenueTransferIconUrlPc() {
        return venueTransferIconUrlPc;
    }

    public void setVenueTransferIconUrlPc(String venueTransferIconUrlPc) {
        this.venueTransferIconUrlPc = venueTransferIconUrlPc;
    }

    public WalletNamesObject getWalletNamesObject() {
        return walletNamesObject;
    }

    public void setWalletNamesObject(WalletNamesObject walletNamesObject) {
        this.walletNamesObject = walletNamesObject;
    }

    public EventUpdateGameWebView asEventUpdateGameWebView() {
        EventUpdateGameWebView update = new EventUpdateGameWebView();
        update.setGameId(null);
        update.setRoutes("/game");
        update.setGameCode(getVenueCode());
        update.setGameType(getVenueType());
        update.setTitle(getVenueName());
        update.setUrl("");
        return update;
    }
}
