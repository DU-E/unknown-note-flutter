import 'package:flutter/material.dart';

class CommonLoadingWidget extends StatefulWidget {
  final Function()? whenBuild;

  const CommonLoadingWidget({
    super.key,
    this.whenBuild,
  });

  @override
  State<CommonLoadingWidget> createState() => _CommonLoadingWidgetState();
}

class _CommonLoadingWidgetState extends State<CommonLoadingWidget> {
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
