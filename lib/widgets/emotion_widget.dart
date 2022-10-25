import 'package:flutter/material.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';

class EmotionWidget extends StatelessWidget {
  final Emotions emotion;
  final Function(Emotions) handlePressed;
  final ReactionBoxParamenters boxParamenters;

  const EmotionWidget({
    super.key,
    required this.emotion,
    required this.handlePressed,
    required this.boxParamenters,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        handlePressed(emotion);
        Navigator.pop(context);
      },
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.symmetric(
          horizontal: boxParamenters.iconSpacing,
        ),
        alignment: Alignment.center,
        child: Image.asset(
          emotion.assetImage,
          height: boxParamenters.iconSize,
          width: boxParamenters.iconSize,
        ),
      ),
    );
  }
}
