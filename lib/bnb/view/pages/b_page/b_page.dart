import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_bloc.dart';
import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_state.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'b_state_controller.dart';

class BPage extends StatelessWidget {
  const BPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _BPage();
  }
}

class _BPage extends StatefulWidget {
  const _BPage({Key? key}) : super(key: key);

  @override
  State<_BPage> createState() => _BPageState();
}

class _BPageState extends State<_BPage> {
  late final BStateController _stateController = context.read();
  late final BNBBloc _bloc = context.read();
  @override
  void initState() {
    _bloc.stream.listen((event) {
      if (event is BNBSecond) {
        _stateController.controller
            .animateTo(0, duration: Duration(seconds: 1), curve: Curves.linear);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _stateController.controller,
      child: Column(
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: 50,
            itemBuilder: (c, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.blueAccent,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Center(
                        child: Text(
                      '$index',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    )),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
