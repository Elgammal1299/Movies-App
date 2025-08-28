import 'package:dartz/dartz.dart';
import 'package:movies_app/feature/movies/features/movies/domain/entities/movie.dart';
import 'package:movies_app/feature/movies/features/movies/domain/repositories/base_movies_repository.dart';

class GetPopularMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMoviesRepository baseMoviesRepository;

  GetPopularMoviesUseCase(this.baseMoviesRepository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMoviesRepository.getPopularMovies();
  }
}