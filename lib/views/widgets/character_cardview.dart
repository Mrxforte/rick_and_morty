import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rick_and_morty/app/locator.dart';
import 'package:rick_and_morty/app/router.dart';
import 'package:rick_and_morty/models/characters_model.dart';
import 'package:rick_and_morty/services/preferences_service.dart';

class CharacterCardView extends StatefulWidget {
  final CharacterModel characterModel;
  final bool isFavorited;
  const CharacterCardView({
    super.key,
    required this.characterModel,
    this.isFavorited = false,
  });

  @override
  State<CharacterCardView> createState() => _CharacterCardViewState();
}

class _CharacterCardViewState extends State<CharacterCardView>
    with SingleTickerProviderStateMixin {
  late bool isFavorited;
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    isFavorited = widget.isFavorited;

    // Initialize animation controller
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Create scale animation (pulse effect)
    _scaleAnimation =
        TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween<double>(begin: 1.0, end: 1.5),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween<double>(begin: 1.5, end: 1.0),
            weight: 50,
          ),
        ]).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        );

    // Create rotation animation (optional spin effect)
    _rotationAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    // Create color animation
    _colorAnimation =
        ColorTween(begin: Colors.grey[400], end: Colors.amber[600]).animate(
          CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
        );

    // If already favorited, set animation to completed state
    if (isFavorited) {
      _animationController.value = 1.0;
    }

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Future<void> _favoriteCharacter() async {
    // Trigger the animation
    if (!isFavorited) {
      // Adding to favorites - forward animation
      await _animationController.forward();
    } else {
      // Removing from favorites - reverse animation
      await _animationController.reverse();
    }

    // Update the actual state
    if (isFavorited) {
      locator<PreferencesService>().removeCharacter(widget.characterModel.id);
      isFavorited = false;
    } else {
      locator<PreferencesService>().saveCharacter(widget.characterModel.id);
      isFavorited = true;
    }

    // Update UI
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        AppRoutes.characterProfile,
        extra: widget.characterModel,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Hero(
                      tag: widget.characterModel.image,
                      child: Image.network(
                        widget.characterModel.image,
                        height: 100,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 17,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.characterModel.name,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          const SizedBox(height: 5),
                          _infoWidget(
                            type: 'Origin',
                            value: widget.characterModel.origin.name,
                          ),
                          const SizedBox(height: 4),
                          _infoWidget(
                            type: 'Location',
                            value:
                                '${widget.characterModel.status} - ${widget.characterModel.species}',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Animated Favorite Button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Transform.rotate(
                      angle: _rotationAnimation.value * 0.1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: IconButton(
                          onPressed: _favoriteCharacter,
                          icon: Icon(
                            isFavorited
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: _colorAnimation.value,
                            size: 24 * _scaleAnimation.value,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoWidget({required String type, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          type,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w300),
        ),
        Text(value, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
