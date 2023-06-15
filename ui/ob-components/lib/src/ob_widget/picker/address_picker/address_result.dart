/// 地址选择器返回结果
class AddressResult {
  ///
  AddressResult(this.provinceCode, this.provinceName, this.cityCode,
      this.cityName, this.townCode, this.townName);

  /// 省编码
  final String provinceCode;

  /// 省名称
  final String provinceName;

  /// 城市编码
  final String cityCode;

  /// 城市名称
  final String cityName;

  /// 县编码
  final String townCode;

  /// 县名称
  final String townName;
}
