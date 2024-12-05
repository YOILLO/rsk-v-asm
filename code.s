.data
N:
.word 4
M:
.word 4
matrix:
.word 1, 1, 1, 1
.word 2, 2, 2, 2
.word 3, 3, 3, 3
.word 4, 4, 4, 4
result:
.word 0
str:
.word 1

.text

main:
la a2, N
la a3, M
la a4, matrix
la a5, result
la a6, str
call process
la a2, result
call print
call exit

print:
lw t1, 0(a2)

addi a0, x0, 1 # print_int ecall
lw a1, 0(a2)
ecall
ret

exit:
addi a0, x0, 10
ecall

process:
lw t1, 0(a2) # N
lw t2, 0(a3) # M
lw t0, 0(a6) # str

addi t4, x0, 0 # row pointer
addi t5, x0, 0 # result to save

init:
addi t3, x0, 0 # row element number

cycle:
lw t6, 0(a4) # load value from array
addi a4, a4, 4 # increment array pointer
bne t4 t0 end_sum # check if raw what we need
add t5, t5, t6 # count sum
end_sum:
addi t3, t3, 1
blt t3, t1, cycle
addi t4, t4, 1
blt t4, t2, init
sw t5 0(a5)
ret