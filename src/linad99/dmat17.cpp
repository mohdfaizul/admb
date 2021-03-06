/*
 * $Id$
 *
 * Author: David Fournier
 * Copyright (c) 2008-2012 Regents of the University of California
 */
/**
 * \file
 * Description not yet available.
 */
#include "fvar.hpp"

/**
 * Create a Identity matrix.
 * \param
 */
dmatrix identity_matrix(int min,int max)
{
  dmatrix tmp(min,max,min,max);
  #ifndef SAFE_INITIALIZE
  tmp.initialize();
  #endif

  for (int i=min; i<=max; i++)
  {
    tmp.elem(i,i)=1;
  }
  return(tmp);
}
