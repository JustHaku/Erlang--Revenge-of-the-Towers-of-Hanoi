%% @author Nathan
%% @doc @todo Add description to towersofhanoi.


-module(hanoi).

%% ====================================================================
%% API functions
%% ====================================================================
-import(lists,[nth/2,min/1,delete/2,append/2,append/1,sort/1]). 

-export([create_towers/1, display_towers/1, move/3]).

create_tower1(0) -> [];


create_tower1(MaxDiscSize) when MaxDiscSize > 0 ->

	lists:append([MaxDiscSize], create_tower1(MaxDiscSize - 1)).
	
 

create_towers(MaxDiscSize) ->
	
	Tower2 = [],

	Tower3 = [],
	
	Tower1 = create_tower1(MaxDiscSize),
	
	Towers = [Tower1,Tower2,Tower3],

	lists:append([Towers]).
	



	
display_towers(List) ->	

	io:fwrite("Tower 1: ~p~n",[nth(1,List)]),
	io:fwrite("Tower 2: ~p~n",[nth(2,List)]),
	io:fwrite("Tower 3: ~p~n",[nth(3,List)]).
	

move(List, Tower1, Tower2) ->

	TowerScore = 6,
	TowerScore1 = TowerScore - Tower1,
	TowerScore2 = TowerScore1 - Tower2,

	RemoveTower = nth(Tower1,List),
	
	
	RemovePosition = Tower1,
	io:format("~p~n", [RemovePosition]),
	
	AddTower = nth(Tower2,List),
	
	
	AddPosition = Tower2,
	io:format("~p~n", [AddPosition]),
	
	Tower3 = nth(TowerScore2,List),
	io:format("~p~n", [TowerScore2]),

	
	
	Sorting = [RemovePosition,AddPosition,TowerScore2],
	io:format("~p~n", [Sorting]),
	
	
	Min = min(RemoveTower),
	MinList = [Min],

	RemovedElement = delete(Min,RemoveTower),
	AddedElement = append(AddTower,MinList),
	
	FinalTowers = checker(Sorting,RemovedElement,AddedElement,Tower3),

	display_towers(FinalTowers).

	
checker(Sorting,RemovedElement,AddedElement,Tower3) ->	
	
	if 
		(Sorting == [1,2,3]) ->  [RemovedElement,AddedElement,Tower3];
		(Sorting == [1,3,2]) ->  [RemovedElement,Tower3,AddedElement];
		(Sorting == [2,1,3]) ->  [AddedElement,RemovedElement,Tower3];
		(Sorting == [2,3,1]) ->  [AddedElement,Tower3,RemovedElement];
		(Sorting == [3,2,1]) ->  [Tower3,AddedElement,RemovedElement];
		(Sorting == [3,1,2]) ->  [Tower3,RemovedElement,AddedElement];
		true -> invalid
	end.




