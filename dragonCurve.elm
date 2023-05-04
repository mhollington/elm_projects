myShapes model = [ animate |> notifyTap Animate
                 , if model.time < model.startAnimate then 
                     group [(recursiveDragon (round (12 - (model.startAnimate - model.time))))
                            |> group
                            |> scale 16
                            ,
                            text (String.fromInt (round (12 - (model.startAnimate - model.time))))
                            |> filled black
                            |> move (-75, 40)
                            ]
                            
                   else
                     group[(recursiveDragon (round (12 * model.sliderValue - 0.3)))
                            |> group 
                            |> scale 16
                          , slider 185 (0,1) SliderDown SliderMove SliderUp model.sliderValue model.sliderState
                            |> move (0,-57)
                          , group (axis 12 2.5 [])
                          ]
                        
                 ]


-- sets the scale for the slider
-- spaces out the numbers by 15
axis n interval list = if n >= 0 then 
                        let 
                          newList = list ++ [text (String.fromInt n) |> filled black |> scale 0.5 |> move (89 - interval, -48.5)]
                          newInt = interval + 15
                        in
                          axis (n-1) newInt newList                    
               
                      else
                        list
-- draws the animation button
-- when clicked it sends a message to start the animation from 0 - 12 recursive calls
animate = group [ roundedRect 61 15 2 |> filled yellow
                , roundedRect 61.2 15.2 2 |> outlined (solid 1) black
                , text "Click to Animate" |> filled black |> scale 0.7 |> move (-29, -4)
                ] |> scale 0.8 |> move (60, 50)
          
-- uses the sierpinski example        
-- makes the dragon curve, replaces each segment with 2 segments on each recursive call
-- rotates one of the segments 45 degrees from its original position and scales by 1/sqrt(2)
-- rotates the other segment 135 degrees from its original positon and scales by 1/sqrt(2)
recursiveDragon n =  
    ( 
      if n > 0 then 
        let 
          aChild = recursiveDragon (n-1)
        in 
          interleave3 
            ( aChild |> List.map ( move (0, 2.5) >> rotate (degrees 45) >> scale (1/(2^0.5)) ) )
            ( aChild |> List.map ( move (0, -2.5) >> rotate (degrees 135) >> scale (1/(2^0.5)) ) )
      else
        [rect 5.3 0.3 |> filled black]
        
    ) 
    


-- transpose the list (breadth first)
interleave3 item1 item2 =
  case (item1, item2) of
    (x0::xs, y0::ys) ->
      [x0,y0] ++ (interleave3 xs ys)
    _ -> []

       
       
-- function to draw a slider 
-- click on the slider to set the value, move off the slider or stop holding 
--   the mouse to stop changing the value
-- let the user specify to range of Float values to be returned
slider : Float -> (Float,Float) 
    -> (Float -> Msg) 
    -> (Float -> Msg) 
    -> Msg
    -> Float 
    -> SliderState
    -> Shape Msg
    
    
slider height (minValue,maxValue) downMsg moveMsg stopMsg currentValue state =
  let
    background = roundedRect height 6 2
                    |> filled (rgb 200 200 255)
    highlightedHeight =
      if maxValue-minValue < 0.0001 then
        0
      else
        currentValue / (maxValue-minValue) * height
    
    -- "do" the calculation for the slider value, here in the "view" 
    mouseDownMsg : (Float,Float) -> Msg
    mouseDownMsg (x,y) = downMsg ((x + 0.5 * height / (maxValue-minValue) ) 
                                    / height * (maxValue-minValue))

    mouseMoveMsg : (Float,Float) -> Msg
    mouseMoveMsg (x,y) = ((x + 0.5 * height / (maxValue-minValue) ) 
                                    / height * (maxValue-minValue))
                            |> moveMsg

  in
    group
      [ background
      , rect highlightedHeight 6
          |> filled (rgb 0 0 255) 
          |> move ((height - highlightedHeight) * (-0.5), 0)
          |> clip background 
      , rect height 10 |> filled (rgba 0 0 0 0.12)
      ]
      |> ( case state of
            SliderWaiting -> notifyMouseDownAt mouseDownMsg
            SliderDragging -> 
              (    notifyMouseMoveAt mouseMoveMsg
                >> notifyMouseUp stopMsg
                >> notifyLeave stopMsg
              )
         )


type Msg 
  = Tick Float GetKeyState
  | SliderDown Float
  | SliderMove Float
  | SliderUp
  | Animate
  
type SliderState
  = SliderWaiting
  | SliderDragging
  

update msg model 
  = case msg of
      Tick t _-> 
        { model | time = t }
      SliderMove value ->
        { model | sliderValue = value } 
      SliderDown value ->
        { model | sliderState = SliderDragging, sliderValue = value }
      SliderUp ->
        { model | sliderState = SliderWaiting }
      Animate ->
        { model | startAnimate = model.time + 12 } -- resets the animation
        
init =  { time = 0
        , sliderState = SliderWaiting
        , sliderValue = 0.0
        , startAnimate = 0 -- acts like a timer
        }




