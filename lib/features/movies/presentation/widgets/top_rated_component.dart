import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/network/api_constance.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_state.dart';
import 'package:shimmer/shimmer.dart';
import 'package:movies_app/features/movies/presentation/bloc/favorite_movies_bloc/favorite_movies_bloc.dart';

class TopRatedComponent extends StatelessWidget {
  const TopRatedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) =>
          previous.topRatedState != current.topRatedState,
      builder: (context, state) {
        switch (state.topRatedState) {
          case RequestState.loading:
            return const SizedBox(
              height: 170.0,
              child: Center(child: CircularProgressIndicator()),
            );
          case RequestState.loaded:
            return FadeIn(
              duration: const Duration(milliseconds: 500),
              child: SizedBox(
                height: 170.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  itemCount: state.topRatedMovies.length,
                  itemBuilder: (context, index) {
                    final movie = state.topRatedMovies[index];
                    return Container(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: InkWell(
                        onTap: () {
                          /// TODO : NAVIGATE TO  MOVIE DETAILS
                        },
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8.0),
                              ),
                              child: CachedNetworkImage(
                                width: 120.0,
                                height: 170.0,
                                fit: BoxFit.fill,
                                imageUrl: ApiConstance.imageUrl(
                                  movie.backdropPath,
                                ),
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                      baseColor: Colors.grey[850]!,
                                      highlightColor: Colors.grey[800]!,
                                      child: Container(
                                        height: 170.0,
                                        width: 120.0,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child:
                                  BlocBuilder<
                                    FavoriteMoviesBloc,
                                    FavoriteMoviesState
                                  >(
                                    builder: (context, favState) {
                                      final isFav = favState.favoriteMovies.any(
                                        (m) => m.id == movie.id,
                                      );
                                      return Material(
                                        color: Colors.black45,
                                        shape: const CircleBorder(),
                                        child: IconButton(
                                          icon: Icon(
                                            isFav
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: isFav
                                                ? Colors.red
                                                : Colors.white,
                                            size: 20,
                                          ),
                                          onPressed: () {
                                            if (isFav) {
                                              context
                                                  .read<FavoriteMoviesBloc>()
                                                  .add(
                                                    RemoveFromFavoriteEvent(
                                                      movie.id,
                                                    ),
                                                  );
                                            } else {
                                              context
                                                  .read<FavoriteMoviesBloc>()
                                                  .add(
                                                    AddToFavoriteEvent(
                                                      movie.id,
                                                    ),
                                                  );
                                            }
                                          },
                                        ),
                                      );
                                    },
                                  ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          case RequestState.error:
            return SizedBox(
              height: 170.0,
              child: Center(child: Text(state.nowPlayingMessage)),
            );
        }
      },
    );
  }
}
