import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
import 'package:todolist_app/src/database/model/model.dart';

part 'appdatabase.g.dart';

@DriftDatabase(tables: [
  Task,
], views: [
  // TaskView,
])
class DatabaseManager extends _$DatabaseManager {
  DatabaseManager() : super(openConnection());

  // static final DatabaseManager _singleton = DatabaseManager._internal();
  //
  // factory DatabaseManager() {
  //   return _singleton;
  // }
  //
  // DatabaseManager._internal() : super(_singleton.openConnection());

  ///DAO
  // $TaskViewView? _productsDao;

  // initDao() {
  //   _productsDao = productsDao;
  // }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();
      },
    );
  }

//
// Transaction

  Future<List<TaskData>> getAllTask() => select(task).get();

  Future<int> insertTask(TaskCompanion product) => into(task).insert(product);

  Future<bool> updateTask(TaskData product) => update(task).replace(product);

  Future<int> deleteTask(int id) =>
      (delete(task)..where((p) => p.id.equals(id))).go();

  Future<List<TaskData>> searchTask(String query) =>
      (select(task)..where((p) => p.title.like('%$query%'))).get();

  // Add new method to get products with categories
  // Future<List<TaskViewData>> getAllTaskWithCategories() {
  //   return select(productsView).get();
  // }

// Add method to search products with categories
// Future<List<TaskWithCategory>> searchTaskWithCategories(String query) {
//   return (select(productsView)
//         ..where(
//             (p) => p.name.like('%$query%') | p.categoryName.like('%$query%')))
//       .map((row) => TaskWithCategory(
//             id: row.id,
//             name: row.name,
//             description: row.description,
//             unitPrice: row.unitPrice,
//             unitType: row.unitType,
//             stock: row.stock,
//             isActive: row.isActive,
//             categoryId: row.categoryId,
//             imageUrl: row.imageUrl,
//             categoryName: row.categoryName,
//             categoryDescription: row.categoryDescription,
//           ))
//       .get();
// }
}

LazyDatabase openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }
    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}
