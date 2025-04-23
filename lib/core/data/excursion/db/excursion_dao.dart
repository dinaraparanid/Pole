import 'package:drift/drift.dart';
import 'package:pole/core/data/db/app_database.dart';
import 'package:pole/core/data/db/tables.dart';

part 'excursion_dao.g.dart';

@DriftAccessor(tables: [
  CityTable, ExcursionImageTable, ExcursionTable,
  CategoryTable, VisitationImageTable, VisitationTable,
])
class ExcursionDao extends DatabaseAccessor<AppDatabase> with _$ExcursionDaoMixin {
  ExcursionDao(super.db);
}
