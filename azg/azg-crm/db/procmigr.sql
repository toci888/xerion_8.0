drop function TwoLevelDict (text, text, text, varchar, boolean, integer);
drop function MigrateToTags(text, text, text);
drop function ConvToTag(varchar);

---protected :P
CREATE FUNCTION ConvToTag(textfc varchar) RETURNS text AS $$
DECLARE 
	arrpol char[] := ARRAY['ê','ó','±','¶','³','¿','¼','æ','ñ',',','-','.'];
	arrstn char[] := ARRAY['e','o','a','s','l','z','z','c','n','_','_','_'];
	zrod_lower text;
	temp char;
	i integer := 1;
	res text;
BEGIN
	select into zrod_lower lower(trim(textfc));
	res := zrod_lower;

	while i < 13 loop
		select into res replace(res, arrpol[i], arrstn[i]);
		i := i + 1;
	end loop;
	
	select into res replace (res, ' ', '_');

	RETURN '_' || res;
END;
$$ LANGUAGE plpgsql;
---protected :P
CREATE FUNCTION MigrateToTags(tab_cur_dict text, col_cur_dict text, col_cur_id text) RETURNS SETOF text AS $$
DECLARE
	curs refcursor;
	res record;
	tag_from_word text;
BEGIN
	OPEN curs FOR EXECUTE 'select ' || col_cur_id || ' as id, ' || col_cur_dict || ' as nazwa from ' || tab_cur_dict || ';';

	LOOP
		FETCH curs INTO res;
    
		IF  NOT FOUND THEN
		        EXIT;  -- exit loop
		END IF;
		
		select into tag_from_word convtotag(res.nazwa);

		EXECUTE 'update ' || tab_cur_dict || ' set ' || col_cur_dict ||  ' = \'' || tag_from_word || '\' where ' || col_cur_id || ' = ' || res.id || ';';
		INSERT INTO lang_tag (nazwa) values (tag_from_word);

		RETURN NEXT tag_from_word;
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;

---select migratetotags('ciepla_woda', 'nazwa_wo', 'id');

---inserts to wyposazenie_nier
CREATE FUNCTION TwoLevelDict (tab_dict text, col_dict text, id_dict text, parent_tag varchar, wiel boolean, id_sek integer) RETURNS VOID AS $$
DECLARE
	one_tag record;
	id_par integer;
	
BEGIN
	insert into wyposazenie_nier (wielokrotne, ma_dzieci, id_sekcja, nazwa) values (wiel, true, id_sek, parent_tag);
	select into id_par id from wyposazenie_nier where nazwa = parent_tag;
	INSERT INTO lang_tag (nazwa) values (parent_tag);

	FOR one_tag IN SELECT * from migratetotags(tab_dict, col_dict, id_dict) LOOP
		insert into wyposazenie_nier (id_parent, wielokrotne, ma_dzieci, id_sekcja, nazwa) values (id_par, wiel, false, id_sek, one_tag.migratetotags);
	END LOOP;
	RETURN;
END;
$$ LANGUAGE plpgsql;


---select twoleveldict('ciepla_woda', 'nazwa_wo', 'id', '_ciepla_woda', true, (select id from sekcja where nazwa = '_sekcjapodstawowa'));
