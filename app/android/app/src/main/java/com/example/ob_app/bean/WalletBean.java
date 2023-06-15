package com.example.ob_app.bean;

import com.example.ob_app.R;

public class WalletBean {
    String walletName = "xxx";
    String type = "";
    String money = "0";
    boolean isActivity = false;
    boolean isSelect = false;
    String activityName = "vip晋级";
    String needFlow = "20000000000";
    String finishFlow = "100000";
    String per = "0.00";
    String iconUrl = "";

    String walletIconUrl = "";

    String stauts = "0"; //开启1 维护2 禁用0 接口不会返回0的情况。
    String needMoreWater = "0";
    String vipActivityGoing = "false";

    public String getWalletName() {
        return walletName;
    }

    public void setWalletName(String walletName) {
        this.walletName = walletName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMoney() {
        return money;
    }

    public void setMoney(String money) {
        this.money = money;
    }

    public boolean isActivity() {
        return isActivity;
    }

    public void setActivity(boolean activity) {
        isActivity = activity;
    }

    public String getActivityName() {
        return activityName;
    }

    public void setActivityName(String activity) {
        this.activityName = activity;
    }

    public String getNeedFlow() {
        return needFlow;
    }

    public void setNeedFlow(String needFlow) {
        this.needFlow = needFlow;
    }

    public String getFinishFlow() {
        return finishFlow;
    }

    public void setFinishFlow(String finishFlow) {
        this.finishFlow = finishFlow;
    }

    public String getPer() {
        return per;
    }

    public void setPer(String per) {
        this.per = per;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public String getWalletIconUrl() {
        return walletIconUrl;
    }

    public void setWalletIconUrl(String walletIconUrl) {
        this.walletIconUrl = walletIconUrl;
    }

    public boolean isSelect() {
        return isSelect;
    }

    public void setSelect(boolean select) {
        isSelect = select;
    }

    public String getStauts() {
        return stauts;
    }

    public void setStauts(String stauts) {
        this.stauts = stauts;
    }

    public String getNeedMoreWater() {
        return needMoreWater;
    }

    public void setNeedMoreWater(String needMoreWater) {
        this.needMoreWater = needMoreWater;
    }

    //开启1 维护2 禁用0
    public boolean getEnabled() {
        return this.stauts.equals("1");
    }

    public boolean getMaintained() {
        return this.stauts.equals("2");
    }

    public boolean getDisabled() {
        return this.stauts.equals("0");
    }

    @Override
    public String toString() {
        return "WalletBean{" +
                "walletName='" + walletName + '\'' +
                ", type='" + type + '\'' +
                ", money='" + money + '\'' +
                ", isActivity=" + isActivity +
                ", isSelect=" + isSelect +
                ", activityName='" + activityName + '\'' +
                ", needFlow='" + needFlow + '\'' +
                ", finishFlow='" + finishFlow + '\'' +
                ", per='" + per + '\'' +
                ", iconUrl=" + iconUrl +
                ", stauts='" + stauts + '\'' +
                ", needMoreWater='" + needMoreWater + '\'' +
                ", vipActivityGoing='" + vipActivityGoing + '\'' +
                '}';
    }
}
