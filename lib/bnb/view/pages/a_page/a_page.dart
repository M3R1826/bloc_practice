import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_bloc.dart';
import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_state.dart';
import 'package:bloc_arch_test/bnb/view/pages/a_page/a_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class APage extends StatelessWidget {
  const APage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _APage();
  }
}

class _APage extends StatefulWidget {
  const _APage({Key? key}) : super(key: key);

  @override
  State<_APage> createState() => _APageState();
}

class _APageState extends State<_APage> {
  late final AStateController _stateController = context.read();
  late final BNBBloc _bloc = context.read();
  @override
  void initState() {
    _bloc.stream.listen((event) {
      if (event is BNBFirst) {
        _stateController.controller
            .animateTo(0, duration: Duration(seconds: 1), curve: Curves.linear);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(context.watch<BNBBloc>().state);
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
                  color: Colors.redAccent,
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
