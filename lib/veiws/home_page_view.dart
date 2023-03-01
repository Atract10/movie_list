import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import '../view_models/home_page_view_model.dart';
import 'widgets/movie_list_widget.dart';

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  final scrollController = ScrollController();

  @override
  void initState() {
    context.read<HomePageViewModel>().getMovieListAction();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homePadeViewModel = context.watch<HomePageViewModel>();
    final movieList = homePadeViewModel.movieList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Movies',
          style: Theme.of(context).textTheme.labelLarge,
        ),
      ),
      body: ListView.separated(
        controller: scrollController,
        itemCount: movieList.length,
        itemBuilder: (BuildContext context, int index) {
          homePadeViewModel.updateMovieListAction(index);
          return MovieListWidget(
            indexInList: index,
            movieList: movieList,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider(height: 10);
        },
      ),
      floatingActionButton: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: Colors.blue),
        child: CupertinoButton(
          child: const Icon(
            CupertinoIcons.arrow_up,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () => scrollController.animateTo(
            0.0,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 500),
          ),
        ),
      ),
    );
  }
}
