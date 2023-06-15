// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'record_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RecordApi implements RecordApi {
  _RecordApi(
    this._dio, {
    this.baseUrl,
  });

  final Dio _dio;

  String? baseUrl;

  @override
  Future<DepositDetailsPageResponse> memberRecord(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = JsonMapper.serialize(param);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<DepositDetailsPageResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/records/deposit/memberRecord',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        JsonMapper.fromMap<DepositDetailsPageResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<GameRecordMeta> all(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = JsonMapper.serialize(param);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GameRecordMeta>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/records/query/all',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<GameRecordMeta>(_result.data!)!;
    return value;
  }

  @override
  Future<GameRecordDetail> game(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = JsonMapper.serialize(param);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<GameRecordDetail>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/records/query/game',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<GameRecordDetail>(_result.data!)!;
    return value;
  }

  @override
  Future<MemberDepositRecordingPageResponse> selectDeposit(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = JsonMapper.serialize(param);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MemberDepositRecordingPageResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/records/selectDeposit',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        JsonMapper.fromMap<MemberDepositRecordingPageResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<MemberAccountRecordingPageResponse> selectMemberAccount(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = JsonMapper.serialize(param);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MemberAccountRecordingPageResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/records/selectMemberAccount',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        JsonMapper.fromMap<MemberAccountRecordingPageResponse>(_result.data!)!;
    return value;
  }

  @override
  Future<MemberWithdrawalRecordingPageResponse> selectWithdrawal(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = JsonMapper.serialize(param);
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<MemberWithdrawalRecordingPageResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/records/selectWithdrawal',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<MemberWithdrawalRecordingPageResponse>(
        _result.data!)!;
    return value;
  }

  @override
  Future<StreamDetails> streamDetails(param) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = JsonMapper.serialize(param);
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<StreamDetails>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/records/streamDetails',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = JsonMapper.fromMap<StreamDetails>(_result.data!)!;
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
