library reaction_askany;

export 'widgets/reaction_box.dart';

import 'package:flutter/material.dart';
import 'package:reaction_askany/models/emotions.dart';
import 'package:reaction_askany/models/reaction_box_paramenters.dart';
import 'package:reaction_askany/widgets/reaction_box.dart';

class ReactionAskany {
  static void showReactionBox(
    BuildContext context, {
    required Offset offset,
    Function(Emotions)? handlePressed,
    ReactionBoxParamenters? boxParamenters,
  }) async {
    final double left = offset.dx;
    final double top = offset.dy;

    final ReactionBoxParamenters paramenters =
        boxParamenters ?? ReactionBoxParamenters();

    await showMenu(
      context: context,
      useRootNavigator: true,
      color: Brightness.light == paramenters.brightness
          ? Colors.white
          : Colors.black,
      position: RelativeRect.fromLTRB(
        left,
        top - paramenters.reactionBoxHeight - paramenters.iconSpacing * 2,
        left,
        top,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            paramenters.radiusBox,
          ),
        ),
      ),
      constraints: BoxConstraints(
        maxWidth: paramenters.reactionBoxWidth,
      ),
      items: [
        PopupMenuItem(
          height: paramenters.reactionBoxHeight,
          padding: EdgeInsets.zero,
          enabled: true,
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                paramenters.radiusBox,
              ),
            ),
            height: paramenters.reactionBoxHeight,
            width: paramenters.reactionBoxWidth,
            child: ReactionBox(
              emotions: Emotions.values,
              handlePressed: handlePressed ?? (Emotions emo) {},
              boxParamenters: paramenters,
            ),
          ),
        ),
      ],
      elevation: .35,
    );
  }
}
