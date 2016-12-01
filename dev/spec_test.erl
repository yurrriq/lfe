-module(spec_test).
-export([add_2/1]).

-spec add_2(integer()) -> integer().
add_2(X) -> X + 2.
