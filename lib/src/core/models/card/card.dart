import 'package:freezed_annotation/freezed_annotation.dart';

part 'card.freezed.dart';

@freezed
class CardModel with _$CardModel {
  const factory CardModel({
    required String cardName,
    required String imageUrl,
    required String description,
  }) = _CardModel;

  const CardModel._();
}
