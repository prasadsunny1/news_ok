import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ok/app/router/router_constants.dart';
import 'package:news_ok/home/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<HomeCubit>(context).fetchSources();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sources'),
      ),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoadedState) {
            return ListView.builder(
              itemCount: (state.data['sources'] as List).length,
              itemBuilder: (context, index) {
                final item = (state.data['sources'] as List)[index] as Map;
                return ListTile(
                  title: Text(item['name'].toString()),
                  onTap: () {
                    final topicId = item['id'].toString();
                    Navigator.of(context).pushNamed(
                      RouterConstants.allNewsPage,
                      arguments: topicId,
                    );
                  },
                );
              },
            );
          } else if (state is HomeEmptyState) {
            return const Center(
              child: Text('Empty'),
            );
          } else if (state is HomeLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
