DO language plpgsql $$
declare 
   QuestionList         text[];
   UserResponseID_List  text[];
   UserResponseList     text[];
begin

FOR C1 IN 1..10
LOOP
	QuestionList := array_append(QuestionList,concat('testeA',C1));
	UserResponseID_List := array_append(UserResponseID_List,concat('testeB',C1));
	UserResponseList := array_append(UserResponseList,concat('testeC',C1));
END LOOP;

FOR C2 IN 1..array_upper(QuestionList, 1)
LOOP
QuestionList :=  array_remove(QuestionList, QuestionList[1]);
UserResponseID_List :=  array_remove(UserResponseID_List, UserResponseID_List[1]);
UserResponseList :=  array_remove(UserResponseList, UserResponseList[1]);
END LOOP;

FOR C1 IN 1..10
LOOP
	QuestionList := array_append(QuestionList,concat('testeA',C1));
	UserResponseID_List := array_append(UserResponseID_List,concat('testeB',C1));
	UserResponseList := array_append(UserResponseList,concat('testeC',C1));
END LOOP;

FOR i IN 1 .. array_upper(QuestionList, 1)
   LOOP
      raise notice 'U%:U%:U%', QuestionList[i], UserResponseID_List[i], UserResponseList[i];
   END LOOP;

END   
$$;

