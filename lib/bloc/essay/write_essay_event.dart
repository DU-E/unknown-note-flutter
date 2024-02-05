abstract class WriteEssayEvent {}

class WriteEssaySetTitle extends WriteEssayEvent {
  final String title;

  WriteEssaySetTitle({required this.title});
}

class WriteEssaySetContent extends WriteEssayEvent {
  final String content;

  WriteEssaySetContent({required this.content});
}

class WriteEssayUpload extends WriteEssayEvent {}
