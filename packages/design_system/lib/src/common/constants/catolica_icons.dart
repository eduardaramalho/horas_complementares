const _assetsPath = 'packages/design_system/assets';

enum CatolicaIcons {
  chevronDownSolid('$_assetsPath/chevron_down_solid_icon.svg'),
  userSolid('$_assetsPath/user_solid_icon.svg'),
  plusSolid('$_assetsPath/plus_solid_icon.svg'),
  minusSolid('$_assetsPath/minus_solid_icon.svg');

  final String path;

  const CatolicaIcons(this.path);
}
