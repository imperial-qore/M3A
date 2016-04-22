M3A: Marked MAP Matching Algorithms
===
<p><b>Introduction</b>
<br>Marked Markovian Arrival Processes (MMAPs) are a class of stochastic processes
used to model multi-class correlated arrivals at a queuing system.
M3A is a set of Matlab functions designed for computing the statistical descriptors
of MMAPs and fitting marked traces with MMAPs. The documentation of M3A is available
<a href="https://github.com/Imperial-AESOP/M3A/blob/master/m3a.pdf">here</a>.

<p><b>Installation Requirements</b>
<br>- A recent version of MATLAB, e.g., R2012 or above.
<br>- <a href="https://github.com/kpctoolboxteam/kpc-toolbox/">KPC-Toolbox</a> version 0.3.2 or above.

<p><b>MATLAB Example</b>
<br>% S(i): inter-arrival time between i-th and (i-1)-th arrivals 
<br>% C(i): class of i-th arrival
<br>load example.mat
<br>T = m3afit_init(S,C)
<br>MMAP = m3afit_auto(T,'NumStates',2)

<p><b>License</b>
<br>M3A is released under BSD-3 license.

<p><b>References</b>
<br>Andrea Sansottera, Giuliano Casale, Paolo Cremonesi,
*Fitting Second-Order Acyclic Marked Markovian Arrival Processes*,
IEEE/IFIP Dependable Systems and Networks (DSN), 2013.
<a href="http://ieeexplore.ieee.org/xpl/articleDetails.jsp?tp=&arnumber=6575347">Paper</a>

An earlier version of M3A can be found <a href="https://github.com/asansottera/m3a">here</a>.
