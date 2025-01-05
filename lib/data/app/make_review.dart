import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myclinic/utils/http/http.dart';

class MakeReviewService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<String?> getToken() async {
    return await _storage.read(key: 'token');
  }

  Future<String?> getID() async {
    return await _storage.read(key: 'id');
  }

  Future<dynamic> makeReview({
    required String docotrID,
    required String userName,
    required int rating,
    required String comment,
  }) async {
    try {
      String? token = await getToken();
      String? id = await getID();
      dynamic res = await KHTTP.post(
        endpoint: "/doctors/$docotrID/reviews",
        token: token,
        body: {
          "userId": id,
          "userName": userName,
          "rating": rating,
          "comment": comment,
        },
      );

      return res;
    } catch (e) {
      throw Exception("Server Error: ${e.toString()}");
    }
  }
}
