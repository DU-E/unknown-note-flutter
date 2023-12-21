enum EEssayCategory {
  recomm('맞춤 추천'),
  mood('감성 추천'),
  recent('최신 순'),
  rate('좋아요 순'),
  random('무작위');

  final String title;

  const EEssayCategory(this.title);
}
