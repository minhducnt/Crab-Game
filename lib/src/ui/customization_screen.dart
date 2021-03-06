part of ui;

class CustomizationScreen extends StatefulWidget {
  const CustomizationScreen({Key? key}) : super(key: key);

  @override
  State<CustomizationScreen> createState() => _CustomizationScreenState();
}

class _CustomizationScreenState extends State<CustomizationScreen> {
  @override
  Widget build(BuildContext context) {
    final playerExp = context.watch<Experience>();

    return AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 26,
                height: 26,
                child: Image.asset(kCoinImage),
              ),
              const SizedBox(width: 5),
              Text(playerExp.money.toString())
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: Character.options.map((Character character) {
              final index = Character.options.indexOf(character);
              BorderSide borderSide = BorderSide.none;
              double spacing = 8;

              if (character == playerExp.character) {
                borderSide = const BorderSide(
                  width: 4,
                  color: Colors.red,
                );
              }

              if (index == 0) {
                spacing = 0;
              }

              return Padding(
                padding: EdgeInsets.only(left: spacing),
                child: GestureDetector(
                  onTap: () {
                    playerExp.changeCharacter(character);
                  },
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: borderSide,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          character.assetImage,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 15),
          Row(
            children: BackgroundImage.options.map((BackgroundImage image) {
              final index = BackgroundImage.options.indexOf(image);
              BorderSide borderSide = BorderSide.none;
              double spacing = 8;

              if (image == playerExp.backgroundImage) {
                borderSide = const BorderSide(
                  width: 4,
                  color: Colors.red,
                );
              }

              if (index == 0) {
                spacing = 0;
              }

              return Padding(
                padding: EdgeInsets.only(left: spacing),
                child: GestureDetector(
                  onTap: () {
                    playerExp.changeBackground(image);
                  },
                  child: DecoratedBox(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: borderSide,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 50,
                        height: 50,
                        child: Image.asset(
                          image.assetImage,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
