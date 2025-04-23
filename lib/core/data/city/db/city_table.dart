import 'package:drift/drift.dart';

class CityTable extends Table {
  late final id = integer()();
  late final name = text()();

  @override
  Set<Column<Object>>? get primaryKey => {id};
}
