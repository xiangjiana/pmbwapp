class TemplateModel {
  late String s;
  late double d;
  late bool b;
  late List l;
  late Map m;

  TemplateModel.fromJson(Map<String, dynamic> json)
      : s = json['s']?.toString() ?? '',
        d = double.tryParse(json['d'].toString()) ?? 0,
        b = json['b'] ?? false,
        l = json['l'] is List ? json['l'] : [],
        m = json['m'] is Map ? json['m'] : {};
}
