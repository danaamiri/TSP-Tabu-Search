%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%      TTTTTTTTTTTTTTTTTTTTTTT   SSSSSSSSSSSSSSS PPPPPPPPPPPPPPPPP        % 
%      T:::::::::::::::::::::T SS:::::::::::::::SP::::::::::::::::P       %
%      T:::::::::::::::::::::TS:::::SSSSSS::::::SP::::::PPPPPP:::::P      %
%      T:::::TT:::::::TT:::::TS:::::S     SSSSSSSPP:::::P     P:::::P     %
%      TTTTTT  T:::::T  TTTTTTS:::::S              P::::P     P:::::P     %
%              T:::::T        S:::::S              P::::P     P:::::P     %
%              T:::::T         S::::SSSS           P::::PPPPPP:::::P      %
%              T:::::T          SS::::::SSSSS      P:::::::::::::PP       %
%              T:::::T            SSS::::::::SS    P::::PPPPPPPPP         %
%              T:::::T               SSSSSS::::S   P::::P                 %
%              T:::::T                    S:::::S  P::::P                 %  
%              T:::::T                    S:::::S  P::::P                 %
%            TT:::::::TT      SSSSSSS     S:::::SPP::::::PP               %
%            T:::::::::T      S::::::SSSSSS:::::SP::::::::P               %
%            T:::::::::T      S:::::::::::::::SS P::::::::P               % 
%            TTTTTTTTTTT       SSSSSSSSSSSSSSS   PPPPPPPPPP               %
%                               WITH                                      %
%        _______    _            _____                     _              %
%       |__   __|  | |          / ____|                   | |             % 
%          | | __ _| |__  _   _| (___   ___  __ _ _ __ ___| |__           % 
%          | |/ _` | '_ \| | | |\___ \ / _ \/ _` | '__/ __| '_ \          % 
%          | | (_| | |_) | |_| |____) |  __/ (_| | | | (__| | | |         %
%          |_|\__,_|_.__/ \__,_|_____/ \___|\__,_|_|  \___|_| |_|         %
%-------------------------------------------------------------------------%
% This program solves traveling salesman problem using TabuSearch         %
% algorithm.                                                              %
% Collaborators:                                                          %
% 	- Dana Amiri                                                          %
%	- Pourya Mirelmi                                                      %
%	- Mahsa Mokhtare                                                      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function result = TabuSearch(problem, solutionResult, iteration)
    clc
    %begin
    initial = makeProblem(problem);
    answer = solutionResult;
    bound = iteration;
    sz = size(problem);
    n = sz(1);
    
    %intialization
    currentSolution = initial;
    bestSolution = currentSolution;
    tabuTenure = round(sqrt(n));
    tabuList = zeros(n);
    currentCost = evaluation(currentSolution);
    bestCost = currentCost;
    plotSolution(currentSolution);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   ____ ___ ____ ____ ___    ____ _    ____ ____ ____ _ ___ _  _ _  _   %
%   [__   |  |__| |__/  |     |__| |    | __ |  | |__/ |  |  |__| |\/|   % 
%   ___]  |  |  | |  \  |     |  | |___ |__] |__| |  \ |  |  |  | |  |   % 
%                                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                
    for counter = 1:bound
        successors = getSuccessors(currentSolution,20);
        best = getBestSuccessors(successors);
        bestMat = best.matrix;
        bestMove = best.moves;
        bestEval = best.evaluation;
        while(true)
           if(tabuList(besteMov(1),bestEval(2))>0)
               if(bestEval < bestCost)
                   bestSolution = bestMat;
                   bestCost = bestEval;
                   currentSolution = bestMat;
                   currentCost = bestEval;
                   break;
               else
                   best = getBestSuccessors(successors);
                   bestMat = best.matrix;
                   bestMove = best.moves;
                   bestEval = best.evaluation;
               end
           else
               if(bestEval < bestCost)
                   bestSolution = bestMat;
                   bestCost = bestEval;
                   currentSolution = bestMat;
                   currentCost = bestEval;
                   break;
               end
           end
        end
        tabuList(bestMove(1),bestMove(2)) = tabuTenure;
        tabuList(bestMove(2),bestMove(1)) = tabuTenure;
        bestSolution
        bestCost
    end
    result = bestCost;
end

















