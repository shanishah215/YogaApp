import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yogaapp/views/home/widgets/app_drawer.dart';

import '../../blocs/bloc_status.dart';
import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_event.dart';
import '../../blocs/home/home_state.dart';
import '../../network/repository/repository_store.dart';
import '../../src/app_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.appBarText)),
      drawer: const AppDrawer(),
      body: BlocProvider(
        create: (context) => HomeBloc(homeRepo: RepositoryStore.homeRepository),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.appStatus == const InitialStatus()) {
              context.read<HomeBloc>().add(HomeGetCardData());
            }

            if (state.appStatus == SubmissionLoading()) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemCount: state.homeCardModel?.data.yogaTypes.length ?? 0,
                  itemBuilder: (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          CachedNetworkImage(
                            imageUrl: state.homeCardModel?.data.yogaTypes[index]
                                    .image ??
                                "",
                          ),
                          Text(
                              state.homeCardModel?.data.yogaTypes[index].name ??
                                  ""),
                        ],
                      ),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
