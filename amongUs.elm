myShapes model =
    case model.state of
        Cafeteria  ->
            [ text "Cafeteria"
                  |> centered
                  |> filled black
                  
              ,
              button "Medbay" P1LD -18 |> move(50,-20)
              ,
              button "Upper Engine" P1L -32 |> move(-50,-20)
            ]
        MedBay  ->
            [ text "MedBay"
                  |> centered
                  |> filled black
              
              ,
              button "Upper Engine" P1UL -32 |> move(0,-20)
            ]
        UpperEngine  ->
            [ text "Upper Engine"
                  |> centered
                  |> filled black
              
              ,
              button "Security" P2DR -17 |> move(50,-20)
              ,
              button "Reactor" P2DL -17 |> move(0,-20) 
              |> notifyTap ResetMsg
              ,
              button "Lower Engine" P2D -32 |> move(-50,-20)
            ]
        Reactor  ->
            [ text "Reactor"
                  |> centered
                  |> filled black
                  
              ,
              button "Clean Up Task" Task1 -35 |> move(50,-20) 
              |> notifyTap StartTimer
              |> notifyTap ResetLeaf
              |> notifyTap ResetPos1
              |> notifyTap ResetPos2
              |> notifyTap ResetPos3
              |> notifyTap ResetPos4   
              |> notifyTap ResetPos5
              |> notifyTap ResetPos6  
              ,
              button "Security" P2R -17 |> move(0,-20)
              ,
              button "Lower Engine" P2RD -32 |> move(-50,-20)
              , 
              text model.completeMsg
              |> outlined (solid 1) green
              |> move (-38, 40)
            ]
        Security  ->
            [ text "Security"
                  |> centered
                  |> filled black
                  
              ,
              button "Reactor" P2L -17 |> move(50,-20)
              |> notifyTap ResetMsg
              ,
              button "Lower Engine" P2LD -32 |> move(-50,-20)
            ]
        LowerEngine  ->
            [ text "Lower Engine"
                  |> centered
                  |> filled black
                  
              ,
              button "Electrical" P3RDRU -20 |> move(50,-20)
              ,
              button "Storage" P3RDR -17 |> move(-50,-20)
            ]
        CleanUpTask  ->
                [ text "Clean Up Task"
                      |> centered
                      |> filled black
                  ,

                  myBackground
                  
                  ,
                  
                  leftWall  
                  
                 ,
                 
                 text "O2"
                 |> outlined (solid 0.8) darkBlue
                 |> move (-10, -60)
                 
                 ,
                 
                  rect 110 100 
                   |> outlined (solid 1) (rgb 0 0 0)
                   |> move (-5, 0)
                 
                ,
                  
                  leafVent    
                  
                ,
    
                  
                  if Tuple.first (model.pos1) > -38 || Tuple.second (model.pos1) > 22 || Tuple.second (model.pos1) < -22 then
                   if model.dragState1 == Released_1 then 
                     leaf 
                      |> rotate (degrees 60*model.time)
                      |> move (4*cos model.time,-15*sin model.time)
                      |> move (rightPos model.pos1)
                      |> notifyMouseDown ChangeLeaf_1                    
                   else
                     leaf 
                      |> rotate (degrees 60*model.time)
                      |> move (rightPos model.pos1)
                      |> notifyMouseDown ChangeLeaf_1   
                        
                  else
                    if (model.timestamp - model.time) > 0 then
                      ghostVent
                      |> makeTransparent 0
                      |> notifyEnter LeafCounter
                      
                    else
                      group []
                     

                  ,
                  

                  if Tuple.first (model.pos2) > -38 || Tuple.second (model.pos2) > 22 || Tuple.second (model.pos2) < -22 then
                    if model.dragState2 == Released_2 then 
                      leaf 
                      |> rotate (degrees -40*model.time)
                      |> move (25*cos model.time,15*sin model.time)
                      |> move (rightPos model.pos2)
                      |> notifyMouseDown ChangeLeaf_2
                    else
                     leaf 
                      |> rotate (degrees -40*model.time)                      
                      |> move (rightPos model.pos2)
                      |> notifyMouseDown ChangeLeaf_2  
                   else
                    if (model.timestamp - model.time) > 0 then
                      ghostVent
                      |> makeTransparent 0
                      |> notifyEnter LeafCounter
                    else
                      group []
                     
                     
                  ,

                  if Tuple.first (model.pos3) > -38 || Tuple.second (model.pos3) > 22 || Tuple.second (model.pos3) < -22 then
                    if model.dragState3 == Released_3 then
                      leaf 
                      |> rotate (degrees 70*model.time)
                      |> move (5*cos model.time,5*sin model.time)
                      |> move (rightPos model.pos3)
                      |> notifyMouseDown ChangeLeaf_3 
                    else
                      leaf 
                      |> rotate (degrees 70*model.time)                      
                      |> move (rightPos model.pos3)
                      |> notifyMouseDown ChangeLeaf_3
                  else
                    if (model.timestamp - model.time) > 0 then
                      ghostVent
                      |> makeTransparent 0
                      |> notifyEnter LeafCounter
                    else
                      group []

              
                  ,
                  
                  if Tuple.first (model.pos4) > -38 || Tuple.second (model.pos4) > 22 || Tuple.second (model.pos4) < -22 then
                    if model.dragState4 == Released_4 then                  
                      leaf 
                      |> rotate (degrees 40*cos model.time)
                      |> move (18*cos model.time,10*sin model.time)
                      |> move (rightPos model.pos4)
                      |> notifyMouseDown ChangeLeaf_4
                    else
                      leaf 
                      |> rotate (degrees 40*cos model.time)
                      |> move (rightPos model.pos4)
                      |> notifyMouseDown ChangeLeaf_4
                  else
                    if (model.timestamp - model.time) > 0 then
                      ghostVent
                      |> makeTransparent 0
                      |> notifyEnter LeafCounter
                    else
                      group []
                      
                  
                  ,

                  if Tuple.first (model.pos5) > -38 || Tuple.second (model.pos5) > 22 || Tuple.second (model.pos5) < -22 then
                    if model.dragState5 == Released_5 then 
                      leaf 
                      |> rotate (degrees -15*model.time)
                      |> move (8*sin model.time,10*cos model.time)
                      |> move (rightPos model.pos5)
                      |> notifyMouseDown ChangeLeaf_5
                    else
                      leaf 
                      |> rotate (degrees -15*model.time)
                      |> move (rightPos model.pos5)
                      |> notifyMouseDown ChangeLeaf_5 
                  else
                    if (model.timestamp - model.time) > 0 then
                      ghostVent
                      |> makeTransparent 0
                      |> notifyEnter LeafCounter
                    else
                      group []
                    

                  
                  ,
                  if Tuple.first (model.pos6) > -38 || Tuple.second (model.pos6) > 22 || Tuple.second (model.pos6) < -22 then
                    if model.dragState6 == Released_6 then                   
                      leaf  
                      |> rotate (degrees 90*model.time)
                      |> move (15*sin model.time,20*cos model.time)
                      |> move (rightPos model.pos6)
                      |> notifyMouseDown ChangeLeaf_6
                    else
                      leaf 
                      |> rotate (degrees 90*model.time)                    
                      |> move (rightPos model.pos6)
                      |> notifyMouseDown ChangeLeaf_6 
                  else
                    if (model.timestamp - model.time) > 0 then
                      ghostVent
                      |> makeTransparent 0
                      |> notifyEnter LeafCounter
                    else
                      group []
                     
                         
                ,
                
                if model.leafCount >= 6 then
                   square 200 
                   |> filled pink
                   |> makeTransparent 0
                   |> notifyEnter Task1Pass
                else
                  group []
                  
                ,
                  
                  if ((model.startTimer - model.time) > 0) then
                    timer (model.startTimer - model.time)
                  else if (model.startTimer - model.time) <= 0 && (model.startTimer - model.time) > -0.5 then 
                    square 200 
                    |> filled pink
                    |> makeTransparent 0
                    |> notifyEnter FailDisplay
                  else
                    if (model.failDisplay - model.time) > 0 then
                      group [text "Failed Task: Try Again"
                             |> outlined (solid 1) red
                             |> scale 0.7
                             |> move (-42, 53)
                             ]
                    else
                      square 200 
                      |> filled pink
                      |> makeTransparent 0
                      |> notifyEnter Task1Fail
                      |> notifyEnter StartTimer
                      |> notifyEnter ResetLeaf 
                      |> notifyEnter ResetPos1
                      |> notifyEnter ResetPos2
                      |> notifyEnter ResetPos3
                      |> notifyEnter ResetPos4
                      |> notifyEnter ResetPos5
                      |> notifyEnter ResetPos6
                       
                  
                ,
                
                
                   case model.dragState1 of 
                     Released_1 -> group []
                     Dragging_1 -> rect 185 125 
                         |> ghost 
                         |> notifyMouseMoveAt Drag_1 
                         |> notifyLeave ChangeLeaf_1 
                         |> notifyMouseUp ChangeLeaf_1
                         |> notifyLeave UpdateTimestamp
                         |> notifyMouseUp UpdateTimestamp
                         
                        
                ,
                
                   case model.dragState2 of 
                     Released_2 -> group []
                     Dragging_2 -> rect 185 125 
                         |> ghost 
                         |> notifyMouseMoveAt Drag_2 
                         |> notifyLeave ChangeLeaf_2 
                         |> notifyMouseUp ChangeLeaf_2
                         |> notifyLeave UpdateTimestamp
                         |> notifyMouseUp UpdateTimestamp                       
                
                ,
                
                   case model.dragState3 of 
                     Released_3 -> group []
                     Dragging_3 -> rect 185 125 
                         |> ghost 
                         |> notifyMouseMoveAt Drag_3 
                         |> notifyLeave ChangeLeaf_3 
                         |> notifyMouseUp ChangeLeaf_3 
                         |> notifyLeave UpdateTimestamp
                         |> notifyMouseUp UpdateTimestamp  
                         
                ,
                
                   case model.dragState4 of 
                     Released_4 -> group []
                     Dragging_4 -> rect 185 125 
                         |> ghost 
                         |> notifyMouseMoveAt Drag_4 
                         |> notifyLeave ChangeLeaf_4 
                         |> notifyMouseUp ChangeLeaf_4 
                         |> notifyLeave UpdateTimestamp
                         |> notifyMouseUp UpdateTimestamp  
                         
                ,
                
                   case model.dragState5 of 
                     Released_5 -> group []
                     Dragging_5 -> rect 185 125 
                         |> ghost 
                         |> notifyMouseMoveAt Drag_5 
                         |> notifyLeave ChangeLeaf_5 
                         |> notifyMouseUp ChangeLeaf_5 
                         |> notifyLeave UpdateTimestamp
                         |> notifyMouseUp UpdateTimestamp                           
                ,
                
                   case model.dragState6 of 
                     Released_6 -> group []
                     Dragging_6 -> rect 185 125 
                         |> ghost 
                         |> notifyMouseMoveAt Drag_6 
                         |> notifyLeave ChangeLeaf_6 
                         |> notifyMouseUp ChangeLeaf_6
                         |> notifyLeave UpdateTimestamp
                         |> notifyMouseUp UpdateTimestamp                          
                      
                             
            ]
        Electrical  ->
            [ text "Electrical"
                  |> centered
                  |> filled black
                  
              ,
              button "Storage" P3DR -17 |> move(0,-20)
            ]
        Storage  ->
            [ text "Storage"
                  |> centered
                  |> filled black
                  
              ,
              button "Admin" P4UR -15 |> move(50,-20),
              button "Cafeteria" P4U -22 |> move(-50,-20)
              
            ]
        Admin  ->
            [ text "Admin"
                  |> centered
                  |> filled black
                  
              ,
              button "Card Swipe Task" Task2 -42 |> move(50,-20) |> notifyTap InitTask
              ,
              button "Cafeteria" P4LU -20 |> move(-50,-20)
              , text model.compText |> outlined (solid 1) green |> move (-38, 40)
              
            ]
        CardSwipeTask  ->
            [ text "Card Swipe Task"
                  |> centered
                  |> filled black
              
              ,
              
              wallet
                  ,
                  card |> move model.pos  |> case model.cardState of
                                                 InsideWallent -> notifyTap ClickOnCard
                                                 LeaveWallent -> notifyMouseDown ChangeDragState
                  ,
                  hideTheCardSpare model.txtShow
                  , text ("Time Used " ++ Debug.toString (model.timeUsed)) |> filled black|> move (-70,50)
                  ,
                  case model.dragState of 
                     Released -> 
                         group []
                           
                     Dragging -> rect 185 125 
                         |> ghost 
                         |> notifyMouseMoveAt Drag 
                         |> notifyLeave ChangeDragState 
                         |> notifyMouseUp ChangeDragState
                         |> notifyTap ChangeDragState
                         |> notifyEnter StartTime
                         |> notifyMouseUp LeaveTime
                         |> notifyMouseUpAt OrignPos
                         |> notifyLeaveAt OrignPos ]
            

button someText transition amount = group [ roundedRect 50 10 5 |> filled red , 
                                    text someText
                                              
                                              |> filled black 
                                              |> move(amount, -5)
                                              |> scale 0.5
                                  ]
                                 |> notifyTap transition

type DragState = Released | Dragging

type CardState = InsideWallent | LeaveWallent

type DragState_1 = Released_1 | Dragging_1

type LeafState = Released_2 | Dragging_2

type LeafState_3 = Released_3 | Dragging_3

type LeafState_4 = Released_4 | Dragging_4 

type LeafState_5 = Released_5 | Dragging_5

type LeafState_6 = Released_6 | Dragging_6

type Msg = Tick Float GetKeyState
         | P1LD
         | P1UL
         | P1L
         | P2DL
         | Task1
         | Task1Fail
         | Task1Pass
         | P2R
         | P2RD
         | P2LD
         | P3RDRU
         | P3DR
         | P3RDR
         | P4UR
         | Task2
         | Task2Fail
         | Task2Pass
         | P4LU
         | P2L
         | P2DR
         | P2D
         | Drag (Float, Float) 
         | ChangeDragState 
         | ClickOnCard 
         | OrignPos (Float, Float) 
         | LeaveTime 
         | StartTime
         | P4U
         | InitTask
         | Drag_1 (Float, Float) 
         | ChangeLeaf_1 
         | Drag_2 (Float, Float)
         | ChangeLeaf_2 
         | Drag_3 (Float, Float) 
         | ChangeLeaf_3 
         | Drag_4 (Float, Float)
         | ChangeLeaf_4 
         | Drag_5 (Float, Float) 
         | ChangeLeaf_5 
         | Drag_6 (Float, Float)
         | ChangeLeaf_6 
         | LeafCounter 
         | UpdateTimestamp
         | StartTimer
         | FailDisplay
         | ResetLeaf
         | ResetPos1
         | ResetPos2
         | ResetPos3
         | ResetPos4
         | ResetPos5
         | ResetPos6
         | ResetMsg
         
type State = Cafeteria 
           | MedBay 
           | UpperEngine 
           | Reactor 
           | Security 
           | LowerEngine 
           | CleanUpTask 
           | Electrical 
           | Storage 
           | Admin 
           | CardSwipeTask

wallet = group [rect 90 90 |> filled darkGrey,
                roundedRect 85 30 3 |> filled (rgb 165 42 42) |> move (0, -29),
                roundedRect 85 31 3 |> outlined (solid 1.5) (black) |> move (0, -29),
                polygon [(-4,2),(-2,1),(2,1),(4,2)] |> filled (rgb 210 180 140) |> scaleX 10 |> scaleY 5 |> move (0,-24),
                polygon [(-4,2),(-2,1),(2,1),(4,2)] |> outlined (solid 0.2) (black) |> scaleX 10 |> scaleY 5 |> move (0,-24),
                polygon [(0,0),(0,-10),(30,0)] |> filled (rgb 133 187 101) |> rotate 6 |> move (-5,-10),
                text "$20" |> filled black |> scale 0.4 |> rotate 6 |> move (-5,-15),
                rect 40 5 |> outlined (solid 1) (black) |> move (-22, -25),
                rect 30 23 |>filled (rgb 224 255 255) |> move (25,-31),
                rect 30 23 |>outlined (solid 1) (black) |> move (25,-31),
                wedge 10 0.75 |> filled yellow |> move (25, -31),
                wedge 10 0.75 |> outlined (solid 0.5) (black) |> move (25, -31),
                circle 2 |> filled white |> move (25, -25),
                circle 2 |> outlined (solid 0.5) (black) |> move (25, -25),
                circle 0.7 |> filled black |> move (25, -25),
                polygon [(0,1), (2,1),(4,2),(4,-4),(0,-4)] |> outlined (solid 0.1) (black) |> scaleX 10.4 |> scaleY 5|> move (0,-24),
                polygon [(-4,2),(-2,1),(-0.2,1),(-0.2,-4),(-4,-4)] |> outlined (solid 0.1) (black) |> move (0,-4.8)|> scaleX 10.4|> scaleY 5,
                roundedRect 90 14 3 |> filled grey |> move (0, 5),
                roundedRect 90 15 3 |> outlined (solid 1) black|> move (0, 5),
                rect 90 30 |> filled black |> move (0, 30),
                rect 91 91 |> outlined (solid 1) black]
hideTheCardSpare txt = group [rect 39 11 |> filled (rgb 165 42 42)|> move (-21.8, -38),
                              rect 39 11 |> outlined (solid 1) (black) |> move (-21.8, -38),
                              roundedRect 90 27 3 |> filled grey |> move (0, 30.5),
                              roundedRect 90 27 3 |> outlined (solid 1) (black) |> move (0, 30.5),
                              rect 77 9 |> filled darkGreen |> move (0, 38),
                              rect 78 10 |> outlined (solid 1) black |> move (0, 38),
                              text txt|> filled white |> move ( -63,61) |> scale 0.6]
card = group [roundedRect 35 20 3|> filled (rgb 255 253 208),
              roundedRect 35 20 3|> outlined (solid 0.6) (black),
              text "CREWMATE ID CARD" |> filled black |> scale 0.2 |> move (-14.5,5),
              roundedRect 10 10 2 |> filled (rgb 224 255 255) |> move (-10,-2),
              roundedRect 10 10 2 |> outlined (solid 1) (black) |> move (-10,-2),
              group [ wedge 10 0.75 |> filled yellow|> move (0, 0) ,
                       wedge 10 0.75 |> outlined (solid 0.5) (black) |> move (0, 0),
                       circle 2      |> filled white |> move (0, 5),
                       circle 2      |> outlined (solid 0.5) (black) |> move (0, 5),
                       circle 0.7    |> filled black |> move (0, 5)]|> scale 0.4 |>move (-10.2,-2),
              text "NAME: PLAYER" |> filled black |> scale 0.2 |> move (-2,1),
              text "HEIGHT: 42 INCH" |> filled black |> scale 0.2 |> move (-2,-2.2),
              text "STATUS: ALIVE" |> filled black |> scale 0.2 |> move (-2,-5.5)]
update msg model =
    case msg of
        Tick t _ ->
            { model | time = t }
        P1LD ->
            case model.state of
                Cafeteria  ->
                    { model | state = MedBay  }
                otherwise ->
                    model
        P1UL ->
            case model.state of
                MedBay  ->
                    { model | state = UpperEngine  }
                otherwise ->
                    model
        P1L ->
            case model.state of
                Cafeteria  ->
                    { model | state = UpperEngine  }
                otherwise ->
                    model
        P2DL ->
            case model.state of
                UpperEngine  ->
                    { model | state = Reactor  }
                otherwise ->
                    model
        Task1 ->
            case model.state of
                Reactor  ->
                    { model | state = CleanUpTask  }
                otherwise ->
                    model
        Task1Fail ->
            case model.state of
                CleanUpTask  ->
                    { model | state = CleanUpTask  }
                otherwise ->
                    model
        Task1Pass ->
            case model.state of
                CleanUpTask  ->
                    { model 
                    | state = Reactor
                    , 
                     completeMsg = "Task Completed"}
                otherwise ->
                    model
        P2R ->
            case model.state of
                Reactor  ->
                    { model | state = Security  }
                otherwise ->
                    model
        P2RD ->
            case model.state of
                Reactor  ->
                    { model | state = LowerEngine  }
                otherwise ->
                    model
        P2LD ->
            case model.state of
                Security  ->
                    { model | state = LowerEngine  }
                otherwise ->
                    model
        P3RDRU ->
            case model.state of
                LowerEngine  ->
                    { model | state = Electrical  }
                otherwise ->
                    model
        P3DR ->
            case model.state of
                Electrical  ->
                    { model | state = Storage  }
                otherwise ->
                    model
        P3RDR ->
            case model.state of
                LowerEngine  ->
                    { model | state = Storage  }
                otherwise ->
                    model
        P4UR ->
            case model.state of
                Storage  ->
                    { model | state = Admin  }
                otherwise ->
                    model
        Task2 ->
            case model.state of
                Admin  ->
                    { model | state = CardSwipeTask  }
                otherwise ->
                    model
        Task2Fail ->
            case model.state of
                CardSwipeTask  ->
                    { model | state = CardSwipeTask  }
                otherwise ->
                    model
        Task2Pass ->
            case model.state of
                CardSwipeTask  ->
                    { model | state = Admin  }
                otherwise ->
                    model
        P4LU ->
            case model.state of
                Admin  ->
                    { model | state = Cafeteria  }
                otherwise ->
                    model
        P2L ->
            case model.state of
                Security  ->
                    { model | state = Reactor  }
                otherwise ->
                    model
        P2DR ->
            case model.state of
                UpperEngine  ->
                    { model | state = Security  }
                otherwise ->
                    model
        P2D ->
            case model.state of
                UpperEngine  ->
                    { model | state = LowerEngine  }
                otherwise ->
                    model
        P4U ->
            case model.state of
                Storage  ->
                    { model | state = Cafeteria  }
                otherwise ->
                    model
        Drag (x, y) -> { model | pos = (x , 10)}
                      
                     
        ChangeDragState -> { model | dragState = case model.dragState of
                                                Released -> Dragging
                                                Dragging -> Released}
        ClickOnCard -> { model | pos = (-35,10), cardState = LeaveWallent, txtShow = "PLEASE SWIPE CARD"}
        LeaveTime -> {model | endTime = model.time}
        StartTime -> {model | startTime = model.time, timeUsed = 0}
        InitTask -> {model | pos = (-22, -32), txtShow = "PLEASE ClICK CARD", cardState = InsideWallent, timeUsed = 0}
        OrignPos (x,y) ->
                if x < 35 then {model | pos = (-35,10), txtShow = "BAD READ. TRY AGAIN", timeUsed = model.endTime - model.startTime}
                else if (model.endTime - model.startTime) < 1 then {model | pos = (-35,10), txtShow = "TOO FAST! TRY AGAIN!", timeUsed = model.endTime - model.startTime}
                else if (model.endTime - model.startTime) > 2 then {model | pos = (-35,10), txtShow = "TOO SLOW! TRY AGAIN", timeUsed = model.endTime - model.startTime}
                else {model | pos = (-22, -32), txtShow = "ACCEPTED. THANK YOU.", compText =  "Task Completed!", state = Admin, cardState = InsideWallent, timeUsed = model.endTime - model.startTime}

                     
        UpdateTimestamp -> { model | timestamp = model.time + 0.4}
        StartTimer -> { model | startTimer = model.time + 31}
        FailDisplay -> { model | failDisplay = model.time + 2}
        Drag_1 (x, y) -> { model | pos1 = (x, y)}
        ResetPos1 -> {model | pos1 = (0, 0) }
        ResetPos2 -> {model | pos2 = (0, 20) }  
        ResetPos3 -> {model | pos3 = (-20, 30) } 
        ResetPos4 -> {model | pos4 = (-20, -28) }
        ResetPos5 -> {model | pos5 = (30, -20) }
        ResetPos6 -> {model | pos6 = (25, 15) }
        ResetMsg  -> {model | completeMsg = ""}
        Drag_2 (x, y) -> {model | pos2 = (x, y) }
        Drag_3 (x, y) -> {model | pos3 = (x, y) }
        Drag_4 (x, y) -> {model | pos4 = (x, y) }
        Drag_5 (x, y) -> {model | pos5 = (x, y) }
        Drag_6 (x, y) -> {model | pos6 = (x, y) }
        LeafCounter   -> {model   | leafCount = model.leafCount + 1}
        ResetLeaf     -> {model   | leafCount = 0}
        ChangeLeaf_1  -> { model | dragState1 = case model.dragState1 of
                                                                Released_1 -> Dragging_1
                                                                Dragging_1 -> Released_1
                                          
                                                             }
        ChangeLeaf_2 -> { model | dragState2 = case model.dragState2 of
                                                                Released_2 -> Dragging_2
                                                                Dragging_2 -> Released_2
                                                             }                                                        
        ChangeLeaf_3 -> { model | dragState3 = case model.dragState3 of
                                                                Released_3 -> Dragging_3
                                                                Dragging_3 -> Released_3
                                                             }    
        ChangeLeaf_4 -> { model | dragState4 = case model.dragState4 of
                                                                Released_4 -> Dragging_4
                                                                Dragging_4 -> Released_4
                                                             }   
        ChangeLeaf_5 -> { model | dragState5 = case model.dragState5 of
                                                                Released_5 -> Dragging_5
                                                                Dragging_5 -> Released_5
                                                             }                                                                
        ChangeLeaf_6 -> { model | dragState6 = case model.dragState6 of
                                                                Released_6 -> Dragging_6
                                                                Dragging_6 -> Released_6
                                                             }    
init = { time = 0 
       , state = Cafeteria
       , pos = (-22, -32)
       , dragState = Released
       , cardState = InsideWallent
       , txtShow = "PLEASE ClICK CARD"
       , compText = ""
       , startTime = 0
       , startTimer = 0
       , endTime =0
       , timeUsed = 0
       , timestamp = 0
       , failDisplay = 0
       , dragState1 = Released_1
       , dragState2 = Released_2
       , dragState3 = Released_3
       , dragState4 = Released_4
       , dragState5 = Released_5
       , dragState6 = Released_6
       , pos1 = (0,0)
       , pos2 = (0, 20)
       , pos3 = (-20, 30)
       , pos4 = (-20, -28)
       , pos5 = (30, -20)
       , pos6 = (25, 15)
       , leafCount = 0
       , completeMsg = ""
       }
       
rightPos : (Float, Float) -> (Float, Float)
rightPos (x, y) = if x > -48 && x < 38 then
                if y > -38 && y < 38 then
                  (x, y)
                else if y <= -38 then
                  (x, -38)
                else 
                  (x, 38)
               else if x <= -48 then
                if y > -38 && y < 38 then
                  (-48, y)
                else if y <= -38 then
                  (-48, -38)
                else 
                  (-48, 38)                
               else 
                if y > -38 && y < 38 then
                  (38, y)
                else if y <= -38 then
                  (38, -38)
                else 
                  (38, 38)  
                  

timer seconds = group [rect 45 13 
                        |> filled yellow
                        |> move (96, 55)
                       ,
                       
                       text (String.left 2 (String.fromFloat seconds))
                        |> outlined (solid 1) black
                        |> move (132, 64)
                        |> scale 0.8
                        
                       ,
                       
                       text "Timer:"
                       |> outlined (solid 1) black
                       |> move (95, 64)
                       |> scale 0.8
                       
                       ,
                       
                       rect 45.1 13.1
                       |> outlined (solid 1) black
                       |> move (96, 55)
                       
                       ]|> scale 0.8
                       
                       

              
leaf = group[oval 10 15
             |> filled green
             ,
             
             triangle 5 
             |> filled green 
             |> rotate (degrees 30) 
             |> move (0, -6.5)
             
             ,
             
             rect 0.4 3 
             |> filled darkGreen 
             |> rotate (degrees 40) 
             |> move (1, 5)
             
             ,
             
             rect 0.4 3.2 
             |> filled darkGreen 
             |> rotate (degrees 137) 
             |> move(-1.4, 5)
             
             ,
             
             rect 0.4 4 
             |> filled darkGreen 
             |> rotate (degrees 40) 
             |> move (1, 3)
             
             ,
             
             rect 0.4 4.2 
             |> filled darkGreen 
             |> rotate (degrees 137) 
             |> move(-1.4, 3)
             
             ,
             
             rect 0.4 5 
             |> filled darkGreen 
             |> rotate (degrees 40) 
             |> move (1.2, 0.5)
             
             ,
             
             rect 0.4 5.2 
             |> filled darkGreen 
             |> rotate (degrees 137) 
             |> move(-1.8, 0.5) 
             
             ,
            
             rect 0.4 5 
             |> filled darkGreen 
             |> rotate (degrees 30) 
             |> move (1.2, -1.8)
             
             ,
             
             rect 0.4 5.2 
             |> filled darkGreen 
             |> rotate (degrees 147) |> move(-1.8, -1.8) 
             
             ,
             
             
             rect 1.1 20 
             |> filled darkGreen 
             |> move (0, 0)
             
             ,
             
             triangle 0.8 
             |> filled darkGreen
             |> rotate (degrees 30) 
             |> move (0, -10)
             
             
             
               

          ]|> rotate (degrees 180)


myBackground = square 100 |> filled lightBlue

ghostBackground = square 100 |> filled orange

leftWall = group [
                    rect 50 200
                    |> filled gray
                    |> move (-96, 0)
                    ,
                    rect 1 200
                    |> filled black
                    |> move (-71, 0)
                  ]|> scale 0.5

leafVent = group [
                    rect 8 40
                    |> filled black
                    |> move (-82, 0)
                    ,
                    triangle 5
                    |> filled darkGray
                    |> move (-92, 0)
                    ,
                    triangle 3
                    |> filled darkGray
                    |> rotate (degrees 180)
                    |> move (-74, 0)
                    ,
                    triangle 5.38
                    |> filled black
                    |> rotate (degrees 0)
                    |> move (-83.28, 19.9)
                    ,
                    triangle 5.38
                    |> filled black
                    |> rotate (degrees 0)
                    |> move (-83.28, -19.9)
                    ]|> scale 0.9 
                     |> move (27, 0)
                    

ghostVent = group [
                    rect 8 40
                    |> filled pink
                    |> move (-82, 0)
                    ,
                    triangle 5.38
                    |> filled pink
                    |> rotate (degrees 0)
                    |> move (-83.28, 19.9)
                    ,
                    triangle 5.38
                    |> filled pink
                    |> rotate (degrees 0)
                    |> move (-83.28, -19.9)
                    ,
                    rect 60 40
                    |> filled pink
                    |> move (-115, 0)
                    ]|> scale 0.9
                     |> scaleX 1.8
                     |> scaleY 1.3
                     |> move (88, 0)

