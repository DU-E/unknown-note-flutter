abstract class WriteDiaryEvent {}

class WriteDiarySetTitle extends WriteDiaryEvent {
  final String title;

  WriteDiarySetTitle({required this.title});
}

class WriteDiarySetBody extends WriteDiaryEvent {
  final String body;

  WriteDiarySetBody({required this.body});
}

class WriteDiaryUpload extends WriteDiaryEvent {}
