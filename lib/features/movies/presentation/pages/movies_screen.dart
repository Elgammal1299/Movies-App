import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_app/core/services/services_locator.dart';
import 'package:movies_app/core/utils/app_string.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_bloc.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_event.dart';
import 'package:movies_app/features/movies/presentation/bloc/movies_state.dart';
import 'package:movies_app/features/movies/presentation/widgets/now_playing_component.dart';
import 'package:movies_app/features/movies/presentation/widgets/popular_component.dart';
import 'package:movies_app/features/movies/presentation/widgets/top_rated_component.dart';
import 'package:movies_app/features/movies/presentation/pages/favorites_screen.dart';
import 'package:movies_app/features/movies/presentation/bloc/favorite_movies_bloc/favorite_movies_bloc.dart';
import 'package:movies_app/features/movies/presentation/pages/popular_see_more_page.dart';
import 'package:movies_app/features/movies/presentation/pages/top_rated_see_more_page.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => sl<MoviesBloc>()
            ..add(GetNowPlayingMoviesEvent())
            ..add(GetPopularMoviesEvent())
            ..add(GetTopRatedMoviesEvent()),
        ),
        BlocProvider(
          create: (_) =>
              sl<FavoriteMoviesBloc>()..add(const GetFavoriteMoviesEvent()),
        ),
      ],
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(AppString.appName),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_border),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const FavoritesScreen(),
                      ),
                    );
                  },
                ),
              ],
            ),
            body: SingleChildScrollView(
              key: const Key('movieScrollView'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NowPlayingComponent(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.popular,
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            final moviesBloc = context.read<MoviesBloc>();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: moviesBloc,
                                  child: const PopularSeeMorePage(),
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  AppString.seeMore,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const PopularComponent(),
                  Container(
                    margin: const EdgeInsets.fromLTRB(16.0, 24.0, 16.0, 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppString.topRated,
                          style: GoogleFonts.poppins(
                            fontSize: 19,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.15,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            final moviesBloc = context.read<MoviesBloc>();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => BlocProvider.value(
                                  value: moviesBloc,
                                  child: const TopRatedSeeMorePage(),
                                ),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: const [
                                Text(
                                  AppString.seeMore,
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TopRatedComponent(),
                  const SizedBox(height: 50.0),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
