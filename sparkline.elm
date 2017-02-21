import Html exposing (text, div)
import Svg exposing (..)
import Svg.Attributes exposing (..)
import Util exposing (pairs)

--lines : List number -> List (Float, Float)
lines list =
  let
    range = 96 -- wtf
    div = (List.length(data) |> toFloat) / 100.0
    min = List.minimum data |> Maybe.withDefault 0
    max = List.maximum data |> Maybe.withDefault 0
    length = List.length data |> toFloat
    scaled = List.map (\ num -> 100 * (num - min) / (max - min) ) data

    head = List.head scaled |> Maybe.withDefault 0
    tail = List.tail scaled |> Maybe.withDefault []

    pct = (\ num -> (toString num) ++ "%")
  in
  pairs head tail |> List.indexedMap (\ i tuple ->
    let
      (start,end) = tuple
    in
    Svg.line [
      color "rgba(0,0,0,0.5)",
      strokeWidth "1",
      y1 (pct start),
      y2 (pct end),
      x1 (pct (range * (toFloat i / length) + (div / 2))),
      x2 (pct i)
    ] []
  )

data : List number
data = [1,1,1,100,100]
main =
    svg
      [ version "1.1", x "0", y "0" , width "100%", height "100%", preserveAspectRatio "none" ]
      (lines data)

      --[
        --polyline [ fill "none", stroke "black", points "20,100 40,60 70,80 100,20" ] []
        --, Svg.path [ fill "none", stroke "blue", d "M 100 100 L 300 100 L 200 300 z"] []
        --line [
        --  color "rgba(0,0,0)",
        --  strokeWidth "1",
        --  x1 "250",
        --  x2 "50",
        --  y1 "250",
        --  y2 "50"
        --] []
      --]
