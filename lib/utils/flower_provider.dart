class Flower {
  final String name;
  final String mean;
  final List<String> text;

  const Flower({
    required this.name,
    required this.mean,
    required this.text,
  });
}

class FlowerProvider {
  static final FlowerProvider _instance = FlowerProvider._();

  factory FlowerProvider() => _instance;

  FlowerProvider._();

  static const Flower happy = Flower(
    name: '복수초',
    mean: '영원한 행복',
    text: [
      '앞으로도 지금처럼 행복한 날들만 가득하길.',
      '일상 속 사소한 행복이 주는 즐거움.',
      '당신 주변도 행복이 가득하길.',
    ],
  );
  static const Flower love = Flower(
    name: '장미',
    mean: '행복한 사랑',
    text: [
      '사랑스런 하루가 계속되길.',
      '사랑은 은하수 다방에서.',
      '사랑하기 딱 좋은시기, 오늘.',
    ],
  );
  static const Flower expect = Flower(
    name: '프리지아',
    mean: '새로운 시작을 응원',
    text: [
      '새로운 시작이라는 마음으로 기다려봐요.',
      '기다림이란 즐거운 설레임.',
      '모두 잘 될거에요.',
    ],
  );
  static const Flower thanks = Flower(
    name: '민들레',
    mean: '행복과 감사',
    text: [
      '하루하루 감사하는 마음으로.',
      '내 곁에 있어주는 사람에게 감사를 전해봐요.',
      '감사함을 느낄 줄 아는 당신, 감사합니다.',
    ],
  );
  static const Flower sad = Flower(
    name: '메리골드',
    mean: '반드시 올 행복',
    text: [
      '반드시 행복한 날이 찾아올거에요.',
      '아픔은 나를 더 단단하게 만들거에요.',
      '슬픔도 당신의 일부, 힘내세요.',
    ],
  );
  static const Flower anger = Flower(
    name: '클로버',
    mean: '평화',
    text: [
      '때론 차분함이 정답을 보여주기 마련이에요.',
      '감정이 상할때는 잠깐의 휴식을 가져봐요.',
      '화 내도 괜찮지만, 감정이를 지켜주세요.',
    ],
  );
  static const Flower fear = Flower(
    name: '덧나무',
    mean: '용기',
    text: [
      '용기내어 시작해보아요.',
      '용기를 내어봐요. 세상은 용기있는 사람의 편이에요.',
      '두려움은 무지로부터 비롯돼요. 일단 시도해봐요.',
    ],
  );
  static const Flower regret = Flower(
    name: '라일락',
    mean: '젊은 날의 추억',
    text: [
      '오늘의 후화는 먼 훗날의 작은 추억.',
      '지금은 쓰지만, 미래에 같은 실수를 반복하지 않게 해줄거에요.',
      '앞으로 후회할 일 하나는 줄었다고 생각해봐요.',
    ],
  );
}
