ifeq ($(OS),Windows_NT)
  ifeq (sh.exe,$(findstring sh.exe,$(SHELL)))
    SHELL=cmd
  else
    EXT=.sh
  endif
endif

ADMB_OPTIONS=-g

GTEST_DIR=googletest-read-only

GTESTS=\
 test_adstring_strcase.cpp\
 test_fmm_control.cpp\
 test_adstring.cpp\
 test_adstring_array.cpp\
 test_dlist.cpp\
 test_ad_comm.cpp\
 test_gradient_structure.cpp\
 test_option_match.cpp\
 test_lvector.cpp\
 test_df3_two_variable.cpp\
 test_adjson.cpp\
 test_adpool.cpp\
 test_dvector.cpp\
 test_dmatrix.cpp\
 test_param_init_bounded_number_vector.cpp\
 test_param_init_d3array.cpp\
 test_spline.cpp\
 test_banded_symmetric_dmatrix.cpp\
 test_line_adstring.cpp\
 test_ivector.cpp\
 test_multi_index.cpp\
 test_adtimer.cpp\
 test_idea.cpp\
 test_df_file.cpp\
 test_multinomial.cpp\
 test_multi_index.cpp\
 test_cifstream.cpp\
 test_param_init_vector_vector.cpp\
 test_param_init_matrix_vector.cpp\
 test_param_init_bounded_vector_vector.cpp\
 test_param_init_number_vector.cpp\
 test_pow.cpp\
 test_dvariable.cpp\
 test_imatrix.cpp\
 test_lmatrix.cpp\
 test_dvar_matrix.cpp\
 main.cpp

##Need to debug this
## test_atan2.cpp
## test_dvar_vector.cpp

# test_df1b2atan2.obj\
# df1b2atan2.obj\
# scalefactor.obj\

all: clean gtest-all
ifeq ($(SHELL),cmd)
	gtest-all
else
	./gtest-all
endif

memcheck: gtest-all
	valgrind -v --tool=memcheck ./gtest-all

test_df1b2atan2.obj: test_df1b2atan2.cpp df1b2atan2.obj
ifeq ($(SHELL),cmd)
	CXXFLAGS=-I$(GTEST_DIR)\\include ..\\..\\admb -c $(ADMB_OPTIONS) test_df1b2atan2.cpp
else
	CXXFLAGS=-I$(GTEST_DIR)/include ../../admb$(EXT) -c $(ADMB_OPTIONS) test_df1b2atan2.cpp
endif

df1b2atan2.obj: df1b2atan2.cpp
ifeq ($(SHELL),cmd)
	..\\..\\admb -c $(ADMB_OPTIONS) $^
else
	../../admb$(EXT) -c $(ADMB_OPTIONS) $^
endif

test_scalefactor.obj: test_scalefactor.cpp scalefactor.obj
ifeq ($(SHELL),cmd)
	set CXXFLAGS=-I$(GTEST_DIR)/include & ..\\..\\admb -c $(ADMB_OPTIONS) test_scalefactor.cpp
else
	CXXFLAGS=-I$(GTEST_DIR)/include ../../admb$(EXT) -c $(ADMB_OPTIONS) test_scalefactor.cpp
endif

scalefactor.obj: scalefactor.tpl
ifeq ($(SHELL),cmd)
	set CXXFLAGS="-Dmain=scalefactor" & ..\\..\\admb -c $^
else
	CXXFLAGS=-Dmain=scalefactor ../../admb$(EXT) -c $^
endif

test_scalefactor: test_scalefactor.obj main.obj gtest-all.obj scalefactor.obj
ifeq ($(SHELL),cmd)
	set CXXFLAGS=-I$(GTEST_DIR)\\include & set LDFLAGS=-pthread & ..\\..\\admb $(ADMB_OPTIONS) $^
else
	CXXFLAGS="$(CXXFLAGS) -I$(GTEST_DIR)/include" LDFLAGS=-pthread ../../admb$(EXT) $(ADMB_OPTIONS) $^
endif

test_finance.obj: test_finance.cpp finance.obj
ifeq ($(SHELL),cmd)
	set CXXFLAGS=-I$(GTEST_DIR)/include & ..\\..\\admb -c $(ADMB_OPTIONS) test_finance.cpp
else
	CXXFLAGS=-I$(GTEST_DIR)/include ../../admb$(EXT) -c $(ADMB_OPTIONS) test_finance.cpp
endif

finance.obj: finance.tpl
ifeq ($(SHELL),cmd)
	set CXXFLAGS="-Dmain=finance" & ..\\..\\admb -c $^
else
	CXXFLAGS=-Dmain=finance ../../admb$(EXT) -c $^
endif

test_finance: test_finance.obj main.obj gtest-all.obj finance.obj
ifeq ($(SHELL),cmd)
	set CXXFLAGS=-I$(GTEST_DIR)\\include & set LDFLAGS=-pthread & ..\\..\\admb $(ADMB_OPTIONS) $^
	copy ..\\..\\examples\\admb\\finance\\finance.dat
else
	CXXFLAGS="$(CXXFLAGS) -I$(GTEST_DIR)/include" LDFLAGS=-pthread ../../admb$(EXT) $(ADMB_OPTIONS) $^
	cp ../../examples/admb/finance/finance.dat .
endif

gtest-all: gtest-all.obj $(GTESTS)
ifeq ($(SHELL),cmd)
	set CXXFLAGS=-I$(GTEST_DIR)\\include & set LDFLAGS=-pthread & ..\\..\\admb $(ADMB_OPTIONS) $^
else
	CXXFLAGS="$(CXXFLAGS) -I$(GTEST_DIR)/include" LDFLAGS=-pthread ../../admb$(EXT) $(ADMB_OPTIONS) $^
endif

gtest-all.obj: googletest-read-only
ifeq ($(SHELL),cmd)
	$(CXX) -c $(CXXFLAGS) -g -I$(GTEST_DIR)\\include -I$(GTEST_DIR) -o $@ $(GTEST_DIR)\\src\\gtest-all.cc
else
	$(CXX) -c $(CXXFLAGS) -g -I$(GTEST_DIR)/include -I$(GTEST_DIR) -o $@ $(GTEST_DIR)/src/gtest-all.cc
endif

googletest-read-only:
	svn checkout http://googletest.googlecode.com/svn/trunk/ googletest-read-only

admb_messages:
	OPTIONS=-s $(MAKE) --directory=$@

init_bounded_number_matrix:
	OPTIONS=-s $(MAKE) --directory=$@

df33_tester:
	OPTIONS=-s $(MAKE) --directory=$@

total-clean: clean
ifeq ($(SHELL),cmd)
	@if exist googletest-read-only rmdir /s /q googletest-read-only
else
	@rm -rvf googletest-read-only
endif

clean:
ifeq ($(SHELL),cmd)
	@del gtest-all.exe
	@del gtest-all *.obj
	@del eigv.rpt
	@del fmin.log
	@del simple.log
	@del variance
	@del cmpdiff.tmp
	@del f1b2list1
	@del f1b2list12
	@del f1b2list13
	@del gradfil1.tmp
	@del gradfil2.tmp
	@del nf1b2list1
	@del nf1b2list12
	@del nf1b2list13
	@del scalefactor.cpp
	@del scalefactor.htp
	@del scalefactor.log
	@del scalefactor.exe
	@del varssave.tmp
	@del admodel.cov
	@del admodel.dep
	@del admodel.hes
	@del hesscheck
	@del hessian.bin
	@del scalefactor.bar
	@del scalefactor.bgs
	@del scalefactor.cor
	@del scalefactor.eva
	@del scalefactor.luu
	@del scalefactor.par
	@del scalefactor.rhes
	@del scalefactor.std
	@del finance.dat
	@del finance.dat
	@del finance.b01
	@del finance.b02
	@del finance.bar
	@del finance.cor
	@del finance.cpp
	@del finance.eva
	@del finance.htp
	@del finance.log
	@del finance.p01
	@del finance.p02
	@del finance.par
	@del finance.std
	@del scalefactor.rep
	@del test_finance.exe
	@del test_scalefactor.exe
	@del finance.b0
	@del finance.p0
else
	@rm -vf finance.b0
	@rm -vf finance.p0
	@rm -vf gtest-all *.obj
	@rm -vf eigv.rpt
	@rm -vf fmin.log
	@rm -vf simple.log
	@rm -vf variance
	@rm -vf cmpdiff.tmp
	@rm -vf f1b2list1
	@rm -vf f1b2list12
	@rm -vf f1b2list13
	@rm -vf gradfil1.tmp
	@rm -vf gradfil2.tmp
	@rm -vf nf1b2list1
	@rm -vf nf1b2list12
	@rm -vf nf1b2list13
	@rm -vf scalefactor.cpp
	@rm -vf scalefactor
	@rm -vf scalefactor.exe
	@rm -vf scalefactor.htp
	@rm -vf scalefactor.log
	@rm -vf varssave.tmp
	@rm -vf admodel.cov
	@rm -vf admodel.dep
	@rm -vf admodel.hes
	@rm -vf hesscheck
	@rm -vf hessian.bin
	@rm -vf scalefactor.bar
	@rm -vf scalefactor.bgs
	@rm -vf scalefactor.cor
	@rm -vf scalefactor.eva
	@rm -vf scalefactor.luu
	@rm -vf scalefactor.par
	@rm -vf scalefactor.rhes
	@rm -vf scalefactor.std
	@rm -vf finance.dat
	@rm -vf finance.b01
	@rm -vf finance.b02
	@rm -vf finance.bar
	@rm -vf finance.cor
	@rm -vf finance.cpp
	@rm -vf finance.eva
	@rm -vf finance.htp
	@rm -vf finance.log
	@rm -vf finance.p01
	@rm -vf finance.p02
	@rm -vf finance.par
	@rm -vf finance.std
	@rm -vf scalefactor.rep
	@rm -vf test_finance
	@rm -vf test_scalefactor
endif
