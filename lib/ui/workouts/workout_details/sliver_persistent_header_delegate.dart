import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './anim.dart';
import 'dart:math' as math;

class MySliverPersistenceHeaderDelegate extends SliverPersistentHeaderDelegate {
  MySliverPersistenceHeaderDelegate(
      {@required this.title,
      @required this.titleSizeExpanded,
      @required this.titleColor,
      @required this.actions});

  final String title;
  final Color titleColor;
  final double titleSizeExpanded;
  final List<Widget> actions;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double currentExtent() => math.max(minExtent, maxExtent - shrinkOffset);

    return Container(
      height: maxExtent,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0xD5000000),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ],
      ),
      child: Stack(
        children: <Widget>[
          Center(
            child: Text("Hello"),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                _buildTopBar(context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTopBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Text("okok"),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: (){},
        ),
        IconButton(
          icon: Icon(Icons.edit_attributes),
          onPressed: (){},
        )
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }

  @override
  double get maxExtent => 360.0;

  @override
  double get minExtent => 56.0;
}
