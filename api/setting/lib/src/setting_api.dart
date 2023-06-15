import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'setting_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class SettingApi {
  factory SettingApi(Dio dio, {String baseUrl}) = _SettingApi;

  @POST('/setting/addFeedBack')
  Future<void> addFeedBack(@Body() AddFeedbackParam param);

  @POST('/setting/feedBackList')
  Future<FeedbackPageResponse> feedBackList(@Body() PageParam param);

  @POST('/setting/languageList')
  Future<List<Language>> languageList();

  @POST('/setting/upload')
  Future<UploadAvatar> upload(
    @Part(name: 'file') List<int> file,
    @SendProgress() ProgressCallback? onSendProgress,
  );
}
