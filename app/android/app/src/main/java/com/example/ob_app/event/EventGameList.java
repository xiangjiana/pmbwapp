package com.example.ob_app.event;

import com.example.ob_app.bean.Datum;

import java.util.List;

public class EventGameList {
    public final List<Datum> data;

    public EventGameList(List<Datum> data) {
        this.data = data;
    }
}
