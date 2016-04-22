M3A: Marked MAP Matching Algorithms
===
<p><b>Introduction</b>
<br>Marked Markovian Arrival Processes (MMAPs) are a class of stochastic processes
used to model multi-class correlated arrivals at a queuing system.
M3A is a set of Matlab functions designed for computing the statistical descriptors
of MMAPs and fitting marked traces with MMAPs. The documentation of M3A is available
<a href="https://github.com/Imperial-AESOP/M3A/blob/master/m3a.pdf">here</a>.

M3A is a joint work of
<a href="https://www.linkedin.com/in/andrea-sansottera-5b688579">Andrea Sansottera<a>,
<a href="http://wp.doc.ic.ac.uk/gcasale/">Giuliano Casale</a> and
<a href="http://home.deib.polimi.it/cremones/">Paolo Cremonesi</a>.
If you use M3A for your research, please reference the following paper:

<p><b>Installation Requirements</b>
<br>- A recent version of MATLAB, e.g., R2012 or above.
<br>- <a href="https://github.com/kpctoolboxteam/kpc-toolbox/">KPC-Toolbox</a>

<p><b>MATLAB Example</b>
<br>% S(i): inter-arrival time between i-th and (i-1)-th arrivals 
<br>% C(i): class of i-th arrival
<br>load example.mat
<br>T = m3afit_init(S,C)
<br>MMAP = m3afit_auto(T,'NumStates',2)

<p><b>References</b>
<br>Andrea Sansottera, Giuliano Casale, Paolo Cremonesi,
*Fitting Second-Order Acyclic Marked Markovian Arrival Processes*,
IEEE/IFIP Dependable Systems and Networks (DSN), 2013.
<a href="http://ieeexplore.ieee.org/xpl/articleDetails.jsp?tp=&arnumber=6575347">Paper</a>

An earlier version of M3A can be found <a href="https://github.com/asansottera/m3a">here</a>.
