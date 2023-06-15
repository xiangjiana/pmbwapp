class ModelTs {
  static String s = 'late String <#>;';
  static String d = 'late double <#>;';
  static String b = 'late bool <#>;';
  static String l = 'late List <#>;';
  static String m = 'late Map <#>;';

  static String s_tr = '<#> = json[\'<#>\']?.toString() ?? \'\'';
  static String d_tr = '<#> = double.tryParse(json[\'<#>\'].toString()) ?? 0';
  static String b_tr = '<#> = json[\'<#>\'] ?? false';
  static String l_tr = '<#> = json[\'<#>\'] is List ? json[\'<#>\'] : []';
  static String m_tr = '<#> = json[\'<#>\'] is Map ? json[\'<#>\'] : {}';

  static String fromJson =
      'class <#ClassName> { <#Vars>  <#Constructor>  <#ClassName>.fromJson(Map<String, dynamic> json): <#FromJson> <#ToJson>}';

  static String toJson = 'Map<String, dynamic> toJson() { return { <#> }; }';
  static String toJsonMap = '\'<#>\': <#>,';
}
