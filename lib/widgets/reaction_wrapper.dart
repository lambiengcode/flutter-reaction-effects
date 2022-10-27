import 'package:flutter/material.dart';

import '../models/emotions.dart';
import '../models/reaction_box_paramenters.dart';
import '../reaction_askany.dart';

class ReactionWrapper extends StatefulWidget {
  final Widget child;
  final Widget buttonReaction;
  final Function(Emotions?)? handlePressed;
  final Function()? handlePressedReactions;
  final ReactionBoxParamenters? boxParamenters;
  final Emotions? initialEmotion;

  const ReactionWrapper({
    super.key,
    required this.child,
    required this.buttonReaction,
    this.boxParamenters,
    this.handlePressed,
    this.handlePressedReactions,
    this.initialEmotion,
  });

  @override
  State<StatefulWidget> createState() => _ReactionWrapperState();
}

class _ReactionWrapperState extends State<ReactionWrapper>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  Offset? _beginOffset;
  late final ReactionBoxParamenters boxParamenters =
      widget.boxParamenters ?? ReactionBoxParamenters();
  Emotions? _emotion;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _emotion = widget.initialEmotion;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _emotion != null ? 12.0 : 0),
      child: Row(
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
                  bottom: -11,
                  child: GestureDetector(
                    onTap: widget.handlePressedReactions,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: _beginOffset ?? Offset.zero,
                        end: Offset.zero,
                      ).animate(CurvedAnimation(
                        parent: _controller,
                        curve: Curves.bounceOut,
                      )),
                      child: Container(
                        padding: const EdgeInsets.all(3.0),
                        margin: const EdgeInsets.only(
                          left: 20.0,
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
                ),
              )
            ],
          ),
          const SizedBox(width: 4.0),
          GestureDetector(
            onTapDown: (details) {
              setState(() {
                _beginOffset = Offset.zero;
              });

              ReactionAskany.showReactionBox(
                context,
                offset: details.globalPosition,
                boxParamenters: boxParamenters,
                emotionPicked: _emotion,
                handlePressed: (Emotions emotion) {
                  _controller.reset();

                  if (emotion == _emotion) {
                    setState(() {
                      _emotion = null;
                    });

                    if (widget.handlePressed != null) {
                      widget.handlePressed!(_emotion);
                    }

                    return;
                  }

                  setState(() {
                    _emotion = emotion;
                    _beginOffset = const Offset(.25, -1);
                  });

                  _controller.forward();

                  if (widget.handlePressed != null) {
                    widget.handlePressed!(_emotion);
                  }
                },
              );
            },
            child: widget.buttonReaction,
          ),
        ],
      ),
    );
  }
}
