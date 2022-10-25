enum Emotions {
  like,
  haha,
  love,
  wow,
  angry,
  care,
}

extension EmotionsX on Emotions {
  String get assetImage {
    return 'packages/reaction_askany/icons/${name.toLowerCase()}.png';
  }
}
