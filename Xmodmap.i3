! The 205 Meta_L isn't really registering, it seems, but should still work
! Map The Windows key to Meta
keycode 133 = Meta_L NoSymbol Meta_L
! Make sure Alt is mapped to alt
keycode 64 = Alt_L

! Clear out Mod4 and Mod3 to allow for setting them later
clear Mod4
clear Mod3
! Ensure Mod1 does not include Meta
remove mod1 = Meta_L

! Set Mod4 to Super and Mod3 to Meta
add mod4 = Super_L
add mod4 = Super_R
add mod3 = Meta_L


! Reset Caps Lock to Super
clear Lock
keycode 66 = Super_L NoSymbol Super_R
