.PHONY: disk

LIBNAME = libads.a
SRCDIR = src
.SUFFIXES: .obj .cpp
vpath %.obj $(LIBPATH)

include objects.lst

all: disk

disk: $(DISKDIR)/lib/$(LIBNAME)
	cp fvar.hpp $(DISKDIR)/include
	cp trunc.hpp $(DISKDIR)/include
	cp factors.h $(DISKDIR)/include
	cp adthread.h $(DISKDIR)/include

$(DISKDIR)/lib/$(LIBNAME): $(OBJ0) $(OBJ1) $(OBJ2) $(OBJ3) $(LIBPATH)/hs_sparse.obj
	$(AR) -rs $@ $(addprefix $(LIBPATH)/, $(OBJ0))
	$(AR) -rs $@ $(addprefix $(LIBPATH)/, $(OBJ1))
	$(AR) -rs $@ $(addprefix $(LIBPATH)/, $(OBJ2))
	$(AR) -rs $@ $(addprefix $(LIBPATH)/, $(OBJ3))
	$(AR) -rs $@ $(LIBPATH)/hs_sparse.obj

$(LIBPATH)/hs_sparse.obj: ../sparse/hs_sparse.cpp
	$(CXX) $(CXXFLAGS) -o $@ $<

%.obj: %.cpp
	$(CXX) $(CXXFLAGS) -o $(LIBPATH)/$(@F) $<