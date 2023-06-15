import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:heic_to_jpg/heic_to_jpg.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'dart:html' if(dart.library.io) 'html_stub.dart' as html;


class ImageUtil {
  
  static Future<String?> compress(String? filePath) async {
    try {
      if (filePath == null || filePath.isEmpty) return null;
      int fileLength = 0;
      var targetPath = "";
      if (kIsWeb) {
        fileLength = (await WebUtil.file2uini8list(filePath)).length;
      } else {
        var file = File(filePath);
        fileLength = file.lengthSync();

        var dir = await path_provider.getTemporaryDirectory();
        targetPath = dir.absolute.path +
            "/" +
            DateTime.now().millisecondsSinceEpoch.toString() +
            ".jpg";
      }
      if (fileLength < 200 * 1024) {
        return filePath;
      }
      var quality = 100;
      if (fileLength > 4 * 1024 * 1024) {
        quality = 50;
      } else if (fileLength > 2 * 1024 * 1024) {
        quality = 60;
      } else if (fileLength > 1 * 1024 * 1024) {
        quality = 70;
      } else if (fileLength > 0.5 * 1024 * 1024) {
        quality = 80;
      } else if (fileLength > 0.25 * 1024 * 1024) {
        quality = 90;
      }
      var result = await FlutterImageCompress.compressAndGetFilePath(
        kIsWeb ? filePath : File(filePath).absolute.path,
        targetPath,
        minWidth: 600,
        quality: quality,
        rotate: 0,
      );
      if (result == null) {
        return filePath;
      }
      return result;
    } catch (_) {
      return filePath;
    }
  }


  static String getSuffixByFilePath(String imgFilePath) {
    List splitArr = imgFilePath.split('.');
    return splitArr[splitArr.length - 1];
  }

  static Future<String?> heicToJpg(String imgFilePath) async {
    try {
      String suffix = getSuffixByFilePath(imgFilePath);
      if ('heic' == suffix.toLowerCase()) {
        String? jpegPath = await HeicToJpg.convert(imgFilePath);
        if (jpegPath == null) {
          return imgFilePath;
        }
        return jpegPath;
      }
      return imgFilePath;
    } catch (_) {
      return imgFilePath;
    }
  }



  static Future<Uint8List?> readImgAsBytes(String? filePath) async {
    try {
      if (kIsWeb) {
        html.HttpRequest request = html.HttpRequest();
        request.responseType = 'blob';
        request.open("get", filePath!);
        request.send();
        await request.onLoad.first;
        var blob = request.response;
        html.FileReader reader = html.FileReader();
        reader.readAsArrayBuffer(blob);
        await reader.onLoad.first;
        dynamic o = reader.result;
        return o;
      }
      if (filePath != null && filePath.isNotEmpty) {
        final imageBytes = await File(filePath).readAsBytes();
        if (imageBytes.isNotEmpty) {
          return imageBytes;
        }
      }
    } catch (_) {
      ///
    }
  }



  static Future<bool> checkImageType(String filePath) async{
    String suffix="";
    if(kIsWeb){
      //web文件路径不带后缀，需要读取文件二进制头来判断
      String fileHeader=(await WebUtil.file2uini8list(filePath)).getRange(0, 4).toList().map((e) => e.toRadixString(16)).join("");
      //合法的文件头，89504e47:png,00018:heci,其他：jpeg(jpg)
      List<String> validFileHeader=["89504e47","ffd8ffe0","ffd8ffe1","ffd8ffe2","ffd8ffe3","ffd8ffe8","00018"];
      if(validFileHeader.contains(fileHeader)){
        suffix="jpg";
      }
    }else{
      suffix = getSuffixByFilePath(filePath);
    }
    return Future.value(['jpg', 'jpeg', 'png', 'heic'].contains(suffix.toLowerCase()));
  }


  static Future<bool> checkSize(String filePath) async{
    if(kIsWeb){
      return (await WebUtil.file2uini8list(filePath)).length > 5 * 1024 * 1024;
    }
    return Future.value(File(filePath).lengthSync() > 5 * 1024 * 1024);
  }
}
