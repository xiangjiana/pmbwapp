// 发送数据包
class PakageData {
  int commandId;
  int playerId;
  String body;
  PakageData(
      {required this.commandId, required this.playerId, required this.body});
}
