import 'package:drift/drift.dart';

class Task extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text().withLength(max: 50)();
  TextColumn get description => text().nullable()();
  DateTimeColumn get dueDate => dateTime()();
  TextColumn get status => text()();
}
