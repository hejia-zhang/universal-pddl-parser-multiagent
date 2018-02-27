(define (problem p6_6_2_0_4_0) (:domain boxpushing)
(:objects
	a1 a2 - agent
	m1 m2 m3 m4 - mediumbox
	r1x1 r1x2 r1x3 r1x4 r1x5 r1x6 r2x1 r2x2 r2x3 r2x4 r2x5 r2x6 r3x1 r3x2 r3x3 r3x4 r3x5 r3x6 r4x1 r4x2 r4x3 r4x4 r4x5 r4x6 r5x1 r5x2 r5x3 r5x4 r5x5 r5x6 r6x1 r6x2 r6x3 r6x4 r6x5 r6x6 - location
)
(:init
	(at a1 r2x5)
	(at a2 r3x6)
	(at m1 r3x6)
	(at m2 r5x2)
	(at m3 r6x4)
	(at m4 r3x2)
	(connected r1x1 r2x1)
	(connected r1x1 r1x2)
	(connected r1x2 r2x2)
	(connected r1x2 r1x1)
	(connected r1x2 r1x3)
	(connected r1x3 r2x3)
	(connected r1x3 r1x2)
	(connected r1x3 r1x4)
	(connected r1x4 r2x4)
	(connected r1x4 r1x3)
	(connected r1x4 r1x5)
	(connected r1x5 r2x5)
	(connected r1x5 r1x4)
	(connected r1x5 r1x6)
	(connected r1x6 r2x6)
	(connected r1x6 r1x5)
	(connected r2x1 r1x1)
	(connected r2x1 r3x1)
	(connected r2x1 r2x2)
	(connected r2x2 r1x2)
	(connected r2x2 r3x2)
	(connected r2x2 r2x1)
	(connected r2x2 r2x3)
	(connected r2x3 r1x3)
	(connected r2x3 r3x3)
	(connected r2x3 r2x2)
	(connected r2x3 r2x4)
	(connected r2x4 r1x4)
	(connected r2x4 r3x4)
	(connected r2x4 r2x3)
	(connected r2x4 r2x5)
	(connected r2x5 r1x5)
	(connected r2x5 r3x5)
	(connected r2x5 r2x4)
	(connected r2x5 r2x6)
	(connected r2x6 r1x6)
	(connected r2x6 r3x6)
	(connected r2x6 r2x5)
	(connected r3x1 r2x1)
	(connected r3x1 r4x1)
	(connected r3x1 r3x2)
	(connected r3x2 r2x2)
	(connected r3x2 r4x2)
	(connected r3x2 r3x1)
	(connected r3x2 r3x3)
	(connected r3x3 r2x3)
	(connected r3x3 r4x3)
	(connected r3x3 r3x2)
	(connected r3x3 r3x4)
	(connected r3x4 r2x4)
	(connected r3x4 r4x4)
	(connected r3x4 r3x3)
	(connected r3x4 r3x5)
	(connected r3x5 r2x5)
	(connected r3x5 r4x5)
	(connected r3x5 r3x4)
	(connected r3x5 r3x6)
	(connected r3x6 r2x6)
	(connected r3x6 r4x6)
	(connected r3x6 r3x5)
	(connected r4x1 r3x1)
	(connected r4x1 r5x1)
	(connected r4x1 r4x2)
	(connected r4x2 r3x2)
	(connected r4x2 r5x2)
	(connected r4x2 r4x1)
	(connected r4x2 r4x3)
	(connected r4x3 r3x3)
	(connected r4x3 r5x3)
	(connected r4x3 r4x2)
	(connected r4x3 r4x4)
	(connected r4x4 r3x4)
	(connected r4x4 r5x4)
	(connected r4x4 r4x3)
	(connected r4x4 r4x5)
	(connected r4x5 r3x5)
	(connected r4x5 r5x5)
	(connected r4x5 r4x4)
	(connected r4x5 r4x6)
	(connected r4x6 r3x6)
	(connected r4x6 r5x6)
	(connected r4x6 r4x5)
	(connected r5x1 r4x1)
	(connected r5x1 r6x1)
	(connected r5x1 r5x2)
	(connected r5x2 r4x2)
	(connected r5x2 r6x2)
	(connected r5x2 r5x1)
	(connected r5x2 r5x3)
	(connected r5x3 r4x3)
	(connected r5x3 r6x3)
	(connected r5x3 r5x2)
	(connected r5x3 r5x4)
	(connected r5x4 r4x4)
	(connected r5x4 r6x4)
	(connected r5x4 r5x3)
	(connected r5x4 r5x5)
	(connected r5x5 r4x5)
	(connected r5x5 r6x5)
	(connected r5x5 r5x4)
	(connected r5x5 r5x6)
	(connected r5x6 r4x6)
	(connected r5x6 r6x6)
	(connected r5x6 r5x5)
	(connected r6x1 r5x1)
	(connected r6x1 r6x2)
	(connected r6x2 r5x2)
	(connected r6x2 r6x1)
	(connected r6x2 r6x3)
	(connected r6x3 r5x3)
	(connected r6x3 r6x2)
	(connected r6x3 r6x4)
	(connected r6x4 r5x4)
	(connected r6x4 r6x3)
	(connected r6x4 r6x5)
	(connected r6x5 r5x5)
	(connected r6x5 r6x4)
	(connected r6x5 r6x6)
	(connected r6x6 r5x6)
	(connected r6x6 r6x5)
)
(:goal (and
	(at a1 r1x3)
	(at a2 r5x5)
	(at m1 r2x3)
	(at m2 r6x2)
	(at m3 r4x2)
	(at m4 r2x3)
))
)