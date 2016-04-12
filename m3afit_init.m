function mtrace = m3a_init(S, C, varargin)
% mtrace = m3a_init(S,'option1','val1','option2','val2',...)
%
% DESCRIPTION
% Prepare multiclass trace S for M3A fitting
%
% OUTPUT
% mtrace.S - inter-arrival trace
% mtrace.C - arrival class
%
% OPTION LIST

%% options
NumClasses = length(unique(C));
mtrace = struct('S',S,'C',C,'NumClasses',NumClasses);
end
