import 'package:bloc_demo/screen/home/home_bloc.dart';
import 'package:bloc_demo/screen/home/home_event.dart';
import 'package:bloc_demo/screen/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is Init) {
            BlocProvider.of<HomeBloc>(context).add(LoadProduct());
          }
          return state is! Loaded
              ? Center(child: const CircularProgressIndicator())
              : ListView.builder(
                  itemCount: 5,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Center(
                      child: Text(
                        state.title,
                        style: const TextStyle(color: Colors.blue),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
