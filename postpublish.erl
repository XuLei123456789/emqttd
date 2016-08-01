-module(postpublish).
-export([postpublish_fun/1]).

postpublish_fun(Msg) ->
	{ok, Postpublish} = file:open("postpublish.dat", [append]),
    io:format(Postpublish, "~w~n", [Msg]),
    file:close(Postpublish).