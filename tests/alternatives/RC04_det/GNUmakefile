.PHONY: run

TARGET=det

all: clean $(TARGET) run

$(TARGET): $(TARGET).tpl $(TARGET).dat
	export ADMB_HOME=$(ADMB_HOME); export PATH=$(ADMB_HOME)/bin:${PATH}; admb -s $(TARGET)

run:
	@printf "Started run:\n"
	./$(TARGET) -nohess
	@printf "Finished run.\n"

clean:
	@rm -vf $(TARGET)
	@rm -vf admodel.*
	@rm -vf variance
	@rm -vf fmin.log
	@rm -vf $(TARGET).eva
	@rm -vf $(TARGET).htp
	@rm -vf $(TARGET).bar
	@rm -vf $(TARGET).bgs
	@rm -vf $(TARGET).cor
	@rm -vf $(TARGET).cpp
	@rm -vf $(TARGET).log
	@rm -vf $(TARGET).o
	@rm -vf $(TARGET).par
	@rm -vf eigv.rpt
