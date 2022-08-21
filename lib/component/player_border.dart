import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:split/component/player.dart';
import 'package:split/component/tile.dart';
import 'package:split/my_game.dart';

class PlayerBorder extends PositionComponent
    with CollisionCallbacks, HasGameRef<MyGame> {
  final int borderReach;
  final Player player;

  PlayerBorder({required this.player, this.borderReach = 5})
      : super(
          size: Vector2(
            borderReach * Tile.spriteSize,
            borderReach * Tile.spriteSize,
          ),
          anchor: Anchor.center,
        );

  @override
  Future<void> onLoad() async {
    debugMode = true;
    position = player.position;
    add(RectangleHitbox());
  }
}
