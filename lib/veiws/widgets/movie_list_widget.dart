import 'package:flutter/material.dart';
import 'package:movie_list/models/movie_model.dart';
import '../../navigation.dart';
import 'loader_widget.dart';

class MovieListWidget extends StatefulWidget {
  const MovieListWidget({
    Key? key,
    required this.indexInList,
    required this.movieList,
  }) : super(key: key);
  final int indexInList;
  final List<MovieModel> movieList;

  @override
  State<MovieListWidget> createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    final listMovieIndex = widget.movieList[widget.indexInList];
    final title = listMovieIndex.title;
    final averageVote = listMovieIndex.averageVote;
    final releaseDate = listMovieIndex.releaseDate;
    final poster = listMovieIndex.posterPath;
    final id = listMovieIndex.id;

    return ColoredBox(
      color: Colors.white,
      child: ListTile(
          title: InkWell(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  SizedBox(
                    height: 150,
                    width: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500/$poster',
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const LoadingIndicator();
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 250,
                        child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            style: Theme.of(context).textTheme.displayMedium,
                            children: <TextSpan>[
                              const TextSpan(
                                  text: 'Title: ',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w700)),
                              TextSpan(text: title),
                            ],
                          ),
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.displayMedium,
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Score: ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(text: averageVote.toString()),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.displayMedium,
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Release date: ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(text: releaseDate),
                          ],
                        ),
                      ),
                    ]
                        .map((widget) => Padding(
                              padding: const EdgeInsets.all(5),
                              child: widget,
                            ))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              MainNavigationRouteNames.movieDetails,
              arguments: AgumentsNavigation(id, context),
            );
          }),
    );
  }
}
