CC = g++
CXXFLAGS = -Wall -O2
LDFLAGS =
SRC_DIR = ./
OBJ_DIR = ./obj
BIN_DIR = ./bin
TARGET = Encoder
SRCS = $(notdir $(wildcard $(SRC_DIR)/*.cpp))
OBJS = $(SRCS:.cpp=.o)
OBJECTS = $(patsubst %.o,$(OBJ_DIR)/%.o,$(OBJS))
DEPS = $(OBJECTS:.o=.d)

all: $(TARGET)

OUT :
	mkdir -p $(OBJ_DIR) $(BIN_DIR)

$(OBJ_DIR)/%.o : $(SRC_DIR)/%.cpp
	$(CC) $(CXXFLAGS) -c $< -o $@ -MD $(LDFLAGS)

$(TARGET) : OUT $(OBJECTS)
	$(CC) $(CXXFLAGS) $(OBJECTS) -o $(BIN_DIR)/$(TARGET) $(LDFLAGS)

.PHONY: clean
clean :
	rm -rf $(OBJ_DIR) $(BIN_DIR)

-include $(DEPS)
