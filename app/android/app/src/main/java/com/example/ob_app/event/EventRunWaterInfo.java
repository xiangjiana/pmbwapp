package com.example.ob_app.event;

import java.util.Map;

public class EventRunWaterInfo {
    private String event="";
    Map<String, Object> arguments;

    public String getEvent() {
        return event;
    }

    public void setEvent(String event) {
        this.event = event;
    }

    public Map<String, Object> getArguments() {
        return arguments;
    }

    public void setArguments(Map<String, Object> arguments) {
        this.arguments = arguments;
    }

    @Override
    public String toString() {
        return "EventTransfer{" +
                "event='" + event + '\'' +
                ", arguments=" + arguments +
                '}';
    }
}
