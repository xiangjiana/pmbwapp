
package com.example.ob_app.bean;

import java.util.List;
import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class Datum {

    @SerializedName("venueTypeCode")
    @Expose
    private String venueTypeCode;
    @SerializedName("venueList")
    @Expose
    private List<Venue> venueList = null;

    public String getVenueTypeCode() {
        return venueTypeCode;
    }

    public void setVenueTypeCode(String venueTypeCode) {
        this.venueTypeCode = venueTypeCode;
    }

    public List<Venue> getVenueList() {
        return venueList;
    }

    public void setVenueList(List<Venue> venueList) {
        this.venueList = venueList;
    }

}
