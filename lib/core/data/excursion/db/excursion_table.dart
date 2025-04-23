import 'package:drift/drift.dart';
import 'package:pole/core/data/visit_place/db/visitation_table.dart';

class ExcursionTable extends Table {
  late final id = integer()();
  late final name = text()();
  late final visitationId = integer().references(VisitationTable, #id)();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
