import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_ok/all_news/cubit/all_news_cubit.dart';

class AllNewsPage extends StatefulWidget {
  const AllNewsPage({Key? key, required this.sourceId}) : super(key: key);
  final String sourceId;

  @override
  State<AllNewsPage> createState() => _AllNewsPageState();
}

class _AllNewsPageState extends State<AllNewsPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<AllNewsCubit>(context).fetchAllNews(id: widget.sourceId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All News'),
      ),
      body: BlocBuilder<AllNewsCubit, AllNewsState>(
        builder: (context, state) {
          if (state is AllNewsLoaded) {
            return ListView.builder(
              itemCount: (state.data['articles'] as List).length,
              itemBuilder: (context, index) {
                final item = (state.data['articles'] as List)[index] as Map;
                return ListTile(
                  title: Text(item['title'].toString()),
                  subtitle: Text(
                    item['description'].toString(),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              },
            );
          } else if (state is AllNewsError) {
            return const Center(
              child: Text('Empty'),
            );
          } else if (state is AllNewsLoading) {
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
