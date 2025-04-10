CC = gcc
ASM = nasm
CFLAGS = -m64 -Wall -g
LDFLAGS = -no-pie

ASMO = ld

all: main2

main2: main2.obj
	$(ASMO) -m elf_x86_64 -o main2 main2.obj

#test1.o: test1.c
#	$(CC) $(CFLAGS) -c test1.c -o test1.o

main2.obj: main2.asm
	$(ASM) -f elf64 main2.asm -o main2.obj

clean:
	rm -f *.obj main2
