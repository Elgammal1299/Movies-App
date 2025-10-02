import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/features/movies/domain/repositories/base_movies_repository.dart';

class AddToFavoriteUseCase extends BaseUseCase<bool, AddToFavoriteParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  AddToFavoriteUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, bool>> call(AddToFavoriteParameters parameters) async {
    return await baseMoviesRepository.addToFavorite(parameters);
  }
}

class AddToFavoriteParameters extends Equatable {
  final int movieId;
  final bool favorite;

  const AddToFavoriteParameters({
    required this.movieId,
    required this.favorite,
  });

  @override
  List<Object> get props => [movieId, favorite];
}