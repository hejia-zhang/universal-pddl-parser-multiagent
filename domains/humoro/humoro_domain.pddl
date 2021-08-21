(define (domain humoro_table)

(:requirements :typing :conditional-effects :multi-agent)

(:types 
    agent 
    location
    object 
)

(:constants
    table small_shelf big_shelf - location
    cup_red cup_green cup_blue cup_pink plate_pink plate_red plate_green plate_blue jug bowl - object
)

(:predicates 
    (on ?x - object ?l - location)
    (object-available ?x - object)
    (agent-free ?a - agent)
    (agent-at ?a - agent ?l - location)
    (agent-carry ?a - agent ?x - object)
)

(:action move
    :agent ?a - agent
    :parameters (?l1 - location ?l2 - location)
    :precondition (and 
                    (agent-at ?a ?l1)
                    (not (agent-at ?a ?l2))

    )
    :effect (and
            (agent-at ?a ?l2) 
            (not (agent-at ?a ?l1))
    )
)

(:action pick
    :agent ?a - agent
    :parameters (?x - object ?l - location)
    :precondition (and 
                    (agent-at ?a ?l)
                    (on ?x ?l)
                    (object-available ?x)
                    (agent-free ?a)
                    (forall (?a2 - agent) (not (pick ?a ?x ?l)))

    )
    :effect (and
            (not (on ?x ?l))
            (not (object-available ?x))
            (not (agent-free ?a))
            (agent-carry ?a ?x)
            (agent-at ?a ?l)
    )
)

(:action place
    :agent ?a - agent
    :parameters (?x - object ?l - location)
    :precondition (and 
                    (agent-at ?a ?l)
                    (agent-carry ?a ?x)

    )
    :effect (and
            (on ?x ?l)
            (object-available ?x)
            (agent-free ?a)
            (not (agent-carry ?a ?x))
            (agent-at ?a ?l)
    )
)

)