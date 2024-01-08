import 'package:equatable/equatable.dart';

class OAuth2Model extends Equatable {
  final String token;
  // final String id;

  const OAuth2Model({
    required this.token,
    // required this.id,
  });

  @override
  List<Object?> get props => [
        token,
        // id,
      ];
}
