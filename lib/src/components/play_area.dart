import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/src/tank_killer.dart';

final class PlayArea extends RectangleComponent
    with HasGameReference<TankKiller> {
  PlayArea()
      : super(
            paint: Paint()..color = const Color(0xFF00FF00),
            children: [RectangleHitbox()]);

  @override
  Future<void> onLoad() async {
    super.onLoad();
    size = Vector2(game.width, game.height);
  }
}
