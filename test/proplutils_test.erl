-module(proplutils_test).
-include_lib("eunit/include/eunit.hrl").

% Test descriptions
delete_test_() ->
    [{"Using a atom should work as proplist:delete/2",
      check_delete_atom_arg()},
     {"Using a list should remove all keys in the list",
      check_delete_list_arg()}
    ].

delete_except_test_() ->
    [{"Using an atom should remove everything except keys"
      "matching that atom",
      check_delete_except_atom_arg()},
     {"Using a list should remove all keys except keys"
      "matching the atoms in the list",
      check_delete_except_list_arg()}
    ].

% Tests
check_delete_atom_arg() ->
    PL = [{foo, "doesnot"}, {bar, "matter"}],
    Ret = proplutils:delete(foo, PL),
    [?_assertEqual(Ret, [{bar, "matter"}])].

check_delete_list_arg() ->
    PL = [{foo, "doesnot"}, {bar, "matter"}, {baz, "really"}],
    Ret = proplutils:delete([foo, baz], PL),
    [?_assertEqual(Ret, [{bar, "matter"}])].

check_delete_except_atom_arg() ->
    PL = [{foo, "doesnot"}, {bar, "matter"}, {baz, "really"}],
    Ret = proplutils:delete_except(bar, PL),
    [?_assertEqual(Ret, [{bar, "matter"}])].

check_delete_except_list_arg() ->
    PL = [{foo, "doesnot"}, {bar, "matter"}, {baz, "really"}],
    Ret = proplutils:delete_except([foo, bar], PL),
    [?_assertEqual(Ret,[{foo, "doesnot"}, {bar, "matter"}])].


