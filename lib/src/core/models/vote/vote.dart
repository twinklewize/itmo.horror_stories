import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:horror_stories/src/core/models/id/id.dart';

part 'vote.freezed.dart';

@freezed
class VoteModel with _$VoteModel {
  const factory VoteModel({
    required Id playerId,
    required Id tableCardId,
  }) = _VoteModel;

  const VoteModel._();
}
