%% @author Guido Günther <agx@sigxcpu.org>
%% @copyright 2013 godiug.net
%%
%%  This library is free software; you can redistribute it and/or
%%  modify it under the terms of the GNU Lesser General Public
%%  License as published by the Free Software Foundation; either
%%  version 3 of the License, or (at your option) any later version.
%%
%%  This library is distributed in the hope that it will be useful,
%%  but WITHOUT ANY WARRANTY; without even the implied warranty of
%%  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
%%  Lesser General Public License for more details.
%%
%%  You should have received a copy of the GNU Lesser General Public
%%  License along with this library.  If not, see
%%  <http://www.gnu.org/licenses/>.
%%
%% @doc Simplify proplist manipulation a bit

-module(proplutils).
-export([delete/2,
	 delete_except/2
	]).

%% @doc Delete all Keys from Proplist
delete(Key, PropList) when is_atom(Key) ->
    proplists:delete(Key, PropList);
delete([], Proplist) -> Proplist;
delete([H | T], PropList) ->
    PL = proplists:delete(H, PropList),
    delete(T, PL).

%% @doc Delete all keys except Keys from PropList
delete_except(Key, PropList) when is_atom(Key) ->
    delete_except([Key], PropList);
delete_except(Keys, PropList) when is_list(Keys) ->
    [{X, Y} || {X, Y} <- PropList, lists:member(X, Keys)].



