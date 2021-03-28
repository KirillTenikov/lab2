-module(lab2).
-export([findPerfectNumbers/1]).
-include_lib("eunit/include/eunit.hrl").



checkNumberHelper(N, Index,Sum) when N==Index->N==Sum;
checkNumberHelper(N, Index,Sum) when N rem Index==0->checkNumberHelper(N, Index+1,Sum+Index);
checkNumberHelper(N, Index,Sum)->checkNumberHelper(N, Index+1, Sum).

checkPerfectNumber(N) -> checkNumberHelper(N,1,0).

findNumbersHelperProxy(true, N, Index, List)->findNumbersHelper(N,Index+1,List++[Index]);
findNumbersHelperProxy(false, N, Index, List)->findNumbersHelper(N,Index+1,List).

findNumbersHelper(N, Index, List) when N<2->List;
findNumbersHelper(N, Index, List) when Index==N+1->List;
findNumbersHelper(N, Index, List)->findNumbersHelperProxy(checkPerfectNumber(Index), N, Index,List).

findPerfectNumbers(N)->findNumbersHelper(N,2,[]).


f_test_() ->
 [?_assertEqual([], findPerfectNumbers(0)),
 ?_assertEqual([], findPerfectNumbers(-100)),
 ?_assertEqual([], findPerfectNumbers(2)),
 ?_assertEqual([6,28], findPerfectNumbers(100)),
 ?_assertEqual([6,28,496], findPerfectNumbers(1000))].