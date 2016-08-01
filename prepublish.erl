-module(prepublish).
-export([prepublish_fun/1]).

prepublish_fun(Msg) ->
	{ok, Prepublish} = file:open("prepublish.dat", [append]),
    io:format(Prepublish, "~w~n", [Msg]),
    file:close(Prepublish).