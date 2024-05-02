import 'package:equatable/equatable.dart';
import 'package:unknown_note_flutter/enums/enum_loading_status.dart';

abstract class BlocState extends Equatable {
  final ELoadingStatus status;
  final String? message;

  const BlocState({
    required this.status,
    this.message,
  });

  BlocState copyWith({
    ELoadingStatus? status,
    String? message,
  });
}
