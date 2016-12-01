%% File for testing expansion of function specifications.
%% We specify functions a/0, b/1, c/2, d/2.

-type st() :: {st,list(),list()}.

-spec a() -> integer().

-spec b(any()) -> 42.

-spec c(atom(), integer()) -> string().

-spec d(atom(), integer()) -> string() ;
       (integer(), atom()) -> st().

-spec e(X, Y) -> {ok,Z} when X :: integer(),
			     Y :: atom(),
			     Z :: any().

-spec f_1(fun((any()) -> boolean()), list()) -> list().

-spec f_2(Pred, list()) -> list() when Pred :: fun((any()) -> boolean()).

%% Bad func specs.
%%-spec b(any()) -> any().                        %Respecing b/1
%%-spec g(X, Y) -> Z when X :: integer().         %Undefined constraints Y,Z
