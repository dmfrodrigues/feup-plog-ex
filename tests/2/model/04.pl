:- use_module(library(clpfd)).

% sweet_recipes(+MaxTime,+NEggs,+RecipeTimes,+RecipeEggs,-Cookings,-Eggs)
sweet_recipes(MaxTime,NEggs,RecipeTimes,RecipeEggs,Cookings,Eggs) :-
    length(RecipeTimes, NRecipes),
    Cookings = [A,B,C], domain(Cookings, 1, NRecipes), all_distinct(Cookings),
    element(A, RecipeTimes, TimeA), element(A, RecipeEggs, EggsA),
    element(B, RecipeTimes, TimeB), element(B, RecipeEggs, EggsB),
    element(C, RecipeTimes, TimeC), element(C, RecipeEggs, EggsC),
    Time #= TimeA+TimeB+TimeC,
    Eggs #= EggsA+EggsB+EggsC,

    Time #=< MaxTime,
    Eggs #=< NEggs,
    
    labeling([maximize(Eggs),best], Cookings).
