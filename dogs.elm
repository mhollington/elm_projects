import Bootstrap.Form.Input as Input 
import Html.Events as Events
import Set exposing (Set)

--this appears at the top of the browser screen (or on the tab)
title : String
title = "Dogs"

blankLine = Grid.row [] --this is an empty row (to add blank space)
              [ Grid.col []
                  [ Html.h6[Spacing.my3][] --change spacing number to make empty row bigger or smaller (0-5)
                  ]
              ]
        
page : Model -> List (Html Msg)
page model =
    [ Grid.container [] -- Wrap in a container to center the navbar
        [ Navbar.config NavbarMsg
            |> Navbar.withAnimation
            |> Navbar.collapseMedium            -- Collapse menu at the medium breakpoint
            |> Navbar.info                      -- Customize coloring
            |> Navbar.brand                     -- Add logo to your brand with a little styling to align nicely
                [ href "#" ]
                [ Html.img
                    [ src "https://mpng.subpng.com/20180616/seh/kisspng-dog-logo-snout-veterinarian-canidae-cachorro-5b251ea1368d19.7731991515291593292235.jpg"
                    , class "d-inline-block align-top"
                    , style  "width" "120px" 
                    ]
                    []
                ]
            |> Navbar.items
                [ Navbar.itemLink
                    [ href "#" ] [ Html.text "Does Nothing 1" ]

                , Navbar.itemLink
                    [ href "#" ] [ Html.text "Does nothing 2" ]
                    
                , Navbar.dropdown        
                    { id = "mydropdown"
                    , toggle = Navbar.dropdownToggle [] [ Html.text "Dog info" ]
                    , items =
                        [Navbar.dropdownItem [ href "https://en.wikipedia.org/wiki/Dog" ] [Html.text "What is a dog"],
                        Navbar.dropdownItem [ href "https://dogtime.com/dog-breeds/profiles" ] [Html.text "Dog Breeds"],
                        Navbar.dropdownItem [ href "https://www.dogtales.ca/adopt-a-dog" ] [Html.text "Adopt A Dog"]]
                        
                    }
                ]
            |> Navbar.customItems
                [ Navbar.formItem []
                    [ Input.text [ Input.attrs [placeholder "character search", value model.searchString, Events.onInput UpdateSearch ]]]
                     
                ]       
                
            |> Navbar.view model.navbarState
        ]
     --HEADER
    , Html.div [] []
    ] 
    ++
    ( List.map (\ wrd -> Html.text (wrd ++ ", ")) model.searchList )
    ++ (showCarousel model (Set.toList (searchBar model)))
  
                  

{- The number of accordions, carousels and pop ups.
   To add more than one of each, you must increase these numbers and then make sure to
   put the correct id in the code where you add it. The ids start at 0 and go up from there
   (0, 1, 2, 3, etc.)
-}
numAccordions = 1
numCarousels = 9
numPopUps = 1

showCarousel model list = 
  case list of
    "german shepherd" :: moreList ->
       [germanShepherd model, germanShepAcc model, Html.div [] []] ++ (showCarousel model moreList)
    "siberian husky" :: moreList ->
       [siberianHusky model, siberianHusAcc model, Html.div [] []] ++ (showCarousel model moreList)
    "bulldog" :: moreList ->
       [bullDog model, bullDogAcc model, Html.div [] []] ++ (showCarousel model moreList)   
    "poodle" :: moreList ->
       [poodle model, poodleAcc model, Html.div [] []] ++ (showCarousel model moreList) 
    "golden retriever" :: moreList ->
       [goldenRetriever model, goldenRetAcc model, Html.div [] []] ++ (showCarousel model moreList)
    "chihuahua" :: moreList ->
       [chihuahua model, chihuahuaAcc model, Html.div [] []] ++ (showCarousel model moreList)
    "corgi" :: moreList ->
       [corgi model, corgiAcc model, Html.div [] []] ++ (showCarousel model moreList)
    "greyhound" :: moreList ->
       [greyHound model, greyHoundAcc model, Html.div [] []] ++ (showCarousel model moreList)
    "border collie" :: moreList ->
       [borderCollie model, borderCollAcc model, Html.div [] []] ++ (showCarousel model moreList)
    "dalmatian" :: moreList ->
       [dalmatian model, dalmatianAcc model, Html.div [] []] ++ (showCarousel model moreList)       
    _ :: moreList ->
      []
    [] -> []
      

makeCarousel model id link1 link2 link3 = Carousel.config (CarouselMsg id {-the id number of the Carousel-}) [style "height" "500px"]
                                            |> Carousel.slides
                                                [ Slide.config [] (image "500px" link1)
                                                , Slide.config [] (image "500px" link2)
                                                , Slide.config [] (image "500px" link3)
                                                ]
                                            |> Carousel.withIndicators
                                            |> Carousel.view (carouselState id model.carouselStates)


germanShepherd model = makeCarousel model 0 "https://upload.wikimedia.org/wikipedia/commons/6/61/20110425_German_Shepherd_Dog_8505.jpg" "https://t3.ftcdn.net/jpg/03/71/50/48/360_F_371504841_Alggb6D2MaMhw6JmjsXhKOwAyFsdWXpW.jpg" "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2018/03/12191539/German-shepherd-puppies-licking-header-500x486.jpg"
                
siberianHusky model = makeCarousel model 1 "https://moderndogmagazine.com/sites/default/files/images/articles/top_images/husky2.jpg" "https://i.pinimg.com/originals/d5/94/e9/d594e97fbe465daa076caf6be4484579.jpg" "https://cache.desktopnexus.com/thumbseg/299/299843-bigthumbnail.jpg"
                   
                      
bullDog model =  makeCarousel model 2 "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/11234019/Bulldog-standing-in-the-grass.jpg" "https://www.cesarsway.com/wp-content/uploads/2019/06/AdobeStock_38321652.jpeg" "https://www.vicnews.com/wp-content/uploads/2020/01/20208471_web1_french-bulldog-puppy-pexels-1024x683.jpg"
 
                        
poodle model =        Carousel.config (CarouselMsg 3 {-the id number of the Carousel-}) [style "height" "500px"]
                        |> Carousel.slides
                            [ Slide.config [] (image "500px" "https://www.rover.com/blog/wp-content/uploads/2019/12/top-french-poodle-dog-names-960x540.jpg")
                            , Slide.config [] (image "500px" "https://thehappypuppysite.com/wp-content/uploads/2018/01/Toy-Poodle-HP-long.jpg")
                            , Slide.config [] (image "500px" "https://a-z-animals.com/media/Poodle-Canis-familiaris-white.jpg")
                            ]
                        |> Carousel.withIndicators
                        |> Carousel.view (carouselState 3 model.carouselStates)
                        
goldenRetriever model = Carousel.config (CarouselMsg 4 {-the id number of the Carousel-}) [style "height" "500px"]
                        |> Carousel.slides
                            [ Slide.config [] (image "500px" "https://vetstreet-brightspot.s3.amazonaws.com/98/d98250a0d311e0a2380050568d634f/file/Golden-Retriever-3-645mk062411.jpg")
                            , Slide.config [] (image "500px" "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2020/07/09151754/Golden-Retriever-puppy-standing-outdoors-500x486.jpg")
                            , Slide.config [] (image "500px" "https://dogsbestlife.com/wp-content/uploads/2019/07/golden-retriever-plays-fetch-min.jpeg")
                            ]
                        |> Carousel.withIndicators
                        |> Carousel.view (carouselState 4 model.carouselStates) 

chihuahua model =     Carousel.config (CarouselMsg 5 {-the id number of the Carousel-}) [style "height" "500px"]
                        |> Carousel.slides
                            [ Slide.config [] (image "500px" "https://thehappypuppysite.com/wp-content/uploads/2019/06/Chihuahua-pics-HP-long.jpg")
                            , Slide.config [] (image "500px" "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/27134552/Chihuahua-laying-down-with-her-puppies.jpg")
                            , Slide.config [] (image "500px" "https://www.loveyourdog.com/wp-content/uploads/2020/04/Chihuahua-Relaxing-Indoors.jpg")
                            ]
                        |> Carousel.withIndicators
                        |> Carousel.view (carouselState 5 model.carouselStates) 
                        
corgi model =         Carousel.config (CarouselMsg 6 {-the id number of the Carousel-}) [style "height" "500px"]
                        |> Carousel.slides
                            [ Slide.config [] (image "500px" "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/14112506/Pembroke-Welsh-Corgi-standing-outdoors-in-the-fall.jpg")
                            , Slide.config [] (image "500px" "https://mymodernmet.com/wp/wp-content/uploads/2020/10/cooper-baby-corgi-dogs-8.jpg")
                            , Slide.config [] (image "500px" "https://mymodernmet.com/wp/wp-content/uploads/2020/10/cute-corgi-dogs-thumbnail.jpg")
                            ]
                        |> Carousel.withIndicators
                        |> Carousel.view (carouselState 6 model.carouselStates) 
                        
greyHound model =     Carousel.config (CarouselMsg 7 {-the id number of the Carousel-}) [style "height" "500px"]
                        |> Carousel.slides
                            [ Slide.config [] (image "500px" "https://blog.humanesociety.org/wp-content/uploads/2020/10/greyhounds-alamyEAWDH7_311303-scaled.jpg")
                            , Slide.config [] (image "500px" "https://s3.amazonaws.com/cdn-origin-etr.akc.org/wp-content/uploads/2017/11/03144628/Greyhound-running.jpg")
                            , Slide.config [] (image "500px" "https://figopetinsurance.com/sites/default/files/imagedogscute-italian-greyhound-sitting-couchblog.jpg")
                            ]
                        |> Carousel.withIndicators
                        |> Carousel.view (carouselState 7 model.carouselStates) 
                        
borderCollie model =     Carousel.config (CarouselMsg 8 {-the id number of the Carousel-}) [style "height" "500px"]
                        |> Carousel.slides
                            [ Slide.config [] (image "500px" "http://cdn.akc.org/content/hero/border_collie_hero.jpg")
                            , Slide.config [] (image "500px" "https://dogsbestlife.com/wp-content/uploads/2019/02/clone-min-1.jpeg")
                            , Slide.config [] (image "500px" "https://www.animalfactsencyclopedia.com/images/border-collie-puppy.jpg")
                            ]
                        |> Carousel.withIndicators
                        |> Carousel.view (carouselState 8 model.carouselStates) 
                        
dalmatian model =     Carousel.config (CarouselMsg 9 {-the id number of the Carousel-}) [style "height" "500px"]
                        |> Carousel.slides
                            [ Slide.config [] (image "500px" "https://vetstreet-brightspot.s3.amazonaws.com/ee/140380a73111e0a0d50050568d634f/file/Dalmatian-2-645mk062311.jpg")
                            , Slide.config [] (image "500px" "https://thehappypuppysite.com/wp-content/uploads/2019/06/Miniature-Dalmatian-HP-LONG.jpg")
                            , Slide.config [] (image "500px" "https://i.pinimg.com/originals/15/b9/28/15b928303aaa8aa65fa931a611c789af.jpg")
                            ]
                        |> Carousel.withIndicators
                        |> Carousel.view (carouselState 9 model.carouselStates)  
                        
                                               
germanShepAcc model =  Accordion.config (AccordionMsg 0) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card1" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "German Shepherd" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "German Shepherds originated from Germany in the year 1899." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 0 {-same id as above-} model.accordionStates)
 
siberianHusAcc model =  Accordion.config (AccordionMsg 1) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card2" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Siberian Husky" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "Siberian Huskies originated from Siberia, and are known to be very talkative dogs." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 1 {-same id as above-} model.accordionStates)
  
  
bullDogAcc model =  Accordion.config (AccordionMsg 2) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card3" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Bulldog" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "English Bulldogs were originally bred to fight bulls." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 2 {-same id as above-} model.accordionStates)  

poodleAcc model =    Accordion.config (AccordionMsg 3) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card4" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Poodle" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "Poodles were originally bred as hunting dogs." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 3 {-same id as above-} model.accordionStates)

goldenRetAcc model =  Accordion.config (AccordionMsg 4) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card5" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Golden Retriever" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "Golden Retrievers are incredible swimmers, due to the large webbing between their toes and long tail." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 4 {-same id as above-} model.accordionStates)
                                
  
chihuahuaAcc model =  Accordion.config (AccordionMsg 5) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card6" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Chihuahua" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "Chihuahuas originate from Mexico." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 5 {-same id as above-} model.accordionStates)
 
corgiAcc model =     Accordion.config (AccordionMsg 6) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card7" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Corgi" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "Corgis are popular among British Royalty." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 6 {-same id as above-} model.accordionStates)
 
 
greyHoundAcc model =  Accordion.config (AccordionMsg 7) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card8" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Greyhound" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "Greyhounds are the fastest dogs in the world." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 7 {-same id as above-} model.accordionStates)

borderCollAcc model =  Accordion.config (AccordionMsg 8) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card9" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Border Collie" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "Border Collies are the ultimate herding dogs." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 8 {-same id as above-} model.accordionStates)

dalmatianAcc model =  Accordion.config (AccordionMsg 9) -- the ID number of the accordion
                        |> Accordion.withAnimation
                        |> Accordion.cards
                            [ Accordion.card
                                { id = "card10" --each accordion card needs an id
                                , options = []
                                , header =
                                    Accordion.header [] <| Accordion.toggle [] [ Html.text "Dalmatian" ]
                                , blocks =
                                    [ Accordion.block []
                                        [ Block.text [] [ Html.text "Dalmatians are born with no spots, and they are often known as firehouse dogs." ] ]
                                    ]
                                }
                                ] |> Accordion.view (accordionState 9 {-same id as above-} model.accordionStates)
                                 
type alias Model =
    { navKey : Navigation.Key
    , page : Page
    , time : Float
    , navbarState : Navbar.State
    , accordionStates : Dict Int Accordion.State --ADD ACCORDION
    , carouselStates : Dict Int Carousel.State -- ADD CAROUSEL
    , modalVisibilities : Dict Int Modal.Visibility -- ADD MODAL
    , searchString : String
    , searchList : List String
    }

type Page
    = Home
    | NotFound


type Msg
    = UrlChange Url
    | ClickedLink UrlRequest
    | NavbarMsg Navbar.State
    | NoOp
    | AccordionMsg Int Accordion.State --ADD ACCORDION
    | CarouselMsg Int Carousel.Msg --ADD CAROUSEL
    | CloseModal Int
    | ShowModal Int
    | Tick Float
    | UpdateSearch String

init : Flags -> Url -> Navigation.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        ( navbarState, navCmd ) =
            Navbar.initialState NavbarMsg

        ( model, urlCmd ) =
            urlUpdate url { navKey = key
                          , navbarState = navbarState
                          , page = Home
                          , time = 0
                          , accordionStates = Dict.fromList <| List.map (\n -> (n,Accordion.initialStateCardOpen "")) (List.range 0 (numAccordions-1)) --ADD ACCORDION - what does accordion look like when you open the page?
                            --Accordion.initialStateCardOpen "card1" -- if you put a card id, the accordion starts with that card open
                          , carouselStates = Dict.fromList <| List.map (\n -> (n,Carousel.initialState)) (List.range 0 (numCarousels-1))
                          , modalVisibilities = Dict.fromList <| List.map (\n -> (n,Modal.hidden)) (List.range 0 (numPopUps-1))
                          , searchString = ""
                          , searchList = []
                          }
    in
        ( model, Cmd.batch [ urlCmd, navCmd ] )



subscriptions : Model -> Sub Msg
subscriptions model =
    --ADD ACCORDION - now that there are multiple subscriptions, they need to be grouped in Sub.batch
    Sub.batch [Navbar.subscriptions model.navbarState NavbarMsg
              , Sub.batch <| List.map (\(n, s) -> Accordion.subscriptions s (AccordionMsg n)) <| Dict.toList model.accordionStates
              , Sub.batch <| List.map (\(n, s) -> Carousel.subscriptions s (CarouselMsg n)) <| Dict.toList model.carouselStates
              , onAnimationFrame ( \ posix -> Tick ((Time.posixToMillis posix |> toFloat) * 0.001) )
              ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        ClickedLink req ->
             case req of
                 Browser.Internal url ->
                     ( model, Navigation.pushUrl model.navKey <| Url.toString url )

                 Browser.External href ->
                     ( model, Navigation.load href )


        UrlChange url ->
            urlUpdate url model

        NavbarMsg state ->
            ( { model | navbarState = state }
            , Cmd.none
            )

        NoOp -> (model, Cmd.none)

        --ADD ACCORDION
        AccordionMsg id state ->
            ( { model | accordionStates = Dict.insert id state model.accordionStates }
            , Cmd.none
            )

        --ADD CAROUSEL
        CarouselMsg id cMsg ->
            ( {model | carouselStates = Dict.update id
                                            (\m -> case m of
                                                    Just s -> Just <| Carousel.update cMsg s
                                                    Nothing -> Nothing
                                            ) model.carouselStates

             }
            , Cmd.none
            )

        --ADD MODAL
        CloseModal id ->
            ( { model | modalVisibilities = Dict.insert id Modal.hidden model.modalVisibilities } , Cmd.none )

        ShowModal id ->
            ( { model | modalVisibilities = Dict.insert id Modal.shown model.modalVisibilities } , Cmd.none )

        Tick t -> ({ model | time = t }, Cmd.none)
        
        UpdateSearch str ->
                        let searchString = String.filter filterChars str
                            listWords = (String.split " " (String.toLower searchString))
                            firstList = List.take ((List.length listWords)-1) listWords
                            lastList = List.drop ((List.length listWords)-1) listWords
                            searchList = (List.filter commonWrds firstList)++lastList --filter out common words only from fully typed keyword
                        in
                        ({ model | searchString = searchString
                                 , searchList = searchList
                                --, searching = True
                                --, searchBeginT = if model.searching then model.searchBeginT else model.t
                                --, searchContinuesT = model.t
                                --, menuState = Closed
                        }, Cmd.none )

filterChars char = if Char.isLower char || Char.isUpper char || Char.isDigit char || char == ' ' then True else False


dogList = ["german shepherd", "siberian husky", "bulldog", "poodle", "golden retriever"
          , "chihuahua", "corgi", "greyhound", "border collie", "dalmatian"]

searchBar model = Set.fromList (searchResults (possibleCombo model.searchList dogList []) [])
                                                                         
possibleCombo wrd dog sugg =      if List.length wrd > 0 then
                                    let 
                                      newWrd = List.drop 1 wrd
                                      adding = List.map2 Tuple.pair (List.repeat 10 (headList "" (List.head wrd))) dog ++ sugg
                                    in 
                                      possibleCombo newWrd dog adding
                                   else
                                     sugg
                                  
                             
searchResults poss sugg = if List.length poss > 0 then
                           let
                             newPoss = List.drop 1 poss
                             inList = (checkString poss) ++ sugg
                           in 
                             searchResults newPoss inList
                          else
                            sugg
 
checkString list =  let
                      first_tuple = (Tuple.first (headList ("", "") (List.head list)))
                      second_tuple = (Tuple.second (headList ("a", "b") (List.head list)))
                    in 
                      if first_tuple /= "" && String.contains first_tuple second_tuple then
                        [second_tuple]
                      else
                        []
                    

headList : a -> Maybe a -> a
headList d maybeHead = case maybeHead of 
                       Just a -> a
                       Nothing -> d
                                 
                               
 
                  
                  
                  
commonWrds wrd = case wrd of
                  "the" -> False
                  "best" -> False
                  "with" -> False
                  "about" -> False
                  "and" -> False
                  "as" -> False
                  "at" -> False
                  "a" -> False
                  "to" -> False
                  "in" -> False
                  "by" -> False
                  "on" -> False
                  "for" -> False
                  "from" -> False
                  "greatest" -> False
                  "ever" -> False
                  "school" -> False
                  "grade" -> False
                  "catholic" -> False
                  "public" -> False
                  "junior" -> False
                  "senior" -> False
                  "elementary" -> False
                  "secondary" -> False
                  "district" -> False
                  "" -> False
                  _ -> True

resetViewport : Cmd Msg
resetViewport =
  Task.perform (\_ -> NoOp) (Dom.setViewport 0 0)


urlUpdate : Url -> Model -> ( Model, Cmd Msg )
urlUpdate url model =
    case decode url of
        Nothing ->
            ( { model | page = NotFound }, resetViewport )

        Just route ->
            ( { model | page = route }, resetViewport )

decode : Url -> Maybe Page
decode url =
    { url | path = Maybe.withDefault "" url.fragment, fragment = Nothing }
    |> UrlParser.parse routeParser

routeParser : Parser (Page -> a) a
routeParser =
    UrlParser.oneOf
        [ UrlParser.map Home top
        ]


view : Model -> Browser.Document Msg
view model =
    { title = case model.page of
          Home ->
            title

          NotFound ->
              "Page Not Found"
    , body =
        [
          Html.node "link" [attribute "rel" "stylesheet", href "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"] []
        , Html.node "link" [attribute "rel" "stylesheet", href "https://documents.mcmaster.ca/www/cdn/css/1.0/mcm-bw.css"] []
        ,  Html.div []
            [ mainContent model
            ]
        ]
    }

mainContent : Model -> Html Msg
mainContent model =
    Grid.container [] <|
        case model.page of
            Home ->
                page model

            NotFound ->
                pageNotFound


pageNotFound : List (Html Msg)
pageNotFound =
    [ Html.h1 [Spacing.my4] [ Html.text "Not found" ]
    , Html.text "Sorry, couldn't find that page"
    ]



