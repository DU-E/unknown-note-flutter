import 'package:flutter/material.dart';

class LoadingWidget extends StatefulWidget {
  final Function()? whenBuild;

  const LoadingWidget({
    super.key,
    this.whenBuild,
  });

  @override
  State<LoadingWidget> createState() => _LoadingWidgetState();
}

class _LoadingWidgetState extends State<LoadingWidget> {
  @override
  void initState() {
    super.initState();

    if (widget.whenBuild != null) {
      widget.whenBuild!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
