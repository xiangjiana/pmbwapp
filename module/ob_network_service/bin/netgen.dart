import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:repository/netgen.dart';
import 'package:socket_io_client/socket_io_client.dart';

void main(List<String> arguments) async {
  final workspace;
  if (arguments.isNotEmpty) {
    workspace = Directory(arguments[0]);
  } else {
    workspace = Directory.current;
  }

  var scriptspace;

  if (arguments.isNotEmpty) {
    scriptspace = workspace;
  } else {
    scriptspace =
        Directory(dirname(Platform.script.toString().substring(7))).parent;
    if (!checkIfWorkspace(workspace)) {
      print('请在项目下打开');
      exit(-1);
    }
  }

  print('当前工作目录 $workspace \n当前脚本目录 $scriptspace \n');

  // 判断工作路径

  // 复制 utils 文件创建目录 并 处理
  prepareNetgenDirs(workspace);
  // prepareNetgenFiles(workspace, scriptspace);
  Map<String, int> cache = Map<String, int>();
  // 遍历取所有 yaml 结尾文件并解析，根据 group 分类
  var yamlMaps = tryDecodeData(getYamlsInWorkspace(workspace));

  // 根据 yamlMap 生成对应的 reqModel reqAdaptor respModel respAdaptor subRespModel
  yamlMaps.forEach((key, yMaps) {
    yMaps.forEach((yMap) {
      var group = yMap['group'];
      var fileName = "${yMap['group']}_${yMap['name']}_${yMap['method']}";
      var respMap = yMap['resp'];
      var reqMap = yMap['req'];
      Map subMap = yMap['resp_subs'] ?? {};
      if (respMap != null) {
        genModel('${fileName}_resp', workspace, respMap);
        genAdaptor('${fileName}_resp', workspace);
      }

      if (reqMap != null) {
        genModel('${fileName}_req', workspace, reqMap);
      }

      subMap.forEach((key, value) {
        if (value == null) return;
        genModel('${fileName}_${key}_sub_resp', workspace, value);
      });
      cache[yMap['uri']] = 60;
    });
  });
  File("a.json").writeAsStringSync(jsonEncode(cache));
  // 生成 请求入口 apis
  genApis(yamlMaps, workspace);

  // fmt dart 文件
  print('begin fmt codes in ${workspace.path}');
  await Process.run('dart', ['format', workspace.path])
      .then((ProcessResult results) {
    print(results.stdout);
  });
}
