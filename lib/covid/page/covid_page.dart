import 'package:bloc_arch_test/covid/covid_bloc/bloc/covid_bloc.dart';
import 'package:bloc_arch_test/covid/covid_bloc/event/covid_event.dart';
import 'package:bloc_arch_test/covid/covid_bloc/state/covid_state.dart';
import 'package:bloc_arch_test/covid/model/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidPage extends StatefulWidget {
  const CovidPage({Key? key}) : super(key: key);

  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {
  final CovidBloc _newsBloc = CovidBloc();
  ScrollController controller = ScrollController();
  int limit = 10;
  @override
  void initState() {
    _newsBloc.add(GetCovidList());
    controller.addListener(_scrollListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() {
    if (controller.position.extentAfter < 500) {
      setState(() => limit += 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('COVID-19 List')),
      body: _buildListCovid(),
    );
  }

  Widget _buildListCovid() {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: BlocProvider(
        create: (_) => _newsBloc,
        child: BlocListener<CovidBloc, CovidState>(
          listener: (context, state) {
            if (state is CovidError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<CovidBloc, CovidState>(
            builder: (context, state) {
              if (state is CovidInitial) {
                return _buildLoading();
              } else if (state is CovidLoading) {
                return _buildLoading();
              } else if (state is CovidSuccess) {
                return _buildCard(context, state.covidModel);
              } else if (state is CovidError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, CovidModel model) {
    return RefreshIndicator(
      onRefresh: () => Future(() => _newsBloc.add(ShuffleList())),
      child: ListView.builder(
        controller: controller,
        itemCount: model.countries!.take(limit).length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            child: Card(
              child: Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      "国: ${model.countries![index].country}",
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text("総感染者数: ${model.countries![index].totalConfirmed}人"),
                    Text("総死者数: ${model.countries![index].totalDeaths}人"),
                    Text("総回復者数: ${model.countries![index].totalRecovered}人"),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
}
