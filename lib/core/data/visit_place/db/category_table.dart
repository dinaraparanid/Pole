import 'package:drift/drift.dart';

class CategoryTable extends Table {
  late final id = integer()();
  late final name = text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
