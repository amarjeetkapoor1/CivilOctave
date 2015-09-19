## -*- encoding: utf-8 -*-
## This file (civil.sagetex.sage) was *autogenerated* from civil.tex with sagetex.sty version 2012/01/16 v2.3.3-69dcb0eb93de.
import sagetex
_st_ = sagetex.SageTeXProcessor('civil', version='2012/01/16 v2.3.3-69dcb0eb93de', version_check=True)
_st_.blockbegin()
try:
  load('input.sage')
  latex.matrix_delimiters("[","]")
  '''for storey_i in range(Number_of_storeys):
   Stiffness_matrix(storey_i, storey_i) = Stiffness_storey(storey_i)
   if (storey_i < Number_of_storeys ):
   Stiffness_matrix(storey_i, storey_i) = Stiffness_matrix(storey_i, storey_i) + Stiffness_storey(storey_i + 1)
   Stiffness_matrix(storey_i, storey_i + 1) = - Stiffness_storey(storey_i + 1)
   Stiffness_matrix(storey_i + 1, storey_i) = Stiffness_matrix(storey_i, storey_i + 1)
  '''
 
 
  Stiffness_matrix=matrix([[18,-8,0,0],[-8,14,-6,0],[0,-6,12,-6],[0,0,-6,6]])
  w=var('w')
  q=Stiffness_matrix-(w^2)*Mass
  A=Stiffness_matrix*Mass.inverse()
  Omega_square=A.eigenvalues()
  Time_period=list()
  for i in range( Number_of_storeys):
   q=sqrt(Omega_square[i])
   Time_period.append(n(2*pi)/q)
  Frequency=list()
  for storey_i in range(Number_of_storeys):
   Frequency.append(sqrt(Omega_square[storey_i]))
  z=A.eigenvectors_left()
  J=list()
  for x in range(Number_of_storeys):
   q=matrix(z[x][1][0])
   J.append(q*Mass*q.transpose())
  X=list()
  for x in range(Number_of_storeys):
   q=matrix(z[x][1][0])
   X.append(q/sqrt(abs(J[x])))
  Modal_participation_factor=list()
  Modal_mass=list()
  sum_modal_mass=0
  for j in range(Number_of_storeys):
         P1,P2=0,0
         m=matrix(X[j])
         for i in range(Number_of_storeys):
             P1=P1+Mass[i][i]*m[0][i]
             P2=P2+Mass[i][i]*(m[0][i])**2
         Modal_participation_factor.append(P1/P2)
         Modal_mass.append((P1)**2/(P2))
         sum_modal_mass = sum_modal_mass + Modal_mass[j]
  print(sum_modal_mass)
  Modal_contribution=list()
  for i in range(Number_of_storeys):
   Modal_contribution.append(100 / sum_modal_mass *Modal_mass[i])
 
 
 
 
 
except:
 _st_.goboom(80)
_st_.blockend()
try:
 _st_.inline(0, latex(q))
except:
 _st_.goboom(82)
try:
 _st_.inline(1, latex(Stiffness_matrix))
except:
 _st_.goboom(85)
try:
 _st_.inline(2, latex(Mass))
except:
 _st_.goboom(86)
try:
 _st_.inline(3, latex(Omega_square))
except:
 _st_.goboom(88)
try:
 _st_.inline(4, latex(Time_period))
except:
 _st_.goboom(90)
try:
 _st_.inline(5, latex(X))
except:
 _st_.goboom(92)
try:
 _st_.inline(6, latex(Modal_participation_factor))
except:
 _st_.goboom(95)
try:
 _st_.inline(7, latex(Modal_mass))
except:
 _st_.goboom(98)
try:
 _st_.inline(8, latex(Modal_contribution))
except:
 _st_.goboom(101)
_st_.endofdoc()