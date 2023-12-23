abstract class WriteEssayEvent {}

class WriteEssaySetTitle extends WriteEssayEvent {
  final String title;

  WriteEssaySetTitle({required this.title});
}

class WriteEssaySetBody extends WriteEssayEvent {
  final String body;

  WriteEssaySetBody({required this.body});
}

class WriteEssayUpload extends WriteEssayEvent {}
