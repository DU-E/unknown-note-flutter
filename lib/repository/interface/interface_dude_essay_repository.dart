import 'package:unknown_note_flutter/enums/enum_essay_category.dart';
import 'package:unknown_note_flutter/models/essay/essay_model.dart';
import 'package:unknown_note_flutter/models/res/res_model.dart';

abstract interface class IDudeEssayRepository {
  Future<ResModel<List<EssayModel>>> getEssayList({
    required EEssayCategory category,
    required int page,
  });

  Future<ResModel<List<EssayModel>>> getUserEssayList({
    required int userId,
    required int page,
  });

  Future<ResModel<EssayModel>> postEssay({
    required EssayModel essay,
  });

  Future<ResModel<EssayModel>> patchEssay({
    required EssayModel essay,
  });

  Future<ResModel<void>> postLike({
    required int essayId,
  });

  Future<ResModel<void>> deleteLike({
    required int essayId,
  });
}
