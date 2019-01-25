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
    plotSolution(bestSolution,currentSolution);
    answerMat = [0,bestCost];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%   ____ ___ ____ ____ ___    ____ _    ____ ____ ____ _ ___ _  _ _  _   %
%   [__   |  |__| |__/  |     |__| |    | __ |  | |__/ |  |  |__| |\/|   % 
%   ___]  |  |  | |  \  |     |  | |___ |__] |__| |  \ |  |  |  | |  |   % 
%                                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                                                                
    for counter = 1:bound
        successors = getSuccessors(currentSolution,50);
        best = getBestSuccessors(successors);
        bestMat = best.matrix;
        bestMove = best.moves;
        bestEval = best.evaluation;
        bestIndex = best.index;
        tabuList(tabuList > 0 ) =  tabuList(tabuList > 0 ) - 1;
        while(true)
           if(tabuList(bestMove(1),bestMove(2))>0)
               if(bestEval < bestCost)
                   bestSolution = bestMat;
                   bestCost = bestEval;
                   break;
               else
                    successors = removeSuccessor(best,successors);
                    best = getBestSuccessors(successors);
                    bestMat = best.matrix;
                    bestMove = best.moves;
                    bestIndex = best.index;
                    bestEval = best.evaluation;
                    if(bestEval > 100000000000)
                        successors
                        break;
                    end
               end
           else
               if(bestEval < bestCost)
                   bestSolution = bestMat;
                   bestCost = bestEval;
               end   
               break;
           end
           
        end
        currentSolution = bestMat;
        currentCost = bestEval;
        tabuList(bestMove(1),bestMove(2)) = 50;
        tabuList(bestMove(2),bestMove(1)) = 50;
        clc
        %fprintf('%d [%d,%d]\n',bestSolution(:,1));
        bestSolution
        fprintf('Best path cost visited : %03d',round(bestCost));
        answerMat=[answerMat;[counter,bestCost]];
        %plot(answerMat);
        counter
        plotSolution(bestSolution, currentSolution);
        %pause(0.000000001);
    end
    result = bestCost;
end

















