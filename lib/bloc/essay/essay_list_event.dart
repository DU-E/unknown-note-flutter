abstract class EssayListEvent {}

class EssayListLoadEvent extends EssayListEvent {
  final String category;
  final int page;

  EssayListLoadEvent({
    required this.category,
    this.page = 1,
  });
}
