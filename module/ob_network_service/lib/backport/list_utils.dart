class ListUtils {
  ListUtils._();

  ///分组
  static List<List<T>> split<T>(List<T> list, int groupSize) {
    int length = list.length;
    int num = (length + groupSize - 1) ~/ groupSize;
    List<List<T>> newList = [];
    for (int i = 0; i < num; i++) {
      int fromIndex = i * groupSize;
      int toIndex = (i + 1) * groupSize < length ? (i + 1) * groupSize : length;
      newList.add(list.sublist(fromIndex, toIndex));
    }
    return newList;
  }
}
