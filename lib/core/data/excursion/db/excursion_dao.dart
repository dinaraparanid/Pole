import 'package:dartx/dartx.dart';
import 'package:drift/drift.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:pole/core/data/db/app_database.dart';
import 'package:pole/core/data/db/tables.dart';
import 'package:pole/core/domain/city/entity/mod.dart';
import 'package:pole/core/domain/excursion/entity/mod.dart';
import 'package:pole/core/domain/visit_place/entity/mod.dart';

part 'excursion_dao.g.dart';

@DriftAccessor(tables: [
  CityTable, ExcursionImageTable, ExcursionTable,
  CategoryTable, VisitationImageTable, VisitationTable,
])
class ExcursionDao extends DatabaseAccessor<AppDatabase> with _$ExcursionDaoMixin {
  ExcursionDao(super.db);

  Future<IList<Excursion>> excursions({required String searchQuery}) => transaction(() async {
    final excursions = await switch (searchQuery.isEmpty) {
      true => select(excursionTable),
      false => select(excursionTable)..where((t) => t.name.equals(searchQuery)),
    }.get();

    final excursionImages = await select(excursionImageTable).get();
    final visitations = await select(visitationTable).get();
    final visitationImages = await select(visitationImageTable).get();
    final cities = await select(cityTable).get();
    final categories = await select(categoryTable).get();

    return excursions.map((e) {
      final images = excursionImages
        .where((i) => i.excursionId == e.id)
        .map((i) => i.url)
        .toIList();

      final excursionVisitations = visitations
        .where((v) => v.excursionId == e.id)
        .map((v) {
          final city = cities.firstWhere((c) => c.id == v.cityId);
          final category = categories.firstWhere((c) => c.id == v.categoryId);
          final images = visitationImages
            .where((i) => i.visitationId == v.id)
            .map((i) => i.url)
            .toIList();

          return Visitation(
            startTime: v.startTime,
            duration: Duration(milliseconds: v.durationMs),
            place: VisitPlace(
              id: v.id,
              name: v.name,
              category: PlaceCategory(
                id: PlaceCategoryId(value: category.id),
                name: category.name,
              ),
              address: v.address,
              visitTimeHours: v.visitTimeHours,
              images: images,
              city: City(id: CityId(value: city.id), name: city.name),
            ),
          );
        })
        .toIList();

        return Excursion(
          id: ExcursionId(value: e.id),
          info: ExcursionInfo(
            city: excursionVisitations.first.place.city,
            name: ExcursionName(value: e.name),
            images: images,
            visitations: excursionVisitations,
          )
        );
    }).toIList();
  });

  Future<void> insertExcursion({required Excursion excursion}) => transaction(() async {
    await into(excursionTable).insertOnConflictUpdate(
      ExcursionTableCompanion.insert(
        id: Value(excursion.id.value),
        name: excursion.info.name.value,
      ),
    );

    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        excursionImageTable,
        excursion.info.images.map((i) => ExcursionImageTableCompanion.insert(
          excursionId: excursion.id.value,
          url: i,
        )),
      );
    });

    await into(cityTable).insertOnConflictUpdate(
      CityTableCompanion.insert(
        id: Value(excursion.info.city.id.value),
        name: excursion.info.city.name,
      ),
    );

    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        categoryTable,
        excursion.info.visitations
          .map((v) => v.place.category)
          .distinct()
          .map((c) => CategoryTableCompanion.insert(
            id: Value(c.id.value),
            name: c.name,
          )),
      );
    });

    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        visitationTable,
        excursion.info.visitations.map((v) => VisitationTableCompanion.insert(
          id: Value(v.place.id),
          name: v.place.name,
          address: v.place.address,
          visitTimeHours: v.place.visitTimeHours,
          excursionId: excursion.id.value,
          categoryId: v.place.category.id.value,
          cityId: v.place.city.id.value,
          startTime: v.startTime,
          durationMs: v.duration.inMilliseconds,
        )),
      );
    });

    await batch((batch) {
      batch.insertAllOnConflictUpdate(
        visitationImageTable,
        excursion.info.visitations
          .flatMap((v) => v.place.images.map((u) => (v.place.id, u)))
          .map((idWithUrl) => VisitationImageTableCompanion.insert(
            url: idWithUrl.$2,
            visitationId: idWithUrl.$1,
          )),
      );
    });
  });
}
