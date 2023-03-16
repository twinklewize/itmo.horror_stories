import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/uuid_util.dart';

class Id extends Equatable {
  factory Id.fromJson(dynamic json) {
    if (json.runtimeType == int) {
      return Id.fromInt(json as int);
    }
    if (json.runtimeType == String) {
      return Id.fromString(json as String);
    }
    // ignore: avoid_dynamic_calls
    return Id.fromString(json['id'] as String);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{'id': _id};

  final String? _id;

  const Id.absent()
      : _id = null,
        super();

  const Id.fromString(String id)
      : _id = id,
        super();

  Id.fromNumber(num id)
      : _id = id.toString(),
        super();

  Id.fromInt(int id)
      : _id = id.toString(),
        super();

  Id.fromDouble(double id)
      : _id = id.toString(),
        super();

  factory Id.generateFromRandomUUID() {
    return Id.fromString(
      const Uuid(
        options: <String, dynamic>{
          'grng': UuidUtil.cryptoRNG,
        },
      ).v4(),
    );
  }

  bool get isAbsent => _id == null;

  String parseToString() => _id!;
  num parseToNumber() => num.parse(_id!);
  int parseToInt() => int.parse(_id!);
  double parseToDouble() => double.parse(_id!);

  num? tryParseToNumber() => _id != null ? num.tryParse(_id!) : null;
  int? tryParseToInt() => _id != null ? int.tryParse(_id!) : null;
  double? tryParseToDouble() => _id != null ? double.tryParse(_id!) : null;

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [_id];
}
