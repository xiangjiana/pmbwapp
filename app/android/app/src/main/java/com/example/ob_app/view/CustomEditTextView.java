package com.example.ob_app.view;

import android.content.Context;
import android.os.IBinder;
import android.text.Editable;
import android.text.InputType;
import android.text.TextWatcher;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.Toast;

import androidx.constraintlayout.widget.ConstraintLayout;

import com.example.ob_app.R;
import com.example.ob_app.utils.PublicUtils;

import java.lang.reflect.Method;

public class CustomEditTextView extends ConstraintLayout {
    int countCursorBehind = 0;
    public EditText editText;
    String beforeContent = "";
    boolean isDelete=false;

    public CustomEditTextView(Context context) {
        super(context);
        initView();
    }

    public CustomEditTextView(Context context, AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    public CustomEditTextView(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

    private void  initView() {
        View inflate = View.inflate(getContext(), R.layout.view_edittext_custom, this);
         editText = inflate.findViewById(R.id.editView);
        disableShowInput();
        setTextChangeListener();
        setFocusListener();

    }

    private void setFocusListener() {
        editText.setOnClickListener(new OnClickListener() {
            @Override
            public void onClick(View view) {
                setEditTextFocus(true);
            }
        });
        editText.setOnFocusChangeListener(new OnFocusChangeListener() {
            @Override
            public void onFocusChange(View view, boolean b) {
                if (onFocusListener != null) {
                    onFocusListener.foucusChange(b);
                }
            }
        });
    }

    private void setTextChangeListener() {
        editText.addTextChangedListener(new TextWatcher() {
            @Override
            public void beforeTextChanged(CharSequence charSequence, int start, int count, int after) {
                // start是文本改变操作后输入光标所在位置
                // count删除内容时是删除字符的个数，增加内容时为0
                // after增加内容时是增加字符的个数，删除内容时为0

                beforeContent=charSequence.toString();

                if (count > 0) {
                    isDelete=true;
                    //删除
                    countCursorBehind = beforeContent.length() - start-1;
                } else {
                    isDelete=false;
                    countCursorBehind = beforeContent.length() - start;
                }

            }

            @Override
            public void onTextChanged(CharSequence charSequence, int start, int before, int count) {
                // start是文本改变操作后输入光标所在位置
                // count增加内容时是增加字符的个数，删除内容时为0
                // after删除内容时是删除字符的个数，增加内容时为0

            }

            @Override
            public void afterTextChanged(Editable editable) {
                editText.removeTextChangedListener(this);
                String temp = editable.toString();
                int posDot = temp.indexOf(".");
                if (posDot == 0) {
                    editable.delete(0, 1);
                    editText.addTextChangedListener(this);
                    return;
                }
                temp = editable.toString();
                int count = PublicUtils.getCount(temp, ".");
                if (count == 2) {
                    editable.clear();
                    editable.append(beforeContent);
                    setCursorIndex(editable.toString().length());
                    editText.addTextChangedListener(this);
                    return;
                }

                temp = editable.toString();
                if (temp.length() > 0) {
                    String s = PublicUtils.fmtMicrometer(editable.toString());
                    editable.clear();
                    editable.append(s);
                    setCursorIndex(editable.toString().length());
                    if (onTextChangeLitener != null) {
                        double doubleNum = getDoubleAmount();
                        onTextChangeLitener.textChange(doubleNum);
                    }
                }else {

                    if (onTextChangeLitener != null) {
                        onTextChangeLitener.textChange(0.00);
                    }
                }

                editText.addTextChangedListener(this);


            }
        });

    }

    private void setCursorIndex(int contentLength) {
        try {
            int i = contentLength - countCursorBehind;
            if (i < 0) {
                i=0;
            }
            editText.setSelection(i);
        } catch (Exception e) {
            e.printStackTrace();
            showToast("setCursorIndex   "+e.getMessage());
        }

    }


    public double getDoubleAmount() {
        try {
            String s = editText.getText().toString();
            if (s.isEmpty()) {
                return 0.00;
            }
            String replace = s.replace(",", "");
            double v = Double.parseDouble(replace);
            return v;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            showToast("getDoubleAmount   "+e.getMessage());
        }
        return 0.00;

    }
    public String getStringAmount(){
        try {
            String s = editText.getText().toString();
            String replace = s.replace(",", "");
            return replace;
        } catch (Exception e) {
            e.printStackTrace();
            showToast("getStringAmount   "+e.getMessage());
        }
        return "";
    }
    public String getAmountIncludeComma(){
        try {
            String s = editText.getText().toString();
            return s;
        } catch (Exception e) {
            e.printStackTrace();
            showToast("getAmountIncludeComma   "+e.getMessage());
        }
        return "";
    }

    private void showToast(String message) {
        Toast.makeText(getContext(),message,Toast.LENGTH_LONG).show();

    }
    public OnTextChangeLitener onTextChangeLitener;

    public void setAmount(String s) {
        Editable text = editText.getText();
        text.clear();
        String s1 = PublicUtils.fmtMicrometer(s);
        text.append(s1);
    }

    public void clean() {
          editText.getText().clear();


    }

    public  void  insertText(String string) {
        int selectionStart = editText.getSelectionStart();
        Editable ediTable = editText.getText();
        ediTable.insert(selectionStart,string);

    }
    public void delete(){
        try {
            int index = editText.getSelectionStart();
            if (index < 1) {
                return;
            }
            Editable editable = editText.getText();
            editable.delete(index-1, index);
        } catch (Exception e) {
            e.printStackTrace();
            showToast(e.getMessage());
        }
    }


    public void setEditTextFocus(boolean b) {
        if (editText != null) {
            if (!b) {
                editText.clearFocus();
            }else {
                editText.requestFocus();
            }
        }
    }
    public interface  OnTextChangeLitener{
       void textChange(double money);
    }
    public void addOnTextChangeListener(OnTextChangeLitener litener){
        onTextChangeLitener=litener;
    }

    public OnFocusListener onFocusListener;
    public  interface  OnFocusListener{
        void  foucusChange(boolean b);
    }

    public void addOnFocusChangeListener(OnFocusListener listener) {
        onFocusListener=listener;
    }

    public void disableShowInput() {
        if (android.os.Build.VERSION.SDK_INT <= 10) {
            editText.setInputType(InputType.TYPE_NULL);
        } else {
            Class<EditText> cls = EditText.class;
            Method method;
            try {
                method = cls.getMethod("setShowSoftInputOnFocus", boolean.class);
                method.setAccessible(true);
                method.invoke(editText, false);
            } catch (Exception e) {//TODO: handle exception
            }
            try {
                method = cls.getMethod("setSoftInputShownOnFocus", boolean.class);
                method.setAccessible(true);
                method.invoke(editText, false);
            } catch (Exception e) {//TODO: handle exception
            }
        }
    }

}
