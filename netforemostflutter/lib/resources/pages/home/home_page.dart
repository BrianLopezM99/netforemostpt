import 'package:flutter/material.dart';
import 'package:netforemostflutter/resources/pages/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netforemostflutter/resources/widgets/article_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    super.initState();
    homeBloc.add(HomeInitialEvent());
  }

  @override
  void dispose() {
    homeBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Articles DEMO By Brian Lopez 🚀")),
      body: Column(
        children: [
          Expanded(
            child: BlocConsumer<HomeBloc, HomeState>(
              listenWhen: (previous, current) => current is HomeInitial,
              buildWhen: (previous, current) => current is! HomeInitial,
              bloc: homeBloc,
              listener: (context, state) {
                if (state is HomeErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is HomeInitial) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is HomeLoadedState) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      homeBloc.add(HomeInitialEvent());
                      await Future.delayed(
                          const Duration(seconds: 2)); // Simular carga demorada
                    },
                    child: ListView.builder(
                      itemCount: state.articles.length,
                      itemBuilder: (context, index) {
                        return ArticleCard(article: state.articles[index]);
                      },
                    ),
                  );
                } else if (state is HomeErrorState) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text("Unknown state"));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
