import 'dart:io';

void main() {
  PubspecManager().update('version:');
}

class PubspecManager {
  String _pubspecContent = '';

  void update(String key) {
    File pubspecFile = File('pubspec.yaml');

    for (String line in pubspecFile.readAsLinesSync()) {
      if (line.startsWith(key)) {
        line = 'version: ${handleVersion(line)}';
      }
      _pubspecContent = "$_pubspecContent\n$line";
    }
    _pubspecContent = _pubspecContent.replaceFirst(RegExp(r'\n'), '');
    pubspecFile.writeAsString(_pubspecContent);
  }

  String handleVersion(String content) {
    String oldVersion = content.split(' ').last;
    List<String> versionList = oldVersion.split('+').first.split('.');
    int firstDecimal = int.parse(versionList.first);
    int secondDecimal = int.parse(versionList[1]);
    int lastDecimal = int.parse(versionList.last);
    lastDecimal++;
    if (lastDecimal > 99) {
      secondDecimal++;
    }
    if (secondDecimal > 99) {
      firstDecimal++;
    }
    lastDecimal = lastDecimal > 99 ? 0 : lastDecimal;
    secondDecimal = secondDecimal > 99 ? 0 : secondDecimal;
    return '$firstDecimal.$secondDecimal.$lastDecimal+$firstDecimal$secondDecimal${lastDecimal >= 10 ? lastDecimal : ('0' + '$lastDecimal')}';
  }
}
