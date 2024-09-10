abstract interface class BaseDbHelper {
  void OpenDB();
  insertDbProduct({required String? productId});
  updateDbProduct({required String? productId});
  deleteDbProduct({required String? productId});
  getDbFavProducts();
  void CloseDB();
}
