package com.example.ob_app.utils;

import com.example.ob_app.R;

import java.io.OptionalDataException;
import java.util.HashMap;
import java.util.Map;

public class ConstantType {
    public final static Map<String, Integer> getWalletIcon = new HashMap<String, Integer>() {
        {
            put("ty", R.mipmap.wallet_ty);
            put("zr", R.mipmap.wallet_zr);
            put("dj", R.mipmap.wallet_dj);
            put("cp",R.mipmap.wallet_cp);
            put("qp", R.mipmap.wallet_qp);
            put("dy", R.mipmap.wallet_dy);
            put("by", R.mipmap.wallet_by);
        }
    };

}
