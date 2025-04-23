import 'package:drift/drift.dart';
import 'package:pole/core/data/visit_place/db/visitation_table.dart';

class VisitationImageTable extends Table {
  late final id = integer().autoIncrement()();
  late final url = text()();
  late final visitationId = integer().references(VisitationTable, #id)();
}
