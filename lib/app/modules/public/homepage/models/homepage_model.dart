class ImageContentModel {
  final String imagePath;

  ImageContentModel({required this.imagePath});
}

class MenuItemModel {
  final String iconPath;
  final String label;
  final String route;

  MenuItemModel({
    required this.iconPath,
    required this.label,
    required this.route,
  });
}
