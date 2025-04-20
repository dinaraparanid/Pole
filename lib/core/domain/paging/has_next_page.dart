import 'package:freezed_annotation/freezed_annotation.dart';

part 'has_next_page.freezed.dart';
part 'has_next_page.g.dart';

@freezed
abstract class HasNextPage with _$HasNextPage {
  const factory HasNextPage({required bool value}) = _HasNextPage;

  factory HasNextPage.fromJson(Map<String, dynamic> json) =>
    _$HasNextPageFromJson(json);
}
