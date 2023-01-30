import 'package:cachingdata_and_filedownloading/data/models/product_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  Database? database;
  String tableName = "products";

  Future<Database> getDb() async {
    if (database == null) {
      database = await createDatabase();
      return database!;
    }
    return database!;
  }

  createDatabase() async {
    String databasesPath = await getDatabasesPath();
    String dbPath = '${databasesPath}products.db';

    var database = await openDatabase(dbPath, version: 1, onCreate: populateDb);
    return database;
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE $tableName ("
        "${ProductFields.id} INTEGER,"
        "${ProductFields.categoryId} INTEGER,"
        "${ProductFields.name} TEXT,"
        "${ProductFields.price} INTEGER,"
        "${ProductFields.imageUrl} TEXT"
        ")");
  }

  Future addProduct(ProductModel product) async {
    Database db = await getDb();
    await db.insert(tableName, product.toJson());
  }

  Future<List> getAllProduct() async {
    Database db = await getDb();

    var result = await db.query(tableName, columns: [
      ProductFields.id,
      ProductFields.categoryId,
      ProductFields.name,
      ProductFields.price,
      ProductFields.imageUrl
    ]);

    return result.toList();
  }

  Future<int> deleteAllData() async {
    Database db = await getDb();
    return await db.delete(tableName);
  }
}
