import 'package:drift/drift.dart';
import 'tables.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  CityTable, ExcursionImageTable, ExcursionTable,
  CategoryTable, VisitationImageTable, VisitationTable,
])
final class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;
}
