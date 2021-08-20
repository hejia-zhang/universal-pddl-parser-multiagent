(define (problem block_rearrangement0)

(:domain block_rearrangement)

(:objects
    a0 - Agent
    a1 - Agent
    b0 - Block
    b1 - Block
    r0 - Region
    r1 - Region
    r2 - Region
    r3 - Region
)

(:init 
    (InRegion b0 r0)
    (InRegion b1 r1)
    (IsFree r2)
    (IsFree r3)
    (HandEmpty a0)
    (HandEmpty a1)
)

(:goal (and
    (InRegion b0 r1)
    (InRegion b1 r0)
))

)