import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class ContactUsRow extends StatelessWidget {
  final String title;
  final String email;

  ContactUsRow({
    required this.title,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap:_copyText,
      child: Container(
        decoration: BoxDecoration(
          color: Get.theme.colorScheme.primary.withOpacity(0.04),
          borderRadius: BorderRadius.circular(8.w),
        ),
        height: 64.w,
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12
          ..w),
        child: Row(
          children: [
            ObImage.asset(
              Assets.images.icon.loginMail.path,
              width: 24.w,
              height: 24.w,
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 12,
                      color: Get.theme.colorScheme.primary.withOpacity(0.6),
                    ),
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    email.isEmpty ? "-" : email,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      color: Get.theme.colorScheme.primary,
                    ),
                  ),
                ],
              ),
            ),
            PrimaryButton(
              child: Text(
                'copy'.tr,
                style: TextStyle(fontSize: 12,height: 1.2),
              ),
              size: ButtonSize.small, //28.w
              onPressed: _copyText,
            ),
          ],
        ),
      ),
    );
  }

  void _copyText() async {
    if(kIsWeb){
      WebUtil.copyText2Clipboard(email);
    }else{
      await Clipboard.setData(ClipboardData(text: email));
    }
    showToast('copy_successfully'.tr);
  }
}
