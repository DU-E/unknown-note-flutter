enum EEmotion {
  normal('normal', '일반'),
  happy('happy', '행복'),
  love('love', '사랑'),
  anticipation('anticipation', '기대감'),
  thank('thank', '감사'),
  sad('sad', '슬픔'),
  rage('rage', '분노'),
  fear('fear', '두려움'),
  regret('regret', '후회');

  final String key;
  final String text;

  const EEmotion(
    this.key,
    this.text,
  );
}
