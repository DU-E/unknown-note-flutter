enum EEmotion {
  happy('happy', '행복', '🤭'),
  love('love', '사랑', '🥰'),
  expect('expect', '기대감', '😏'),
  thanks('thanks', '감사', '🤗'),
  sad('sad', '슬픔', '😥'),
  anger('anger', '분노', '😡'),
  fear('fear', '두려움', '😨'),
  regret('regret', '후회', '😮‍💨');

  final String key;
  final String text;
  final String emoji;

  const EEmotion(
    this.key,
    this.text,
    this.emoji,
  );
}
