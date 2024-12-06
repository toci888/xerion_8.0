---delete na tabele z nier dla ofert innych biur

delete from tab_dom where id_b > 1;
delete from tab_mie where id_b > 1;
delete from tab_obi where id_b > 1;
delete from tab_lok where id_b > 1;
delete from tab_te where id_b > 1;
delete from tab_dzi where id_b > 1;

delete from tab_dom_w where id_b > 1;
delete from tab_mie_w where id_b > 1;
delete from tab_obi_w where id_b > 1;
delete from tab_lok_w where id_b > 1;
delete from tab_te_w where id_b > 1;
delete from tab_dzi_w where id_b > 1;

delete from tab_dom_za where id_b > 1;
delete from tab_mie_za where id_b > 1;

delete from tab_agent where id_b > 1;



