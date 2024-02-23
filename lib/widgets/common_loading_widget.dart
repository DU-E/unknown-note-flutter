import 'package:flutter/material.dart';

class CommonLoadingWidget extends StatefulWidget {
  final Function()? whenBuild;
  final Color? color;

  const CommonLoadingWidget({
    super.key,
    this.whenBuild,
    this.color,
  });

  @override
  State<CommonLoadingWidget> createState() => _CommonLoadingWidgetState();
}

class _CommonLoadingWidgetState extends State<CommonLoadingWidget> {
  @override
  void initState() {
    super.initState();
    widget.whenBuild?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: widget.color ?? Theme.of(context).primaryColor,
      ),
    );
  }
}
