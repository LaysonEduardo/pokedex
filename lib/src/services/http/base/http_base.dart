abstract interface class HTTPServices {
  Future init() async {}

  Future<dynamic> get(String url) async {}

  Future<dynamic> post(String url) async {}
}
