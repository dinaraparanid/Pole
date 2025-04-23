import 'package:drift/drift.dart';
import 'package:pole/core/data/excursion/db/excursion_table.dart';

class ExcursionImageTable extends Table {
  late final id = integer().autoIncrement()();
  late final excursionId = integer().references(ExcursionTable, #id)();
  late final url = text()();
}
