import 'dart:io';

class NetgenPaths {
  static String netgen = '/lib/';
  static String utils = netgen + 'utils/';
  static String adaptor = netgen + 'adaptor/';
  static String genApi = netgen + 'gen/api/';
  static String genMod = netgen + 'gen/mod/';

  static String templates = '/lib/templates/';
  static String tempUtils = templates + 'utils/';

  static List<String> getPaths = [utils, adaptor, genApi, genMod];

  static String getUtilsPath(Directory workspace) {
    return workspace.path + utils;
  }

  static String getAdaptorPath(Directory workspace) {
    return workspace.path + adaptor;
  }

  static String getGenAPiPath(Directory workspace) {
    return workspace.path + genApi;
  }

  static String getGenModPath(Directory workspace) {
    return workspace.path + genMod;
  }

  static String getTempUtilsPath(Directory scriptspace) {
    return scriptspace.path + tempUtils;
  }
}
