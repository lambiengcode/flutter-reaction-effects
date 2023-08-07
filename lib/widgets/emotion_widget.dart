import 'package:flutter/material.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';

class EmotionWidget extends StatefulWidget {
  final Emotions emotion;
  final Function(Emotions) handlePressed;
  final ReactionBoxParamenters boxParamenters;
  final bool isSelected;

  const EmotionWidget({
    super.key,
    required this.emotion,
    required this.handlePressed,
    required this.boxParamenters,
    this.isSelected = false,
  });

  @override
  State<EmotionWidget> createState() => _EmotionWidgetState();
}

class _EmotionWidgetState extends State<EmotionWidget>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );
    if (widget.isSelected) {
      _controller.repeat();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.handlePressed(widget.emotion);
        Navigator.pop(context);
      },
      child: widget.isSelected
          ? Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ScaleTransition(
                scale: Tween(begin: 1.0, end: 1.1).animate(
                  CurvedAnimation(
                    curve: Curves.easeInOut,
                    parent: _controller,
                  ),
                ),
                child: _buildBody(),
              ),
            )
          : _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: widget.boxParamenters.iconSpacing,
      ),
      alignment: Alignment.center,
      child: Image.asset(
        widget.emotion.assetImage,
        height: widget.boxParamenters.iconSize,
        width: widget.boxParamenters.iconSize,
      ),
    );
  }
}
