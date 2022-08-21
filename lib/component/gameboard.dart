import 'package:flame/components.dart';
import 'package:split/component/control_model_panel.dart';
import 'package:split/component/maze.dart';
import 'package:split/component/player.dart';

class GameBoard extends PositionComponent {
  static const _mazeGap = 10;

  late Maze _realMaze;
  late Maze _shadowMaze;

  Player get realPlayer => _realMaze.player;

  Player get shadowPlayer => _shadowMaze.player;

  GameBoard() : super(priority: -1) {
    init();
  }

  final ControlModePanel controlModePanel = ControlModePanel(
    controlMode: ControlMode.together,
  );

  void init() {
    final realPlayer = RealPlayer();
    final shadowPlayer = ShadowPlayer();

    final startPosition = Vector2(50, 50);
    _realMaze = Maze(position: startPosition);

    _realMaze.setPlayer(realPlayer);

    _shadowMaze = Maze(
      position: Vector2(
        _realMaze.position.x + _realMaze.width + _mazeGap,
        _realMaze.position.y,
      ),
    );

    _shadowMaze.setPlayer(shadowPlayer);

    add(_realMaze);
    add(_shadowMaze);

    // TODO(Tobias): move control at right place
    // TODO(Tobias): adjust position of control mode components

    add(controlModePanel);

    size = Vector2(
      _realMaze.size.x * 2 + _mazeGap + _realMaze.position.x * 2,
      _realMaze.size.y + _realMaze.position.y * 2,
    );
  }
}
