import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/movie_details_view_model.dart';
import 'widgets/loader_widget.dart';

class MovieDetailsVeiw extends StatefulWidget {
  const MovieDetailsVeiw({
    Key? key,
    required this.context,
    required this.id,
  }) : super(key: key);

  final BuildContext context;
  final int id;

  @override
  State<MovieDetailsVeiw> createState() => _MovieDetailsVeiwState();
}

class _MovieDetailsVeiwState extends State<MovieDetailsVeiw> {
  late final MovieDetailsPageViewModel viewModel;
  @override
  void initState() {
    viewModel = context.read<MovieDetailsPageViewModel>();
    viewModel.getMovieDetailsAction(widget.id);
    super.initState();
  }

  @override
  void dispose() {
    viewModel.setDetails(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        context.watch<MovieDetailsPageViewModel>().movieDetails;
    final poster = movieDetails?.posterPath;
    final overview = movieDetails?.overview;
    final title = movieDetails?.title;
    final averageVote = movieDetails?.averageVote;
    final releaseDate = movieDetails?.releaseDate;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Movie Details',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: (movieDetails?.title == null)
          ? const LoadingIndicator()
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  SizedBox(
                    height: 500,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        fit: BoxFit.cover,
                        'https://image.tmdb.org/t/p/w500/$poster',
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const LoadingIndicator();
                        },
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      RichText(
                        text: TextSpan(
                          style: Theme.of(context).textTheme.displayMedium,
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Title: ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(text: title),
                          ],
                        ),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.displayMedium,
                          children: <TextSpan>[
                            const TextSpan(
                                text: 'Overview: ',
                                style: TextStyle(fontWeight: FontWeight.w700)),
                            TextSpan(text: overview),
                          ],
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
                ]
                    .map((widget) => Padding(
                          padding: const EdgeInsets.all(10),
                          child: widget,
                        ))
                    .toList(),
              ),
            ),
    );
  }
}
