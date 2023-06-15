package com.example.ob_app.event;

import com.example.ob_app.bean.ApiGame3;

import java.util.List;

public class EventDyGameList {
    public final List<ApiGame3> data;

    public EventDyGameList(List<ApiGame3> data) {
        this.data = data;
    }
}
