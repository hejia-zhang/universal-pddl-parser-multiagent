(define (problem table3_3_1_0) 
	(:domain tablemover)

(:objects
	a0 - agent
	a1 - agent
	b0 - block
	b1 - block
	b2 - block
	r0 - room
	r1 - room
	r2 - room
	left0 right0 - side0
)

(:init
	(on-floor b0)
	(on-floor b1)
	(on-floor b2)
	(inroom b0 r1)
	(inroom b1 r2)
	(inroom b2 r0)
	(inroom a0 r2)
	(inroom a1 r2)
	(available a0)
	(available a1)
	(handempty a0)
	(handempty a1)
	(connected r0 r1)
	(connected r1 r0)
	(connected r1 r2)
	(connected r2 r1)
	(down left0)
	(down right0)
	(clear left0)
	(clear right0)
	(inroom Table0 r2)
)

(:goal (and
	(down left0)
	(down right0)
	(on-floor b0)
	(on-floor b1)
	(on-floor b2)
	(inroom b0 r0)
	(inroom b1 r0)
	(inroom b2 r0)
))

)
