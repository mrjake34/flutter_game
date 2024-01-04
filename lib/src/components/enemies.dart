import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter_game/src/tank_killer.dart';

import 'ball.dart';
import 'bat.dart';

class Enemies extends Component
    with CollisionCallbacks, HasGameReference<TankKiller> {
  Enemies(Vector2 position) : super();

  @override
  void onLoad() {
    super.onLoad();
    final image = game.images.fromCache('crate.png');
    final sprite = Sprite(image);
    final spriteComponent = SpriteComponent(sprite: sprite);
    spriteComponent.anchor = Anchor.center;
    super.add(spriteComponent);
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    removeFromParent();

    if (game.world.children.query<Enemies>().length == 1) {
      game.playState = PlayState.won;
      game.world.removeAll(game.world.children.query<Ball>());
      game.world.removeAll(game.world.children.query<Bat>());
    }
  }
}
