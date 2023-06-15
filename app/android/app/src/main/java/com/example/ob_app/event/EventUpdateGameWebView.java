package com.example.ob_app.event;

import android.os.Parcel;
import android.os.Parcelable;

public class EventUpdateGameWebView implements Parcelable {
    private String routes;
    private String title;
    private String url;
    private String gameCode;
    private String gameType;
    private String gameId;
    private String symbol;
    private boolean testify;
    private boolean isFromHomePage;


    public String getRoutes() {
        return routes;
    }

    public void setRoutes(String routes) {
        this.routes = routes;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getGameCode() {
        return gameCode;
    }

    public void setGameCode(String gameCode) {
        this.gameCode = gameCode;
    }

    public String getGameId() {
        return gameId;
    }

    public void setGameId(String gameId) {
        this.gameId = gameId;
    }

    public boolean isTestify() {
        return testify;
    }

    public void setTestify(boolean testify) {
        this.testify = testify;
    }

    public boolean isFromHomePage() {
        return isFromHomePage;
    }

    public void setFromHomePage(boolean fromHomePage) {
        isFromHomePage = fromHomePage;
    }

    public String getGameType() {
        return gameType;
    }

    public void setGameType(String gameType) {
        this.gameType = gameType;
    }

    public String getSymbol() {
        return symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.routes);
        dest.writeString(this.title);
        dest.writeString(this.url);
        dest.writeString(this.gameCode);
        dest.writeString(this.gameType);
        dest.writeString(this.gameId);
        dest.writeString(this.symbol);
        dest.writeByte(this.testify ? (byte) 1 : (byte) 0);
        dest.writeByte(this.isFromHomePage ? (byte) 1 : (byte) 0);
    }

    public void readFromParcel(Parcel source) {
        this.routes = source.readString();
        this.title = source.readString();
        this.url = source.readString();
        this.gameCode = source.readString();
        this.gameType = source.readString();
        this.gameId = source.readString();
        this.symbol = source.readString();
        this.testify = source.readByte() != 0;
        this.isFromHomePage = source.readByte() != 0;
    }

    public EventUpdateGameWebView() {
    }

    protected EventUpdateGameWebView(Parcel in) {
        this.routes = in.readString();
        this.title = in.readString();
        this.url = in.readString();
        this.gameCode = in.readString();
        this.gameType = in.readString();
        this.gameId = in.readString();
        this.symbol = in.readString();
        this.testify = in.readByte() != 0;
        this.isFromHomePage = in.readByte() != 0;
    }

    public static final Creator<EventUpdateGameWebView> CREATOR = new Creator<EventUpdateGameWebView>() {
        @Override
        public EventUpdateGameWebView createFromParcel(Parcel source) {
            return new EventUpdateGameWebView(source);
        }

        @Override
        public EventUpdateGameWebView[] newArray(int size) {
            return new EventUpdateGameWebView[size];
        }
    };

    @Override
    public String toString() {
        return "EventUpdateGameWebView{" +
                "routes='" + routes + '\'' +
                ", title='" + title + '\'' +
                ", url='" + url + '\'' +
                ", gameCode='" + gameCode + '\'' +
                ", gameType='" + gameType + '\'' +
                ", gameId='" + gameId + '\'' +
                ", symbol='" + symbol + '\'' +
                ", testify=" + testify +
                ", isFromHomePage=" + isFromHomePage +
                '}';
    }
}
