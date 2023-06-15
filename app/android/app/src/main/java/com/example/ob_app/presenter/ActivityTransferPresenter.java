package com.example.ob_app.presenter;

import android.os.Handler;
import android.util.Log;
import android.view.View;

import com.example.ob_app.activity.ActivityTransfer;
import com.example.ob_app.bean.WalletBean;
import com.example.ob_app.utils.ConstantType;
import com.example.ob_app.utils.PublicUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ActivityTransferPresenter  {
    private  ActivityTransfer  activityTransfer;
    public ActivityTransferPresenter(ActivityTransfer activityTransfes) {
        activityTransfer=activityTransfes;

    }

    public void onDestory() {
        activityTransfer = null;
    }

    public void setWalletBeanList(Map<String, Object> arguments,String tag) {
        List<WalletBean> objects = new ArrayList<WalletBean>();
        if (arguments != null) {
            List<Map<String,String>> walletList = (List<Map<String, String>>) arguments.get("walletList");

            for (int x = 0; x < walletList.size(); x++) {
                WalletBean walletBean = new WalletBean();
                Map map = walletList.get(x);
                String balance = (String) map.get("balance");
                if (balance.isEmpty()) {
                    balance="0.00";
                }


                String vipActivityGoing = (String) map.get("vipActivityGoing");
                String name = (String) map.get("name");
                String id = (String) map.get("id");
                String status = (String) map.get("status");
                Boolean aBoolean = Boolean.valueOf(vipActivityGoing);
                walletBean.setActivity(aBoolean);
                walletBean.setStauts(status);
                walletBean.setMoney(PublicUtils.formatTwoPoint(Double.parseDouble(balance)));
                walletBean.setWalletName(name);
                walletBean.setType(id);

                String venueIconUrlApp = (String) map.get("venueIconUrlApp");
                walletBean.setIconUrl(venueIconUrlApp);

                String walletIconUrl = (String) map.get("venueWalletIconUrl");
                walletBean.setWalletIconUrl(walletIconUrl);

                objects.add(walletBean);

            }
            activityTransfer.onWalletListFinish(objects,tag);
        }
    }


    public int getInScreenY(View view) {
        int[] screens = new int[2];
        view.getLocationInWindow(screens);
        int screenY = screens[1];



        return screenY;
    }


    public  void  getMoveUpDistance(View keyboard,View view) {
        keyboard.setVisibility(View.INVISIBLE);
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                int editViewY = getInScreenY(view);
                int keyboardY = getInScreenY(keyboard);
                int viewHeight = view.getHeight();
                int moveUpDistance = editViewY + viewHeight - keyboardY;
                keyboard.setVisibility(View.GONE);
                activityTransfer.onGetmoveUpDistance(moveUpDistance);
            }
        }, 100);


    }
}
