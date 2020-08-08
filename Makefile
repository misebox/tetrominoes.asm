run : tetrominoes
	@./tetrominoes
tetrominoes : tetrominoes.o
	@ld -o tetrominoes tetrominoes.o

tetrominoes.o : ./tetrominoes.asm
	@nasm -felf64 tetrominoes.asm -o tetrominoes.o

clean :
	@rm tetrominoes tetrominoes.o
