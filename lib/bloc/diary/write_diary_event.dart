abstract class WriteDiaryEvent {}

class WriteDiarySetContent extends WriteDiaryEvent {
  final String content;

  WriteDiarySetContent({required this.content});
}

class WriteDiaryUpload extends WriteDiaryEvent {}
