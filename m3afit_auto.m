function [MMAP]=m3afit_auto(mtrace, varargin)
% [MMAP] = m3afit_auto(T,'option1',val1,'option2',val2,...)
%
% DESCRIPTION
% Automatic fitting of trace T into a Marked Markovian Arrival Process
% based on the M3A toolbox.
%
% INPUT
% T        - data structure returned by m3afit_init
%
% OUTPUT
% MMAP          - fitted marked MAP
%
% EXAMPLE
%  T = m3afit_init(S)
%  MMAP = m3afit_auto(T,'NumStates',2)
%
% OPTION LIST
% 'Method'  - 0 for inter-arrival fitting, 1 for counting process fitting.
% 'NumStates'  - integer, mandatory parameter
%
% REFERENCES
% [1] A. Sansottera, G. Casale, P. Cremonesi. Fitting Second-Order Acyclic
%     Marked Markovian Arrival Processes. IEEE/IFIP DSN 2013.
% [2] G. Casale, A. Sansottera, P. Cremonesi. Compact Markov-Modulated
%     Models for Multiclass Trace Fitting. European Journal of Operations
%     Research, 2016.
%

%% options
OptionNames = [
    'Method    ';
    'NumStates ';
    ];

OptionTypes = [
    'numeric';
    'numeric'];

OptionValues = [];
for i = 1:size(OptionNames,1)
    options.(deblank(OptionNames(i,:)))=[];
end

% Default settings
options.NumStates = [];

% Parse Optional Parameters
options=ParseOptPara(options,OptionNames,OptionTypes,OptionValues,varargin);
%% fitting algorithm run parameterization

options.Timescale = mean(mtrace.S);
options.TimescaleAsy = sum(mtrace.S)/30;

%% fitting

if mtrace.NumClasses == 2 && options.NumStates == 2 && options.Method==0
    MMAPType=sprintf('%d-state MAMAP[%d]',options.NumStates,mtrace.NumClasses);
    fprintf(1,'Init: M3A will search for a %s\n',MMAPType);
    MMAP = mamap22_fit_gamma_fs_trace(mtrace.S,mtrace.C);
elseif  mtrace.NumClasses == 2 && options.NumStates >= 2 && options.Method==1
    MMAPType=sprintf('%d-state M3PP[%d]',options.NumStates,mtrace.NumClasses);
    fprintf(1,'Init: M3A will search for a %s\n',MMAPType);
    MMAP = m3pp2m_fit_count_trace(mtrace.S,mtrace.C,'approx_ag',options.Timescale,options.TimescaleAsy);
elseif  mtrace.NumClasses > 2 && options.NumStates >= 2 &&options.Method==0
    MMAPType=sprintf('%d-state MAMAP[%d]',options.NumStates,mtrace.NumClasses);
    fprintf(1,'Init: M3A will search for a %s\n',MMAPType);
    MMAP = mamap2m_fit_trace(mtrace.S,mtrace.C);
elseif  mtrace.NumClasses > 2 && options.Method==1
    error('Option combination is not available yet.');
end

if mmap_isfeasible(MMAP)
    fprintf(1,'\nOutput: M3A fitted a valid %s.\n',MMAPType);
else
    fprintf(1,'\nOutput: M3A could *not* obtain a valid MMAP.\n');
end

%     if strcmp(model,'m3pp54')
%         fprintf('Fitting model\n');
%         fit = m3pp_interleave_fit_count_trace(T,A,100,1000);
%         fprintf('Sampling from model\n');
%         [TS,AS] = mmap_sample(fit, procsamples);
%     elseif strcmp(model, 'm3pp24')
%         fprintf('Fitting model\n');
%     elseif strcmp(model, 'm3pp21-superpos')
%         fprintf('Fitting model\n');
%         fit = m3pp_superpos_fit_count_trace(T,A,100,1000);
%     elseif strcmp(model, 'm3pp22-interleave-12-34')
%         fprintf('Fitting model\n');
%         fit = m3pp_interleave_fit_count_trace(T,A,100,1000,[1 0; 1 0; 0 1; 0 1]);
%     elseif strcmp(model, 'm3pp22-interleave-13-24')
%         fprintf('Fitting model\n');
%         fit = m3pp_interleave_fit_count_trace(T,A,100,1000,[1 0; 0 1; 1 0; 0 1]);
%     elseif strcmp(model, 'm3pp22-interleave-14-23')
%         fprintf('Fitting model\n');
%         fit = m3pp_interleave_fit_count_trace(T,A,100,1000,[1 0; 0 1; 0 1; 1 0]);
%     elseif strcmp(model, 'm3pp22-interleave-indep')
%         fprintf('Fitting model\n');
%         fit = m3pp_interleave_fit_count_trace(T,A,100,1000,[1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 1]);
%     elseif strcmp(model, 'm3pp22-interleave-cov')
%         fprintf('Fitting model\n');
%         fit = m3pp_interleave_fit_count_trace(T,A,100,1000,[1 0 0; 0 1 0; 1 0 0; 0 0 1]);


end