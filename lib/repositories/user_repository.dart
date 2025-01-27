import 'dart:convert';
import 'package:simbora/http/http_client.dart';
import 'package:simbora/models/user.dart';

abstract class IUserRepository {
  Future<User?> getUser(String email, String pwd);
}

class UserRepository implements IUserRepository {
  final IHttpClient client;

  UserRepository({required this.client});

  @override
  Future<User?> getUser(String email, String pwd) async {
    final response = await client.get(url: "");

    if (response.statusCode == 200) {
      final User usuario;

      final body = jsonDecode(response.body);

      return null;
    }
  }
}
