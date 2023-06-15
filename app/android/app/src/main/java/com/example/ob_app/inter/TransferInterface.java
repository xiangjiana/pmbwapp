package com.example.ob_app.inter;

import com.example.ob_app.bean.WalletBean;

import java.util.List;

public interface TransferInterface {
     void  onWalletListFinish(List<WalletBean> list,String tag);

     void onGetmoveUpDistance(int distance);
}
