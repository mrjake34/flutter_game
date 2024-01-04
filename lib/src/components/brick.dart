import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_game/src/tank_killer.dart';

import '../config.dart';
import 'ball.dart';
import 'bat.dart';

class Brick extends SpriteComponent
    with CollisionCallbacks, HasGameReference<TankKiller> {
  Brick(Vector2 position, Color color)
      : super(
          position: position,
          size: Vector2(brickWidth, brickHeight),
          anchor: Anchor.center,
          paint: Paint()
            ..color = color
            ..style = PaintingStyle.fill,
          children: [],
        );

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    removeFromParent();

    if (game.world.children.query<Brick>().length == 1) {
      game.playState = PlayState.won;
      game.world.removeAll(game.world.children.query<Ball>());
      game.world.removeAll(game.world.children.query<Bat>());
    }
  }
}
