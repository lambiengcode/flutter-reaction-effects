import 'package:flutter/material.dart';

import '../models/emotions.dart';
import '../models/reaction_box_paramenters.dart';
import '../reaction_askany.dart';

class ReactionWrapper extends StatefulWidget {
  final Widget child;
  final Widget buttonReaction;
  final Function(Emotions)? handlePressed;
  final ReactionBoxParamenters? boxParamenters;
  final Emotions? initialEmotion;

  const ReactionWrapper({
    super.key,
    required this.child,
    required this.buttonReaction,
    this.boxParamenters,
    this.handlePressed,
    this.initialEmotion,
  });

  @override
  State<StatefulWidget> createState() => _ReactionWrapperState();
}

class _ReactionWrapperState extends State<ReactionWrapper> {
  late final ReactionBoxParamenters boxParamenters =
      widget.boxParamenters ?? ReactionBoxParamenters();
  Emotions? _emotion;

  @override
  void initState() {
    super.initState();
    _emotion = widget.initialEmotion;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            widget.child,
            Visibility(
              visible: _emotion != null,
              child: Positioned(
                bottom: -10,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(3.0),
                    margin: const EdgeInsets.only(
                      left: 24.0,
                    ),
                    decoration: BoxDecoration(
                      color: Brightness.light == boxParamenters.brightness
                          ? Colors.grey.shade100
                          : Colors.grey.shade800,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    alignment: Alignment.center,
                    child: Image.asset(
                      _emotion?.assetImage ?? '',
                      height: 16,
                      width: 16,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        const SizedBox(width: 4.0),
        GestureDetector(
          onTapDown: (details) {
            ReactionAskany.showReactionBox(
              context,
              offset: details.globalPosition,
              boxParamenters: boxParamenters,
              emotionPicked: _emotion,
              handlePressed: (Emotions emotion) {
                setState(() {
                  _emotion = emotion;
                });
              },
            );
          },
          child: widget.buttonReaction,
        ),
      ],
    );
  }
}
