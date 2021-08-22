( DEFINE ( PROBLEM SET_TABLE )
( :DOMAIN HUMORO_TABLE )
( :OBJECTS
	A0 A1
	CHAIR1 CHAIR2
	TABLE SMALL_SHELF BIG_SHELF
	CUP_RED CUP_GREEN CUP_BLUE CUP_PINK PLATE_PINK PLATE_RED PLATE_GREEN PLATE_BLUE JUG BOWL
)
( :INIT
    ( AGENT A0 )
    ( AGENT A1 )
    ( LOCATION CHAIR1 )
    ( LOCATION CHAIR2 )
    ( LOCATION TABLE )
    ( LOCATION SMALL_SHELF )
    ( LOCATION BIG_SHELF )
    ( OBJECT CUP_RED )
    ( OBJECT CUP_GREEN )
    ( OBJECT CUP_BLUE )
    ( OBJECT CUP_PINK )
    ( OBJECT PLATE_PINK )
    ( OBJECT PLATE_RED )
    ( OBJECT PLATE_GREEN )
    ( OBJECT PLATE_BLUE )
    ( OBJECT JUG )
    ( OBJECT BOWL )
	( FREE-BLOCK )
	( FREE-AGENT A0 )
	( FREE-AGENT A1 )
	( AGENT-FREE A0 )
	( AGENT-FREE A1 )
	( AGENT-AT A0 TABLE )
	( AGENT-AT A1 TABLE )
	( OBJECT-AVAILABLE PLATE_BLUE )
	( OBJECT-AVAILABLE PLATE_PINK )
	( OBJECT-AVAILABLE PLATE_RED )
	( OBJECT-AVAILABLE PLATE_GREEN )
	( OBJECT-AVAILABLE CUP_BLUE )
	( OBJECT-AVAILABLE CUP_PINK )
	( OBJECT-AVAILABLE CUP_RED )
	( OBJECT-AVAILABLE CUP_GREEN )
	( OBJECT-AVAILABLE JUG )
	( ON PLATE_BLUE BIG_SHELF )
	( ON PLATE_PINK BIG_SHELF )
	( ON PLATE_RED BIG_SHELF )
	( ON PLATE_GREEN BIG_SHELF )
	( ON BOWL BIG_SHELF )
	( ON CUP_RED SMALL_SHELF )
	( ON CUP_GREEN SMALL_SHELF )
	( ON CUP_BLUE SMALL_SHELF )
	( ON CUP_PINK SMALL_SHELF )
	( ON JUG SMALL_SHELF )
)
( :GOAL
	( AND
	    ( AGENT A0 )
        ( AGENT A1 )
        ( LOCATION CHAIR1 )
        ( LOCATION CHAIR2 )
        ( LOCATION TABLE )
        ( LOCATION SMALL_SHELF )
        ( LOCATION BIG_SHELF )
        ( OBJECT CUP_RED )
        ( OBJECT CUP_GREEN )
        ( OBJECT CUP_BLUE )
        ( OBJECT CUP_PINK )
        ( OBJECT PLATE_PINK )
        ( OBJECT PLATE_RED )
        ( OBJECT PLATE_GREEN )
        ( OBJECT PLATE_BLUE )
        ( OBJECT JUG )
        ( OBJECT BOWL )
		( FREE-BLOCK )
		( ON PLATE_BLUE TABLE )
		( ON PLATE_PINK TABLE )
		( ON PLATE_GREEN TABLE )
		( ON PLATE_RED TABLE )
		( ON CUP_BLUE TABLE )
		( ON CUP_PINK TABLE )
		( ON CUP_GREEN TABLE )
		( ON CUP_RED TABLE )
		( ON JUG TABLE )
		( ON BOWL BIG_SHELF )
	)
)
)