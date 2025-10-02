class Vibe {
  final String name;         // e.g. "Hip-Hop"
  final String description;  // e.g. "Rap • Trap • Dance"
  final String coverImage;   // background image for card
  final String iconImage;    // small icon (neon style)
  bool isSelected;           // whether user selected it

  Vibe({
    required this.name,
    required this.description,
    required this.coverImage,
    required this.iconImage,
    this.isSelected = false,
  });
}
