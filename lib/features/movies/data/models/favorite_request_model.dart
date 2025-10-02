class FavoriteRequestModel {
  final String mediaType;
  final int mediaId;
  final bool favorite;

  const FavoriteRequestModel({
    required this.mediaType,
    required this.mediaId,
    required this.favorite,
  });

  Map<String, dynamic> toJson() {
    return {
      'media_type': mediaType,
      'media_id': mediaId,
      'favorite': favorite,
    };
  }
}