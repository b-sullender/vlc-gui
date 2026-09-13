# Define compiler and flags
CC = gcc
CFLAGS = -Wall -g
LDFLAGS = $(shell pkg-config --libs libvlc sdl2 x11 cairo) -lm

# Define source files and directories
SRC_DIR = source
SRCS = $(wildcard $(SRC_DIR)/*.c)
OBJS = $(SRCS:.c=.o)
TARGET = neoplayer

# Variable for changing root installation directory (e.g., alternate root environments)
DESTDIR =

# Default target: compile the program
all: $(TARGET)

# Rule to link the object files and produce the binary
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS) $(LDFLAGS)

# Rule to compile each source file into an object file
$(SRC_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean rule: remove the binary and object files
clean:
	rm -f $(OBJS) $(TARGET)

