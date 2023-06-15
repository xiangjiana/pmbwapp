extension Webp2Png on String {
  String toPng() {
    if (startsWith('assets')) {
      return replaceAll('webp', 'png');
    }
    return this;
  }
}