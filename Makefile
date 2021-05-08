UNAME_S := $(shell uname -s)

ifeq ($(UNAME_S),Darwin)
	CC := clang++ -arch x86_64
else
	CC := g++
endif

CXXFLAGS := -Wall -O2
LDFLAGS :=
ifeq ($(UNAME_S),Linux)
  CXXFLAGS += -std=gnu++11 -O2 # -fPIC
else
  CXXFLAGS += -std=c++11 -stdlib=libc++ -O2
endif

SRCDIR := ./
OBJDIR := ./obj
BINDIR := ./bin

TARGET := Encoder
SRCS := $(notdir $(wildcard $(SRCDIR)/*.cpp))
OBJS := $(SRCS:.cpp=.o)
OBJECTS := $(patsubst %.o,$(OBJDIR)/%.o,$(OBJS))
DEPS := $(OBJECTS:.o=.d)

all: $(TARGET)

OUT :
	mkdir -p $(OBJDIR) $(BINDIR)

$(OBJDIR)/%.o : $(SRCDIR)/%.cpp
	$(CC) $(CXXFLAGS) -c $< -o $@ -MD $(LDFLAGS)

$(TARGET) : OUT $(OBJECTS)
	$(CC) $(CXXFLAGS) $(OBJECTS) -o $(BINDIR)/$(TARGET) $(LDFLAGS)

.PHONY: clean
clean :
	rm -rf $(OBJDIR) $(BINDIR)

-include $(DEPS)
