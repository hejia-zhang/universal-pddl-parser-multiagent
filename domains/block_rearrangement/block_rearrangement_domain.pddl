(define (domain block_rearrangement)

(:requirements :typing :conditional-effects :multi-agent)

(:types 
    Agent 
    Block
    Region 
)

(:predicates 
    (InRegion ?b - Block ?r - Region)
    (HandEmpty ?a - Agent)
    (IsFree ?r - Region)
)

(:action pickandplace
    :agent ?a - agent
    :parameters (?b - Block ?r1 - Region ?r2 - Region)
    :precondition (and 
                    (InRegion ?b ?r1)
                    (IsFree ?r2)
                    (HandEmpty ?a)
                    (forall (?a2 - agent) (not (pickandplace ?a2 ?b ?r1 ?r2)))

    )
    :effect (and
            (IsFree ?r1)
            (not (IsFree ?r2))
            (InRegion ?b ?r2)
            (HandEmpty ?a)
            (not (InRegion ?b ?r1))
    )
)
)