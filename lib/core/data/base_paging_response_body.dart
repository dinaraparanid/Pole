import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_paging_response_body.freezed.dart';
part 'base_paging_response_body.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class BasePagingResponseBody<T> with _$BasePagingResponseBody<T> {
  const factory BasePagingResponseBody({
    @JsonKey(name: 'currentPage') required int currentPage,
    @JsonKey(name: 'pageCount') required int pageCount,
    @JsonKey(name: 'totalSize') required int totalSize,
    @JsonKey(name: 'elements') required List<T> response,
  }) = _BasePagingResponseBody<T>;

  factory BasePagingResponseBody.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$BasePagingResponseBodyFromJson(json, fromJsonT);
}

extension BasePagingResponseBodyExt<T> on BasePagingResponseBody<T> {
  bool get hasNext => currentPage < pageCount;
}
