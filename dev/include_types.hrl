%% File for testing expansion of type declarations.

-export_type([o1/1]).

%% Some normal attributes.

-dummy(42).
-dummyier([42]).

%% Some records.

-record(r1, {a=hello,b}).
-record(r2, {a=hello :: atom(),b :: #r1{},c}).

%% Defining types 

-type t1() :: list(integer()).

-type integer(X) :: {not_integer,atom(),X}.

-opaque o1(X) :: {not_atom,integer(),integer(X)}.

-type t3(X,Y) :: {not_atom,bert:integer(),bert:integer(X),bert:integer(X, Y)}.

-type t4() :: atom() | pid() | 42.

-type t5() :: #r1{}.

-type t6() :: #r1{a :: integer(),b :: list()}.

-type t7() :: fun((atom(),atom()) -> {t7,integer()}).

-type t8() :: fun((...) -> t8).                 %Any arity

-type t9() :: #{}.                              %Empty map

-type t10() :: #{integer() => atom(), atom() := pid()}.

-type t11() :: unicode:unicode_binary().        %UTF-8 string

%%-type it4(X) :: {not_atom,bert:integer(),bert:integer(X),bert:integer(X, Y)}.
%%-type integer() :: {integer,atom()}.          %Illegal as integer() exists
