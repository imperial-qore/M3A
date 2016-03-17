%% CREATE A MAP AND OBTAIN SAMPLES FROM IT
MAP = {[-1,1/3;0,-2],[2/3 0; 1/4 7/4]}
S=map_sample(MAP,1e5);
plot(S(1:1e3)); xlabel('sample id'); ylabel('sample value')
figure
plot(trace_acf(S,1:30)); hold all; plot(map_acf(MAP,1:30)); xlabel('lag'); ylabel('acf');

%% CREATE A MMAP - This section illustrates calls to M3A
MMAP = {MAP{1},MAP{2},MAP{2}.* [2/3 0; 0 2/7],MAP{2}.*[1/3 0; 1 5/7]};
mmap_isfeasible(MMAP) 
mmap_forward_moment(MMAP,1)
mmap_backward_moment(MMAP,1)

%% OBTAIN SAMPLES FROM A MMAP
[T,C] = mmap_sample(MMAP,1e3); %
plot(S(C==1),'k'); hold on; xlabel('sample id'); ylabel('sample value')
plot(S(C==2),'r');

%% KPC-Toolbox INTERPRETS MMAPs AS MAPs
[map_isfeasible(MAP),map_isfeasible(MMAP)]
[map_mean(MAP),map_moment(MMAP,1)]
[map_scv(MAP),map_moment(MMAP,2)]
[map_moment(MAP,3),map_moment(MMAP,3)]

%% FITTING AN AMAP(2) WITH TWO CLASSES
[T,C] = mmap_sample(MMAP,1e5);
FIT = mamap22_fit_gamma_fs_trace(T,C); 
FIT
RESULT = [mtrace_forward_moment(T,C,1) mmap_forward_moment(FIT,1)] 

%% FITTING AN AMAP(2) WITH M CLASSES
FIT = mamap2m_fit_trace(T, C)
RESULT = [mtrace_forward_moment(T,C,1) mmap_forward_moment(FIT,1)] 

%% FITTING AN ARBITRARY MMAP INTO AN AMAP
FIT = mamap2m_fit_gamma_fb_mmap(MMAP)
RESULT = [mmap_forward_moment(FIT,1) , mmap_forward_moment(MMAP,1)] 
