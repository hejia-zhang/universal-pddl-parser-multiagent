( DEFINE ( DOMAIN BLOCK_REARRANGEMENT )
( :REQUIREMENTS :EQUALITY :NEGATIVE-PRECONDITIONS :CONDITIONAL-EFFECTS :TYPING :UNIVERSAL-PRECONDITIONS )
( :TYPES
	AGENT - OBJECT
	BLOCK - OBJECT
	REGION - OBJECT
)
( :CONSTANTS
)
( :PREDICATES
	( FREE-BLOCK )
	( SELECTING )
	( APPLYING )
	( RESETTING )
	( FREE-AGENT ?AGENT0 - AGENT )
	( BUSY-AGENT ?AGENT0 - AGENT )
	( DONE-AGENT ?AGENT0 - AGENT )
	( INREGION ?BLOCK0 - BLOCK ?REGION1 - REGION )
	( HANDEMPTY ?AGENT0 - AGENT )
	( ISFREE ?REGION0 - REGION )
	( ACTIVE-PICKANDPLACE ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?REGION2 - REGION ?REGION3 - REGION )
	( REQ-NEG-PICKANDPLACE ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?REGION2 - REGION ?REGION3 - REGION )
)
( :ACTION START
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( FREE-BLOCK )
	)
  :EFFECT
	( AND
		( NOT ( FREE-BLOCK ) )
		( SELECTING )
	)
)
( :ACTION APPLY
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( SELECTING )
	)
  :EFFECT
	( AND
		( NOT ( SELECTING ) )
		( APPLYING )
	)
)
( :ACTION RESET
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( APPLYING )
	)
  :EFFECT
	( AND
		( NOT ( APPLYING ) )
		( RESETTING )
	)
)
( :ACTION FINISH
  :PARAMETERS ( )
  :PRECONDITION
	( AND
		( RESETTING )
		( FORALL
			( ?AGENT0 - AGENT )
			( FREE-AGENT ?AGENT0 )
		)
	)
  :EFFECT
	( AND
		( NOT ( RESETTING ) )
		( FREE-BLOCK )
	)
)
( :ACTION SELECT-PICKANDPLACE
  :PARAMETERS ( ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?REGION2 - REGION ?REGION3 - REGION )
  :PRECONDITION
	( AND
		( SELECTING )
		( FREE-AGENT ?AGENT0 )
		( NOT ( REQ-NEG-PICKANDPLACE ?AGENT0 ?BLOCK1 ?REGION2 ?REGION3 ) )
		( INREGION ?BLOCK1 ?REGION2 )
		( ISFREE ?REGION3 )
		( HANDEMPTY ?AGENT0 )
		( FORALL
			( ?AGENT4 - AGENT )
			( AND
				( NOT ( ACTIVE-PICKANDPLACE ?AGENT4 ?BLOCK1 ?REGION2 ?REGION3 ) )
			)
		)
	)
  :EFFECT
	( AND
		( NOT ( FREE-AGENT ?AGENT0 ) )
		( BUSY-AGENT ?AGENT0 )
		( ACTIVE-PICKANDPLACE ?AGENT0 ?BLOCK1 ?REGION2 ?REGION3 )
		( FORALL
			( ?AGENT4 - AGENT )
			( AND
				( REQ-NEG-PICKANDPLACE ?AGENT4 ?BLOCK1 ?REGION2 ?REGION3 )
			)
		)
	)
)
( :ACTION DO-PICKANDPLACE
  :PARAMETERS ( ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?REGION2 - REGION ?REGION3 - REGION )
  :PRECONDITION
	( AND
		( APPLYING )
		( BUSY-AGENT ?AGENT0 )
		( ACTIVE-PICKANDPLACE ?AGENT0 ?BLOCK1 ?REGION2 ?REGION3 )
	)
  :EFFECT
	( AND
		( NOT ( BUSY-AGENT ?AGENT0 ) )
		( DONE-AGENT ?AGENT0 )
		( ISFREE ?REGION2 )
		( NOT ( ISFREE ?REGION3 ) )
		( INREGION ?BLOCK1 ?REGION3 )
		( HANDEMPTY ?AGENT0 )
		( NOT ( INREGION ?BLOCK1 ?REGION2 ) )
	)
)
( :ACTION END-PICKANDPLACE
  :PARAMETERS ( ?AGENT0 - AGENT ?BLOCK1 - BLOCK ?REGION2 - REGION ?REGION3 - REGION )
  :PRECONDITION
	( AND
		( RESETTING )
		( DONE-AGENT ?AGENT0 )
		( ACTIVE-PICKANDPLACE ?AGENT0 ?BLOCK1 ?REGION2 ?REGION3 )
	)
  :EFFECT
	( AND
		( NOT ( DONE-AGENT ?AGENT0 ) )
		( FREE-AGENT ?AGENT0 )
		( NOT ( ACTIVE-PICKANDPLACE ?AGENT0 ?BLOCK1 ?REGION2 ?REGION3 ) )
		( FORALL
			( ?AGENT4 - AGENT )
			( AND
				( NOT ( REQ-NEG-PICKANDPLACE ?AGENT4 ?BLOCK1 ?REGION2 ?REGION3 ) )
			)
		)
	)
)
)