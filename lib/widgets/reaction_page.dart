import 'package:flutter/material.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';
import 'package:reaction_askany/widgets/emotion_widget.dart';

class ReactionPage extends StatelessWidget {
  final List<Emotions> emotions;
  final Function(Emotions) handlePressed;
  final ReactionBoxParamenters boxParamenters;
  final Emotions? emotionPicked;

  const ReactionPage({
    super.key,
    required this.emotions,
    required this.handlePressed,
    required this.boxParamenters,
    required this.emotionPicked,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(
        horizontal: boxParamenters.paddingHorizontal,
      ),
      scrollDirection: Axis.horizontal,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: emotions.length,
      itemBuilder: (context, index) {
        return EmotionWidget(
          emotion: emotions[index],
          handlePressed: handlePressed,
          boxParamenters: boxParamenters,
          isSelected: emotions[index] == emotionPicked,
        );
      },
    );
  }
}
