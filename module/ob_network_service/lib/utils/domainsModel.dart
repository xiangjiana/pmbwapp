// To parse this JSON data, do
//
//     final DomainsManagement = DomainsManagementFromJson(jsonString);

import 'dart:convert';

DomainsManagement DomainsManagementFromJson(String str) =>
    DomainsManagement.fromJson(json.decode(str));

String DomainsManagementToJson(DomainsManagement data) =>
    json.encode(data.toJson());

class DomainsManagement {
  DomainsManagement({
    required this.domains,
  });

  Map<String, Domain> domains;

  DomainsManagement copyWith({
    required Map<String, Domain> domains,
  }) =>
      DomainsManagement(
        domains: domains,
      );

  factory DomainsManagement.fromJson(Map<String, dynamic> json) =>
      DomainsManagement(
        domains: Map.from(json['domains'])
            .map((k, v) => MapEntry<String, Domain>(k, Domain.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        'domains': Map.from(domains)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Domain {
  Domain({
    required this.thLd,
    required this.url,
    required this.isUse,
  });

  String thLd;
  String url;
  int isUse;

  Domain copyWith({
    required String thLd,
  }) =>
      Domain(
        thLd: thLd,
        url: url,
        isUse: isUse,
      );

  factory Domain.fromJson(Map<String, dynamic> json) => Domain(
        thLd: json['thLd'],
        isUse: json['isUse'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'thLd': thLd,
        'isUse': isUse,
        'url': url,
      };
}
