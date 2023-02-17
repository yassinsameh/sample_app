abstract class DataSourceUtils {
  static Map<String, dynamic> mergeDataWithId(
      {required String id, required Map<String, dynamic> json}) {
    json["id"] = id;
    return json;
  }
}
