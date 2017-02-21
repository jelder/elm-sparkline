module Util exposing (pairs)

pairs : a -> List a -> List (a, a)
pairs start list =
  case list of
    [] -> [(start, start)]
    [this] -> [(start, this)]
    [this,final] -> [(start, this),(this, final)]
    this::next::remainder -> (start, this) :: pairs next remainder
