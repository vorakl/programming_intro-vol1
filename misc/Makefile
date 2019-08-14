.PHONY: all clean clean-obj

SRCS := $(wildcard *.pas)
APPS := $(patsubst %.pas,%,$(SRCS))

all: $(APPS)

%: %.pas
	@fpc -o$@ $<
clean:
	@find . -type f \( -perm /a+x -o -name "*.o" \) -delete
clean-obj:
	@find . -type f -name "*.o" -delete

