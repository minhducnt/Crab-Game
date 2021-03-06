part of views;

class GameStartedView extends StatelessWidget {
  const GameStartedView({
    Key? key,
    required this.score,
    required this.player,
    required this.barriers,
    required this.onTap,
  }) : super(key: key);

  final int score;
  final Player player;
  final Iterable<BarrierPair> barriers;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final playerExp = context.watch<Experience>();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Background(
              assetImage: playerExp.backgroundImage.assetImage,
            ),
          ),
          ...barriers
              .expand((pair) => [pair.top, pair.bottom])
              .map((barrier) => Positioned(
                    left: barrier.x,
                    top: barrier.y,
                    width: barrier.width,
                    height: barrier.height,
                    child: barrier.draw(context),
                  )),
          Positioned(
            left: player.x,
            top: player.y,
            width: player.width,
            height: player.height,
            child: player.draw(context),
          ),
          Align(
            alignment: const Alignment(0, -0.9),
            child: Text(
              score.toString(),
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ],
      ),
    );
  }
}
