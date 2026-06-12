
import 'package:education_live_app/core/network/supabase/database_client.dart';

class DatabaseClientImpl implements DatabaseClient {
  DatabaseClientImpl();

  @override
  Future<Map<String, dynamic>> insert(String table, Map<String, dynamic> data) async {
    // TODO: Implement insert
    throw UnimplementedError('insert not implemented yet');
  }

  @override
  Future<List<Map<String, dynamic>>> select(
    String table, {
    String columns = '*',
    Map<String, dynamic>? filters,
    String? orderBy,
    bool ascending = false,
    int? rangeFrom,
    int? rangeTo,
  }) async {
    throw UnimplementedError('select not implemented yet');
  }

  @override
  Future<Map<String, dynamic>> selectById(
    String table,
    String id, {
    String columns = '*',
  }) async {
    throw UnimplementedError('selectById not implemented yet');
  }

  @override
  Future<Map<String, dynamic>> update(String table, String id, Map<String, dynamic> data) async {
    throw UnimplementedError('update not implemented yet');
  }

  @override
  Future<void> delete(String table, String id) async {
    throw UnimplementedError('delete not implemented yet');
  }

  @override
  Future<List<Map<String, dynamic>>> search(
    String table, {
    required String column,
    required String query,
    String columns = '*',
  }) async {
    throw UnimplementedError('search not implemented yet');
  }

  @override
  Future<void> rpc(String functionName, {Map<String, dynamic>? params}) async {
    throw UnimplementedError('rpc not implemented yet');
  }
}
