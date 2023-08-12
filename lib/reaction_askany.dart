library reaction_askany;

export 'widgets/reaction_wrapper.dart';

import 'package:flutter/material.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';
import 'package:reaction_askany/widgets/reaction_box.dart';

class ReactionAskany {
  static void showReactionBox(
    BuildContext context, {
    required Offset offset,
    Function(Emotions)? handlePressed,
    Emotions? emotionPicked,
    ReactionBoxParamenters? boxParamenters,
    String? doubleTapLabel,
  }) async {
    final double left = offset.dx;
    final double top = offset.dy;

    final ReactionBoxParamenters paramenters =
        boxParamenters ?? ReactionBoxParamenters();

    await showMenu(
      context: context,
      color: Colors.transparent,
      position: RelativeRect.fromLTRB(
        left,
        top - paramenters.reactionBoxHeight - paramenters.iconSpacing * 2.5,
        left,
        top - paramenters.iconSpacing * 3,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          paramenters.radiusBox,
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: paramenters.reactionBoxWidth,
      ),
      items: [
        PopupMenuItem(
          padding: EdgeInsets.zero,
          enabled: false,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Brightness.light == paramenters.brightness
                    ? Colors.grey.shade300
                    : Colors.grey.shade800,
                width: .2,
              ),
              color: Brightness.light == paramenters.brightness
                  ? Colors.white
                  : const Color(0xFF22222A),
              borderRadius: BorderRadius.circular(
                paramenters.radiusBox,
              ),
            ),
            height: paramenters.reactionBoxHeight + 10.0,
            width: paramenters.reactionBoxWidth,
            padding: const EdgeInsets.symmetric(
              vertical: 4.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                  visible: doubleTapLabel != null,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3.0),
                    child: Text(
                      doubleTapLabel!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 9.5,
                      ),
                    ),
                  ),
                ),
                ReactionBox(
                  emotions: Emotions.values,
                  handlePressed: handlePressed ?? (Emotions emo) {},
                  boxParamenters: paramenters,
                  emotionPicked: emotionPicked,
                ),
              ],
            ),
          ),
        ),
      ],
      elevation: 0,
    );
  }
}
