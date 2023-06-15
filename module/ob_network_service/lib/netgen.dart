import 'dart:convert';
import 'dart:io';

import 'package:repository/models/json_to_dart_controller.dart';
import 'package:repository/netgen_paths.dart';
import 'package:repository/templates/adaptor_ts.dart';
import 'package:repository/templates/apis_ts.dart';
import 'package:repository/templates/apis_without_req_ts.dart';
import 'package:repository/templates/model_ts.dart';
import 'package:path/path.dart';
import 'package:yaml/yaml.dart';

var groupApiImports = {};
// var groupApiRequests = <String, List<Map>>{};

bool checkIfWorkspace(Directory workspace) {
  if (File(workspace.path + '/pubspec.yaml').existsSync()) {
    return true;
  }
  return false;
}

void prepareNetgenDirs(Directory workspace) {
  NetgenPaths.getPaths.forEach((element) {
    Directory('${workspace.path + element}').createSync(recursive: true);
  });
}

void prepareNetgenFiles(Directory workspace, Directory scriptspace) {
  // 复制 utils 等文件
  var tempUtilsDir = Directory(NetgenPaths.getTempUtilsPath(scriptspace));
  var netUtilsPath = NetgenPaths.getUtilsPath(workspace);

  tempUtilsDir.listSync().forEach((f) {
    File(f.path).copySync(netUtilsPath + basename(f.path));
  });
}

List<FileSystemEntity> getYamlsInWorkspace(Directory workspace) {
  var files = <FileSystemEntity>[];
  workspace.listSync(recursive: true).forEach((file) {
    if (file.path.endsWith('.yaml') || file.path.endsWith('.yml')) {
      files.add(file);
    }
  });

  return files;
}

Map<String, List<YamlMap>> tryDecodeData(List<FileSystemEntity> files) {
  var groups = <String, List<YamlMap>>{};
  files.forEach((element) {
    YamlMap yaml = loadYaml(File(element.path).readAsStringSync());
    if (!(yaml.containsKey('method') || yaml.containsKey('uri'))) return;

    String groupName = yaml['group'] ?? 'def';
    if (groups[groupName] == null) {
      groups[groupName] = <YamlMap>[yaml];
    } else {
      groups[groupName]?.add(yaml);
    }
  });
  return groups;
}

String genModel(String fileName, Directory workspace, Map model) {
  var path = NetgenPaths.getGenModPath(workspace);

  var className = '${fileName}_model';
  var fullPath = '$path$className.dart';

  var vars = '';
  var fromJson = '';
  var toJson = '';

  var modString = JsonToDartController()
      .formatJson(_dashToHump(className), jsonEncode(model));
  // model.forEach((key, value) {
  //   if (value is String) {
  //     vars = vars + ModelTs.s.replaceAll('<#>', key);
  //     fromJson = fromJson + ModelTs.s_tr.replaceAll('<#>', key) + ',';
  //   } else if (value == null) {
  //     vars = vars + ModelTs.s.replaceAll('<#>', key);
  //     fromJson = fromJson + ModelTs.s_tr.replaceAll('<#>', key) + ',';
  //   } else if (value is double) {
  //     vars = vars + ModelTs.d.replaceAll('<#>', key);
  //     fromJson = fromJson + ModelTs.d_tr.replaceAll('<#>', key) + ',';
  //   } else if (value is int) {
  //     vars = vars + ModelTs.d.replaceAll('<#>', key);
  //     fromJson = fromJson + ModelTs.d_tr.replaceAll('<#>', key) + ',';
  //   } else if (value is bool) {
  //     vars = vars + ModelTs.b.replaceAll('<#>', key);
  //     fromJson = fromJson + ModelTs.b_tr.replaceAll('<#>', key) + ',';
  //   } else if (value is List) {
  //     vars = vars + ModelTs.l.replaceAll('<#>', key);
  //     fromJson = fromJson + ModelTs.l_tr.replaceAll('<#>', key) + ',';
  //   } else if (value is Map) {
  //     vars = vars + ModelTs.m.replaceAll('<#>', key);
  //     fromJson = fromJson + ModelTs.m_tr.replaceAll('<#>', key) + ',';
  //   }

  //   toJson = toJson + ModelTs.toJsonMap.replaceAll('<#>', key);
  // });

  // //
  // if (fromJson.isNotEmpty) {
  //   fromJson = fromJson.substring(0, fromJson.length - 1) + ';';
  // }

  // toJson = ModelTs.toJson.replaceAll('<#>', toJson);
  // // 拼接文件内容
  // var modString = ModelTs.fromJson
  //     .replaceAll('<#ClassName>', _dashToHump(className))
  //     .replaceAll('<#Vars>', vars)
  //     .replaceAll('<#Constructor>', '${_dashToHump(className)}();')
  //     .replaceAll('<#FromJson>', fromJson)
  //     .replaceAll('<#ToJson>', toJson);

  // 写入文件
  File(fullPath).writeAsStringSync(modString);
  _mergeGroupApiImport('import \'../mod/${fileName}_model.dart\';');
  return fullPath;
}

String genAdaptor(String fileName, Directory workspace, {override = false}) {
  var path = NetgenPaths.getAdaptorPath(workspace);
  var fullPath = '$path${fileName}_adaptor.dart';

  var modString = AdaptorTs.importTs
      .replaceAll('<#ClassName>', _dashToHump(fileName))
      .replaceAll('<#FileName>', fileName);

  _mergeGroupApiImport('import \'../../adaptor/${fileName}_adaptor.dart\';');
  // 判断是否需要覆盖
  var file = File(fullPath);
  if (!override && file.existsSync()) return 'skip because exists : $fullPath';
  // 写入文件
  file.writeAsStringSync(modString);
  return fullPath;
}

void genApis(Map<String, List> groupMap, Directory workspace) {
  groupMap.forEach((group, ymls) {
    var groupName = group[0].toUpperCase() + group.substring(1);
    var apis = '';
    ymls.forEach((yml) {
      var fileName = "${yml['group']}_${yml['name']}_${yml['method']}";
      var method = yml['method'];
      var uri = yml['uri'];

      var hasReq = yml['req'] == null ? false : true;
      var preApiClass =
          hasReq == true ? ApisTs.api_ts : ApisWithoutReqTs.api_ts;
      var api = preApiClass
          .replaceAll('<#ApiNameLower>', _dashToHumpLowerFirst(fileName))
          .replaceAll('<#ApiName>', _dashToHump(fileName))
          .replaceAll('<#Method>', method?.toLowerCase() ?? 'get')
          .replaceAll('<#Uri>', uri);
      apis += api;
    });

    var contents = ApisTs.apis_ts
        .replaceAll('<#MoreImps>', groupApiImports[group] ?? '')
        .replaceAll('<#GroupName>', groupName)
        .replaceAll('<#Apis>', apis);

    var savedPath = NetgenPaths.getGenAPiPath(workspace);
    File(savedPath + '${group}_apis.dart').writeAsStringSync(contents);
  });
}

void recordImports(String imports) {}

String _dashToHump(String dashString) {
  var humpStr = '';
  dashString.split('_').forEach((s) {
    humpStr += '${s[0].toUpperCase()}${s.substring(1)}';
  });
  return humpStr;
}

String _dashToHumpLowerFirst(String dashString) {
  var s = _dashToHump(dashString);
  var humpStr = '${s[0].toLowerCase()}${s.substring(1)}';
  return humpStr;
}

void _mergeGroupApiImport(String importString) {
  var group = importString.split('/').removeLast().split('_')[0];
  var g = groupApiImports[group] ?? '';
  g += importString + '\n';
  groupApiImports[group] = g;
}

// void mergeGroupApiRequest(String group, Map yml) {
//   var filenames = groupApiRequests[group] ?? [];
//   filenames.add({
//     'yml': yml,
//     'group': group,
//   });
//   groupApiRequests[group] = filenames;
// }
