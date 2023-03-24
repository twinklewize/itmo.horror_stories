import 'package:horror_stories/src/core/exceptions/app_exception.dart';
import 'package:horror_stories/src/core/models/models.dart';
import 'package:horror_stories/src/core/services/data/dio/dio_client.dart';
import 'package:horror_stories/src/core/services/di/di.dart';
import 'package:horror_stories/src/core/services/logger/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@singleton
class GameRepository {
  final DioBackendClient backendClient;

  GameRepository(this.backendClient);

  Future<GameModel> startGame(RoomModel room) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'start_game',
      queryParameters: {'p2': room.roomInfo.roomCode.toString()},
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }

    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);

      final List<HintCardModel> hintCards = [];
      final hintCardNames = result[0]["cardName"];
      final hintCardDescriptions = result[0]["description"];
      final hintCardImageUrls = result[0]["imageUrl"];
      for (var i = 0; i < (hintCardNames as List<dynamic>).length; i++) {
        hintCards.add(
          HintCardModel(
            card: CardModel(
              cardName: hintCardNames[i],
              description: hintCardDescriptions[i],
              imageUrl: hintCardImageUrls[i],
            ),
            hintStatus: HintStatus.hand,
            canBeChoosen: true,
          ),
        );
      }

      final Id selectedCardId = Id.fromInt(result[2]["selectedCardId"][0]);

      final tableCardIds = result[1]["tableCardId"];
      final tableCardNames = result[1]["cardName"];
      final tableCardDescriptions = result[1]["description"];
      final tableCardImageUrls = result[1]["imageUrl"];
      final List<TableCardModel> tableCards = [];
      for (var i = 0; i < (tableCardIds as List<dynamic>).length; i++) {
        final tableCardId = Id.fromInt(tableCardIds[i]);
        tableCards.add(
          TableCardModel(
            isSelected: tableCardId == selectedCardId,
            tableCardId: tableCardId,
            card: CardModel(
              cardName: tableCardNames[i],
              imageUrl: tableCardImageUrls[i],
              description: tableCardDescriptions[i],
            ),
          ),
        );
      }

      final currentMove = MoveModel(remainingTime: room.roomInfo.moveTime);

      return GameModel(
        room: room,
        currentMove: currentMove,
        hintCards: hintCards,
        tableCardsInfo: TableCardsInfoModel(tableCards: tableCards),
      );
    }
    throw AppException('No results');
  }

  Future<GameModel> joinGame(RoomModel room) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'join_game',
      queryParameters: {'p2': room.roomInfo.roomCode.toString()},
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
      final tableCardIds = result[0]["tableCardId"];
      final tableCardNames = result[0]["cardName"];
      final tableCardImageUrls = result[0]["imageUrl"];
      final tableCardDescriptions = result[0]["description"];
      final List<TableCardModel> tableCards = [];
      for (var i = 0; i < (tableCardIds as List<dynamic>).length; i++) {
        tableCards.add(
          TableCardModel(
            tableCardId: Id.fromInt(tableCardIds[i]),
            card: CardModel(
              cardName: tableCardNames[i],
              imageUrl: tableCardImageUrls[i],
              description: tableCardDescriptions[i],
            ),
          ),
        );
      }

      return GameModel(
        room: room,
        currentMove: MoveModel(remainingTime: room.roomInfo.moveTime),
        tableCardsInfo: TableCardsInfoModel(tableCards: tableCards),
        hintCards: [],
      );
    }
    throw AppException('No results');
  }

  Future<GameModel> restoreGame({
    required RoomInfoModel roomInfo,
    required String nickname,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'restore_game',
      queryParameters: {'p2': roomInfo.roomCode.toString()},
    );
    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);

      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
      final isGameOver = result[0]["isGameOver"][0] == 1;
      Id playerId = Id.fromInt(result[1]["playerId"][0]);
      Id? masterId = (result[2]["masterId"] as List<dynamic>).isEmpty ? null : Id.fromInt(result[2]["masterId"][0]);
      final isMaster = playerId == masterId;
      final gamePhase = result[7]["phase"][0] == 'hints' ? GamePhase.hints : GamePhase.voting;

      final List<PlayerModel> players = [
        PlayerModel(
          playerId: playerId,
          nickname: nickname,
          isMaster: playerId == masterId,
          isPlayer: true,
        )
      ];
      final playerIds = result[3]["playerId"];
      final nicknames = result[3]["nickname"];
      for (var i = 0; i < (nicknames as List<dynamic>).length; i++) {
        final id = Id.fromInt(playerIds[i]);
        players.add(
          PlayerModel(
            nickname: nicknames[i],
            playerId: Id.fromInt(playerIds[i]),
            isMaster: id == masterId,
          ),
        );
      }

      final List<VoteModel> votes = [];
      final votesPlayerIds = result[5]["playerId"];
      final votesTableCardsIds = result[5]["tableCardId"];
      for (var i = 0; i < (votesPlayerIds as List<dynamic>).length; i++) {
        votes.add(VoteModel(
          playerId: Id.fromInt(votesPlayerIds[i]),
          tableCardId: Id.fromInt(votesTableCardsIds[i]),
        ));
      }

      Id? selectedCardId = (result[8]["selectedCardId"] as List<dynamic>?)?.isNotEmpty == true
          ? Id.fromInt(result[8]["selectedCardId"][0])
          : null;

      final List<TableCardModel> tableCards = [];
      final tableCardIds = result[4]["tableCardId"];
      final tableCardNames = result[4]["cardName"];
      final tableCardDescriptions = result[4]["description"];
      final tableCardImageUrls = result[4]["imageUrl"];
      final isOnTables = result[4]["isOnTable"];

      final remainingTime = result[7]["remainingTime"][0];
      final currentMove = MoveModel(
        roundNumber: result[7]["roundNumber"][0],
        phase: gamePhase,
        remainingTime: remainingTime < 0 ? 0 : remainingTime,
        cardsToRemoveCount: result[7]["cardsToRemoveCount"] != null ? result[7]["cardsToRemoveCount"][0] : null,
        isGameOver: isGameOver,
      );

      final haveRemainingVotes =
          (currentMove.cardsToRemoveCount ?? 0) > votes.where((vote) => vote.playerId == playerId).length;

      for (var i = 0; i < (tableCardIds as List<dynamic>).length; i++) {
        final tableCardId = Id.fromInt(tableCardIds[i]);
        final isOnTable = isOnTables[i] == 1;
        final isNotVotedByThisPlayer =
            votes.where((element) => element.tableCardId == tableCardId && element.playerId == playerId).isEmpty;
        tableCards.add(
          TableCardModel(
            isSelected: tableCardId == selectedCardId,
            tableCardId: tableCardId,
            card: CardModel(
              cardName: tableCardNames[i],
              imageUrl: tableCardImageUrls[i],
              description: tableCardDescriptions[i],
            ),
            isOnTable: isOnTable,
            canBeVoted: haveRemainingVotes &&
                !isMaster &&
                gamePhase == GamePhase.voting &&
                isOnTable &&
                !isGameOver &&
                isNotVotedByThisPlayer,
            votesCount: votes.where((element) => element.tableCardId == tableCardId).length,
          ),
        );
      }

      final List<HintCardModel> hintCards = [];
      if (result[6]["cardName"] != null) {
        final hintCardNames = result[6]["cardName"];
        final hintCardDescriptions = result[6]["description"];
        final hintCardImageUrls = result[6]["imageUrl"];
        final hintCardStatuses = result[6]["hintStatus"];

        for (var i = 0; i < (hintCardNames as List<dynamic>).length; i++) {
          final hintStatus = hintCardStatuses[i] == 'connected'
              ? HintStatus.connected
              : hintCardStatuses[i] == 'notConnected'
                  ? HintStatus.notConnected
                  : HintStatus.hand;
          hintCards.add(
            HintCardModel(
              card: CardModel(
                cardName: hintCardNames[i],
                description: hintCardDescriptions[i],
                imageUrl: hintCardImageUrls[i],
              ),
              hintStatus: hintStatus,
              canBeChoosen: isMaster && gamePhase == GamePhase.hints && !isGameOver,
            ),
          );
        }
      }

      final room = RoomModel(
        roomInfo: roomInfo,
        players: players,
        isGameStarted: true,
      );

      return GameModel(
        room: room,
        currentMove: currentMove,
        hintCards: hintCards,
        tableCardsInfo: TableCardsInfoModel(
          tableCards: tableCards,
          votes: votes,
        ),
      );
    }
    throw AppException('No results');
  }

  Future<GameModel> updateGame(GameModel game) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'update_game',
      queryParameters: {
        'p2': game.room.roomInfo.roomCode.toString(),
      },
    );

    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }

    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);

      final isGameOver = result[0]["isGameOver"][0] == 1;

      final otherActivePlayersIds =
          (result[3]["playerId"] as List<dynamic>).map((element) => Id.fromInt(element)).toList();
      final players = [
        game.room.players.firstWhere((element) => element.isPlayer),
        ...game.room.players.where((element) => otherActivePlayersIds.contains(element.playerId))
      ];

      if ((result[5]["roundNumber"] as List<dynamic>?)?.isNotEmpty == true) {}

      final roundNumber = result[5]["roundNumber"][0];
      final gamePhase = result[5]["phase"][0] == 'hints' ? GamePhase.hints : GamePhase.voting;
      final remainingTime = result[5]["remainingTime"][0];
      final cardsToRemoveCount = (result[5]["cardsToRemoveCount"] as List<dynamic>?)?.isNotEmpty != true
          ? null
          : result[5]["cardsToRemoveCount"][0];

      final currentMove = MoveModel(
        roundNumber: roundNumber,
        phase: gamePhase,
        remainingTime: remainingTime < 0 ? 0 : remainingTime,
        cardsToRemoveCount: cardsToRemoveCount,
        isGameOver: isGameOver,
      );

      List<HintCardModel> hintCards = [];
      if (result[6]["cardName"] != null) {
        final hintCardNames = result[6]["cardName"];
        final hintCardDescriptions = result[6]["description"];
        final hintCardImageUrls = result[6]["imageUrl"];
        final hintCardStatuses = result[6]["hintStatus"];

        for (var i = 0; i < (hintCardNames as List<dynamic>).length; i++) {
          final hintStatus = hintCardStatuses[i] == 'connected'
              ? HintStatus.connected
              : hintCardStatuses[i] == 'notConnected'
                  ? HintStatus.notConnected
                  : HintStatus.hand;
          final card = CardModel(
            cardName: hintCardNames[i],
            description: hintCardDescriptions[i],
            imageUrl: hintCardImageUrls[i],
          );
          hintCards.add(
            HintCardModel(
              card: card,
              hintStatus: hintStatus,
            ),
          );
        }
      } else {
        hintCards = [
          ...game.hintCards.map((e) => e.copyWith(canBeChoosen: gamePhase == GamePhase.hints && !isGameOver))
        ];
      }

      Id? selectedCardId =
          (result[1]["selectedCardId"] as List<dynamic>).isEmpty ? null : Id.fromInt(result[1]["selectedCardId"][0]);

      final playerId = players.firstWhere((element) => element.isPlayer).playerId;

      final List<VoteModel> votes = [];

      if (gamePhase == GamePhase.voting) {
        final votesPlayerIds = result[4]["playerId"];
        final votesTableCardsIds = result[4]["tableCardId"];

        final List<VoteModel> otherPLayersVotes = [];
        for (var i = 0; i < (votesPlayerIds as List<dynamic>).length; i++) {
          otherPLayersVotes.add(VoteModel(
            playerId: Id.fromInt(votesPlayerIds[i]),
            tableCardId: Id.fromInt(votesTableCardsIds[i]),
          ));
        }

        votes.addAll(otherPLayersVotes);
      }
      if (gamePhase == GamePhase.voting && roundNumber == game.currentMove.roundNumber) {
        votes.addAll(game.tableCardsInfo.votes.where((element) => element.playerId == playerId));
      }
      if (isGameOver) votes.clear();

      final isMaster = players.where((element) => element.isMaster && element.isPlayer).isNotEmpty;

      final haveRemainingVotes =
          (currentMove.cardsToRemoveCount ?? 0) > votes.where((vote) => vote.playerId == playerId).length;

      final activeTableCardIds =
          (result[2]["tableCardId"] as List<dynamic>).map((tableCardId) => Id.fromInt(tableCardId)).toList();
      final tableCards = game.tableCardsInfo.tableCards.map((tableCard) {
        final isOnTable = activeTableCardIds.contains(tableCard.tableCardId);
        final isSelected = tableCard.isSelected == true ? true : tableCard.tableCardId == selectedCardId;
        final isNotVotedByThisPlayer = votes
            .where((element) => element.tableCardId == tableCard.tableCardId && element.playerId == playerId)
            .isEmpty;

        return TableCardModel(
            tableCardId: tableCard.tableCardId,
            card: tableCard.card,
            isOnTable: isOnTable,
            isSelected: isSelected,
            votesCount: votes.where((element) => element.tableCardId == tableCard.tableCardId).length,
            canBeVoted: haveRemainingVotes &&
                !isMaster &&
                gamePhase == GamePhase.voting &&
                isOnTable &&
                !isGameOver &&
                isNotVotedByThisPlayer);
      }).toList();

      return GameModel(
        currentMove: currentMove,
        hintCards: hintCards,
        room: RoomModel(
          roomInfo: game.room.roomInfo,
          players: players,
        ),
        tableCardsInfo: TableCardsInfoModel(
          tableCards: tableCards,
          votes: votes,
        ),
      );
    }

    throw AppException('No results');
  }

  Future<void> vote({
    required GameModel game,
    required Id tableCardId,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'vote',
      queryParameters: {'p2': tableCardId.parseToString()},
    );
    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);
      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
      return;
    }
    throw AppException('No results');
  }

  Future<GameModel> addHint({
    required GameModel game,
    required String cardName,
    required HintStatus hintStatus,
  }) async {
    final response = await backendClient.get<Map<String, dynamic>>(
      path: 'add_hint',
      queryParameters: {
        'p2': game.room.roomInfo.roomCode.toString(),
        'p3': cardName,
        'p4': hintStatus.name,
      },
    );
    final error = response?["ERROR"] as String?;
    final result = response?["RESULTS"] as List<dynamic>?;

    if (error != null) {
      getIt.get<AppLogger>().logger.log(Level.error, error);

      throw AppException(error);
    }
    if (result != null) {
      getIt.get<AppLogger>().logger.log(Level.info, result);
      final CardModel? newHint;
      final List<HintCardModel> hintCards = [];
      if (result[0]["cardName"] != null) {
        final cardName = result[0]["cardName"][0];
        final imageUrl = result[0]["imageUrl"][0];
        final description = result[0]["description"][0];
        newHint = CardModel(
          cardName: cardName,
          imageUrl: imageUrl,
          description: description,
        );
        hintCards.add(HintCardModel(
          card: newHint,
          hintStatus: HintStatus.hand,
        ));
      }
      hintCards.addAll([
        HintCardModel(
          card: game.hintCards.firstWhere((element) => element.card.cardName == cardName).card,
          hintStatus: hintStatus,
        ),
        ...game.hintCards.where((element) => element.card.cardName != cardName),
      ]);
      return game.copyWith(
          hintCards: hintCards.map((e) => e.copyWith(canBeChoosen: false)).toList(),
          currentMove: game.currentMove.copyWith(
              phase: GamePhase.voting,
              roundNumber: game.currentMove.roundNumber + 1,
              remainingTime: game.room.roomInfo.moveTime));
    }
    throw AppException('No results');
  }
}
