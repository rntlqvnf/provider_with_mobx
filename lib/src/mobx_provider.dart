import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class MobxProvider<T extends Store> extends StatelessWidget {
  final Widget Function(T store, BuildContext context) builder;
  final T Function(BuildContext context) create;
  final T Function(BuildContext context, T store) dispose;
  final bool lazy;

  const MobxProvider(
      {Key key, this.builder, this.create, this.dispose, this.lazy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<T>(
      create: create,
      dispose: dispose,
      lazy: lazy,
      child: Builder(builder: (context) => builder(context.read<T>(), context)),
    );
  }
}
