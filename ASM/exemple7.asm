.include beta.uasm
.include intio.uasm
.options tty

	CMOVE(pile,SP)
	BR(debut)
a: 	LONG(10)
f:
	PUSH(LP)
	PUSH(BP)
	MOVE(SP,BP)
	ALLOCATE(2)
	CMOVE(0,R0)
	PUSH(R0)
	POP(R0)
	PUTFRAME(R0,-12)
	CMOVE(1,R0)
	PUSH(R0)
	POP(R0)
	PUTFRAME(R0,4)
	GETFRAME(-12,R0)
	PUSH(R0)
	GETFRAME(0,R0)
	PUSH(R0)
	GETFRAME(4,R0)
	PUSH(R0)
	POP(R2)
	POP(R1)
	ADD(R1,R2,R0)
	PUSH(R0)
	POP(R2)
	POP(R1)
	ADD(R1,R2,R0)
	PUSH(R0)
	POP(R0)
	ST(R0,a)
return_f:
	DEALLOCATE(2)
	POP(BP)
	POP(LP)
	RTN()
main:
	PUSH(LP)
	PUSH(BP)
	MOVE(SP,BP)
	ALLOCATE(0)

	LD(a,R0)
	PUSH(R0)
	POP(R0)
	WRINT()
return_main:
	DEALLOCATE(0)
	POP(BP)
	POP(LP)
	RTN()
debut:
	CALL(main)
	HALT()
pile:

