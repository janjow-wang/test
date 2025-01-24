CC = gcc
CFLAGS = -I. -I$(SRCS_DIR) -I$(UNITY_DIR)
SRCS_DIR = src
BUILD_DIR = build
SRCT_DIR = test
UNITY_DIR = unity

VPATH = $(SRCS_DIR):$(SRCT_DIR):$(UNITY_DIR)

SRCS = $(wildcard $(SRCS_DIR)/*.c)
SRCT = $(wildcard $(SRCT_DIR)/*.c) $(wildcard $(UNITY_DIR)/*.c) $(filter-out $(SRCS_DIR)/main.c, $(SRCS)) 

OBJS = $(patsubst %.c, $(BUILD_DIR)/%.o, $(notdir $(SRCS)))
OBJT = $(patsubst %.c, $(BUILD_DIR)/%.o, $(notdir $(SRCT)))

TARGET = $(BUILD_DIR)/app
TARGET_T = $(BUILD_DIR)/test_app

all: $(TARGET)

test: $(TARGET_T)
	@$(TARGET_T) > unit_test.log

# for normal program
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

#for unitest program
$(TARGET_T): $(OBJT)
	$(CC) $(CFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(BUILD_DIR)/*.o
	rm -rf $(TARGET)
	rm -rf $(TARGET_T)

.PHONY: all clean test