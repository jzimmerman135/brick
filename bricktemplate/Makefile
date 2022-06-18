# compiler
CC := gcc

# include paths
IFLAGS = -Iinclude/ -I/usr/local/lib/brick/brickstdlib/include/

# compiler flags
CFLAGS := -g -std=c99 -Wall -Werror -Wextra -Wfatal-errors -pedantic
CFLAGS += $(IFLAGS)

# optimization and debug flags
OFLAGS := -O1 -flto
DFLAGS := -DDEBUG -g3 -O0

# link binaries
LDFLAGS := -L/usr/local/lib/brick/brickstdlib
LDLIBS :=

# build directory
BUILD := ./build
OBJ_DIR  := $(BUILD)/objects
APP_DIR  := $(BUILD)/apps
TEST_DIR := $(BUILD)/tests

# source files
SRC          := $(wildcard src/*.c)
OBJECTS      := $(patsubst %.c,$(OBJ_DIR)/%.o,$(SRC))
DEPENDENCIES := $(patsubst %.o,%.d,$(OBJECTS))

# target files
TARG_SRC := $(wildcard src/mains/*.c)
TARGETS  := $(patsubst src/mains/%.c,$(APP_DIR)/%,$(TARG_SRC))

# test files
TEST_SRC := $(wildcard tests/*.c)
TESTS    := $(patsubst tests/%.c,$(TEST_DIR)/%,$(TEST_SRC))

# everything
all: build targets tests

targets: $(TARGETS)

tests: $(TESTS)

# objects compile
$(OBJ_DIR)/%.o: %.c
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -MMD -o $@

# app compile
$(APP_DIR)/%: $(OBJECTS) $(OBJ_DIR)/src/mains/%.o
	@mkdir -p $(@D)
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ $^ $(LDLIBS)

# test compile
$(TEST_DIR)/%: $(OBJECTS) $(OBJ_DIR)/tests/%.o
	@mkdir -p $(@D)
	$(CC) $(LDFLAGS) $(CFLAGS) -o $@ $^ $(LDLIBS)

-include $(DEPENDENCIES)
.PRECIOUS: $(OBJ_DIR)/%.o
.PHONY: all build clean

learn:
	@echo $(TESTS)

build:
	@mkdir -p $(APP_DIR)
	@mkdir -p $(OBJ_DIR)
	@mkdir -p $(TEST_DIR)

debug: CFLAGS += $(DFLAGS)
debug: all

release: CFLAGS += $(OFLAGS)
release: all

clean:
	-@rm -rvf $(OBJ_DIR)/*
	-@rm -rvf $(APP_DIR)/*
	-@rm -rvf $(TEST_DIR)/*

info:
	@echo "[*] Application dir: ${APP_DIR}                           "
	@echo "[*] Object dir:      ${OBJ_DIR}                           "
	@echo "[*] Sources:         ${SRC} ${TARG_SRC} ${TEST_SRC}       "
	@echo "[*] Targets:         ${TARGETS}                           "
	@echo "[*] Tests:           ${TESTS}                             "
	@echo "[*] Objects:         ${OBJECTS} ${TARG_OBJ} ${TEST_OBJ}   "
	@echo "[*] Dependencies:    ${DEPENDENCIES}                      "

