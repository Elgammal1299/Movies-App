import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/presentation/bloc/favorite_movies_bloc/favorite_movies_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          sl<FavoriteMoviesBloc>()..add(const GetFavoriteMoviesEvent()),
      child: Scaffold(
        appBar: AppBar(title: const Text('Favorites')),
        body: BlocBuilder<FavoriteMoviesBloc, FavoriteMoviesState>(
          builder: (context, state) {
            if (state.favoriteMoviesState == RequestState.loading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state.favoriteMoviesState == RequestState.error) {
              return Center(child: Text(state.favoriteMoviesMessage));
            }

            if (state.favoriteMovies.isEmpty) {
              return const Center(child: Text('No favorites yet'));
            }

            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.62,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
              ),
              itemCount: state.favoriteMovies.length,
              itemBuilder: (context, index) {
                final movie = state.favoriteMovies[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        child: CachedNetworkImage(
                          imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      movie.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
