/// 地区的树结构
class AreaTree {
  ///
  AreaTree(
      {required this.areaCode,
      required this.areaName,
      List<AreaTree>? child,
      this.parent})
      : child = child ?? <AreaTree>[];

  /// 无节点
  AreaTree.nullArea()
      : areaCode = '',
        areaName = '',
        child = <AreaTree>[];

  /// 地区编码 可能是省编码 市编码 区编码
  final String areaCode;

  /// 地区名称
  final String areaName;

  /// 子节点
  final List<AreaTree> child;

  /// 父节点
  AreaTree? parent;

  /// 添加子节点
  void addChild(AreaTree node) {
    child.add(node);
  }

  /// 添加多个子节点
  void addAllChild(List<AreaTree> nodes) {
    child.addAll(nodes);
  }

  @override
  String toString() {
    return 'AreaTree{areaCode: $areaCode, areaName: $areaName, child: $child}';
  }
}
