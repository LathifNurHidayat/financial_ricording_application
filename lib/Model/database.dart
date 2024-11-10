 import "package:drift/drift.dart";
import "package:drift/native.dart";
import "package:path/path.dart" as p;
import "package:path_provider/path_provider.dart";
import "dart:io";


class Kategori extends Table{
  IntColumn get kategori_id => integer().autoIncrement()();
  TextColumn get kategori_name => text().withLength(max: 128)();
  IntColumn get type => integer()();
  DateTimeColumn get created_at => dateTime()();
  DateTimeColumn get updated_at => dateTime()();
  DateTimeColumn get deleted_at => dateTime().nullable()(); 
}

class Transaksi extends Table{
  IntColumn get transaksi_id => integer().autoIncrement()();
  TextColumn get name => text().withLength(max: 128)();
  IntColumn get kategori_id => integer()();
  TextColumn get jumlah_transaksi => text().withLength(max : 128)();
  DateTimeColumn get tanggal_transaksi => dateTime()();
  DateTimeColumn get created_at => dateTime()();
  DateTimeColumn get updated_at => dateTime()();
  DateTimeColumn get deleted_at => dateTime()();
}