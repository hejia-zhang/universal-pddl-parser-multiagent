( DEFINE ( DOMAIN TABLEMOVER )
( :REQUIREMENTS :EQUALITY :CONDITIONAL-EFFECTS :TYPING :MULTI-AGENT )
( :TYPES
	AGENT - LOCATABLE
	LOCATABLE - OBJECT
	BLOCK - LOCATABLE
	TABLE - LOCATABLE
	ROOM - OBJECT
	SIDE - OBJECT
)
( :CONSTANTS
	TABLE - TABLE
)
( :PREDICATES
	( ON-TABLE ?BLOCK0 - BLOCK )
	( ON-FLOOR ?BLOCK0 - BLOCK )
	( DOWN ?SIDE0 - SIDE )
	( UP ?SIDE0 - SIDE )
	( CLEAR ?SIDE0 - SIDE )
	( AT-SIDE ?AGENT0 - AGENT ?SIDE1 - SIDE )
	( LIFTING ?AGENT0 - AGENT ?SIDE1 - SIDE )
	( INROOM ?LOCATABLE0 - LOCATABLE ?ROOM1 - ROOM )
	( AVAILABLE ?AGENT0 - AGENT )
	( HANDEMPTY ?AGENT0 - AGENT )
	( HOLDING ?AGENT0 - AGENT ?BLOCK1 - BLOCK )
	( CONNECTED ?ROOM0 - ROOM ?ROOM1 - ROOM )
)
( :CONCURRENT
	( PICKUP-FLOOR ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?ROOM2 - ROOM )
	( PICKUP-TABLE ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?ROOM2 - ROOM )
	( PUTDOWN-TABLE ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?ROOM2 - ROOM )
	( TO-TABLE ?AGENT0 - AGENT ?ROOM1 - ROOM ?SIDE2 - SIDE )
	( MOVE-TABLE ?AGENT0 - AGENT ?ROOM1 - ROOM ?ROOM2 - ROOM ?SIDE3 - SIDE )
	( LIFT-SIDE ?AGENT0 - AGENT ?SIDE1 - SIDE )
	( LOWER-SIDE ?AGENT0 - AGENT ?SIDE1 - SIDE )
)
( :ACTION PICKUP-FLOOR
  :PARAMETERS ( ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?ROOM2 - ROOM )
  :PRECONDITION
	( AND
		( ON-FLOOR ?BLOCK1 )
		( INROOM ?AGENT0 ?ROOM2 )
		( INROOM ?BLOCK1 ?ROOM2 )
		( AVAILABLE ?AGENT0 )
		( HANDEMPTY ?AGENT0 )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( PICKUP-FLOOR ?AGENT3 ?BLOCK1 ?ROOM2 ) )
		)
	)
  :EFFECT
	( AND
		( NOT ( ON-FLOOR ?BLOCK1 ) )
		( NOT ( INROOM ?BLOCK1 ?ROOM2 ) )
		( NOT ( HANDEMPTY ?AGENT0 ) )
		( HOLDING ?AGENT0 ?BLOCK1 )
	)
)
( :ACTION PUTDOWN-FLOOR
  :PARAMETERS ( ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?ROOM2 - ROOM )
  :PRECONDITION
	( AND
		( AVAILABLE ?AGENT0 )
		( INROOM ?AGENT0 ?ROOM2 )
		( HOLDING ?AGENT0 ?BLOCK1 )
	)
  :EFFECT
	( AND
		( ON-FLOOR ?BLOCK1 )
		( INROOM ?BLOCK1 ?ROOM2 )
		( HANDEMPTY ?AGENT0 )
		( NOT ( HOLDING ?AGENT0 ?BLOCK1 ) )
	)
)
( :ACTION PICKUP-TABLE
  :PARAMETERS ( ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?ROOM2 - ROOM )
  :PRECONDITION
	( AND
		( ON-TABLE ?BLOCK1 )
		( INROOM ?AGENT0 ?ROOM2 )
		( INROOM TABLE ?ROOM2 )
		( AVAILABLE ?AGENT0 )
		( HANDEMPTY ?AGENT0 )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( PICKUP-TABLE ?AGENT3 ?BLOCK1 ?ROOM2 ) )
		)
	)
  :EFFECT
	( AND
		( NOT ( ON-TABLE ?BLOCK1 ) )
		( NOT ( HANDEMPTY ?AGENT0 ) )
		( HOLDING ?AGENT0 ?BLOCK1 )
	)
)
( :ACTION PUTDOWN-TABLE
  :PARAMETERS ( ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?ROOM2 - ROOM )
  :PRECONDITION
	( AND
		( INROOM ?AGENT0 ?ROOM2 )
		( INROOM TABLE ?ROOM2 )
		( AVAILABLE ?AGENT0 )
		( HOLDING ?AGENT0 ?BLOCK1 )
		( FORALL
			( ?AGENT3 - AGENT ?SIDE4 - SIDE )
			( NOT ( LIFT-SIDE ?AGENT3 ?SIDE4 ) )
		)
	)
  :EFFECT
	( AND
		( ON-TABLE ?BLOCK1 )
		( HANDEMPTY ?AGENT0 )
		( NOT ( HOLDING ?AGENT0 ?BLOCK1 ) )
	)
)
( :ACTION TO-TABLE
  :PARAMETERS ( ?AGENT0 - AGENT ?ROOM1 - ROOM ?SIDE2 - SIDE )
  :PRECONDITION
	( AND
		( CLEAR ?SIDE2 )
		( INROOM ?AGENT0 ?ROOM1 )
		( INROOM TABLE ?ROOM1 )
		( AVAILABLE ?AGENT0 )
		( FORALL
			( ?AGENT3 - AGENT )
			( NOT ( TO-TABLE ?AGENT3 ?ROOM1 ?SIDE2 ) )
		)
	)
  :EFFECT
	( AND
		( NOT ( CLEAR ?SIDE2 ) )
		( AT-SIDE ?AGENT0 ?SIDE2 )
		( NOT ( AVAILABLE ?AGENT0 ) )
	)
)
( :ACTION LEAVE-TABLE
  :PARAMETERS ( ?AGENT0 - AGENT ?SIDE1 - SIDE )
  :PRECONDITION
	( AND
		( AT-SIDE ?AGENT0 ?SIDE1 )
		( NOT ( LIFTING ?AGENT0 ?SIDE1 ) )
	)
  :EFFECT
	( AND
		( CLEAR ?SIDE1 )
		( NOT ( AT-SIDE ?AGENT0 ?SIDE1 ) )
		( AVAILABLE ?AGENT0 )
	)
)
( :ACTION MOVE-TABLE
  :PARAMETERS ( ?AGENT0 - AGENT ?ROOM1 - ROOM ?ROOM2 - ROOM ?SIDE3 - SIDE )
  :PRECONDITION
	( AND
		( LIFTING ?AGENT0 ?SIDE3 )
		( INROOM ?AGENT0 ?ROOM1 )
		( CONNECTED ?ROOM1 ?ROOM2 )
		( EXISTS
			( ?AGENT4 - AGENT ?SIDE5 - SIDE )
			( AND
				( NOT ( = ?SIDE3 ?SIDE5 ) )
				( MOVE-TABLE ?AGENT4 ?ROOM1 ?ROOM2 ?SIDE5 )
			)
		)
	)
  :EFFECT
	( AND
		( NOT ( INROOM ?AGENT0 ?ROOM1 ) )
		( NOT ( INROOM TABLE ?ROOM1 ) )
		( INROOM ?AGENT0 ?ROOM2 )
		( INROOM TABLE ?ROOM2 )
	)
)
( :ACTION LIFT-SIDE
  :PARAMETERS ( ?AGENT0 - AGENT ?SIDE1 - SIDE )
  :PRECONDITION
	( AND
		( DOWN ?SIDE1 )
		( AT-SIDE ?AGENT0 ?SIDE1 )
		( HANDEMPTY ?AGENT0 )
		( FORALL
			( ?AGENT2 - AGENT ?SIDE3 - SIDE )
			( NOT ( LOWER-SIDE ?AGENT2 ?SIDE3 ) )
		)
	)
  :EFFECT
	( AND
		( NOT ( DOWN ?SIDE1 ) )
		( UP ?SIDE1 )
		( LIFTING ?AGENT0 ?SIDE1 )
		( NOT ( HANDEMPTY ?AGENT0 ) )
		( FORALL
			( ?BLOCK2 - BLOCK ?ROOM3 - ROOM ?SIDE4 - SIDE )
			( WHEN
				( AND
					( INROOM TABLE ?ROOM3 )
					( ON-TABLE ?BLOCK2 )
					( DOWN ?SIDE4 )
					( FORALL
						( ?AGENT5 - AGENT )
						( NOT ( LIFT-SIDE ?AGENT5 ?SIDE4 ) )
					)
				)
				( AND
					( ON-FLOOR ?BLOCK2 )
					( INROOM ?BLOCK2 ?ROOM3 )
					( NOT ( ON-TABLE ?BLOCK2 ) )
				)
			)
		)
	)
)
( :ACTION LOWER-SIDE
  :PARAMETERS ( ?AGENT0 - AGENT ?SIDE1 - SIDE )
  :PRECONDITION
	( AND
		( LIFTING ?AGENT0 ?SIDE1 )
		( FORALL
			( ?AGENT2 - AGENT ?SIDE3 - SIDE )
			( NOT ( LIFT-SIDE ?AGENT2 ?SIDE3 ) )
		)
	)
  :EFFECT
	( AND
		( DOWN ?SIDE1 )
		( NOT ( UP ?SIDE1 ) )
		( NOT ( LIFTING ?AGENT0 ?SIDE1 ) )
		( HANDEMPTY ?AGENT0 )
		( FORALL
			( ?BLOCK2 - BLOCK ?ROOM3 - ROOM ?SIDE4 - SIDE )
			( WHEN
				( AND
					( INROOM TABLE ?ROOM3 )
					( ON-TABLE ?BLOCK2 )
					( UP ?SIDE4 )
					( FORALL
						( ?AGENT5 - AGENT )
						( NOT ( LOWER-SIDE ?AGENT5 ?SIDE4 ) )
					)
				)
				( AND
					( ON-FLOOR ?BLOCK2 )
					( INROOM ?BLOCK2 ?ROOM3 )
					( NOT ( ON-TABLE ?BLOCK2 ) )
				)
			)
		)
	)
)
)
