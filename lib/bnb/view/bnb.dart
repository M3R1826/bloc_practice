import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_bloc.dart';
import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_event.dart';
import 'package:bloc_arch_test/bnb/bnb_bloc/bnb_state.dart';
import 'package:bloc_arch_test/bnb/view/pages/a_page/a_page.dart';
import 'package:bloc_arch_test/bnb/view/pages/a_page/a_state_controller.dart';
import 'package:bloc_arch_test/bnb/view/pages/b_page/b_page.dart';
import 'package:bloc_arch_test/bnb/view/pages/b_page/b_state_controller.dart';
import 'package:bloc_arch_test/bnb/view/pages/c_page/c_page.dart';
import 'package:bloc_arch_test/bnb/view/pages/c_page/c_state_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class BNBPage extends StatelessWidget {
  const BNBPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<BNBBloc>(create: (_) => BNBBloc()),
        ChangeNotifierProvider(create: (context) => AStateController(context)),
        ChangeNotifierProvider(create: (context) => BStateController(context)),
        ChangeNotifierProvider(create: (context) => CStateController(context)),
      ],
      child: BNBChild(),
    );
  }
}

class BNBChild extends StatefulWidget {
  const BNBChild({Key? key}) : super(key: key);

  @override
  _BNBChildState createState() => _BNBChildState();
}

class _BNBChildState extends State<BNBChild> {
  int currentIndex = 0;

  final tab = const [
    APage(),
    BPage(),
    CPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            context.watch<BNBBloc>().state is BNBSuccess ? 'サクセス' : 'other'),
      ),
      body: tab[currentIndex],
      bottomNavigationBar: BlocBuilder<BNBBloc, BNBState>(
        bloc: context.read<BNBBloc>(),
        builder: (c, state) {
          return BottomNavigationBar(
            items: [
              _bnbIcon(0, Icons.add, BNBFirstEvent()),
              _bnbIcon(1, Icons.send, BNBSecondEvent()),
              _bnbIcon(2, Icons.assignment, BNBThirdEvent()),
            ],
          );
        },
      ),
    );
  }

  BottomNavigationBarItem _bnbIcon(int index, IconData icon, BNBEvent event) {
    return BottomNavigationBarItem(
        label: '',
        icon: IconButton(
            onPressed: () {
              context.read<BNBBloc>().add(event);
              setState(() {
                currentIndex = index;
              });
            },
            icon: Icon(
              icon,
              color: currentIndex == index ? Colors.blue : Colors.grey,
            )));
  }
}
