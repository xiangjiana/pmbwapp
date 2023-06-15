
package com.example.ob_app.bean;

import com.google.gson.annotations.Expose;
import com.google.gson.annotations.SerializedName;

public class WalletNamesObject {

    @SerializedName("zhName")
    @Expose
    private String zhName;
    @SerializedName("thName")
    @Expose
    private String thName;
    @SerializedName("vnName")
    @Expose
    private String vnName;

    public String getZhName() {
        return zhName;
    }

    public void setZhName(String zhName) {
        this.zhName = zhName;
    }

    public String getThName() {
        return thName;
    }

    public void setThName(String thName) {
        this.thName = thName;
    }

    public String getVnName() {
        return vnName;
    }

    public void setVnName(String vnName) {
        this.vnName = vnName;
    }

}
