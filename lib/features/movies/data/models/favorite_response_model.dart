import 'package:equatable/equatable.dart';

class FavoriteResponseModel extends Equatable {
  final int statusCode;
  final String statusMessage;

  const FavoriteResponseModel({
    required this.statusCode,
    required this.statusMessage,
  });

  factory FavoriteResponseModel.fromJson(Map<String, dynamic> json) {
    return FavoriteResponseModel(
      statusCode: json['status_code'],
      statusMessage: json['status_message'],
    );
  }

  @override
  List<Object?> get props => [statusCode, statusMessage];
}