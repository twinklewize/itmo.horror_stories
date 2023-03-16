import 'package:hive/hive.dart';

part 'session.g.dart';

@HiveType(typeId: 1)
class SessionModel extends HiveObject {
  @HiveField(0)
  String token;

  @HiveField(1)
  String refreshToken;

  @HiveField(2)
  String nickname;

  SessionModel({
    required this.token,
    required this.refreshToken,
    required this.nickname,
  });

  @override
  String toString() {
    return '$token: $refreshToken $nickname';
  }
}
