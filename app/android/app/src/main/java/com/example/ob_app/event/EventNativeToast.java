package com.example.ob_app.event;

import java.util.Map;

public class EventNativeToast {
    String message = "";

    public EventNativeToast(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }
}
