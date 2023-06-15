import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameMatchesPostRespModel {
  GameMatchesPostRespModel({
    required this.data,
  });

  factory GameMatchesPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameMatchesPostRespModelData>? data = jsonRes['data'] is List ? <GameMatchesPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameMatchesPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameMatchesPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameMatchesPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameMatchesPostRespModelData {
  GameMatchesPostRespModelData({
    required this.csid,
    required this.csna,
    required this.matchesList,
  });

  factory GameMatchesPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameMatchesPostRespModelMatchesList>? matchesList =
        jsonRes['matchesList'] is List ? <GameMatchesPostRespModelMatchesList>[] : null;
    if (matchesList != null) {
      for (final dynamic item in jsonRes['matchesList']!) {
        if (item != null) {
          matchesList.add(GameMatchesPostRespModelMatchesList.fromJson(
              asT<Map<String, dynamic>>("matchesList", item)!));
        }
      }
    }
    return GameMatchesPostRespModelData(
      csid:
          jsonRes['csid'] == null ? '' : asT<String>("csid", jsonRes['csid'])!,
      csna:
          jsonRes['csna'] == null ? '' : asT<String>("csna", jsonRes['csna'])!,
      matchesList: matchesList == null ? [] : matchesList,
    );
  }

  String csid = '';
  String csna = '';
  List<GameMatchesPostRespModelMatchesList> matchesList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'csid': csid,
        'csna': csna,
        'matchesList': matchesList,
      };
}

class GameMatchesPostRespModelMatchesList {
  GameMatchesPostRespModelMatchesList({
    required this.csIcon,
    required this.csid,
    required this.csna,
    required this.hps,
    required this.lurl,
    required this.maid,
    required this.malu,
    required this.malut,
    required this.man,
    required this.mc,
    required this.mcg,
    required this.mct,
    required this.mft,
    required this.mgt,
    required this.mhlu,
    required this.mhn,
    required this.mhs,
    required this.mid,
    required this.mlet,
    required this.mmp,
    required this.mms,
    required this.mo,
    required this.mst,
    required this.seid,
    required this.tn,
    required this.tnjc,
  });

  factory GameMatchesPostRespModelMatchesList.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameMatchesPostRespModelHps>? hps = jsonRes['hps'] is List ? <GameMatchesPostRespModelHps>[] : null;
    if (hps != null) {
      for (final dynamic item in jsonRes['hps']!) {
        if (item != null) {
          hps.add(GameMatchesPostRespModelHps.fromJson(asT<Map<String, dynamic>>("hps", item)!));
        }
      }
    }

    final List<String>? malu = jsonRes['malu'] is List ? <String>[] : null;
    if (malu != null) {
      for (final dynamic item in jsonRes['malu']!) {
        if (item != null) {
          malu.add(asT<String>("malu", item)!);
        }
      }
    }

    final List<String>? mhlu = jsonRes['mhlu'] is List ? <String>[] : null;
    if (mhlu != null) {
      for (final dynamic item in jsonRes['mhlu']!) {
        if (item != null) {
          mhlu.add(asT<String>("mhlu", item)!);
        }
      }
    }
    return GameMatchesPostRespModelMatchesList(
      csIcon: jsonRes['csIcon'] == null
          ? ''
          : asT<String>("csIcon", jsonRes['csIcon'])!,
      csid:
          jsonRes['csid'] == null ? '' : asT<String>("csid", jsonRes['csid'])!,
      csna:
          jsonRes['csna'] == null ? '' : asT<String>("csna", jsonRes['csna'])!,
      hps: hps == null ? [] : hps,
      lurl:
          jsonRes['lurl'] == null ? '' : asT<String>("lurl", jsonRes['lurl'])!,
      maid:
          jsonRes['maid'] == null ? '' : asT<String>("maid", jsonRes['maid'])!,
      malu: malu == null ? [] : malu,
      malut: jsonRes['malut'] == null
          ? ''
          : asT<String>("malut", jsonRes['malut'])!,
      man: jsonRes['man'] == null ? '' : asT<String>("man", jsonRes['man'])!,
      mc: jsonRes['mc'] == null ? 0 : asT<int>("mc", jsonRes['mc'])!,
      mcg: jsonRes['mcg'] == null ? 0 : asT<int>("mcg", jsonRes['mcg'])!,
      mct: jsonRes['mct'] == null ? '' : asT<String>("mct", jsonRes['mct'])!,
      mft: jsonRes['mft'] == null ? 0 : asT<int>("mft", jsonRes['mft'])!,
      mgt: jsonRes['mgt'] == null ? '' : asT<String>("mgt", jsonRes['mgt'])!,
      mhlu: mhlu == null ? [] : mhlu,
      mhn: jsonRes['mhn'] == null ? '' : asT<String>("mhn", jsonRes['mhn'])!,
      mhs: jsonRes['mhs'] == null ? 0 : asT<int>("mhs", jsonRes['mhs'])!,
      mid: jsonRes['mid'] == null ? '' : asT<String>("mid", jsonRes['mid'])!,
      mlet:
          jsonRes['mlet'] == null ? '' : asT<String>("mlet", jsonRes['mlet'])!,
      mmp: jsonRes['mmp'] == null ? '' : asT<String>("mmp", jsonRes['mmp'])!,
      mms: jsonRes['mms'] == null ? 0 : asT<int>("mms", jsonRes['mms'])!,
      mo: jsonRes['mo'] == null ? 0 : asT<int>("mo", jsonRes['mo'])!,
      mst: jsonRes['mst'] == null ? '' : asT<String>("mst", jsonRes['mst'])!,
      seid:
          jsonRes['seid'] == null ? '' : asT<String>("seid", jsonRes['seid'])!,
      tn: jsonRes['tn'] == null ? '' : asT<String>("tn", jsonRes['tn'])!,
      tnjc:
          jsonRes['tnjc'] == null ? '' : asT<String>("tnjc", jsonRes['tnjc'])!,
    );
  }

  String csIcon = '';
  String csid = '';
  String csna = '';
  List<GameMatchesPostRespModelHps> hps;
  String lurl = '';
  String maid = '';
  List<String> malu;
  String malut = '';
  String man = '';
  int mc = 0;
  int mcg = 0;
  String mct = '';
  int mft = 0;
  String mgt = '';
  List<String> mhlu;
  String mhn = '';
  int mhs = 0;
  String mid = '';
  String mlet = '';
  String mmp = '';
  int mms = 0;
  int mo = 0;
  String mst = '';
  String seid = '';
  String tn = '';
  String tnjc = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'csIcon': csIcon,
        'csid': csid,
        'csna': csna,
        'hps': hps,
        'lurl': lurl,
        'maid': maid,
        'malu': malu,
        'malut': malut,
        'man': man,
        'mc': mc,
        'mcg': mcg,
        'mct': mct,
        'mft': mft,
        'mgt': mgt,
        'mhlu': mhlu,
        'mhn': mhn,
        'mhs': mhs,
        'mid': mid,
        'mlet': mlet,
        'mmp': mmp,
        'mms': mms,
        'mo': mo,
        'mst': mst,
        'seid': seid,
        'tn': tn,
        'tnjc': tnjc,
      };
}

class GameMatchesPostRespModelHps {
  GameMatchesPostRespModelHps({
    required this.hl,
    required this.hpn,
  });

  factory GameMatchesPostRespModelHps.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameMatchesPostRespModelHl>? hl = jsonRes['hl'] is List ? <GameMatchesPostRespModelHl>[] : null;
    if (hl != null) {
      for (final dynamic item in jsonRes['hl']!) {
        if (item != null) {
          hl.add(GameMatchesPostRespModelHl.fromJson(asT<Map<String, dynamic>>("hl", item)!));
        }
      }
    }
    return GameMatchesPostRespModelHps(
      hl: hl == null ? [] : hl,
      hpn: jsonRes['hpn'] == null ? '' : asT<String>("hpn", jsonRes['hpn'])!,
    );
  }

  List<GameMatchesPostRespModelHl> hl;
  String hpn = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'hl': hl,
        'hpn': hpn,
      };
}

class GameMatchesPostRespModelHl {
  GameMatchesPostRespModelHl({
    required this.hs,
    required this.hv,
    required this.ol,
  });

  factory GameMatchesPostRespModelHl.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameMatchesPostRespModelOl>? ol = jsonRes['ol'] is List ? <GameMatchesPostRespModelOl>[] : null;
    if (ol != null) {
      for (final dynamic item in jsonRes['ol']!) {
        if (item != null) {
          ol.add(GameMatchesPostRespModelOl.fromJson(asT<Map<String, dynamic>>("ol", item)!));
        }
      }
    }
    return GameMatchesPostRespModelHl(
      hs: jsonRes['hs'] == null ? 0 : asT<int>("hs", jsonRes['hs'])!,
      hv: jsonRes['hv'] == null ? '' : asT<String>("hv", jsonRes['hv'])!,
      ol: ol == null ? [] : ol,
    );
  }

  int hs = 0;
  String hv = '';
  List<GameMatchesPostRespModelOl> ol;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'hs': hs,
        'hv': hv,
        'ol': ol,
      };
}

class GameMatchesPostRespModelOl {
  GameMatchesPostRespModelOl({
    required this.on,
    required this.os,
    required this.ots,
    required this.ov,
  });

  factory GameMatchesPostRespModelOl.fromJson(Map<String, dynamic> jsonRes) => GameMatchesPostRespModelOl(
        on: jsonRes['on'] == null ? '' : asT<String>("on", jsonRes['on'])!,
        os: jsonRes['os'] == null ? 0 : asT<int>("os", jsonRes['os'])!,
        ots: jsonRes['ots'] == null ? '' : asT<String>("ots", jsonRes['ots'])!,
        ov: jsonRes['ov'] == null ? 0 : asT<int>("ov", jsonRes['ov'])!,
      );

  String on = '';
  int os = 0;
  String ots = '';
  int ov = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'on': on,
        'os': os,
        'ots': ots,
        'ov': ov,
      };
}
