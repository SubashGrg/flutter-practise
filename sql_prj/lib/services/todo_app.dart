import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sql_prj/models/task.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  final String _tasksTableName = "tasks";
  final String _tasksIdColumnName = "id";
  final String _tasksContentColumnName = "content";
  final String _tasksStatusColumnName = "status";

  DatabaseService._constructor();

  Future<Database> getdatabse() async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final databaseDirPAth = await getDatabasesPath();
    final databasePath = join(databaseDirPAth, "masterdb.db");
    final database = await openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''CREATE TABLE $_tasksTableName(
        $_tasksIdColumnName INTEGER PRIMARY KEY,
        $_tasksContentColumnName TEXT NOT NULL,
        $_tasksStatusColumnName INTEGER NOT NULL
        )
     ''');
      },
    );
    return database;
  }

  void addTask(String content) async {
    final db = await getdatabse();
    await db.insert(_tasksTableName, {
      _tasksContentColumnName: content,
      _tasksStatusColumnName: 0,
    });
  }

  Future<List<Task>> getTasks() async {
    final db = await getdatabse();
    final data = await db.query(_tasksTableName);
    List<Task> tasks = data
        .map(
          (e) => Task(
            id: e["id"] as int,
            status: e["status"] as int,
            content: e["content"] as String,
          ),
        )
        .toList();
    return tasks;
  }

  void updateTaskStatus(int id, int status) async {
    final db = await getdatabse();
    await db.update(
      _tasksTableName,
      {_tasksStatusColumnName: status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void updateTaskContent(int id, String content) async {
    final db = await getdatabse();
    await db.update(
      _tasksTableName,
      {_tasksContentColumnName: content},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void deleteTask(int id) async {
    final db = await getdatabse();
    await db.delete(_tasksTableName, where: 'id = ?', whereArgs: [id]);
  }
}
