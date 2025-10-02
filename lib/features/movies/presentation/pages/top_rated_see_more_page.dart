import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_state.dart';

class TopRatedSeeMorePage extends StatelessWidget {
  const TopRatedSeeMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Top Rated')),
      body: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state.topRatedState == RequestState.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.topRatedState == RequestState.error) {
            return Center(child: Text(state.topRatedMessage));
          }
          final movies = state.topRatedMovies;
          return ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: movies.length,
            separatorBuilder: (_, __) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final movie = movies[index];
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: CachedNetworkImage(
                      imageUrl: ApiConstance.imageUrl(movie.backdropPath),
                      width: 120,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          movie.overview,
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
