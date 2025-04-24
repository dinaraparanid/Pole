import 'package:drift/drift.dart';
import 'package:pole/core/data/city/db/city_table.dart';
import 'package:pole/core/data/db/tables.dart';
import 'package:pole/core/data/visit_place/db/category_table.dart';

class VisitationTable extends Table {
  late final id = integer()();
  late final name = text()();
  late final address = text()();
  late final visitTimeHours = integer()();
  late final excursionId = integer().references(ExcursionTable, #id)();
  late final categoryId = integer().references(CategoryTable, #id)();
  late final cityId = integer().references(CityTable, #id)();
  late final startTime = dateTime()();
  late final durationMs = integer()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
