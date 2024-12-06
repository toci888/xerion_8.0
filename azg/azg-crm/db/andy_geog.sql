--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: region_geog; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE region_geog (
    id serial NOT NULL,
    id_parent integer,
    id_otodom integer,
    nazwa character varying(60) NOT NULL
);


ALTER TABLE public.region_geog OWNER TO postgres;

--
-- Name: region_geog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval(pg_catalog.pg_get_serial_sequence('region_geog', 'id'), 30222, true);


--
-- Data for Name: region_geog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY region_geog (id, id_parent, id_otodom, nazwa) FROM stdin;
1	\N	1	_polska
2	1	1	dolnośląskie
3	1	2	kujawsko-pomorskie
4	1	5	łódzkie
5	1	3	lubelskie
6	1	4	lubuskie
7	1	6	małopolskie
8	1	7	mazowieckie
9	1	8	opolskie
10	1	9	podkarpackie
11	1	10	podlaskie
12	1	11	pomorskie
13	1	12	śląskie
14	1	13	świętokrzyskie
15	1	14	warmińsko-mazurskie
16	1	15	wielkopolskie
17	1	16	zachodniopomorskie
18	13	287	lubliniecki
19	13	288	mikołowski
20	13	289	myszkowski
21	13	290	pszczyński
22	13	291	raciborski
23	13	293	tarnogórski
24	13	295	wodzisławski
25	13	296	zawierciański
26	13	297	żywiecki
27	13	282	miasto Bielsko-Biała
28	13	282	bielski
29	13	299	miasto Bytom
30	13	300	miasto Chorzów
31	13	284	miasto Częstochowa
32	13	284	częstochowski
33	13	302	miasto Dąbrowa Górnicza
34	13	285	miasto Gliwice
35	13	285	gliwicki
36	13	304	miasto Jastrzębie-Zdrój
37	13	305	miasto Jaworzno
38	17	\N	łobeski
39	13	306	miasto Katowice
40	13	307	miasto Mysłowice
41	13	308	miasto Piekary Śląskie
42	13	309	miasto Ruda Śląska
43	13	292	miasto Rybnik
44	13	292	rybnicki
45	13	311	miasto Siemianowice Śląskie
46	13	312	miasto Sosnowiec
47	13	294	miasto Tychy
48	13	315	miasto Zabrze
49	13	313	miasto Świętochłowice
50	13	316	miasto Żory
51	14	317	buski
52	14	318	jędrzejowski
53	14	319	kazimierski
54	14	321	konecki
55	14	322	opatowski
56	14	323	ostrowiecki
57	14	324	pińczowski
58	14	325	sandomierski
59	14	326	skarżyski
60	14	327	starachowicki
61	14	328	staszowski
62	14	329	włoszczowski
63	14	320	miasto Kielce
64	14	320	kielecki
65	15	331	bartoszycki
66	15	332	braniewski
67	15	333	działdowski
68	15	335	ełcki
69	15	336	giżycki
70	15	337	iławski
71	15	338	kętrzyński
72	15	339	lidzbarski
73	15	340	mrągowski
74	15	341	nidzicki
75	15	342	nowomiejski
76	15	346	ostródzki
77	15	347	piski
78	15	348	szczycieński
79	15	334	miasto Elbląg
80	15	334	elbląski
81	15	343	olecki
82	15	344	gołdapski
83	15	345	miasto Olsztyn
84	15	345	olsztyński
85	16	1	chodzieski
86	16	2	czarnkowsko-trzcianecki
87	16	3	gnieźnieński
88	16	4	gostyński
89	16	5	grodziski
90	16	6	jarociński
91	16	7	kaliski
92	16	9	kolski
93	16	10	koniński
94	15	\N	węgorzewski
95	16	11	kościański
96	16	12	krotoszyński
97	16	8	kępiński
98	16	13	leszczyński
99	16	14	międzychodzki
100	16	15	nowotomyski
101	16	16	obornicki
102	16	17	ostrowski
103	16	18	ostrzeszowski
104	16	19	pilski
105	16	20	pleszewski
106	16	22	rawicki
107	16	24	szamotulski
108	16	23	słupecki
109	16	27	turecki
110	16	29	wolsztyński
111	16	30	wrzesiński
112	16	28	wągrowiecki
113	16	31	złotowski
114	16	25	średzki
115	16	26	śremski
116	16	21	miasto Poznań
117	16	21	poznański
118	16	7	miasto Kalisz
119	16	10	miasto Konin 
120	16	13	miasto Leszno
121	17	351	białogardzki
122	17	352	choszczeński
123	17	353	drawski
124	17	354	goleniowski
125	17	355	gryficki
126	17	356	gryfiński
127	17	357	kamieński
128	17	358	kołobrzeski
129	17	360	myśliborski
130	17	361	policki
131	17	362	pyrzycki
132	17	364	stargardzki
133	17	363	sławieński
134	17	367	wałecki
135	17	366	świdwiński
136	17	359	miasto Koszalin
137	17	359	koszalińsk
138	17	365	miasto Szczecin
139	17	365	szczecinecki
140	17	370	miasto Świnoujście
141	13	\N	bieruńsko-lędziński
142	7	161	tatrzański
143	7	162	wadowicki
144	7	163	wielicki
145	7	150	miasto Kraków
146	7	150	krakowski
147	7	154	miasto Nowy Sącz
148	7	154	nowosądecki
149	7	160	tarnowski
150	7	160	miasto Tarnów
151	8	167	białobrzeski
152	8	168	ciechanowski
153	8	169	garwoliński
154	8	170	gostyniński
155	8	172	grójecki
156	12	\N	sztumski
157	8	171	grodziski
158	8	173	kozienicki
159	8	174	legionowski
160	8	175	lipski
161	8	177	makowski
162	8	178	miński
163	8	179	mławski
164	8	180	nowodworski
165	8	182	ostrowski
166	8	183	otwocki
167	8	184	piaseczyński
168	8	187	pruszkowski
169	8	188	przasnyski
170	8	189	przysuski
171	8	190	pułtuski
172	8	186	płoński
173	8	193	sierpecki
174	8	194	sochaczewski
175	8	195	sokołowski
176	8	196	szydłowiecki
177	8	197	miasto Warszawa
178	8	198	warszawski zachodni
179	8	200	wołomiński
180	8	201	wyszkowski
181	8	199	węgrowski
182	8	202	zwoleński
183	8	176	łosicki
184	8	203	żuromiński
185	8	204	żyrardowski
186	8	181	miasto Ostrołęka
187	8	181	ostrołęcki
188	8	185	miasto Płock
189	8	185	płocki
190	8	191	miasto Radom
191	8	191	radomski
192	8	192	miasto Siedlce
193	8	192	siedlecki
194	9	209	brzeski
195	9	210	głubczycki
196	9	212	kluczborski
197	9	213	krapkowicki
198	10	\N	leski
199	9	211	kędzierzyńsko-kozielski
200	9	214	namysłowski
201	9	215	nyski
202	9	216	oleski
203	9	218	prudnicki
204	9	219	strzelecki
205	9	217	miasto Opole
206	9	217	opolski
207	10	221	bieszczadzki
208	10	222	brzozowski
209	10	223	dębicki
210	10	224	jarosławski
211	10	225	jasielski
212	10	226	kolbuszowski
213	10	228	leżajski
214	10	229	lubaczowski
215	10	231	mielecki
216	10	232	niżański
217	10	234	przeworski
218	10	235	ropczycko-sędziszowski
219	10	237	sanocki
220	10	238	stalowowolski
221	10	239	strzyżowski
222	10	230	łańcucki
223	10	227	miasto Krosno
224	10	227	krośnieński
225	10	233	miasto Przemyśl
226	10	233	przemyski
227	10	236	miasto Rzeszów
228	10	236	rzeszowski
229	10	240	miasto Tarnobrzeg
230	10	240	tarnobrzeski
231	11	245	augustowski
232	11	247	bielski
233	11	248	grajewski
234	11	249	hajnowski
235	11	250	kolneński
236	11	252	moniecki
237	11	253	sejneński
238	11	254	siemiatycki
239	11	255	sokólski
240	11	257	wysokomazowiecki
241	11	258	zambrowski
242	11	246	miasto Białystok
243	11	246	białostocki
244	11	256	miasto Suwałki
245	11	256	suwalski
246	11	251	miasto Łomża
247	11	251	łomżyński
248	12	262	bytowski
249	12	263	chojnicki
250	12	264	człuchowski
251	12	266	kartuski
252	12	267	kościerski
253	12	268	kwidzyński
254	12	269	lęborski
255	12	270	malborski
256	12	271	nowodworski
257	12	272	pucki
258	12	274	starogardzki
259	12	275	tczewski
260	12	276	wejherowski
261	12	265	miasto Gdańsk
262	12	265	gdański
263	12	278	miasto Gdynia
264	12	280	miasto Sopot
265	12	273	miasto Słupsk
266	12	273	słupski
267	13	281	będziński
268	13	283	cieszyński
269	13	286	kłobucki
270	2	40	legnicki
271	2	41	lubański
272	2	42	lubiński
273	2	43	lwówecki
274	2	44	milicki
275	2	45	oleśnicki
276	2	46	oławski
277	2	47	polkowicki
278	2	48	strzeliński
279	6	\N	wschowski
280	2	51	trzebnicki
281	2	56	zgorzelecki
282	2	57	złotoryjski
283	2	55	ząbkowicki
284	2	49	średzki
285	2	50	świdnicki
286	2	53	wołowski
287	2	52	miasto Wałbrzych
288	2	52	wałbrzyski
289	2	54	miasto Wrocław
290	2	54	wrocławski
291	3	62	aleksandrowski
292	3	63	brodnicki
293	3	65	chełmiński
294	3	66	golubsko-dobrzyński
295	3	68	inowrocławski
296	3	69	lipnowski
297	3	70	mogileński
298	3	71	nakielski
299	3	72	radziejowski
300	3	73	rypiński
301	3	74	sępoleński
302	3	77	tucholski
303	3	78	wąbrzeski
304	3	75	świecki
305	3	80	żniński
306	3	64	miasto Bydgoszcz
307	3	64	bydgoski
308	3	67	miasto Grudziądz
309	3	67	grudziądzki
310	3	76	miasto Toruń
311	3	76	toruński
312	3	79	miasto Włocławek
313	3	79	włocławski
314	5	86	biłgorajski
315	5	88	hrubieszowski
316	5	89	janowski
317	5	90	krasnostawski
318	5	91	kraśnicki
319	5	92	lubartowski
320	5	96	opolski(lubelskie
321	5	97	parczewski
322	5	98	puławski
323	5	99	radzyński
324	5	100	rycki
325	5	102	tomaszowski
326	5	103	włodawski
327	4	\N	brzeziński
328	5	95	łukowski
329	5	94	łęczyński
330	5	101	świdnicki
331	5	85	miasto Biała Podlaska
332	5	85	bialski
333	5	87	miasto Chełm
334	5	87	chełmski
335	5	93	miasto Lublin
336	5	93	lubelski
337	5	104	miasto Zamość
338	5	104	zamojski
339	6	110	krośnieński
340	6	111	międzyrzecki
341	6	112	nowosolski
342	6	114	strzelecko-drezdenecki
343	6	115	sulęciński
344	6	113	słubicki
345	6	109	miasto Gorzów Wielkopolski
346	6	109	gorzowski
347	6	117	miasto Zielona Góra
348	6	117	zielonogórski
349	6	116	świebodziński
350	6	118	żagański
351	6	119	żarski
352	4	122	bełchatowski
353	4	123	kutnowski
354	4	128	opoczyński
355	4	129	pabianicki
356	4	130	pajęczański
357	4	132	poddębicki
358	4	133	radomszczański
359	4	134	rawski
360	4	135	sieradzki
361	4	137	tomaszowski
362	4	138	wieluński
363	4	139	wieruszowski
364	4	140	zduńskowolski
365	4	141	zgierski
366	4	142	miasto Łódź
367	4	124	łaski
368	4	127	łódzki wschodni
369	4	126	łowicki
370	4	125	łęczycki
371	4	131	miasto Piotrków Trybunalski
372	4	131	piotrkowski
373	4	136	miasto Skierniewice
374	4	136	skierniewicki
375	7	145	bocheński
376	7	146	brzeski
377	7	147	chrzanowski
378	7	148	dąbrowski
379	7	149	gorlicki
380	7	151	limanowski
381	2	32	bolesławiecki
382	2	33	dzierżoniowski
383	2	35	górowski
384	2	34	głogowski
385	2	36	jaworski
386	2	58	miasto Jelenia Góra
387	2	37	jeleniogórski
388	2	38	kamiennogórski
389	2	39	kłodzki
390	2	40	miasto Legnica
391	7	152	miechowski
392	7	153	myślenicki
393	7	155	nowotarski
394	7	156	olkuski
395	7	157	oświęcimski
396	7	158	proszowicki
397	7	159	suski
398	206	\N	Chrząstowice
399	206	\N	Dąbrowa
400	206	\N	Dobrzeń Wielki
401	206	\N	Komprachcice
402	206	\N	Łubniany
403	206	\N	Murów
404	206	\N	Niemodlin
405	206	\N	Ozimek
406	206	\N	Popielów
407	206	\N	Prószków
408	206	\N	Tarnów Opolski
409	206	\N	Tułowice
410	206	\N	Turawa
411	206	\N	Opole
412	196	\N	Byczyna
413	196	\N	Kluczbork
414	196	\N	Lasowice Wielkie
415	196	\N	Wołczyn
416	202	\N	Dobrodzień
417	202	\N	Gorzów Śląski
418	202	\N	Olesno
419	202	\N	Praszka
420	202	\N	Radłów
421	202	\N	Rudniki
422	202	\N	Zębowice
423	194	\N	Brzeg
424	194	\N	Grodków
425	194	\N	Lewin Brzeski
426	194	\N	Lubsza
427	194	\N	Olszanka
428	194	\N	Skarbimierz
429	195	\N	Baborów
430	195	\N	Branice
431	195	\N	Głubczyce
432	195	\N	Kietrz
433	199	\N	Kędzierzyn-Koźle
434	199	\N	Bierawa
435	199	\N	Cisek
436	199	\N	Pawłowiczki
437	199	\N	Polska Cerekiew
438	199	\N	Reńska Wieś
439	197	\N	Gogolin
440	197	\N	Krapkowice
441	197	\N	Strzeleczki
442	197	\N	Walce
443	197	\N	Zdzieszowice
444	200	\N	Domaszowice
445	200	\N	Namysłów
446	200	\N	Pokój
447	200	\N	Świerczów
448	200	\N	Wilków
449	201	\N	Głuchołazy
450	201	\N	Kamiennik
451	201	\N	Korfantów
452	201	\N	Łambinowice
453	201	\N	Nysa
454	201	\N	Otmuchów
455	201	\N	Paczków
456	201	\N	Pakosławice
457	201	\N	Skoroszyce
458	203	\N	Biała
459	203	\N	Głogówek
460	203	\N	Lubrza
461	203	\N	Prudnik
462	204	\N	Izbicko
463	204	\N	Jemielnica
464	204	\N	Kolonowskie
465	204	\N	Leśnica
466	204	\N	Strzelce Opolskie
467	204	\N	Ujazd
468	204	\N	Zawadzkie
469	398	\N	Chrząstowice
470	398	\N	Daniec
471	398	\N	Dąbrowice
472	398	\N	Dębie
473	398	\N	Dębska Kuźnia
474	398	\N	Falmirowice
475	398	\N	Kamionka
476	398	\N	Lędziny
477	398	\N	Niwki
478	398	\N	Suchy Bór
479	398	\N	Zbicko
480	399	\N	Chróścina
481	399	\N	Ciepielowice
482	399	\N	Dąbrowa
483	399	\N	Karczów
484	399	\N	Lipowa
485	399	\N	Mechnice
486	399	\N	Narok
487	399	\N	Niewodniki
488	399	\N	Nowa Jamka
489	399	\N	Prądy
490	399	\N	Siedliska
491	399	\N	Skarbiszów
492	399	\N	Sławice
493	399	\N	Sokolniki
494	399	\N	Wrzoski
495	399	\N	Wyrębiny
496	399	\N	Żelazna
497	400	\N	Borki
498	400	\N	Brzezie
499	400	\N	Chróścice
500	400	\N	Czarnowąsy
501	400	\N	Dobrzeń Mały
502	400	\N	Dobrzeń Wielki
503	400	\N	Krzanowice
504	400	\N	Kup
505	400	\N	Młyn
506	400	\N	Świerkle
507	400	\N	Wolny
508	401	\N	Chmielowice
509	401	\N	Domecko
510	401	\N	Dziekaństwo
511	401	\N	Gąsów
512	401	\N	Komprachcice
513	401	\N	Ochodze
514	401	\N	Osiny
515	401	\N	Polska Nowa Wieś
516	401	\N	Wawelno
517	401	\N	Żerkowice
518	402	\N	Biadacz
519	402	\N	Brynica
520	402	\N	Dąbrówka Łubniańska
521	402	\N	Grabie
522	402	\N	Jełowa
523	402	\N	Kępa
524	402	\N	Kobylno
525	402	\N	Kolanowice
526	402	\N	Luboszyce
527	402	\N	Łubniany
528	402	\N	Masów
529	402	\N	Niwa
530	403	\N	Bukowo
531	403	\N	Dębiniec
532	403	\N	Grabczok
533	403	\N	Grabice
534	403	\N	Kały
535	403	\N	Młodnik
536	403	\N	Murów
537	403	\N	Nowe Budkowice
538	403	\N	Okoły
539	403	\N	Radomierowice
540	403	\N	Stare Budkowice
541	403	\N	Święciny
542	403	\N	Wojszyn
543	403	\N	Zagwiździe
544	404	\N	Brzęczkowice
545	404	\N	Gościejowice
546	404	\N	Góra
547	404	\N	Grabin
548	404	\N	Gracze
549	404	\N	Grodziec
550	404	\N	Grodziec Drugi
551	404	\N	Jaczowice
552	404	\N	Jakubowice
553	404	\N	Krasna Góra
554	404	\N	Ligota
555	404	\N	Lipno
556	404	\N	Magnuszowice
557	404	\N	Magnuszowiczki
558	404	\N	Michałówek
559	404	\N	Molestowice
560	404	\N	Piotrowa
561	404	\N	Radoszowice
562	404	\N	Rogi
563	404	\N	Roszkowice
564	404	\N	Rutki
565	404	\N	Rzędziwojowice
566	404	\N	Sady
567	404	\N	Sarny Wielkie
568	404	\N	Sosnówka
569	404	\N	Szydłowiec Śląski
570	404	\N	Tarnica
571	404	\N	Tłustoręby
572	404	\N	Wydrowice
573	404	\N	Niemodlin
574	411	\N	Opole
575	405	\N	Antoniów
576	405	\N	Biestrzynnik
577	405	\N	Chobie
578	405	\N	Dylaki
579	405	\N	Grodziec
580	405	\N	Krasiejów
581	405	\N	Krzyżowa Dolina
582	405	\N	Mnichów
583	405	\N	Nowa Schodnia
584	405	\N	Schodnia
585	405	\N	Szczedrzyk
586	405	\N	Ozimek
587	406	\N	Kaniów
588	406	\N	Karłowice
589	406	\N	Kurznie
590	406	\N	Kuźnica Katowska
591	406	\N	Lubienia
592	406	\N	Nowe Siołkowice
593	406	\N	Popielowska Kolonia
594	406	\N	Popielów
595	406	\N	Rybna
596	406	\N	Stare Kolnie
597	406	\N	Stare Siołkowice
598	406	\N	Stobrawa
599	406	\N	Zawada
600	407	\N	Boguszyce
601	407	\N	Chrząszczyce
602	407	\N	Chrzowice
603	407	\N	Droździce
604	407	\N	Folwark
605	407	\N	Górki
606	407	\N	Jaśkowice
607	407	\N	Ligota Prószkowska
608	407	\N	Nowa Kuźnia
609	407	\N	Przysiecz
610	407	\N	Winów
611	407	\N	Zimnice Małe
612	407	\N	Zimnice Wielkie
613	407	\N	Złotniki
614	407	\N	Źlinice
615	407	\N	Prószków
616	408	\N	Kąty Opolskie
617	408	\N	Kosorowice
618	408	\N	Miedziana
619	408	\N	Nakło
620	408	\N	Przywory
621	408	\N	Raszowa
622	408	\N	Tarnów Opolski
623	408	\N	Walidrogi
624	409	\N	Goszczowice
625	409	\N	Ligota Tułowicka
626	409	\N	Skarbiszowice
627	409	\N	Szydłów
628	409	\N	Tułowice
629	409	\N	Tułowice Małe
630	410	\N	Bierdzany
631	410	\N	Kadłub Turawski
632	410	\N	Kotórz Mały
633	410	\N	Kotórz Wielki
634	410	\N	Ligota Turawska
635	410	\N	Osowiec Śląski
636	410	\N	Piła
637	410	\N	Rzędzów
638	410	\N	Turawa
639	410	\N	Węgry
640	410	\N	Zakrzów Turawski
641	410	\N	Zawada
642	449	\N	Biskupów
643	449	\N	Bodzanów
644	449	\N	Burgrabice
645	449	\N	Charbielin
646	449	\N	Gierałcice
647	449	\N	Jarnołtówek
648	449	\N	Konradów
649	449	\N	Markowice
650	449	\N	Nowy Las
651	449	\N	Nowy Świętów
652	449	\N	Osiedle Pasterówka
653	449	\N	Osiedle Pionierów
654	449	\N	Podlesie
655	449	\N	Pokrzywna
656	449	\N	Polski Świętów
657	449	\N	Sławniowice
658	449	\N	Stary Las
659	449	\N	Sucha Kamienica
660	449	\N	Wilamowice Nyskie
661	449	\N	Głuchołazy
662	450	\N	Białowieża
663	450	\N	Chociebórz
664	450	\N	Cieszanowice
665	450	\N	Goworowice
666	450	\N	Kamiennik
667	450	\N	Karłowice Małe
668	450	\N	Karłowice Wielkie
669	450	\N	Kłodobok
670	450	\N	Lipniki
671	450	\N	Ogonów
672	450	\N	Szklary
673	450	\N	Wilemowice
674	450	\N	Zurzyce
675	451	\N	Borek
676	451	\N	Gryżów
677	451	\N	Jegielnica
678	451	\N	Kuropas
679	451	\N	Kuźnica Ligocka
680	451	\N	Myszowice
681	451	\N	Niesiebędowice
682	451	\N	Piechocice
683	451	\N	Pleśnica
684	451	\N	Przechód
685	451	\N	Przydroże Małe
686	451	\N	Przydroże Wielkie
687	451	\N	Puszyna
688	451	\N	Rączka
689	451	\N	Rynarcice
690	451	\N	Rzymkowice
691	451	\N	Stara Jamka
692	451	\N	Ścinawa Mała
693	451	\N	Ścinawa Nyska
694	451	\N	Węża
695	451	\N	Wielkie Łąki
696	451	\N	Włodary
697	451	\N	Włostowa
698	451	\N	Korfantów
699	452	\N	Bielice
700	452	\N	Budzieszowice
701	452	\N	Drogoszów
702	452	\N	Jasienica Dolna
703	452	\N	Lasocice
704	452	\N	Łambinowice
705	452	\N	Malerzowice Wielkie
706	452	\N	Mańkowice
707	452	\N	Piątkowice
708	452	\N	Sowin
709	452	\N	Szadurczyce
710	452	\N	Wierzbie
711	453	\N	Biała Nyska
712	453	\N	Domaszkowice
713	453	\N	Głębinów
714	453	\N	Goświnowice
715	453	\N	Hajduki Nyskie
716	453	\N	Hanuszów
717	453	\N	Iława
718	453	\N	Jędrzychów
719	453	\N	Kępnica
720	453	\N	Konradowa
721	453	\N	Koperniki
722	453	\N	Kubice
723	453	\N	Lipowa
724	453	\N	Morów
725	453	\N	Niwnica
726	453	\N	Podkamień
727	453	\N	Przełęk
728	453	\N	Radzikowice
729	453	\N	Regulice
730	453	\N	Rusocin
731	453	\N	Sękowice
732	453	\N	Siestrzechowice
733	453	\N	Skorochów
734	453	\N	Wierzbięcice
735	453	\N	Wyszków Śląski
736	453	\N	Złotogłowice
737	453	\N	Nysa
738	454	\N	Bednary
739	454	\N	Broniszowice
740	454	\N	Buków
741	454	\N	Goraszowice
742	454	\N	Grądy
743	454	\N	Janowa
744	454	\N	Jarnołtów
745	454	\N	Jasienica Górna
746	454	\N	Jodłów
747	454	\N	Kałków
748	454	\N	Kijów
749	454	\N	Kwiatków
750	454	\N	Lasowice
751	454	\N	Ligota Wielka
752	454	\N	Lubiatów
753	454	\N	Łąka
754	454	\N	Maciejowice
755	454	\N	Malerzowice Małe
756	454	\N	Meszno
757	454	\N	Nadziejów
758	454	\N	Nieradowice
759	454	\N	Piotrowice Nyskie
760	454	\N	Ratnowice
761	454	\N	Rysiowice
762	454	\N	Sarnowice
763	454	\N	Siedlec
764	454	\N	Starowice
765	454	\N	Suszkowice
766	454	\N	Śliwice
767	454	\N	Ulanowice
768	454	\N	Wierzbno
769	454	\N	Wójcice
770	454	\N	Zwanowice
771	454	\N	Otmuchów
772	455	\N	Dziewiętlice
773	455	\N	Frydrychów
774	455	\N	Gościce
775	455	\N	Kamienica
776	455	\N	Kozielno
777	455	\N	Lisie Kąty
778	455	\N	Stary Paczków
779	455	\N	Ścibórz
780	455	\N	Trzeboszowice
781	455	\N	Ujeździec
782	455	\N	Unikowice
783	455	\N	Wilamowa
784	455	\N	Paczków
785	456	\N	Biechów
786	456	\N	Bykowice
787	456	\N	Goszowice
788	456	\N	Korzekwice
789	456	\N	Nowaki
790	456	\N	Pakosławice
791	456	\N	Prusinowice
792	456	\N	Reńska Wieś
793	456	\N	Rzymiany
794	456	\N	Słupice
795	456	\N	Smolice
796	456	\N	Strobice
797	457	\N	Brzeziny
798	457	\N	Chróścina
799	457	\N	Czarnolas
800	457	\N	Giełczyce
801	457	\N	Makowice
802	457	\N	Mroczkowa
803	457	\N	Pniewie
804	457	\N	Sidzina
805	457	\N	Skoroszyce
806	457	\N	Stary Grodków
807	416	\N	Błachów
808	416	\N	Bzinica Nowa
809	416	\N	Bzinica Stara
810	416	\N	Dąbrowica
811	416	\N	Główczyce
812	416	\N	Gosławice
813	416	\N	Klekotna
814	416	\N	Kocury
815	416	\N	Kolejka
816	416	\N	Ligota Dobrodzieńska
817	416	\N	Makowczyce
818	416	\N	Marzatka
819	416	\N	Myślina
820	416	\N	Pietraszów
821	416	\N	Pludry
822	416	\N	Rzędowice
823	416	\N	Szemrowice
824	416	\N	Turza
825	416	\N	Warłów
826	416	\N	Zwóz
827	416	\N	Dobrodzień
828	417	\N	Budzów
829	417	\N	Dębina
830	417	\N	Goła
831	417	\N	Jamy
832	417	\N	Jastrzygowice
833	417	\N	Kobyla Góra
834	417	\N	Kolonia Uszyce
835	417	\N	Kosowice-Uszyce
836	417	\N	Kozłowice
837	417	\N	Krzyżanowice
838	417	\N	Nędza
839	417	\N	Nowa Wieś
840	417	\N	Pakoszów
841	417	\N	Pawłowice
842	417	\N	Skrońsko
843	417	\N	Szklarnia Pawłowicka
844	417	\N	Uszyce
845	417	\N	Zdziechowice
846	417	\N	Gorzów Śląski
847	418	\N	Ameryka
848	418	\N	Bodzanowice
849	418	\N	Borki Małe
850	418	\N	Borki Wielkie
851	418	\N	Boroszów
852	418	\N	Broniec
853	418	\N	Cegielnia
854	418	\N	Chomącko
855	418	\N	Czarny Las
856	418	\N	Flaki
857	418	\N	Florczyzna
858	418	\N	Gajdownia
859	418	\N	Grodzisko
860	418	\N	Kolonia Łomnicka
861	418	\N	Kucoby
862	418	\N	Leśna
863	418	\N	Ligęzów
864	418	\N	Łomnica
865	418	\N	Łowoszów
866	418	\N	Ługi
867	418	\N	Nowy Wachów
868	418	\N	Rosocha
869	418	\N	Smolarki
870	418	\N	Sobisz
871	418	\N	Sowczyce
872	418	\N	Stara Chudoba
873	418	\N	Stare Kuczoby
874	418	\N	Stare Olesno
875	418	\N	Świercze
876	418	\N	Wachowice
877	418	\N	Wachów
878	418	\N	Wojciechów
879	418	\N	Wysoka
880	418	\N	Zdunów
881	418	\N	Olesno
882	419	\N	Aleksandrów
883	419	\N	Brzeziny
884	419	\N	Gana
885	419	\N	Grabówka
886	419	\N	Kiczmachów
887	419	\N	Kik
888	419	\N	Kowale
889	419	\N	Kozieł
890	419	\N	Kuźniczka
891	419	\N	Lachowskie
892	419	\N	Marki
893	419	\N	Prosna
894	419	\N	Przedmość
895	419	\N	Rosochy
896	419	\N	Rozterk
897	419	\N	Skotnica
898	419	\N	Sołtysy
899	419	\N	Stanisławów
900	419	\N	Strojec
901	419	\N	Szyszków
902	419	\N	Tokary
903	419	\N	Wierzbie
904	419	\N	Wygiełdów
905	419	\N	Żubrówka
906	419	\N	Praszka
907	420	\N	Biskupice
908	420	\N	Brzozówka
909	420	\N	Diabli Młynek
910	420	\N	Flaki
911	420	\N	Goniszów
912	420	\N	Kolonia Biskupska
913	420	\N	Kościeliska
914	420	\N	Ligota Oleska
915	420	\N	Nowe Karmonki
916	420	\N	Psurów
917	420	\N	Radłów
918	420	\N	Stare Karmonki
919	420	\N	Sternalice
920	420	\N	Wichrów
921	420	\N	Wojtków
922	420	\N	Wolęcin
923	420	\N	Wytoka
924	421	\N	Bobrowa
925	421	\N	Borek
926	421	\N	Brzeziny
927	421	\N	Chwiły
928	421	\N	Cieciułów
929	421	\N	Dalachów
930	421	\N	Faustianka
931	421	\N	Glinki
932	421	\N	Hajdamaki
933	421	\N	Janinów
934	421	\N	Jaworek
935	421	\N	Jaworzno
936	421	\N	Jaworzno Bankowe
937	421	\N	Jelonki
938	421	\N	Julianpol
939	421	\N	Kuźnica
940	421	\N	Kuźnica Żytniowska
941	421	\N	Łazy
942	421	\N	Mirowszczyzna
943	421	\N	Młyny
944	421	\N	Mostki
945	421	\N	Nowy Bugaj
946	421	\N	Odcinek
947	421	\N	Pieńki
948	421	\N	Polesie
949	421	\N	Porąbki
950	421	\N	Rudniki
951	421	\N	Słowików
952	421	\N	Stawki Cieciułowskie
953	421	\N	Wytoka
954	421	\N	Żurawie
955	421	\N	Żytniów
956	422	\N	Kadłub Wolny
957	422	\N	Knieja
958	422	\N	Łąka
959	422	\N	Osiecko
960	422	\N	Poczołków
961	422	\N	Prusków
962	422	\N	Radawie
963	422	\N	Siedliska
964	422	\N	Zębowice
965	444	\N	Domaszowice
966	444	\N	Dziedzice
967	444	\N	Gręboszów
968	444	\N	Jarzębiec
969	444	\N	Nowa Wieś
970	444	\N	Polkowskie
971	444	\N	Siemysłów
972	444	\N	Strzelce
973	444	\N	Wielołęka
974	444	\N	Włochy
975	444	\N	Woskowice Górne
976	444	\N	Zalesie
977	444	\N	Zofijówka
978	445	\N	Namysłów
979	445	\N	Baldwinowice
980	445	\N	Barzyna
981	445	\N	Brzezinka
982	445	\N	Brzozowiec
983	445	\N	Bukowa Śląska
984	445	\N	Głuszyna
985	445	\N	Igłowice
986	445	\N	Jastrzębie
987	445	\N	Józefków
988	445	\N	Kamienna
989	445	\N	Kowalowice
990	445	\N	Krasowice
991	445	\N	Ligota Książęca
992	445	\N	Ligotka
993	445	\N	Łączany
994	445	\N	Michalice
995	445	\N	Mikowice
996	445	\N	Minkowskie
997	445	\N	Niwki
998	445	\N	Nowe Smarchowice
999	445	\N	Nowy Folwark
1000	445	\N	Objazda
1001	445	\N	Pawłowice Namysłowskie
1002	445	\N	Przeczów
1003	445	\N	Rychnów
1004	445	\N	Smarchowice Małe
1005	445	\N	Smarchowice Śląskie
1006	445	\N	Smarchowice Wielkie
1007	445	\N	Smogorzów
1008	445	\N	Woskowice Małe
1009	445	\N	Ziemiełowice
1010	445	\N	Żaba
1011	446	\N	Dąbrówka Dolna
1012	446	\N	Domaradz
1013	446	\N	Domaradzka Kuźnia
1014	446	\N	Fałkowice
1015	446	\N	Kopalina
1016	446	\N	Krogulna
1017	446	\N	Krzywa Góra
1018	446	\N	Lubnów
1019	446	\N	Ładza
1020	446	\N	Pokój
1021	446	\N	Siedlice
1022	446	\N	Szum
1023	446	\N	Zawiść
1024	446	\N	Zieleniec
1025	447	\N	Bąkowice
1026	447	\N	Bielice
1027	447	\N	Biestrzykowice
1028	447	\N	Dąbrowa
1029	447	\N	Gola
1030	447	\N	Grodziec
1031	447	\N	Kuźnica Dąbrowska
1032	447	\N	Miejsce
1033	447	\N	Miodary
1034	447	\N	Osiek Duży
1035	447	\N	Pieczyska
1036	447	\N	Starościn
1037	447	\N	Świerczów
1038	447	\N	Wężowice
1039	447	\N	Zbica
1040	448	\N	Bukowie
1041	448	\N	Dębnik
1042	448	\N	Idzikowice
1043	448	\N	Jakubowice
1044	448	\N	Krzyków
1045	448	\N	Lubska
1046	448	\N	Młokicie
1047	448	\N	Pągów
1048	448	\N	Pielgrzymowice
1049	448	\N	Pszeniczna
1050	448	\N	Wilków
1051	448	\N	Wojciechów
1052	439	\N	Gogolin
1053	439	\N	Chorula
1054	439	\N	Dąbrówka
1055	439	\N	Górażdże
1056	439	\N	Kamień Śląski
1057	439	\N	Kamionek
1058	439	\N	Malnia
1059	439	\N	Obrowiec
1060	439	\N	Odrowąż
1061	439	\N	Zakrzów
1062	440	\N	Krapkowice
1063	440	\N	Agnieszczyn
1064	440	\N	Borek
1065	440	\N	Dąbrówka Górna
1066	440	\N	Gwoździce
1067	440	\N	Kórnica
1068	440	\N	Nowy Dwór Prudnicki
1069	440	\N	Pietna
1070	440	\N	Rogów Opolski
1071	440	\N	Steblów
1072	440	\N	Ściborowice
1073	440	\N	Żużela
1074	440	\N	Żywocice
1075	441	\N	Dobra
1076	441	\N	Dziedzice
1077	441	\N	Komorniki
1078	441	\N	Kujawy
1079	441	\N	Łowkowice
1080	441	\N	Moszna
1081	441	\N	Pisarzowice
1082	441	\N	Racławiczki
1083	441	\N	Smolarnia
1084	441	\N	Strzeleczki
1085	441	\N	Ścigów
1086	441	\N	Wawrzyńcowice
1087	441	\N	Zielina
1088	442	\N	Brożec
1089	442	\N	Brzezina
1090	442	\N	Ćwiercie
1091	442	\N	Dobieszowice
1092	442	\N	Grocholub
1093	442	\N	Kromołów
1094	442	\N	Rozkochów
1095	442	\N	Stradunia
1096	442	\N	Walce
1097	442	\N	Zabierzów
1098	443	\N	Zdzieszowice
1099	443	\N	Dalnie
1100	443	\N	Januszkowice
1101	443	\N	Jasiona
1102	443	\N	Krępna
1103	443	\N	Oleszka
1104	443	\N	Rozwadza
1105	443	\N	Żyrowa
1106	423	\N	Brzeg
1107	424	\N	Grodków
1108	424	\N	Bąków
1109	424	\N	Bogdanów
1110	424	\N	Gałązczyce
1111	424	\N	Gierów
1112	424	\N	Głębocko
1113	424	\N	Gnojna
1114	424	\N	Gola Grodkowska
1115	424	\N	Jaszów
1116	424	\N	Jeszkotle
1117	424	\N	Jędrzejów
1118	424	\N	Kobiela
1119	424	\N	Kolnica
1120	424	\N	Kopice
1121	424	\N	Lipowa
1122	424	\N	Lubcz
1123	424	\N	Mikołajowa
1124	424	\N	Młodoszowice
1125	424	\N	Nowa Wieś Mała
1126	424	\N	Osiek Grodkowski
1127	424	\N	Polana
1128	424	\N	Przylesie Dolne
1129	424	\N	Rogów
1130	424	\N	Starowice Dolne
1131	424	\N	Strzegów
1132	424	\N	Sulisław
1133	424	\N	Tarnów Grodkowski
1134	424	\N	Wierzbna
1135	424	\N	Wierzbnik
1136	424	\N	Więcmierzyce
1137	424	\N	Wojnowiczki
1138	424	\N	Wojsław
1139	424	\N	Wójtowice
1140	424	\N	Zielonkowice
1141	424	\N	Żarów
1142	424	\N	Żelazna
1143	425	\N	Lewin Brzeski
1144	425	\N	Borkowice
1145	425	\N	Buszyce
1146	425	\N	Chróścina
1147	425	\N	Golczowice
1148	425	\N	Jasiona
1149	425	\N	Kantorowice
1150	425	\N	Leśniczówka
1151	425	\N	Łosiów
1152	425	\N	Mikolin
1153	425	\N	Nowa Wieś Mała
1154	425	\N	Oldrzyszowice
1155	425	\N	Przecza
1156	425	\N	Ptakowice
1157	425	\N	Różyna
1158	425	\N	Sarny Małe
1159	425	\N	Skorogoszcz
1160	425	\N	Stroszowice
1161	425	\N	Strzelniki
1162	425	\N	Wronów
1163	426	\N	Błota
1164	426	\N	Borek
1165	426	\N	Borucice
1166	426	\N	Czepielowice
1167	426	\N	Dobrzyń
1168	426	\N	Garbów
1169	426	\N	Kościerzyce
1170	426	\N	Lubicz
1171	426	\N	Lubsza
1172	426	\N	Mąkoszyce
1173	426	\N	Michałowice
1174	426	\N	Myśliborzyce
1175	426	\N	Nowe Kolnie
1176	426	\N	Nowy Świat
1177	426	\N	Piastowice
1178	426	\N	Pisarzowice
1179	426	\N	Raciszów
1180	426	\N	Rogalice
1181	426	\N	Roszkowice
1182	426	\N	Stawy
1183	426	\N	Szydłowice
1184	426	\N	Śmiechowice
1185	426	\N	Tarnowiec
1186	426	\N	Złotówka
1187	427	\N	Czeska Wieś
1188	427	\N	Gierszowice
1189	427	\N	Jankowice Wielkie
1190	427	\N	Janów
1191	427	\N	Krzyżowice
1192	427	\N	Michałów
1193	427	\N	Obórki
1194	427	\N	Olszanka
1195	427	\N	Pogorzela
1196	427	\N	Przylesie
1197	428	\N	Bierzów
1198	428	\N	Brzezina
1199	428	\N	Kopanie
1200	428	\N	Kruszyna
1201	428	\N	Lipki
1202	428	\N	Łukowice Brzeskie
1203	428	\N	Małujowice
1204	428	\N	Pawłów
1205	428	\N	Pępice
1206	428	\N	Prędocin
1207	428	\N	Skarbimierz
1208	428	\N	Skarbimierz Osiedle
1209	428	\N	Zielęcice
1210	428	\N	Zwanowice
1211	428	\N	Żłobizna
1212	429	\N	Baborów
1213	429	\N	Babice
1214	429	\N	Boguchwałów
1215	429	\N	Czerwonków
1216	429	\N	Dziećmarów
1217	429	\N	Dzielów
1218	429	\N	Księże Pole
1219	429	\N	Raków
1220	429	\N	Sucha Psina
1221	429	\N	Sułków
1222	429	\N	Szczyty
1223	429	\N	Tłustomosty
1224	430	\N	Bliszczyce
1225	430	\N	Boboluszki
1226	430	\N	Branice
1227	430	\N	Dzbańce
1228	430	\N	Dzbańce-Osiedle
1229	430	\N	Dzierżkowice
1230	430	\N	Gródczany
1231	430	\N	Jabłonka
1232	430	\N	Jakubowice
1233	430	\N	Jędrychowice
1234	430	\N	Lewice
1235	430	\N	Michałkowice
1236	430	\N	Niekazanice
1237	430	\N	Posucice
1238	430	\N	Turków
1239	430	\N	Uciechowice
1240	430	\N	Wiechowice
1241	430	\N	Włodzienin
1242	430	\N	Włodzienin-Kolonia
1243	430	\N	Wódka
1244	430	\N	Wysoka
1245	431	\N	Głubczyce
1246	431	\N	Bernacice
1247	431	\N	Bernacice Górne
1248	431	\N	Biernatów
1249	431	\N	Bogdanowice
1250	431	\N	Braciszów
1251	431	\N	Chomiąża
1252	431	\N	Chróstno
1253	431	\N	Ciermęcice
1254	431	\N	Debrzyca
1255	431	\N	Dobieszów
1256	431	\N	Gadzowice
1257	431	\N	Głubczyce-Sady
1258	431	\N	Gołuszowice
1259	431	\N	Grobniki
1260	431	\N	Kietlice
1261	431	\N	Klisino
1262	431	\N	Krasne Pole
1263	431	\N	Królowe
1264	431	\N	Krzyżowice
1265	431	\N	Kwiatoniów
1266	431	\N	Lenarcice
1267	431	\N	Lisięcice
1268	431	\N	Lwowiany
1269	431	\N	Mokre
1270	431	\N	Mokre-Kolonia
1271	431	\N	Nowa Wieś Głubczycka
1272	431	\N	Nowe Gołuszowice
1273	431	\N	Nowe Sady
1274	431	\N	Nowy Rożnów
1275	431	\N	Opawica
1276	431	\N	Pielgrzymów
1277	431	\N	Pietrowice
1278	431	\N	Pomorzowice
1279	431	\N	Pomorzowiczki
1280	431	\N	Radynia
1281	431	\N	Równe
1282	431	\N	Sławoszów
1283	431	\N	Ściborzyce Małe
1284	431	\N	Tarnkowa
1285	431	\N	Widok
1286	431	\N	Zawiszyce
1287	431	\N	Zopowy
1288	431	\N	Zopowy-Osiedle
1289	431	\N	Zubrzyce
1290	431	\N	Żabczyce
1291	432	\N	Kietrz
1292	432	\N	Chróścielów
1293	432	\N	Dzierżysław
1294	432	\N	Gęsina
1295	432	\N	Kozłówki
1296	432	\N	Lubotyń
1297	432	\N	Ludmierzyce
1298	432	\N	Nasiedle
1299	432	\N	Nowa Cerekwia
1300	432	\N	Pilszcz
1301	432	\N	Rogożany
1302	432	\N	Rozumice
1303	432	\N	Ściborzyce Wielkie
1304	432	\N	Wojnowice
1305	433	\N	Kędzierzyn-Koźle
1306	434	\N	Bierawa
1307	434	\N	Brzeźce
1308	434	\N	Dziergowice
1309	434	\N	Goszyce
1310	434	\N	Grabówka
1311	434	\N	Korzonek
1312	434	\N	Kotlarnia
1313	434	\N	Lubieszów
1314	434	\N	Ortowice
1315	434	\N	Solarnia
1316	434	\N	Stara Kuźnia
1317	434	\N	Stare Koźle
1318	435	\N	Błażejowice
1319	435	\N	Cisek
1320	435	\N	Dzielnica
1321	435	\N	Kobylice
1322	435	\N	Landzmierz
1323	435	\N	Łany
1324	435	\N	Miejsce Odrzańskie
1325	435	\N	Nieznaszyn
1326	435	\N	Podlesie
1327	435	\N	Przewóz
1328	435	\N	Roszowice
1329	435	\N	Roszowicki Las
1330	435	\N	Steblów
1331	435	\N	Sukowice
1332	436	\N	Borzysławice
1333	436	\N	Chrósty
1334	436	\N	Dobieszów
1335	436	\N	Dobrosławice
1336	436	\N	Gościęcin
1337	436	\N	Grodzisko
1338	436	\N	Grudynia Mała
1339	436	\N	Grudynia Wielka
1340	436	\N	Jakubowice
1341	436	\N	Karchów
1342	436	\N	Kózki
1343	436	\N	Krasowa
1344	436	\N	Ligota Wielka
1345	436	\N	Maciowakrze
1346	436	\N	Mierzęcin
1347	436	\N	Milice
1348	436	\N	Naczęsławice
1349	436	\N	Ostrożnica
1350	436	\N	Pawłowiczki
1351	436	\N	Przedborowice
1352	436	\N	Radoszowy
1353	436	\N	Trawniki
1354	436	\N	Ucieszków
1355	436	\N	Urbanowice
1356	437	\N	Ciężkowice
1357	437	\N	Dzielawy
1358	437	\N	Grzędzin
1359	437	\N	Jaborowice
1360	437	\N	Koza
1361	437	\N	Ligota Mała
1362	437	\N	Łaniec
1363	437	\N	Mierzęcin
1364	437	\N	Polska Cerekiew
1365	437	\N	Połowa
1366	437	\N	Witosławice
1367	437	\N	Wronin
1368	437	\N	Zakrzów
1369	438	\N	Bytków
1370	438	\N	Dębowa
1371	438	\N	Długomiłowice
1372	438	\N	Gierałtowice
1373	438	\N	Kamionka
1374	438	\N	Komorno
1375	438	\N	Łężce
1376	438	\N	Mechnica
1377	438	\N	Naczysławki
1378	438	\N	Poborszów
1379	438	\N	Pociękarb
1380	438	\N	Pokrzywnica
1381	438	\N	Radziejów
1382	438	\N	Reńska Wieś
1383	438	\N	Większyce
1384	412	\N	Byczyna
1385	412	\N	Biskupice
1386	412	\N	Borek
1387	412	\N	Chudoba
1388	412	\N	Ciecierzyn
1389	412	\N	Dobiercice
1390	412	\N	Gołkowice
1391	412	\N	Gosław
1392	412	\N	Jakubowice
1393	412	\N	Janówka
1394	412	\N	Jaśkowice
1395	412	\N	Kluczów
1396	412	\N	Kochłowice
1397	412	\N	Kostów
1398	412	\N	Miechowa
1399	412	\N	Nasale
1400	412	\N	Paruszowice
1401	412	\N	Pogorzałka
1402	412	\N	Polanowice
1403	412	\N	Proślice
1404	412	\N	Pszczonki
1405	412	\N	Roszkowice
1406	412	\N	Sarnów
1407	412	\N	Sierosławice
1408	412	\N	Wojsławice
1409	413	\N	Kluczbork
1410	413	\N	Bażany
1411	413	\N	Bąków
1412	413	\N	Biadacz
1413	413	\N	Bogacica
1414	413	\N	Bogacka Szklarnia
1415	413	\N	Bogdańczowice
1416	413	\N	Borkowice
1417	413	\N	Brzezinka
1418	413	\N	Chałupska
1419	413	\N	Czaple Wolne
1420	413	\N	Damnik
1421	413	\N	Dobrzyny
1422	413	\N	Drogomin
1423	413	\N	Drzewiec
1424	413	\N	Gotartów
1425	413	\N	Gotartów-Ogrodnictwo
1426	413	\N	Korzeniaki
1427	413	\N	Krasków
1428	413	\N	Krzywizna
1429	413	\N	Kujakowice Dolne
1430	413	\N	Kujakowice Górne
1431	413	\N	Kuniów
1432	413	\N	Ligota Dolna
1433	413	\N	Ligota Górna
1434	413	\N	Ligota Zamecka
1435	413	\N	Łowkowice
1436	413	\N	Maciejów
1437	413	\N	Miłoszowice
1438	413	\N	Nowa Bogacica
1439	413	\N	Smardy Dolne
1440	413	\N	Smardy Górne
1441	413	\N	Stare Czaple
1442	413	\N	Unieszów
1443	413	\N	Zameczek
1444	413	\N	Żabiniec
1445	414	\N	Borki Małe
1446	414	\N	Borki Wielkie
1447	414	\N	Chałupy
1448	414	\N	Chocianowice
1449	414	\N	Chudoba
1450	414	\N	Ciarka
1451	414	\N	Ciarski Młyn
1452	414	\N	Gronowice
1453	414	\N	Jasienie
1454	414	\N	Kopalina
1455	414	\N	Laskowice
1456	414	\N	Lasowice Małe
1457	414	\N	Lasowice Wielkie
1458	414	\N	Malicz
1459	414	\N	Miskowe
1460	414	\N	Ostrołęka
1461	414	\N	Oś
1462	414	\N	Radlina
1463	414	\N	Radomil
1464	414	\N	Rydzek
1465	414	\N	Sobisz
1466	414	\N	Stara Chudoba
1467	414	\N	Szczepina
1468	414	\N	Szumirad
1469	414	\N	Trzebiszyn
1470	414	\N	Tuły
1471	414	\N	Wędrynia
1472	414	\N	Zimnik
1473	415	\N	Wołczyn
1474	415	\N	Bruny
1475	415	\N	Brynica
1476	415	\N	Brzezinki
1477	415	\N	Cegielnia
1478	415	\N	Chomącko
1479	415	\N	Duczów Mały
1480	415	\N	Duczów Wielki
1481	415	\N	Gierałcice
1482	415	\N	Jędrzejowice
1483	415	\N	Kołoczek
1484	415	\N	Komorzno
1485	415	\N	Krystyna
1486	415	\N	Krzywiczyny
1487	415	\N	Ligota Wołczyńska
1488	415	\N	Markotów Duży
1489	415	\N	Markotów Mały
1490	415	\N	Markowe
1491	415	\N	Mścisław
1492	415	\N	Niwy
1493	415	\N	Rożnów
1494	415	\N	Skałągi
1495	415	\N	Stary Folwark
1496	415	\N	Szum
1497	415	\N	Szymonków
1498	415	\N	Świniary Małe
1499	415	\N	Świniary Wielkie
1500	415	\N	Teklusia
1501	415	\N	Wąsice
1502	415	\N	Wierzbica Dolna
1503	415	\N	Wierzbica Górna
1504	415	\N	Wierzchy
1505	458	\N	Biała
1506	458	\N	Browiniec Polski
1507	458	\N	Brzeźnica
1508	458	\N	Chrzelice
1509	458	\N	Czartowice
1510	458	\N	Dębina
1511	458	\N	Gostomia
1512	458	\N	Górka Prudnicka
1513	458	\N	Grabina
1514	458	\N	Jeleni Dwór
1515	458	\N	Józefów
1516	458	\N	Kolnowice
1517	458	\N	Kolonia Otocka
1518	458	\N	Krobusz
1519	458	\N	Laskowiec
1520	458	\N	Ligota Bialska
1521	458	\N	Łącznik
1522	458	\N	Miłowice
1523	458	\N	Mokra
1524	458	\N	Nagłów
1525	458	\N	Nowa Wieś Prudnicka
1526	458	\N	Ogiernicze
1527	458	\N	Olbrachcice
1528	458	\N	Otoki
1529	458	\N	Pogórze
1530	458	\N	Prężyna
1531	458	\N	Radostynia
1532	458	\N	Rostkowice
1533	458	\N	Solec
1534	458	\N	Śmicz
1535	458	\N	Śródlesie
1536	458	\N	Wasiłowice
1537	458	\N	Wilków
1538	459	\N	Głogówek
1539	459	\N	Biedrzychowice
1540	459	\N	Błażejowice Dolne
1541	459	\N	Ciesznów
1542	459	\N	Dzierżysławice
1543	459	\N	Góreczno
1544	459	\N	Kazimierz
1545	459	\N	Kierpień
1546	459	\N	Leśnik
1547	459	\N	Mionów
1548	459	\N	Młodziejowice
1549	459	\N	Mochów
1550	459	\N	Nowe Kotkowice
1551	459	\N	Racławice Śląskie
1552	459	\N	Rzepcze
1553	459	\N	Stare Kotkowice
1554	459	\N	Szonów
1555	459	\N	Tomice
1556	459	\N	Twardawa
1557	459	\N	Wierzch
1558	459	\N	Wróblin
1559	459	\N	Zawada
1560	459	\N	Zwiastowice
1561	460	\N	Dobroszewice
1562	460	\N	Dytmarów
1563	460	\N	Jasiona
1564	460	\N	Krzyżkowice
1565	460	\N	Laskowice
1566	460	\N	Lubrza
1567	460	\N	Nowy Browiniec
1568	460	\N	Olszynka
1569	460	\N	Prężynka
1570	460	\N	Skrzypiec
1571	460	\N	Słoków
1572	460	\N	Trzebina
1573	461	\N	Prudnik
1574	461	\N	Chocim
1575	461	\N	Czyżowice
1576	461	\N	Dębowiec
1577	461	\N	Łąka Prudnicka
1578	461	\N	Mieszkowice
1579	461	\N	Moszczanka
1580	461	\N	Moszczanka-Kolonia
1581	461	\N	Niemysłowice
1582	461	\N	Piorunkowice
1583	461	\N	Rudziczka
1584	461	\N	Szybowice
1585	461	\N	Wierzbiec
1586	462	\N	Borycz
1587	462	\N	Grabów
1588	462	\N	Izbicko
1589	462	\N	Krośnica
1590	462	\N	Ligota Czamborowa
1591	462	\N	Lwowska
1592	462	\N	Otmice
1593	462	\N	Poznowice
1594	462	\N	Siedlec
1595	462	\N	Sprzęcice
1596	462	\N	Suchodaniec
1597	463	\N	Barut
1598	463	\N	Centawa
1599	463	\N	Gąsiorowice
1600	463	\N	Graniczny
1601	463	\N	Jemielnica
1602	463	\N	Łaziska
1603	463	\N	Miłosna
1604	463	\N	Piotrówka
1605	463	\N	Redwina
1606	463	\N	Wierchlesie
1607	463	\N	Zielona
1608	464	\N	Kolonowskie
1609	464	\N	Baniak
1610	464	\N	Granica
1611	464	\N	Magda
1612	464	\N	Sporok
1613	464	\N	Staniszcze Małe
1614	464	\N	Staniszcze Wielkie
1615	465	\N	Leśnica
1616	465	\N	Czarnocin
1617	465	\N	Dolna
1618	465	\N	Góra Świętej Anny
1619	465	\N	Kadłubiec
1620	465	\N	Krasowa
1621	465	\N	Lichynia
1622	465	\N	Łąki Kozielskie
1623	465	\N	Poręba
1624	465	\N	Raszowa
1625	465	\N	Wysoka
1626	465	\N	Zalesie Śląskie
1627	466	\N	Strzelce Opolskie
1628	466	\N	Błotnica Strzelecka
1629	466	\N	Brzezina
1630	466	\N	Dziewkowice
1631	466	\N	Grodzisko
1632	466	\N	Jędrynie
1633	466	\N	Kaczorownia
1634	466	\N	Kadłub
1635	466	\N	Kalinowice
1636	466	\N	Kalinów
1637	466	\N	Koszyce
1638	466	\N	Ligota Dolna
1639	466	\N	Ligota Górna
1640	466	\N	Niwki
1641	466	\N	Osiek
1642	466	\N	Pakoszyn
1643	466	\N	Płużnica Wielka
1644	466	\N	Poręba
1645	466	\N	Rozmierka
1646	466	\N	Rozmierz
1647	466	\N	Rożniątów
1648	466	\N	Stara Poczta
1649	466	\N	Sucha
1650	466	\N	Szczepanek
1651	466	\N	Szymiszów
1652	466	\N	Szymiszów-Osiedle
1653	466	\N	Warmątowice
1654	467	\N	Ujazd
1655	467	\N	Balcarzowice
1656	467	\N	Janków
1657	467	\N	Jaryszów
1658	467	\N	Klucz
1659	467	\N	Komorniki
1660	467	\N	Księży Las
1661	467	\N	Niezdrowice
1662	467	\N	Nogowczyce
1663	467	\N	Olszowa
1664	467	\N	Sieroniowice
1665	467	\N	Stary Ujazd
1666	467	\N	Zimna Wódka
1667	468	\N	Zawadzkie
1668	468	\N	Kielcza
1669	468	\N	Żędowice
1670	267	\N	Będzin
1671	267	\N	Czeladź
1672	267	\N	Sławków
1673	267	\N	Wojkowice
1674	267	\N	Bobrowniki
1675	267	\N	Mierzęcice
1676	267	\N	Psary
1677	267	\N	Siewierz
1678	28	\N	Szczyrk
1679	28	\N	Bestwina
1680	28	\N	Buczkowice
1681	28	\N	Czechowice-Dziedzice
1682	28	\N	Jasienica
1683	28	\N	Jaworze
1684	28	\N	Kozy
1685	28	\N	Porąbka
1686	28	\N	Wilamowice
1687	28	\N	Wilkowice
1688	27	\N	Bielsko-Biała
1689	1688	\N	Bielsko-Biała
1690	141	\N	Bieruń
1691	141	\N	Imielin
1692	141	\N	Lędziny
1693	141	\N	Bojszowy
1694	141	\N	Chełm Śląski
1695	268	\N	Cieszyn
1696	268	\N	Ustroń
1697	268	\N	Wisła
1698	268	\N	Brenna
1699	268	\N	Chybie
1700	268	\N	Dębowiec
1701	268	\N	Goleszów
1702	268	\N	Hażlach
1703	268	\N	Istebna
1704	268	\N	Skoczów
1705	268	\N	Strumień
1706	268	\N	Zebrzydowice
1707	32	\N	Blachownia
1708	32	\N	Dąbrowa Zielona
1709	32	\N	Janów
1710	32	\N	Kamienica Polska
1711	32	\N	Kłomnice
1712	32	\N	Koniecpol
1713	32	\N	Konopiska
1714	32	\N	Kruszyna
1715	32	\N	Lelów
1716	32	\N	Mstów
1717	32	\N	Mykanów
1718	32	\N	Olsztyn
1719	32	\N	Poczesna
1720	32	\N	Przyrów
1721	32	\N	Rędziny
1722	32	\N	Starcza
1723	35	\N	Knurów
1724	35	\N	Pyskowice
1725	35	\N	Gierałtowice
1726	35	\N	Pilchowice
1727	35	\N	Rudziniec
1728	35	\N	Sośnicowice
1729	35	\N	Toszek
1730	35	\N	Wielowieś
1731	269	\N	Kłobuck
1732	269	\N	Krzepice
1733	269	\N	Lipie
1734	269	\N	Miedźno
1735	269	\N	Opatów
1736	269	\N	Panki
1737	269	\N	Popów
1738	269	\N	Przystajń
1739	269	\N	Wręczyca Wielka
1740	18	\N	Lubliniec
1741	18	\N	Boronów
1742	18	\N	Ciasna
1743	18	\N	Herby
1744	18	\N	Kochanowice
1745	18	\N	Koszęcin
1746	18	\N	Pawonków
1747	18	\N	Woźniki
1748	19	\N	Łaziska Górne
1749	19	\N	Mikołów
1750	19	\N	Orzesze
1751	19	\N	Ornontowice
1752	19	\N	Wyry
1753	20	\N	Myszków
1754	20	\N	Koziegłowy
1755	20	\N	Niegowa
1756	20	\N	Poraj
1757	20	\N	Żarki
1758	21	\N	Goczałkowice-Zdrój
1759	21	\N	Kobiór
1760	21	\N	Miedźna
1761	21	\N	Pawłowice
1762	21	\N	Pszczyna
1763	21	\N	Suszec
1764	22	\N	Racibórz
1765	22	\N	Kornowac
1766	22	\N	Krzanowice
1767	22	\N	Krzyżanowice
1768	22	\N	Kuźnia Raciborska
1769	22	\N	Nędza
1770	22	\N	Pietrowice Wielkie
1771	22	\N	Rudnik
1772	44	\N	Czerwionka-Leszczyny
1773	44	\N	Gaszowice
1774	44	\N	Jejkowice
1775	44	\N	Lyski
1776	44	\N	Świerklany
1777	44	\N	Rybnik
1778	28	\N	Bielsko-Biała
1779	23	\N	Kalety
1780	23	\N	Miasteczko Śląskie
1781	23	\N	Radzionków
1782	23	\N	Tarnowskie Góry
1783	23	\N	Krupski Młyn
1784	23	\N	Ożarowice
1785	23	\N	Świerklaniec
1786	23	\N	Tworóg
1787	23	\N	Zbrosławice
1788	24	\N	Pszów
1789	24	\N	Radlin
1790	24	\N	Rydułtowy
1791	24	\N	Wodzisław Śląski
1792	24	\N	Godów
1793	24	\N	Gorzyce
1794	24	\N	Lubomia
1795	24	\N	Marklowice
1796	24	\N	Mszana
1797	25	\N	Poręba
1798	25	\N	Zawiercie
1799	25	\N	Irządze
1800	25	\N	Kroczyce
1801	25	\N	Łazy
1802	25	\N	Ogrodzieniec
1803	25	\N	Pilica
1804	25	\N	Szczekociny
1805	25	\N	Włodowice
1806	25	\N	Żarnowiec
1807	26	\N	Żywiec
1808	26	\N	Czernichów
1809	26	\N	Gilowice
1810	26	\N	Jeleśnia
1811	26	\N	Koszarawa
1812	26	\N	Lipowa
1813	26	\N	Łękawica
1814	26	\N	Łodygowice
1815	26	\N	Milówka
1816	26	\N	Radziechowy-Wieprz
1817	26	\N	Rajcza
1818	26	\N	Ślemień
1819	26	\N	Świnna
1820	26	\N	Ujsoły
1821	26	\N	Węgierska Górka
1822	32	\N	Częstochowa
1823	1670	\N	Będzin
1824	1671	\N	Czeladź
1825	1674	\N	Bobrowniki
1826	1674	\N	Dobieszowice
1827	1674	\N	Myszkowice
1828	1674	\N	Rogoźnik
1829	1674	\N	Sączów
1830	1674	\N	Siemonia
1831	1674	\N	Twardowice
1832	1674	\N	Wymysłów
1833	1675	\N	Boguchwałowice
1834	1675	\N	Mierzęcice
1835	1675	\N	Najdziszów
1836	1675	\N	Nowa Wieś
1837	1675	\N	Przeczyce
1838	1675	\N	Sadowie
1839	1675	\N	Toporowice
1840	1675	\N	Zawada
1841	1676	\N	Brzękowice Górne
1842	1676	\N	Brzękowice-Wał
1843	1676	\N	Chrobakowe
1844	1676	\N	Dąbie
1845	1676	\N	Gajówka Łagisza
1846	1676	\N	Goląsza Biska
1847	1676	\N	Goląsza Dolna
1848	1676	\N	Goląsza Górna
1849	1676	\N	Góra Siewierska
1850	1676	\N	Grodków
1851	1676	\N	Malinowice
1852	1676	\N	Preczów
1853	1676	\N	Psary
1854	1676	\N	Sarnów
1855	1676	\N	Strzyżowice
1856	1677	\N	Siewierz
1857	1677	\N	Brudzowice
1858	1677	\N	Czekanka
1859	1677	\N	Dzierżawa
1860	1677	\N	Dziewki
1861	1677	\N	Gołuchowice
1862	1677	\N	Leśniaki
1863	1677	\N	Nowa Wioska
1864	1677	\N	Podwarpie
1865	1677	\N	Słowik
1866	1677	\N	Trzebiesławice
1867	1677	\N	Tuliszów
1868	1677	\N	Warężyn
1869	1677	\N	Wojkowice Kościelne
1870	1677	\N	Żelisławice
1871	1672	\N	Sławków
1872	1673	\N	Wojkowice
1873	1678	\N	Szczyrk
1874	1679	\N	Bestwina
1875	1679	\N	Bestwinka
1876	1679	\N	Janowice
1877	1679	\N	Kaniów
1878	1680	\N	Buczkowice
1879	1680	\N	Godziszka
1880	1680	\N	Kalna
1881	1680	\N	Rybarzowice
1882	1681	\N	Czechowice-Dziedzice
1883	1681	\N	Bronów
1884	1681	\N	Ligota
1885	1681	\N	Zabrzeg
1886	1682	\N	Bielowicko
1887	1682	\N	Biery
1888	1682	\N	Grodziec
1889	1682	\N	Iłownica
1890	1682	\N	Jasienica
1891	1682	\N	Landek
1892	1682	\N	Łazy
1893	1682	\N	Mazańcowice
1894	1682	\N	Międzyrzecze Dolne
1895	1682	\N	Międzyrzecze Górne
1896	1682	\N	Roztropice
1897	1682	\N	Rudzica
1898	1682	\N	Świętoszówka
1899	1682	\N	Wieszczęta
1900	1683	\N	Błatnia
1901	1683	\N	Jaworze
1902	1684	\N	Kozy
1903	1685	\N	Bujaków
1904	1685	\N	Czaniec
1905	1685	\N	Kobiernice
1906	1685	\N	Porąbka
1907	1686	\N	Wilamowice
1908	1686	\N	Dankowice
1909	1686	\N	Hecznarowice
1910	1686	\N	Pisarzowice
1911	1686	\N	Stara Wieś
1912	1686	\N	Zasole Bielańskie
1913	1687	\N	Bystra
1914	1687	\N	Kamieńska Płyta
1915	1687	\N	Klimczok
1916	1687	\N	Magurka
1917	1687	\N	Meszna
1918	1687	\N	Szyndzielnia
1919	1687	\N	Wilkowice
1920	1698	\N	Brenna
1921	1698	\N	Górki Małe
1922	1698	\N	Górki Wielkie
1923	1699	\N	Chybie
1924	1699	\N	Frelichów
1925	1699	\N	Mnich
1926	1699	\N	Zaborze
1927	1699	\N	Zarzecze
1928	1700	\N	Dębowiec
1929	1700	\N	Gumna
1930	1700	\N	Iskrzyczyn
1931	1700	\N	Kostkowice
1932	1700	\N	Łączka
1933	1700	\N	Ogrodzona
1934	1700	\N	Simoradz
1935	1695	\N	Cieszyn
1936	1696	\N	Ustroń
1937	1697	\N	Wisła
1938	1701	\N	Bażanowice
1939	1701	\N	Cisownica
1940	1701	\N	Dzięgielów
1941	1701	\N	Godziszów
1942	1701	\N	Goleszów
1943	1701	\N	Kisielów
1944	1701	\N	Kozakowice Dolne
1945	1701	\N	Kozakowice Górne
1946	1701	\N	Leszna Górna
1947	1701	\N	Puńców
1948	1702	\N	Brzezówka
1949	1702	\N	Hażlach
1950	1702	\N	Kończyce Wielkie
1951	1702	\N	Pogwizdów
1952	1702	\N	Rudnik
1953	1702	\N	Zamarski
1954	1703	\N	Istebna
1955	1703	\N	Jaworzynka
1956	1703	\N	Koniaków
1957	1704	\N	Skoczów
1958	1704	\N	Bładnice Dolne
1959	1704	\N	Bładnice Górne
1960	1704	\N	Harbutowice
1961	1704	\N	Kiczyce
1962	1704	\N	Kowale
1963	1704	\N	Międzyświeć
1964	1704	\N	Ochaby Małe
1965	1704	\N	Ochaby Wielkie
1966	1704	\N	Pierściec
1967	1704	\N	Pogórze
1968	1704	\N	Wilamowice
1969	1704	\N	Wiślica
1970	1705	\N	Strumień
1971	1705	\N	Bąków
1972	1705	\N	Drogomyśl
1973	1705	\N	Pruchna
1974	1705	\N	Zabłocie
1975	1705	\N	Zbytków
1976	1706	\N	Kaczyce
1977	1706	\N	Kończyce Małe
1978	1706	\N	Marklowice Górne
1979	1706	\N	Zebrzydowice
1980	1707	\N	Blachownia
1981	1707	\N	Cisie
1982	1707	\N	Gajówka Bieżeń
1983	1707	\N	Gorzelnia
1984	1707	\N	Kierzek-Gajówka
1985	1707	\N	Konradów
1986	1707	\N	Łojki
1987	1707	\N	Wyrazów
1988	1708	\N	Bocian
1989	1708	\N	Borowce
1990	1708	\N	Brzozówki
1991	1708	\N	Cielętniki
1992	1708	\N	Cudków
1993	1708	\N	Dąbek
1994	1708	\N	Dąbrowa Zielona
1995	1708	\N	Gajówka Nowa Wieś
1996	1708	\N	Leśniczówka Knieja
1997	1708	\N	Lipie
1998	1708	\N	Maluszyce
1999	1708	\N	Milionów
2000	1708	\N	Niebyła
2001	1708	\N	Nowa Wieś
2002	1708	\N	Olbrachcice
2003	1708	\N	Osiny
2004	1708	\N	Raczkowice
2005	1708	\N	Raczkowice-Kolonia
2006	1708	\N	Rogaczew
2007	1708	\N	Soborzyce
2008	1708	\N	Święta Anna
2009	1708	\N	Ulesie
2010	1708	\N	Zaleszczyny
2011	1709	\N	Apolonka
2012	1709	\N	Apolonka-Leśniczówka
2013	1709	\N	Bogdaniec
2014	1709	\N	Bukówka
2015	1709	\N	Bystrzanowice
2016	1709	\N	Bystrzanowice-Dwór
2017	1709	\N	Cichy
2018	1709	\N	Czepurka
2019	1709	\N	Dąbrowa-Łazy
2020	1709	\N	Dziadówki-Leśniczówka
2021	1709	\N	Góry Gorzkowskie
2022	1709	\N	Hucisko
2023	1709	\N	Janów
2024	1709	\N	Julianka-Nadleśnictwo
2025	1709	\N	Kamienna Góra
2026	1709	\N	Lgoczanka
2027	1709	\N	Lipnik
2028	1709	\N	Lipnik-Gajówka
2029	1709	\N	Lusławice
2030	1709	\N	Łączki
2031	1709	\N	Okrąglik
2032	1709	\N	Ostrężnik
2033	1709	\N	Ostrów-Leśniczówka
2034	1709	\N	Pabianice
2035	1709	\N	Parkowe-Leśniczówka
2036	1709	\N	Piasek
2037	1709	\N	Ponik
2038	1709	\N	Siedlec
2039	1709	\N	Skowronów
2040	1709	\N	Sokole Pole
2041	1709	\N	Sygontka-Leśniczówka
2042	1709	\N	Śmiertny Dąb
2043	1709	\N	Śmiertny Dąb-Leśniczówka
2044	1709	\N	Teodorów
2045	1709	\N	Teodorów-Gajówka
2046	1709	\N	Zagórze
2047	1709	\N	Złoty Potok
2048	1709	\N	Żuraw
2049	1710	\N	Gajówka Osiny
2050	1710	\N	Hucisko
2051	1710	\N	Kamienica Polska
2052	1710	\N	Kolonia Klepaczka
2053	1710	\N	Osiny
2054	1710	\N	Podlesie
2055	1710	\N	Romanów
2056	1710	\N	Rudnik Wielki
2057	1710	\N	Wanaty
2058	1710	\N	Zawada
2059	1710	\N	Zawisna
2060	1711	\N	Adamów
2061	1711	\N	Antoniów
2062	1711	\N	Bartkowice
2063	1711	\N	Chmielarze
2064	1711	\N	Chorzenice
2065	1711	\N	Garnek
2066	1711	\N	Huby
2067	1711	\N	Jamrozowizna
2068	1711	\N	Janaszów
2069	1711	\N	Karczewice
2070	1711	\N	Kłomnice
2071	1711	\N	Konary
2072	1711	\N	Kuźnica
2073	1711	\N	Lipicze
2074	1711	\N	Łysa Góra
2075	1711	\N	Michałów
2076	1711	\N	Michałów Rudnicki
2077	1711	\N	Mostki
2078	1711	\N	Nieznanice
2079	1711	\N	Niwki
2080	1711	\N	Pacierzów
2081	1711	\N	Przybyłów
2082	1711	\N	Rzeki Małe
2083	1711	\N	Rzeki Wielkie
2084	1711	\N	Rzerzęczyce
2085	1711	\N	Skrzydlów
2086	1711	\N	Smardzew
2087	1711	\N	Śliwaków
2088	1711	\N	Trząska-Zawodzie
2089	1711	\N	Witkowice
2090	1711	\N	Wymysłów
2091	1711	\N	Zawada
2092	1711	\N	Zbereżka
2093	1711	\N	Zdrowa
2094	1712	\N	Koniecpol
2095	1712	\N	Aleksandrów
2096	1712	\N	Borek
2097	1712	\N	Dąbrowa
2098	1712	\N	Kozaków
2099	1712	\N	Kuźnica Grodziska
2100	1712	\N	Kuźnica Wąsowska
2101	1712	\N	Luborcza
2102	1712	\N	Ludwinów
2103	1712	\N	Łabędź
2104	1712	\N	Łysaków
2105	1712	\N	Łysiny
2106	1712	\N	Michałów
2107	1712	\N	Oblasy
2108	1712	\N	Okołowice
2109	1712	\N	Pękowiec
2110	1712	\N	Piaski
2111	1712	\N	Pod Jatnym
2112	1712	\N	Radoszewnica
2113	1712	\N	Rudniki
2114	1712	\N	Rudniki-Kolonia
2115	1712	\N	Siernicze-Gajówka
2116	1712	\N	Stanisławice
2117	1712	\N	Stary Koniecpol
2118	1712	\N	Teodorów
2119	1712	\N	Teresów
2120	1712	\N	Wąsosz
2121	1712	\N	Wólka
2122	1712	\N	Zagacie
2123	1712	\N	Załęże
2124	1712	\N	Zaróg
2125	1713	\N	Aleksandria
2126	1713	\N	Hutki
2127	1713	\N	Jamki
2128	1713	\N	Kolonia Hutki
2129	1713	\N	Konopiska
2130	1713	\N	Kopalnia
2131	1713	\N	Korzonek
2132	1713	\N	Kowale
2133	1713	\N	Leśniaki
2134	1713	\N	Łaziec
2135	1713	\N	Rększowice
2136	1713	\N	Walaszczyki
2137	1713	\N	Wąsosz
2138	1713	\N	Wygoda
2139	1714	\N	Antoniów
2140	1714	\N	Baby
2141	1714	\N	Bogusławice
2142	1714	\N	Cegielnia-Leśniczówka
2143	1714	\N	Gajówka Kruszyna
2144	1714	\N	Jacków
2145	1714	\N	Kijów
2146	1714	\N	Kruszyna
2147	1714	\N	Kuźnica
2148	1714	\N	Lgota Mała
2149	1714	\N	Łęg
2150	1714	\N	Pieńki Szczepockie
2151	1714	\N	Teklinów
2152	1714	\N	Wapiennik-Leśniczówka
2153	1714	\N	Widzów
2154	1714	\N	Widzówek
2155	1714	\N	Wikłów
2156	1715	\N	Biała Wielka
2157	1715	\N	Bogumiłek
2158	1715	\N	Brzozowa Góra
2159	1715	\N	Bysów
2160	1715	\N	Celiny
2161	1715	\N	Drochlin
2162	1715	\N	Gródek
2163	1715	\N	Konstantynów
2164	1715	\N	Kosmówki
2165	1715	\N	Lelów
2166	1715	\N	Lgota Błotna
2167	1715	\N	Lgota Gawronna
2168	1715	\N	Mełchów
2169	1715	\N	Nakło
2170	1715	\N	Paulinów
2171	1715	\N	Podlesie
2172	1715	\N	Skrajniwa
2173	1715	\N	Staromieście
2174	1715	\N	Ślęzany
2175	1715	\N	Turzyn
2176	1716	\N	Brzyszów
2177	1716	\N	Cegielnia
2178	1716	\N	Gąszczyk
2179	1716	\N	Jaskrów
2180	1716	\N	Jaźwiny
2181	1716	\N	Kłobukowice
2182	1716	\N	Kobyłczyce
2183	1716	\N	Krasice
2184	1716	\N	Kuchary
2185	1716	\N	Kuśmierki
2186	1716	\N	Latosówka
2187	1716	\N	Łuszczyn
2188	1716	\N	Małusy Małe
2189	1716	\N	Małusy Wielkie
2190	1716	\N	Mokrzesz
2191	1716	\N	Mstów
2192	1716	\N	Pniaki Mokrzeskie
2193	1716	\N	Rajsko
2194	1716	\N	Siedlec
2195	1716	\N	Srocko
2196	1716	\N	Wancerzów
2197	1716	\N	Zawada
2198	1717	\N	Adamów
2199	1717	\N	Antoniów
2200	1717	\N	Borowno
2201	1717	\N	Borowno-Gajówka
2202	1717	\N	Cykarzew
2203	1717	\N	Cykarzew Południowy
2204	1717	\N	Cykarzew Północny
2205	1717	\N	Czarny Las
2206	1717	\N	Dudki
2207	1717	\N	Florków
2208	1717	\N	Grabowa
2209	1717	\N	Grabówka
2210	1717	\N	Jamno
2211	1717	\N	Kokawa
2212	1717	\N	Kolonia Wierzchowisko
2213	1717	\N	Kuźnica Kiedrzyńska
2214	1717	\N	Kuźnica Lechowa
2215	1717	\N	Lemańsk
2216	1717	\N	Leśniczówka Mykanów
2217	1717	\N	Lubojenka
2218	1717	\N	Lubojna
2219	1717	\N	Łochynia
2220	1717	\N	Mykanów
2221	1717	\N	Nowy Broniszew
2222	1717	\N	Nowy Kocin
2223	1717	\N	Osiny
2224	1717	\N	Parcele
2225	1717	\N	Pasieka
2226	1717	\N	Radostków
2227	1717	\N	Radostków-Kolonia
2228	1717	\N	Rybna
2229	1717	\N	Stary Broniszew
2230	1717	\N	Stary Cykarzew
2231	1717	\N	Stary Kocin
2232	1717	\N	Topolów
2233	1717	\N	Tylin
2234	1717	\N	Wierzchowisko
2235	1717	\N	Wola Hankowska
2236	1717	\N	Wola Kiedrzyńska
2237	1717	\N	Zasmole
2238	1718	\N	Biskupice
2239	1718	\N	Bloki Kolejowe
2240	1718	\N	Bukowno
2241	1718	\N	Krasawa
2242	1718	\N	Kusięta
2243	1718	\N	Leśniczówka Dębowiec
2244	1718	\N	Leśniczówka Zrębice
2245	1718	\N	Odrzykoń
2246	1718	\N	Olsztyn
2247	1718	\N	Przymiłowice
2248	1718	\N	Przymiłowice-Kotysów
2249	1718	\N	Przymiłowice-Podgrabie
2250	1718	\N	Skrajnica
2251	1718	\N	Sokole Góry
2252	1718	\N	Suliszowice-Szczypie
2253	1718	\N	Turów
2254	1718	\N	Zielona Góra
2255	1718	\N	Zrębice
2256	1719	\N	Adamów
2257	1719	\N	Bargły
2258	1719	\N	Brzeziny-Kolonia
2259	1719	\N	Brzeziny Nowe
2260	1719	\N	Dębowiec
2261	1719	\N	Huta Stara A
2262	1719	\N	Huta Stara B
2263	1719	\N	Kolonia Poczesna
2264	1719	\N	Korwinów
2265	1719	\N	Mazury
2266	1719	\N	Michałów
2267	1719	\N	Młynek
2268	1719	\N	Nierada
2269	1719	\N	Nowa Wieś
2270	1719	\N	Poczesna
2271	1719	\N	Słowik
2272	1719	\N	Sobuczyna
2273	1719	\N	Wrzosowa
2274	1719	\N	Zawodzie
2275	1720	\N	Aleksandrówka
2276	1720	\N	Bolesławów
2277	1720	\N	Czerniczno
2278	1720	\N	Julianka
2279	1720	\N	Knieja
2280	1720	\N	Kopaniny
2281	1720	\N	Przyrów
2282	1720	\N	Sieraków
2283	1720	\N	Smyków
2284	1720	\N	Stanisławów
2285	1720	\N	Staropole
2286	1720	\N	Stawki
2287	1720	\N	Sygontka
2288	1720	\N	Wiercica
2289	1720	\N	Wola Mokrzeska
2290	1720	\N	Zalesice
2291	1720	\N	Zalesice-Leśniczówka
2292	1720	\N	Zarębice
2293	1721	\N	Karolina
2294	1721	\N	Konin
2295	1721	\N	Kościelec
2296	1721	\N	Madalin
2297	1721	\N	Marianka Rędzińska
2298	1721	\N	Rędziny
2299	1721	\N	Rudniki
2300	1722	\N	Klepaczka
2301	1722	\N	Łysiec
2302	1722	\N	Rudnik Mały
2303	1722	\N	Starcza
2304	1722	\N	Własna
2305	1725	\N	Beksza
2306	1725	\N	Chudów
2307	1725	\N	Gierałtowice
2308	1725	\N	Paniówki
2309	1725	\N	Przyszowice
2310	1726	\N	Kuźnia Nieborowska
2311	1726	\N	Leboszowice
2312	1726	\N	Nieborowice
2313	1726	\N	Pilchowice
2314	1726	\N	Stanica
2315	1726	\N	Wilcza
2316	1726	\N	Żernica
2317	1724	\N	Pyskowice
2318	1723	\N	Knurów
2319	1727	\N	Bojszów
2320	1727	\N	Bycina
2321	1727	\N	Chechło
2322	1727	\N	Kleszczów
2323	1727	\N	Ligota Łabędzka
2324	1727	\N	Łany
2325	1727	\N	Łącza
2326	1727	\N	Niekarmia
2327	1727	\N	Niewiesze
2328	1727	\N	Pławniowice
2329	1727	\N	Poniszowice
2330	1727	\N	Rudno
2331	1727	\N	Rudziniec
2332	1727	\N	Rzeczyce
2333	1727	\N	Słupsko
2334	1727	\N	Taciszów
2335	1727	\N	Widów
2336	1728	\N	Sośnicowice
2337	1728	\N	Bargłówka
2338	1728	\N	Kozłów
2339	1728	\N	Łany Wielkie
2340	1728	\N	Nowa Wieś
2341	1728	\N	Rachowice
2342	1728	\N	Sierakowice
2343	1728	\N	Smolnica
2344	1728	\N	Trachy
2345	1728	\N	Tworóg Mały
2346	1728	\N	Zamoście
2347	1729	\N	Toszek
2348	1729	\N	Boguszyce
2349	1729	\N	Ciochowice
2350	1729	\N	Kotliszowice
2351	1729	\N	Kotulin
2352	1729	\N	Ligota Toszecka
2353	1729	\N	Łączki
2354	1729	\N	Paczyna
2355	1729	\N	Paczynka
2356	1729	\N	Pawłowice
2357	1729	\N	Pisarzowice
2358	1729	\N	Płużniczka
2359	1729	\N	Pniów
2360	1729	\N	Proboszczowice
2361	1729	\N	Sarnów
2362	1729	\N	Srocza Góra
2363	1729	\N	Wilkowiczki
2364	1729	\N	Zalesie
2365	1730	\N	Błażejowice
2366	1730	\N	Borowiany
2367	1730	\N	Czarków
2368	1730	\N	Dąbrówka
2369	1730	\N	Dąbrówka-Hubertus
2370	1730	\N	Gajowice
2371	1730	\N	Kieleczka
2372	1730	\N	Radonia
2373	1730	\N	Raduń
2374	1730	\N	Sieroty
2375	1730	\N	Świbie
2376	1730	\N	Wielowieś
2377	1730	\N	Wiśnicze
2378	1730	\N	Zacharzowice
2379	1731	\N	Kłobuck
2380	1731	\N	Bartkówka
2381	1731	\N	Biała
2382	1731	\N	Borowianka
2383	1731	\N	Gajówka Kocin
2384	1731	\N	Gruszewnia
2385	1731	\N	Kamyk
2386	1731	\N	Kopiec
2387	1731	\N	Leśniczówka Kocin
2388	1731	\N	Lgota
2389	1731	\N	Libidza
2390	1731	\N	Łobodno
2391	1731	\N	Nadleśnictwo Kłobuck
2392	1731	\N	Nowa Wieś
2393	1731	\N	Podpapiernia
2394	1731	\N	Pogorzele
2395	1731	\N	Rybno
2396	1731	\N	Wapiennik
2397	1732	\N	Krzepice
2398	1732	\N	Dankowice Drugie
2399	1732	\N	Dankowice-Piaski
2400	1732	\N	Dankowice Pierwsze
2401	1732	\N	Dankowice Trzecie
2402	1732	\N	Lutrowskie
2403	1732	\N	Podłęże Królewskie
2404	1732	\N	Stanki
2405	1732	\N	Starokrzepice
2406	1732	\N	Szarki
2407	1732	\N	Zajączki Drugie
2408	1732	\N	Zajączki Pierwsze
2409	1732	\N	Zajączki Pierwsze-Ruda
2410	1733	\N	Albertów
2411	1733	\N	Brzózki
2412	1733	\N	Cegielnia-Grabarze
2413	1733	\N	Danków
2414	1733	\N	Giętkowizna
2415	1733	\N	Grabarze
2416	1733	\N	Julianów
2417	1733	\N	Kleśniska
2418	1733	\N	Lindów
2419	1733	\N	Lipie
2420	1733	\N	Napoleon
2421	1733	\N	Natolin
2422	1733	\N	Parzymiechy
2423	1733	\N	Piła
2424	1733	\N	Rębielice Szlacheckie
2425	1733	\N	Rozalin
2426	1733	\N	Stanisławów
2427	1733	\N	Stawy
2428	1733	\N	Szyszków
2429	1733	\N	Troniny
2430	1733	\N	Wapiennik
2431	1733	\N	Wapiennik-Drabiki
2432	1733	\N	Wapiennik-Gajówka
2433	1733	\N	Zbrojewsko
2434	1733	\N	Zimnowoda
2435	1734	\N	Borowa
2436	1734	\N	Gajówka Sudół
2437	1734	\N	Izbiska
2438	1734	\N	Kołaczkowice
2439	1734	\N	Krzyżówka
2440	1734	\N	Mazówki
2441	1734	\N	Miedźno
2442	1734	\N	Mokra
2443	1734	\N	Nowy Folwark
2444	1734	\N	Ostrowy
2445	1734	\N	Rębielice
2446	1734	\N	Rywaczki
2447	1734	\N	Świercze
2448	1734	\N	Wapiennik
2449	1734	\N	Wiktorów
2450	1734	\N	Władysławów
2451	1735	\N	Brzezinki
2452	1735	\N	Iwanowice Duże
2453	1735	\N	Iwanowice Małe
2454	1735	\N	Iwanowice-Naboków
2455	1735	\N	Julianów
2456	1735	\N	Opatów
2457	1735	\N	Waleńczów
2458	1735	\N	Wilkowiecko
2459	1735	\N	Złochowice
2460	1735	\N	Zwierzyniec Drugi
2461	1735	\N	Zwierzyniec Pierwszy
2462	1736	\N	Aleksandrów
2463	1736	\N	Cyganka
2464	1736	\N	Gajówka Konieczki
2465	1736	\N	Gajówka Zwierzyniec
2466	1736	\N	Jaciska
2467	1736	\N	Jaciska-Gajówka
2468	1736	\N	Janiki
2469	1736	\N	Kałmuki
2470	1736	\N	Kawki
2471	1736	\N	Konieczki
2472	1736	\N	Koski Drugie
2473	1736	\N	Koski-Gajówka
2474	1736	\N	Koski Pierwsze
2475	1736	\N	Kostrzyna
2476	1736	\N	Kotary
2477	1736	\N	Pacanów
2478	1736	\N	Panki
2479	1736	\N	Praszczyki
2480	1736	\N	Za Wodą
2481	1736	\N	Zwierzyniec-Leśniczówka
2482	1736	\N	Zwierzyniec Trzeci
2483	1736	\N	Żerdzina
2484	1737	\N	Annolesie
2485	1737	\N	Antonie
2486	1737	\N	Brzózki
2487	1737	\N	Dąbrowa
2488	1737	\N	Dąbrówka
2489	1737	\N	Dębie
2490	1737	\N	Dębie-Leśniczówka
2491	1737	\N	Florianów
2492	1737	\N	Kamieńszczyzna
2493	1737	\N	Kule
2494	1737	\N	Lelity
2495	1737	\N	Marianów
2496	1737	\N	Nowa Wieś
2497	1737	\N	Osiniec
2498	1737	\N	Płaczki
2499	1737	\N	Popów
2500	1737	\N	Popów-Parcela
2501	1737	\N	Rębielice Królewskie
2502	1737	\N	Smolarze
2503	1737	\N	Strębce
2504	1737	\N	Wąsosz
2505	1737	\N	Wąsosz Dolny
2506	1737	\N	Wąsosz Górny
2507	1737	\N	Więcki
2508	1737	\N	Wrzosy
2509	1737	\N	Zawady
2510	1737	\N	Zbory
2511	1737	\N	Zbory-Młyn
2512	1738	\N	Antonów
2513	1738	\N	Bagna
2514	1738	\N	Bór Zajaciński
2515	1738	\N	Brzeziny
2516	1738	\N	Dąbrowa
2517	1738	\N	Górki
2518	1738	\N	Kamińsko
2519	1738	\N	Kostrzyna
2520	1738	\N	Kuźnica Nowa
2521	1738	\N	Kuźnica Stara
2522	1738	\N	Ługi
2523	1738	\N	Ługi-Radły
2524	1738	\N	Michalinów
2525	1738	\N	Mrówczak
2526	1738	\N	Podłęże Szlacheckie
2527	1738	\N	Przystajń
2528	1738	\N	Siekierowizna
2529	1738	\N	Stany
2530	1738	\N	Wilcza Góra
2531	1738	\N	Wrzosy
2532	1739	\N	Bieżeń
2533	1739	\N	Borowe
2534	1739	\N	Bór Zapilski
2535	1739	\N	Brzezinki
2536	1739	\N	Czarna Wieś
2537	1739	\N	Długi Kąt
2538	1739	\N	Gajówka Kalej
2539	1739	\N	Golce
2540	1739	\N	Grodzisko
2541	1739	\N	Hutka
2542	1739	\N	Jezioro
2543	1739	\N	Kalej
2544	1739	\N	Klepaczka
2545	1739	\N	Kuleje
2546	1739	\N	Ług
2547	1739	\N	Nowa Szarlejka
2548	1739	\N	Nowiny
2549	1739	\N	Pierzchno
2550	1739	\N	Piła Druga
2551	1739	\N	Piła Pierwsza
2552	1739	\N	Podgaj
2553	1739	\N	Puszczew
2554	1739	\N	Szarlejka
2555	1739	\N	Truskolasy
2556	1739	\N	Węglowice
2557	1739	\N	Wręczyca
2558	1739	\N	Wręczyca Mała
2559	1739	\N	Wręczyca Wielka
2560	1739	\N	Wydra
2561	1739	\N	Zamłynie
2562	1764	\N	Racibórz
2563	1765	\N	Kobyla
2564	1765	\N	Kornowac
2565	1765	\N	Łańce
2566	1765	\N	Pogrzebień
2567	1765	\N	Rzuchów
2568	1766	\N	Krzanowice
2569	1766	\N	Bojanów
2570	1766	\N	Borucin
2571	1766	\N	Pietraszyn
2572	1766	\N	Wojnowice
2573	1767	\N	Bieńkowice
2574	1767	\N	Bolesław
2575	1767	\N	Chałupki
2576	1767	\N	Krzyżanowice
2577	1767	\N	Nowa Wioska
2578	1767	\N	Owsiszcze
2579	1767	\N	Roszków
2580	1767	\N	Rudyszwałd
2581	1767	\N	Tworków
2582	1767	\N	Wydale
2583	1767	\N	Zabełków
2584	1768	\N	Kuźnia Raciborska
2585	1768	\N	Budziska
2586	1768	\N	Jankowice
2587	1768	\N	Ruda
2588	1768	\N	Ruda Kozielska
2589	1768	\N	Rudy
2590	1768	\N	Siedliska
2591	1768	\N	Turze
2592	1768	\N	Wildek
2593	1769	\N	Babice
2594	1769	\N	Ciechowice
2595	1769	\N	Górki Śląskie
2596	1769	\N	Łęg
2597	1769	\N	Nędza
2598	1769	\N	Orzeszków
2599	1769	\N	Szymocice
2600	1769	\N	Zawada Książęca
2601	1760	\N	Frydek
2602	1760	\N	Gajówka Wola
2603	1760	\N	Gilowice
2604	1760	\N	Góra
2605	1760	\N	Grzawa
2606	1760	\N	Miedźna
2607	1760	\N	Wola
2608	381	\N	Bolesławiec
2609	381	\N	Gromadka
2610	381	\N	Nowogrodziec
2611	381	\N	Osiecznica
2612	381	\N	Warta Bolesławiecka
2613	2608	\N	Bolesławiec
2614	2609	\N	Borówki
2615	2609	\N	Gromadka
2616	2609	\N	Krzyżowa
2617	2609	\N	Modła
2618	2609	\N	Motyle
2619	2609	\N	Nowa Kuźnia
2620	2609	\N	Osła
2621	2609	\N	Pasternik
2622	2609	\N	Patoka
2623	2609	\N	Różyniec
2624	2609	\N	Wierzbowa
2625	2610	\N	Bieniec
2626	2610	\N	Borowiany
2627	2610	\N	Czerna
2628	2610	\N	Gierałtów
2629	2610	\N	Godzieszów
2630	2610	\N	Gościszów
2631	2610	\N	Kierżno
2632	2610	\N	Milików
2633	2610	\N	Nowa Wieś
2634	2610	\N	Parzyce
2635	2610	\N	Wykroty
2636	2610	\N	Zabłocie
2637	2610	\N	Zagajnik
2638	2610	\N	Zebrzydowa
2639	2611	\N	Bronowiec
2640	2611	\N	Kliczków
2641	2611	\N	Leśny Dwór
2642	2611	\N	Luboszów
2643	2611	\N	Ławszowa
2644	2611	\N	Ołobok
2645	2611	\N	Osiecznica
2646	2611	\N	Osieczów
2647	2611	\N	Parowa
2648	2611	\N	Poświętne
2649	2611	\N	Przejęsław
2650	2611	\N	Świętoszów
2651	2611	\N	Tomisław
2652	2612	\N	Iwiny
2653	2612	\N	Jurków
2654	2612	\N	Lubków
2655	2612	\N	Raciborowice Dolne
2656	2612	\N	Raciborowice Górne
2657	2612	\N	Szczytnica
2658	2612	\N	Tomaszów Bolesławiecki
2659	2612	\N	Warta Bolesławiecka
2660	2612	\N	Wartowice
2661	2612	\N	Wilczy Las
2662	382	\N	Bielawa
2663	382	\N	Dzierżoniów
2664	382	\N	Pieszyce
2665	382	\N	Piława Górna
2666	382	\N	Łagiewniki
2667	382	\N	Niemcza
2668	2662	\N	Bielawa
2669	2663	\N	Dzierżoniów
2670	2664	\N	Pieszyce
2671	2665	\N	Piława Górna
2672	2663	\N	Dobrocin
2673	2663	\N	Jędrzejowice
2674	2663	\N	Kiełczyn
2675	2663	\N	Książnica
2676	2663	\N	Mościsko
2677	2663	\N	Nowizna
2678	2663	\N	Ostroszowice
2679	2663	\N	Owiesno
2680	2663	\N	Piława Dolna
2681	2663	\N	Roztocznik
2682	2663	\N	Tuszyn
2683	2663	\N	Uciechów
2684	2663	\N	Włóki
2685	2666	\N	Jaźwina
2686	2666	\N	Ligota Wielka
2687	2666	\N	Łagiewniki
2688	2666	\N	Młynica
2689	2666	\N	Oleszna
2690	2666	\N	Przystronie
2691	2666	\N	Radzików
2692	2666	\N	Ratajno
2693	2666	\N	Sieniawka
2694	2666	\N	Sienice
2695	2666	\N	Słupice
2696	2666	\N	Sokolniki
2697	2666	\N	Trzebnik
2698	2667	\N	Niemcza
2699	2667	\N	Chwalęcin
2700	2667	\N	Gilów
2701	2667	\N	Gola Dzierżoniowska
2702	2667	\N	Kietlin
2703	2667	\N	Ligota Mała
2704	2667	\N	Nowa Wieś Niemczańska
2705	2667	\N	Podlesie
2706	2667	\N	Przerzeczyn-Zdrój
2707	2667	\N	Ruszkowice
2708	2667	\N	Wilków Wielki
2709	2608	\N	Bolesławice
2710	2608	\N	Bożejowice
2711	2608	\N	Brzeźnik
2712	2608	\N	Buczek
2713	2608	\N	Chościszowice
2714	2608	\N	Dąbrowa Bolesławiecka
2715	2608	\N	Dobra
2716	2608	\N	Golnice
2717	2608	\N	Kozłów
2718	2608	\N	Kraszowice
2719	2608	\N	Kraśnik Dolny
2720	2608	\N	Kraśnik Górny
2721	2608	\N	Krępnica
2722	2608	\N	Kruszyn
2723	2608	\N	Lipiany
2724	2608	\N	Łaziska
2725	2608	\N	Łąka
2726	2608	\N	Mierzwin
2727	2608	\N	Nowa
2728	2608	\N	Nowa Wieś
2729	2608	\N	Nowe Jaroszowice
2730	2608	\N	Ocice
2731	2608	\N	Otok
2732	2608	\N	Parkoszów
2733	2608	\N	Pstrąże
2734	2608	\N	Rakowice
2735	2608	\N	Stara Oleszna
2736	2608	\N	Stare Jaroszowice
2737	2608	\N	Suszki
2738	2608	\N	Trzebień
2739	2608	\N	Trzebień Mały
2740	2608	\N	Żeliszów
2741	2610	\N	Nowogrodziec
2742	384	\N	Głogów
2743	384	\N	Jerzmanowa
2744	384	\N	Kotla
2745	384	\N	Pęcław
2746	384	\N	Żukowice
2747	2742	\N	Głogów
2748	2742	\N	Borek
2749	2742	\N	Bytnik
2750	2742	\N	Grodziec Mały
2751	2742	\N	Klucze
2752	2742	\N	Krzekotów
2753	2742	\N	Przedmoście
2754	2742	\N	Rapocin
2755	2742	\N	Ruszowice
2756	2742	\N	Serby
2757	2742	\N	Stare Serby
2758	2742	\N	Szczyglice
2759	2742	\N	Turów
2760	2742	\N	Wilków
2761	2742	\N	Zabornia
2762	2743	\N	Bądzów
2763	2743	\N	Drogomin
2764	2743	\N	Gaiki
2765	2743	\N	Jaczów
2766	2743	\N	Jerzmanowa
2767	2743	\N	Kurowice
2768	2743	\N	Kurów Mały
2769	2743	\N	Łagoszów Mały
2770	2743	\N	Maniów
2771	2743	\N	Modła
2772	2743	\N	Potoczek
2773	2743	\N	Smardzów
2774	2743	\N	Zofiówka
2775	2744	\N	Ceber
2776	2744	\N	Chociemyśl
2777	2744	\N	Dorzecze
2778	2744	\N	Głogów-Gaj
2779	2744	\N	Głogówko
2780	2744	\N	Grochowice
2781	2744	\N	Kotla
2782	2744	\N	Kozie Doły
2783	2744	\N	Krążkówko
2784	2744	\N	Krzekotówek
2785	2744	\N	Kulów
2786	2744	\N	Leśna Dolina
2787	2744	\N	Moszowice
2788	2744	\N	Skidniów
2789	2744	\N	Skidniówek
2790	2744	\N	Skórzyn
2791	2744	\N	Sobczyce
2792	2744	\N	Winowno
2793	2744	\N	Zabiele
2794	2744	\N	Zaszków
2795	2745	\N	Białołęka
2796	2745	\N	Droglowice
2797	2745	\N	Igłowice
2798	2745	\N	Kotowice
2799	2745	\N	Leszkowice
2800	2745	\N	Pęcław
2801	2745	\N	Piersna
2802	2745	\N	Turów
2803	2745	\N	Wierzchownia
2804	2745	\N	Wietszyce
2805	2745	\N	Wojszyn
2806	2746	\N	Brzeg Głogowski
2807	2746	\N	Bukwica
2808	2746	\N	Czerna
2809	2746	\N	Dankowice
2810	2746	\N	Dobrzejowice
2811	2746	\N	Domaniowice
2812	2746	\N	Glinica
2813	2746	\N	Góra Świętej Anny
2814	2746	\N	Kamiona
2815	2746	\N	Kłoda
2816	2746	\N	Kromolin
2817	2746	\N	Nielubia
2818	2746	\N	Słone
2819	2746	\N	Wiekowice
2820	2746	\N	Zabłocie
2821	2746	\N	Żukowice
2822	383	\N	Góra
2823	383	\N	Jemielno
2824	383	\N	Niechlów
2825	383	\N	Wąsosz
2826	2822	\N	Borszyn Mały
2827	2822	\N	Borszyn Wielki
2828	2822	\N	Bronów
2829	2822	\N	Brzeżany
2830	2822	\N	Chróścina
2831	2822	\N	Czernina
2832	2822	\N	Czernina Dolna
2833	2822	\N	Czernina Górna
2834	2822	\N	Glinka
2835	2822	\N	Gola Górowska
2836	2822	\N	Grabowno
2837	2822	\N	Jastrzębia
2838	2822	\N	Kłoda Górowska
2839	2822	\N	Kruszyniec
2840	2822	\N	Ligota
2841	2822	\N	Łagiszyn
2842	2822	\N	Nowa Wioska
2843	2822	\N	Osetno
2844	2822	\N	Osetno Małe
2845	2822	\N	Polanowo
2846	2822	\N	Radosław
2847	2822	\N	Rogów Górowski
2848	2822	\N	Ryczeń
2849	2822	\N	Sławęcice
2850	2822	\N	Stara Góra
2851	2822	\N	Strumienna
2852	2822	\N	Strumyk
2853	2822	\N	Sułków
2854	2822	\N	Szedziec
2855	2822	\N	Ślubów
2856	2822	\N	Wierzowice Małe
2857	2822	\N	Wierzowice Wielkie
2858	2822	\N	Witoszyce
2859	2822	\N	Włodków Dolny
2860	2822	\N	Zawieścice
2861	2822	\N	Góra
2862	2823	\N	Bieliszów
2863	2823	\N	Chorągwice
2864	2823	\N	Ciechanów
2865	2823	\N	Cieszyny
2866	2823	\N	Czeladź Mała
2867	2823	\N	Daszów
2868	2823	\N	Irządze
2869	2823	\N	Jemielno
2870	2823	\N	Kietlów
2871	2823	\N	Luboszyce
2872	2823	\N	Luboszyce Małe
2873	2823	\N	Lubów
2874	2823	\N	Łęczyca
2875	2823	\N	Osłowice
2876	2823	\N	Piotrowice Małe
2877	2823	\N	Piskorze
2878	2823	\N	Psary
2879	2823	\N	Smolne
2880	2823	\N	Śleszów
2881	2823	\N	Świerki
2882	2823	\N	Zdziesławice
2883	2824	\N	Bartodzieje
2884	2824	\N	Bełcz Wielki
2885	2824	\N	Bogucin
2886	2824	\N	Głobice
2887	2824	\N	Karów
2888	2824	\N	Klimontów
2889	2824	\N	Lipowiec
2890	2824	\N	Łękanów
2891	2824	\N	Masełkowice
2892	2824	\N	Miechów
2893	2824	\N	Naratów
2894	2824	\N	Niechlów
2895	2824	\N	Siciny
2896	2824	\N	Soplicowo
2897	2824	\N	Szaszorowice
2898	2824	\N	Świerczów
2899	2824	\N	Tarpno
2900	2824	\N	Wągroda
2901	2824	\N	Wioska
2902	2824	\N	Wroniniec
2903	2824	\N	Wronów
2904	2824	\N	Żabin
2905	2824	\N	Żuchlów
2906	2825	\N	Wąsosz
2907	2825	\N	Baranowice
2908	2825	\N	Bartków
2909	2825	\N	Bełcz Górny
2910	2825	\N	Bełcz Mały
2911	2825	\N	Chocieborowice
2912	2825	\N	Cieszkowice
2913	2825	\N	Czarnoborsko
2914	2825	\N	Czeladź Wielka
2915	2825	\N	Dochowa
2916	2825	\N	Drozdowice Małe
2917	2825	\N	Drozdowice Wielkie
2918	2825	\N	Gola Wąsoska
2919	2825	\N	Górka Wąsoska
2920	2825	\N	Kamień Górowski
2921	2825	\N	Kąkolno
2922	2825	\N	Kowalowo
2923	2825	\N	Lechitów
2924	2825	\N	Lubiel
2925	2825	\N	Ługi
2926	2825	\N	Ostrawa
2927	2825	\N	Płoski
2928	2825	\N	Pobiel
2929	2825	\N	Rudna Mała
2930	2825	\N	Rudna Wielka
2931	2825	\N	Sułów Wielki
2932	2825	\N	Świniary
2933	2825	\N	Wiewierz
2934	2825	\N	Wiklina
2935	2825	\N	Wodniki
2936	2825	\N	Wrząca Śląska
2937	2825	\N	Wrząca Wielka
2938	2825	\N	Zbaków Dolny
2939	2825	\N	Zbaków Górny
2940	385	\N	Jawor
2941	385	\N	Bolków
2942	385	\N	Męcinka
2943	385	\N	Mściwojów
2944	385	\N	Paszowice
2945	385	\N	Wądroże Wielkie
2946	2940	\N	Jawor
2947	2941	\N	Bolków
2948	2941	\N	Gorzanowice
2949	2941	\N	Grudno
2950	2941	\N	Jastrowiec
2951	2941	\N	Kaczorów
2952	2941	\N	Lipa
2953	2941	\N	Mysłów
2954	2941	\N	Nowe Rochowice
2955	2941	\N	Płonina
2956	2941	\N	Półwsie
2957	2941	\N	Radzimowice
2958	2941	\N	Sady Dolne
2959	2941	\N	Sady Górne
2960	2941	\N	Stare Rochowice
2961	2941	\N	Świny
2962	2941	\N	Wierzchosławice
2963	2941	\N	Wierzchosławiczki
2964	2941	\N	Wolbromek
2965	2942	\N	Bogaczów
2966	2942	\N	Chełmiec
2967	2942	\N	Chroślice
2968	2942	\N	Kondratów
2969	2942	\N	Małuszów
2970	2942	\N	Męcinka
2971	2942	\N	Muchów
2972	2942	\N	Myślinów
2973	2942	\N	Piotrowice
2974	2942	\N	Pomocne
2975	2942	\N	Przybyłowice
2976	2942	\N	Raczyce
2977	2942	\N	Sichów
2978	2942	\N	Sichówek
2979	2942	\N	Słup
2980	2942	\N	Stanisławów
2981	2942	\N	Żarek
2982	2943	\N	Barycz
2983	2943	\N	Drzymałowice
2984	2943	\N	Godziszowa
2985	2943	\N	Grzegorzów
2986	2943	\N	Luboradz
2987	2943	\N	Marcinowice
2988	2943	\N	Mściwojów
2989	2943	\N	Niedaszów
2990	2943	\N	Siekierzyce
2991	2943	\N	Snowidza
2992	2943	\N	Targoszyn
2993	2943	\N	Zimnik
2994	2944	\N	Bolkowice
2995	2944	\N	Grobla
2996	2944	\N	Jakuszowa
2997	2944	\N	Kamienica
2998	2944	\N	Kłonice
2999	2944	\N	Kobylica
3000	2944	\N	Kwietniki
3001	2944	\N	Myślibórz
3002	2944	\N	Nowa Wieś Mała
3003	2944	\N	Nowa Wieś Wielka
3004	2944	\N	Paszowice
3005	2944	\N	Pogwizdów
3006	2944	\N	Sokola
3007	2944	\N	Wiadrów
3008	2944	\N	Zębowice
3009	2945	\N	Augustów
3010	2945	\N	Bielany
3011	2945	\N	Biernatki
3012	2945	\N	Budziszów Mały
3013	2945	\N	Budziszów Wielki
3014	2945	\N	Dobrzany
3015	2945	\N	Gądków
3016	2945	\N	Granowice
3017	2945	\N	Jenków
3018	2945	\N	Kępy
3019	2945	\N	Kosiska
3020	2945	\N	Mierczyce
3021	2945	\N	Pawłowice Wielkie
3022	2945	\N	Postolice
3023	2945	\N	Rąbienice
3024	2945	\N	Skała
3025	2945	\N	Sobolew
3026	2945	\N	Wądroże Małe
3027	2945	\N	Wądroże Wielkie
3028	2945	\N	Wierzchowice
3029	387	\N	Karpacz
3030	387	\N	Kowary
3031	387	\N	Piechowice
3032	387	\N	Szklarska Poręba
3033	387	\N	Janowice Wielkie
3034	387	\N	Jeżów Sudecki
3035	387	\N	Mysłakowice
3036	387	\N	Podgórzyn
3037	387	\N	Stara Kamienica
3038	3029	\N	Karpacz
3039	3030	\N	Kowary
3040	3031	\N	Piechowice
3041	3032	\N	Szklarska Poręba
3042	3033	\N	Janowice Wielkie
3043	3033	\N	Komarno
3044	3033	\N	Miedzianka
3045	3033	\N	Mniszków
3046	3033	\N	Radomierz
3047	3033	\N	Trzcińsko
3048	3034	\N	Chrośnica
3049	3034	\N	Czernica
3050	3034	\N	Dziwiszów
3051	3034	\N	Janówek
3052	3034	\N	Jeżów Sudecki
3053	3034	\N	Płoszczyna
3054	3034	\N	Siedlęcin
3055	3034	\N	Wrzeszczyn
3056	3035	\N	Bobrów
3057	3035	\N	Bukowiec
3058	3035	\N	Dąbrowica
3059	3035	\N	Gruszków
3060	3035	\N	Karpniki
3061	3035	\N	Kostrzyca
3062	3035	\N	Krogulec
3063	3035	\N	Łomnica
3064	3035	\N	Mysłakowice
3065	3035	\N	Strużnica
3066	3035	\N	Szwajcarka
3067	3035	\N	Wojanów
3068	3036	\N	Borowice
3069	3036	\N	Głębock
3070	3036	\N	Marczyce
3071	3036	\N	Miłków
3072	3036	\N	Odrodzenie
3073	3036	\N	Podgórzyn
3074	3036	\N	Przesieka
3075	3036	\N	Sosnówka
3076	3036	\N	Staniszów
3077	3036	\N	Ściegny
3078	3036	\N	Zachełmie
3079	3036	\N	wieś
3080	3036	\N	schronisko turystyczne
3081	3037	\N	Antoniów
3082	3037	\N	Barcinek
3083	3037	\N	Chromiec
3084	3037	\N	Kopaniec
3085	3037	\N	Kromnów
3086	3037	\N	Mała Kamienica
3087	3037	\N	Nowa Kamienica
3088	3037	\N	Rybnica
3089	3037	\N	Stara Kamienica
3090	3037	\N	Wojcieszyce
3091	388	\N	Kamienna Góra
3092	388	\N	Lubawka
3093	388	\N	Marciszów
3094	3091	\N	Kamienna Góra
3095	3091	\N	Czadrów
3096	3091	\N	Czarnów
3097	3091	\N	Dębrznik
3098	3091	\N	Dobromyśl
3099	3091	\N	Gorzeszów
3100	3091	\N	Janiszów
3101	3091	\N	Jawiszów
3102	3091	\N	Kochanów
3103	3091	\N	Krzeszów
3104	3091	\N	Krzeszówek
3105	3091	\N	Leszczyniec
3106	3091	\N	Lipienica
3107	3091	\N	Nowa Białka
3108	3091	\N	Ogorzelec
3109	3091	\N	Olszyny
3110	3091	\N	Pisarzowice
3111	3091	\N	Przedwojów
3112	3091	\N	Ptaszków
3113	3091	\N	Raszów
3114	3091	\N	Rędziny
3115	3091	\N	Szarocin
3116	3092	\N	Lubawka
3117	3092	\N	Błażejów
3118	3092	\N	Błażkowa
3119	3092	\N	Bukówka
3120	3092	\N	Chełmsko Śląskie
3121	3092	\N	Jarkowice
3122	3092	\N	Miszkowice
3123	3092	\N	Niedamirów
3124	3092	\N	Okrzeszyn
3125	3092	\N	Opawa
3126	3092	\N	Paczyn
3127	3092	\N	Paprotki
3128	3092	\N	Stara Białka
3129	3092	\N	Szczepanów
3130	3092	\N	Uniemyśl
3131	3093	\N	Ciechanowice
3132	3093	\N	Domanów
3133	3093	\N	Marciszów
3134	3093	\N	Nagórnik
3135	3093	\N	Pastewnik
3136	3093	\N	Pustelnik
3137	3093	\N	Sędzisław
3138	3093	\N	Świdnik
3139	3093	\N	Wieściszowice
3140	389	\N	Duszniki-Zdrój
3141	389	\N	Kłodzko
3142	389	\N	Kudowa-Zdrój
3143	389	\N	Nowa Ruda
3144	389	\N	Polanica-Zdrój
3145	389	\N	Bystrzyca Kłodzka
3146	389	\N	Lądek-Zdrój
3147	389	\N	Lewin Kłodzki
3148	389	\N	Międzylesie
3149	389	\N	Radków
3150	389	\N	Stronie Śląskie
3151	389	\N	Szczytna
3152	3140	\N	Duszniki-Zdrój
3153	3141	\N	Kłodzko
3154	3142	\N	Kudowa-Zdrój
3155	3143	\N	Nowa Ruda
3156	3144	\N	Polanica-Zdrój
3157	3145	\N	Bystrzyca Kłodzka
3158	3145	\N	Biała Woda
3159	3145	\N	Długopole Dolne
3160	3145	\N	Długopole-Zdrój
3161	3145	\N	Gorzanów
3162	3145	\N	Huta
3163	3145	\N	Idzików
3164	3145	\N	Kamienna
3165	3145	\N	Lasówka
3166	3145	\N	Marcinków
3167	3145	\N	Marianówka
3168	3145	\N	Mielnik
3169	3145	\N	Międzygórze
3170	3145	\N	Młoty
3171	3145	\N	Mostowice
3172	3145	\N	Nowa Bystrzyca
3173	3145	\N	Nowa Łomnica
3174	3145	\N	Nowy Waliszów
3175	3145	\N	Paszków
3176	3145	\N	Piaskowice
3177	3145	\N	Piotrowice
3178	3145	\N	Pławnica
3179	3145	\N	Pokrzywno
3180	3145	\N	Poniatów
3181	3145	\N	Ponikwa
3182	3145	\N	Poręba
3183	3145	\N	Spalona
3184	3145	\N	Stara Bystrzyca
3185	3145	\N	Stara Łomnica
3186	3145	\N	Starkówek
3187	3145	\N	Stary Waliszów
3188	3145	\N	Szczawina
3189	3145	\N	Szklarka
3190	3145	\N	Szklary
3191	3145	\N	Topolice
3192	3145	\N	Wilkanów
3193	3145	\N	Wójtowice
3194	3145	\N	Wyszki
3195	3145	\N	Zabłocie
3196	3145	\N	Zalesie
3197	3141	\N	Bierkowice
3198	3141	\N	Boguszyn
3199	3141	\N	Droszków
3200	3141	\N	Gaj
3201	3141	\N	Gołogłowy
3202	3141	\N	Gorzuchów
3203	3141	\N	Jaszkowa Dolna
3204	3141	\N	Jaszkowa Górna
3205	3141	\N	Jaszkówka
3206	3141	\N	Kamieniec
3207	3141	\N	Korytów
3208	3141	\N	Krosnowice
3209	3141	\N	Ławica
3210	3141	\N	Łączna
3211	3141	\N	Marcinów
3212	3141	\N	Mikowice
3213	3141	\N	Młynów
3214	3141	\N	Morzyszów
3215	3141	\N	Ołdrzychowice Kłodzkie
3216	3141	\N	Piszkowice
3217	3141	\N	Podtynie
3218	3141	\N	Podzamek
3219	3141	\N	Rogówek
3220	3141	\N	Romanowo
3221	3141	\N	Roszyce
3222	3141	\N	Ruszowice
3223	3141	\N	Rybie
3224	3141	\N	Siemków
3225	3141	\N	Siodłków
3226	3141	\N	Starków
3227	3141	\N	Stary Wielisław
3228	3141	\N	Szalejów Dolny
3229	3141	\N	Szalejów Górny
3230	3141	\N	Ścinawica
3231	3141	\N	Święcko
3232	3141	\N	Wilcza
3233	3141	\N	Wojbórz
3234	3141	\N	Wojciechowice
3235	3141	\N	Żelazno
3236	3146	\N	Lądek-Zdrój
3237	3146	\N	Karpno
3238	3146	\N	Kąty Bystrzyckie
3239	3146	\N	Konradów
3240	3146	\N	Lutynia
3241	3146	\N	Orłowiec
3242	3146	\N	Radochów
3243	3146	\N	Skowronki
3244	3146	\N	Skrzynka
3245	3146	\N	Stojków
3246	3146	\N	Trzebieszowice
3247	3146	\N	Wójtówka
3248	3146	\N	Wrzosówka
3249	3147	\N	Dańczów
3250	3147	\N	Darnków
3251	3147	\N	Gołaczów
3252	3147	\N	Jarków
3253	3147	\N	Jawornica
3254	3147	\N	Jeleniów
3255	3147	\N	Jerzykowice Małe
3256	3147	\N	Jerzykowice Wielkie
3257	3147	\N	Kocioł
3258	3147	\N	Krzyżanów
3259	3147	\N	Kulin Kłodzki
3260	3147	\N	Leśna
3261	3147	\N	Lewin Kłodzki
3262	3147	\N	Taszów
3263	3147	\N	Witów
3264	3147	\N	Zielone
3265	3148	\N	Międzylesie
3266	3148	\N	Boboszów
3267	3148	\N	Długopole Górne
3268	3148	\N	Dolnik
3269	3148	\N	Domaszków
3270	3148	\N	Gajnik
3271	3148	\N	Gniewoszów
3272	3148	\N	Goworów
3273	3148	\N	Jaworek
3274	3148	\N	Jodłów
3275	3148	\N	Kamieńczyk
3276	3148	\N	Lesica
3277	3148	\N	Michałowice
3278	3148	\N	Nagodzice
3279	3148	\N	Niemojów
3280	3148	\N	Nowa Wieś
3281	3148	\N	Pisary
3282	3148	\N	Potoczek
3283	3148	\N	Roztoki
3284	3148	\N	Różanka
3285	3148	\N	Smreczyna
3286	3148	\N	Szklarnia
3287	3143	\N	Bartnica
3288	3143	\N	Bieganów
3289	3143	\N	Borek
3290	3143	\N	Bożków
3291	3143	\N	Buczyna
3292	3143	\N	Chudzów
3293	3143	\N	Czerwieńczyce
3294	3143	\N	Dworki
3295	3143	\N	Dzikowiec
3296	3143	\N	Granicznik
3297	3143	\N	Jugów
3298	3143	\N	Koszyn
3299	3143	\N	Krajanów
3300	3143	\N	Ludwikowice Kłodzkie
3301	3143	\N	Miłków
3302	3143	\N	Nowa Wieś Kłodzka
3303	3143	\N	Nowy Miłków
3304	3143	\N	Podlesie
3305	3143	\N	Przygórze
3306	3143	\N	Rybno
3307	3143	\N	Sobaniów
3308	3143	\N	Sokolec
3309	3143	\N	Sokolica
3310	3143	\N	Straszków
3311	3143	\N	Świerki
3312	3143	\N	Świerki Kłodzkie
3313	3143	\N	Włodowice
3314	3143	\N	Wolibórz
3315	3143	\N	Wrześnik
3316	3149	\N	Radków
3317	3149	\N	Gajów
3318	3149	\N	Karłów
3319	3149	\N	Nowy Świat
3320	3149	\N	Pasterka
3321	3149	\N	Raszków
3322	3149	\N	Ratno Dolne
3323	3149	\N	Ratno Górne
3324	3149	\N	Ratno-Wambierzyce
3325	3149	\N	Suszyna
3326	3149	\N	Ścinawka Dolna
3327	3149	\N	Ścinawka Górna
3328	3149	\N	Ścinawka Średnia
3329	3149	\N	Tłumaczów
3330	3149	\N	Wambierzyce
3331	3150	\N	Stronie Śląskie
3332	3150	\N	Bielice
3333	3150	\N	Bolesławów
3334	3150	\N	Goszów
3335	3150	\N	Janowa Góra
3336	3150	\N	Kamienica
3337	3150	\N	Kletno
3338	3150	\N	Młynowiec
3339	3150	\N	Nowa Morawa
3340	3150	\N	Nowy Gierałtów
3341	3150	\N	Rogóżka
3342	3150	\N	Sienna
3343	3150	\N	Stara Morawa
3344	3150	\N	Stary Gierałtów
3345	3150	\N	Strachocin
3346	3151	\N	Szczytna
3347	3151	\N	Chocieszów
3348	3151	\N	Dolina
3349	3151	\N	Łężyce
3350	3151	\N	Niwa
3351	3151	\N	Słoszów
3352	3151	\N	Studzienno
3353	3151	\N	Wolany
3354	3151	\N	Złotno
3355	270	\N	Chojnów
3356	270	\N	Krotoszyce
3357	270	\N	Kunice
3358	270	\N	Legnickie Pole
3359	270	\N	Miłkowice
3360	270	\N	Prochowice
3361	270	\N	Ruja
3362	3355	\N	Biała
3363	3355	\N	Biskupin
3364	3355	\N	Bronim
3365	3355	\N	Brzozy
3366	3355	\N	Budziwojów
3367	3355	\N	Czernikowice
3368	3355	\N	Dębrzyna
3369	3355	\N	Dobroszów
3370	3355	\N	Goliszów
3371	3355	\N	Groble
3372	3355	\N	Jaroszówka
3373	3355	\N	Jerzmanowice
3374	3355	\N	Kobiałka
3375	3355	\N	Kolonia Kołłątaja
3376	3355	\N	Konradówka
3377	3355	\N	Krzywa
3378	3355	\N	Michów
3379	3355	\N	Niedźwiedzice
3380	3355	\N	Okmiany
3381	3355	\N	Osetnica
3382	3355	\N	Pątnów
3383	3355	\N	Piotrowice
3384	3355	\N	Rokitki
3385	3355	\N	Stary Łom
3386	3355	\N	Strupice
3387	3355	\N	Targoszyce
3388	3355	\N	Witków
3389	3355	\N	Zamienice
3390	3355	\N	Chojnów
3391	3356	\N	Babin
3392	3356	\N	Białka
3393	3356	\N	Bielowice
3394	3356	\N	Czerwony Kościół
3395	3356	\N	Dunino
3396	3356	\N	Janowice Duże
3397	3356	\N	Jaszków
3398	3356	\N	Kościelec
3399	3356	\N	Kozice
3400	3356	\N	Krajów
3401	3356	\N	Krotoszyce
3402	3356	\N	Pawłowice Małe
3403	3356	\N	Prostynia
3404	3356	\N	Szymanowice
3405	3356	\N	Tyńczyk Legnicki
3406	3356	\N	Warmątowice Sienkiewiczowskie
3407	3356	\N	Wilczyce
3408	3356	\N	Winnica
3409	3356	\N	Złotniki
3410	3357	\N	Bieniowice
3411	3357	\N	Golanka Górna
3412	3357	\N	Grzybiany
3413	3357	\N	Jaśkowice Legnickie
3414	3357	\N	Kunice
3415	3357	\N	Miłogostowice
3416	3357	\N	Pątnów Legnicki
3417	3357	\N	Piotrówek
3418	3357	\N	Rosochata
3419	3357	\N	Spalona
3420	3357	\N	Szczytniki Małe
3421	3357	\N	Szczytniki nad Kaczawą
3422	3358	\N	Bartoszów
3423	3358	\N	Biskupice
3424	3358	\N	Czarnków
3425	3358	\N	Gniewomierz
3426	3358	\N	Kłębanowice
3427	3358	\N	Koiszków
3428	3358	\N	Koskowice
3429	3358	\N	Księginice
3430	3358	\N	Legnickie Pole
3431	3358	\N	Lubień
3432	3358	\N	Mikołajowice
3433	3358	\N	Nowa Wieś Legnicka
3434	3358	\N	Ogonowice
3435	3358	\N	Raczkowa
3436	3358	\N	Strachowice
3437	3358	\N	Taczalin
3438	3359	\N	Bobrów
3439	3359	\N	Dobrzejów
3440	3359	\N	Głuchowice
3441	3359	\N	Gniewomirowice
3442	3359	\N	Goślinów
3443	3359	\N	Grzymalin
3444	3359	\N	Jakuszów
3445	3359	\N	Jezierzany
3446	3359	\N	Kochlice
3447	3359	\N	Lipce
3448	3359	\N	Miłkowice
3449	3359	\N	Pątnówek
3450	3359	\N	Rzeszotary
3451	3359	\N	Siedliska
3452	3359	\N	Studnica
3453	3359	\N	Ulesie
3454	3360	\N	Prochowice
3455	3360	\N	Cichobórz
3456	3360	\N	Dąbie
3457	3360	\N	Golanka Dolna
3458	3360	\N	Gromadzyń
3459	3360	\N	Kawice
3460	3360	\N	Kwiatkowice
3461	3360	\N	Lisowice
3462	3360	\N	Mierzowice
3463	3360	\N	Motyczyn
3464	3360	\N	Rogów Legnicki
3465	3360	\N	Szczedrzykowice
3466	3361	\N	Brennik
3467	3361	\N	Dzierżkowice
3468	3361	\N	Janowice
3469	3361	\N	Komorniki
3470	3361	\N	Lasowice
3471	3361	\N	Polanka
3472	3361	\N	Rogoźnik
3473	3361	\N	Ruja
3474	3361	\N	Strzałkowice
3475	3361	\N	Tyniec Legnicki
3476	3361	\N	Usza
3477	3361	\N	Wągrodno
3478	271	\N	Lubań
3479	271	\N	Świeradów-Zdrój
3480	271	\N	Leśna
3481	271	\N	Olszyna
3482	271	\N	Platerówka
3483	271	\N	Siekierczyn
3484	3478	\N	Lubań
3485	3479	\N	Świeradów-Zdrój
3486	3480	\N	Leśna
3487	3480	\N	Bartoszówka
3488	3480	\N	Grabiszyce Dolne
3489	3480	\N	Grabiszyce Górne
3490	3480	\N	Grabiszyce Średnie
3491	3480	\N	Janówka
3492	3480	\N	Jurków
3493	3480	\N	Kościelniki Górne
3494	3480	\N	Kościelniki Średnie
3495	3480	\N	Miłoszów
3496	3480	\N	Pobiedna
3497	3480	\N	Smolnik
3498	3480	\N	Stankowice
3499	3480	\N	Sucha
3500	3480	\N	Szyszkowa
3501	3480	\N	Świecie
3502	3480	\N	Wolimierz
3503	3480	\N	Zacisze
3504	3480	\N	Złotniki Lubańskie
3505	3480	\N	Złoty Potok
3506	3478	\N	Henryków Lubański
3507	3478	\N	Jałowiec
3508	3478	\N	Kościelnik
3509	3478	\N	Kościelniki Dolne
3510	3478	\N	Mściszów
3511	3478	\N	Nawojów Łużycki
3512	3478	\N	Nawojów Śląski
3513	3478	\N	Pisarzowice
3514	3478	\N	Radogoszcz
3515	3478	\N	Radostów Dolny
3516	3478	\N	Radostów Górny
3517	3478	\N	Radostów Średni
3518	3478	\N	Uniegoszcz
3519	3481	\N	Olszyna
3520	3481	\N	Biedrzychowice
3521	3481	\N	Bożkowice
3522	3481	\N	Grodnica
3523	3481	\N	Kałużna
3524	3481	\N	Karłowice
3525	3481	\N	Krzewie Małe
3526	3481	\N	Nowa Świdnica
3527	3481	\N	Olszyna Dolna
3528	3481	\N	Zapusta
3529	3482	\N	Platerówka
3530	3482	\N	Przylasek
3531	3482	\N	Węgliniec
3532	3482	\N	Włosień
3533	3482	\N	Zalipie
3534	3483	\N	Nowa Karczma
3535	3483	\N	Pisaczów
3536	3483	\N	Ponikowo
3537	3483	\N	Rudzica
3538	3483	\N	Siekierczyn
3539	3483	\N	Wesołówka
3540	3483	\N	Wyręba
3541	3483	\N	Zaręba
3542	272	\N	Lubin
3543	272	\N	Rudna
3544	272	\N	Ścinawa
3545	3542	\N	Lubin
3546	3542	\N	Bolanów
3547	3542	\N	Buczynka
3548	3542	\N	Bukowna
3549	3542	\N	Chróstnik
3550	3542	\N	Czerniec
3551	3542	\N	Dąbrowa Górna
3552	3542	\N	Gogołowice
3553	3542	\N	Gola
3554	3542	\N	Gorzelin
3555	3542	\N	Gorzyca
3556	3542	\N	Karczowiska
3557	3542	\N	Kłopotów
3558	3542	\N	Krzeczyn Mały
3559	3542	\N	Krzeczyn Wielki
3560	3542	\N	Księginice
3561	3542	\N	Lisiec
3562	3542	\N	Lubków
3563	3542	\N	Miłoradzice
3564	3542	\N	Miłosna
3565	3542	\N	Miroszowice
3566	3542	\N	Niemstów
3567	3542	\N	Obora
3568	3542	\N	Osiek
3569	3542	\N	Owczary
3570	3542	\N	Pieszków
3571	3542	\N	Podgórze
3572	3542	\N	Raszowa
3573	3542	\N	Raszowa Mała
3574	3542	\N	Raszówka
3575	3542	\N	Siedlce
3576	3542	\N	Składowice
3577	3542	\N	Szklary Górne
3578	3542	\N	Ustronie
3579	3542	\N	Wiercień
3580	3542	\N	Zimna Woda
3581	3543	\N	Brodowice
3582	3543	\N	Brodów
3583	3543	\N	Bytków
3584	3543	\N	Chełm
3585	3543	\N	Chobienia
3586	3543	\N	Ciechłowice
3587	3543	\N	Gawronki
3588	3543	\N	Gawrony
3589	3543	\N	Górzyn
3590	3543	\N	Gwizdanów
3591	3543	\N	Juszowice
3592	3543	\N	Kalinówka
3593	3543	\N	Kębłów
3594	3543	\N	Kliszów
3595	3543	\N	Koźlice
3596	3543	\N	Miłogoszcz
3597	3543	\N	Mleczno
3598	3543	\N	Naroczyce
3599	3543	\N	Nieszczyce
3600	3543	\N	Olszany
3601	3543	\N	Orsk
3602	3543	\N	Pielgrzymów
3603	3543	\N	Radomiłów
3604	3543	\N	Radoszyce
3605	3543	\N	Rudna
3606	3543	\N	Rynarcice
3607	3543	\N	Stara Rudna
3608	3543	\N	Studzionki
3609	3543	\N	Toszowice
3610	3543	\N	Wądroże
3611	3543	\N	Wysokie
3612	3544	\N	Ścinawa
3613	3544	\N	Buszkowice
3614	3544	\N	Chełmek Wołowski
3615	3544	\N	Dąbrowa Dolna
3616	3544	\N	Dąbrowa Środkowa
3617	3544	\N	Dębiec
3618	3544	\N	Dłużyce
3619	3544	\N	Dziesław
3620	3544	\N	Dziewin
3621	3544	\N	Jurcz
3622	3544	\N	Krzyżowa
3623	3544	\N	Lasowice
3624	3544	\N	Parszowice
3625	3544	\N	Przychowa
3626	3544	\N	Redlice
3627	3544	\N	Ręszów
3628	3544	\N	Sitno
3629	3544	\N	Turów
3630	3544	\N	Tymowa
3631	3544	\N	Wielowieś
3632	3544	\N	Zaborów
3633	273	\N	Gryfów Śląski
3634	273	\N	Lubomierz
3635	273	\N	Lwówek Śląski
3636	273	\N	Mirsk
3637	273	\N	Wleń
3638	3633	\N	Gryfów Śląski
3639	3633	\N	Krzewie Wielkie
3640	3633	\N	Młyńsko
3641	3633	\N	Proszówka
3642	3633	\N	Rząsiny
3643	3633	\N	Ubocze
3644	3633	\N	Wieża
3645	3633	\N	Wolbromów
3646	3634	\N	Lubomierz
3647	3634	\N	Chałupki
3648	3634	\N	Chmieleń
3649	3634	\N	Golejów
3650	3634	\N	Janice
3651	3634	\N	Maciejowiec
3652	3634	\N	Milęcice
3653	3634	\N	Oleszna Podgórska
3654	3634	\N	Pasiecznik
3655	3634	\N	Pławna Dolna
3656	3634	\N	Pławna Górna
3657	3634	\N	Pokrzywnik
3658	3634	\N	Popielówek
3659	3634	\N	Przysiodłek
3660	3634	\N	Radoniów
3661	3634	\N	Wojciechów
3662	3634	\N	Zalesie
3663	3635	\N	Lwówek Śląski
3664	3635	\N	Bielanka
3665	3635	\N	Brunów
3666	3635	\N	Chmielno
3667	3635	\N	Dębowy Gaj
3668	3635	\N	Dłużec
3669	3635	\N	Dworek
3670	3635	\N	Gaszów
3671	3635	\N	Górczyca
3672	3635	\N	Gradówek
3673	3635	\N	Kotliska
3674	3635	\N	Mojesz
3675	3635	\N	Nagórze
3676	3635	\N	Niwnice
3677	3635	\N	Pieszków
3678	3635	\N	Płóczki Dolne
3679	3635	\N	Płóczki Górne
3680	3635	\N	Radłówka
3681	3635	\N	Radomiłowice
3682	3635	\N	Rakowice Małe
3683	3635	\N	Rakowice Wielkie
3684	3635	\N	Skała
3685	3635	\N	Skorzynice
3686	3635	\N	Sobota
3687	3635	\N	Ustronie
3688	3635	\N	Włodzice Małe
3689	3635	\N	Włodzice Wielkie
3690	3635	\N	Zadole
3691	3635	\N	Zbylutów
3692	3635	\N	Żerkowice
3693	3636	\N	Mirsk
3694	3636	\N	Brzeziniec
3695	3636	\N	Gajówka
3696	3636	\N	Giebułtów
3697	3636	\N	Giebułtówek
3698	3636	\N	Gierczyn
3699	3636	\N	Grudza
3700	3636	\N	Kamienna Góra
3701	3636	\N	Kamień
3702	3636	\N	Karłowiec
3703	3636	\N	Kłopotnica
3704	3636	\N	Kotlina
3705	3636	\N	Krobica
3706	3636	\N	Kwieciszowice
3707	3636	\N	Mlądz
3708	3636	\N	Mroczkowice
3709	3636	\N	Orłowice
3710	3636	\N	Proszowa
3711	3636	\N	Przecznica
3712	3636	\N	Rębiszów
3713	3636	\N	Rozdroże Izerskie
3714	3636	\N	Stóg Izerski
3715	3637	\N	Wleń
3716	3637	\N	Bełczyna
3717	3637	\N	Bystrzyca
3718	3637	\N	Klecza
3719	3637	\N	Łupki
3720	3637	\N	Marczów
3721	3637	\N	Modrzewie
3722	3637	\N	Nielestno
3723	3637	\N	Pilchowice
3724	3637	\N	Przeździedza
3725	3637	\N	Radomice
3726	3637	\N	Strzyżowiec
3727	3637	\N	Tarczyn
3728	274	\N	Cieszków
3729	274	\N	Krośnice
3730	274	\N	Milicz
3731	3728	\N	Antonin
3732	3728	\N	Biadaszka
3733	3728	\N	Brzezina
3734	3728	\N	Cieszków
3735	3728	\N	Dziadkowo
3736	3728	\N	Góry
3737	3728	\N	Grzebielin
3738	3728	\N	Guzowice
3739	3728	\N	Jankowa
3740	3728	\N	Jawor
3741	3728	\N	Konradówko
3742	3728	\N	Nowy Folwark
3743	3728	\N	Pakosławsko
3744	3728	\N	Pustków
3745	3728	\N	Rakłowice
3746	3728	\N	Sędraszyce
3747	3728	\N	Siemianów
3748	3728	\N	Słabocin
3749	3728	\N	Trzebicko
3750	3728	\N	Trzebicko Dolne
3751	3728	\N	Ujazd
3752	3728	\N	Wężowice
3753	3728	\N	Zabornia
3754	3728	\N	Zagajniki
3755	3729	\N	Brzostowo
3756	3729	\N	Bukowice
3757	3729	\N	Czarnogoździce
3758	3729	\N	Czeszyce
3759	3729	\N	Dąbrowa
3760	3729	\N	Dziewiętlin
3761	3729	\N	Grabownica
3762	3729	\N	Kotlarka
3763	3729	\N	Krośnice
3764	3729	\N	Kuźnica Czeszycka
3765	3729	\N	Lędzina
3766	3729	\N	Luboradów
3767	3729	\N	Łazy Wielkie
3768	3729	\N	Pierstnica
3769	3729	\N	Police
3770	3729	\N	Smolak
3771	3729	\N	Stara Huta
3772	3729	\N	Suliradzice
3773	3729	\N	Świebodów
3774	3729	\N	Wąbnice
3775	3729	\N	Wierzchowice
3776	3729	\N	Wolanka
3777	3729	\N	Żeleźniki
3778	3730	\N	Milicz
3779	3730	\N	Baranowice
3780	3730	\N	Bartniki
3781	3730	\N	Borzynowo
3782	3730	\N	Brzezina Sułowska
3783	3730	\N	Czatkowice
3784	3730	\N	Duchowo
3785	3730	\N	Dunkowa
3786	3730	\N	Dyminy
3787	3730	\N	Dzierzgów
3788	3730	\N	Gajdówka
3789	3730	\N	Gądkowice
3790	3730	\N	Godnowa
3791	3730	\N	Gogołowice
3792	3730	\N	Górale
3793	3730	\N	Grabownica
3794	3730	\N	Grabówka
3795	3730	\N	Gruszeczka
3796	3730	\N	Henrykowice
3797	3730	\N	Joachimówka
3798	3730	\N	Kaszowo
3799	3730	\N	Kolęda
3800	3730	\N	Kopice
3801	3730	\N	Kozuby
3802	3730	\N	Lasowice
3803	3730	\N	Latkowa
3804	3730	\N	Lisów
3805	3730	\N	Łąki
3806	3730	\N	Marchwice
3807	3730	\N	Miłochowice
3808	3730	\N	Miłosławice
3809	3730	\N	Młodzianów
3810	3730	\N	Niesułowice
3811	3730	\N	Nowe Grodzisko
3812	3730	\N	Nowy Zamek
3813	3730	\N	Olsza
3814	3730	\N	Ostrowąsy
3815	3730	\N	Piękocin
3816	3730	\N	Piękocinek
3817	3730	\N	Piotrkosice
3818	3730	\N	Płonka
3819	3730	\N	Poradów
3820	3730	\N	Postolin
3821	3730	\N	Potasznia
3822	3730	\N	Pracze
3823	3730	\N	Ruda Milicka
3824	3730	\N	Ruda Sułowska
3825	3730	\N	Sławoszowice
3826	3730	\N	Słączno
3827	3730	\N	Smielice
3828	3730	\N	Stawiec
3829	3730	\N	Stawno
3830	3730	\N	Sulimierz
3831	3730	\N	Sułów
3832	3730	\N	Świętoszyn
3833	3730	\N	Tomaszków
3834	3730	\N	Tworzymirki
3835	3730	\N	Tworzymirki Górne
3836	3730	\N	Wałkowa
3837	3730	\N	Węgrzynów
3838	3730	\N	Wielgie Milickie
3839	3730	\N	Wilkowo
3840	3730	\N	Wodników Górny
3841	3730	\N	Wrocławice
3842	3730	\N	Wróbliniec
3843	3730	\N	Wszewilki
3844	3730	\N	Wziąchowo Małe
3845	3730	\N	Wziąchowo Wielkie
3846	3730	\N	Zamek Myśliwski
3847	275	\N	Oleśnica
3848	275	\N	Bierutów
3849	275	\N	Dobroszyce
3850	275	\N	Dziadowa Kłoda
3851	275	\N	Międzybórz
3852	275	\N	Syców
3853	275	\N	Twardogóra
3854	3847	\N	Oleśnica
3855	3848	\N	Bierutów
3856	3848	\N	Gorzesław
3857	3848	\N	Jemielna
3858	3848	\N	Karwiniec
3859	3848	\N	Kijowice
3860	3848	\N	Kruszowice
3861	3848	\N	Paczków
3862	3848	\N	Posadowice
3863	3848	\N	Radzieszyn
3864	3848	\N	Sątok
3865	3848	\N	Solniki Małe
3866	3848	\N	Solniki Wielkie
3867	3848	\N	Stronia
3868	3848	\N	Strzałkowa
3869	3848	\N	Wabienice
3870	3848	\N	Zawidowice
3871	3848	\N	Zbytowa
3872	3849	\N	Bartków
3873	3849	\N	Białe Błoto
3874	3849	\N	Czartowice
3875	3849	\N	Dobra
3876	3849	\N	Dobroszyce
3877	3849	\N	Dobrzeń
3878	3849	\N	Łuczyna
3879	3849	\N	Malerzów
3880	3849	\N	Mękarzowice
3881	3849	\N	Miodary
3882	3849	\N	Nowica
3883	3849	\N	Nowosiedlice
3884	3849	\N	Rakowice
3885	3849	\N	Sadków
3886	3849	\N	Siekierowice
3887	3849	\N	Strzelce
3888	3850	\N	Dalborowice
3889	3850	\N	Dziadowa Kłoda
3890	3850	\N	Dziadów Most
3891	3850	\N	Gołębice
3892	3850	\N	Gronowice
3893	3850	\N	Lipka
3894	3850	\N	Miłowice
3895	3850	\N	Radzowice
3896	3850	\N	Stradomia Dolna
3897	3851	\N	Międzybórz
3898	3851	\N	Bąków
3899	3851	\N	Bukowina Sycowska
3900	3851	\N	Dziesławice
3901	3851	\N	Hałdrychowice
3902	3851	\N	Kamień
3903	3851	\N	Klonów
3904	3851	\N	Kraszów
3905	3851	\N	Królewska Wola
3906	3851	\N	Ligota Rybińska
3907	3851	\N	Niwki Kraszowskie
3908	3851	\N	Niwki Książęce
3909	3851	\N	Ose
3910	3851	\N	Oska Piła
3911	3847	\N	Blizbórz
3912	3847	\N	Bogusławice
3913	3847	\N	Boguszyce
3914	3847	\N	Brzezinka
3915	3847	\N	Brzezinka Dolna
3916	3847	\N	Bystre
3917	3847	\N	Cieśle
3918	3847	\N	Dąbrowa
3919	3847	\N	Gręboszyce
3920	3847	\N	Jenkowice
3921	3847	\N	Krzeczyn
3922	3847	\N	Ligota Mała
3923	3847	\N	Ligota Polska
3924	3847	\N	Ligota Wielka
3925	3847	\N	Nieciszów
3926	3847	\N	Nowa Ligota
3927	3847	\N	Nowoszyce
3928	3847	\N	Osada Leśna
3929	3847	\N	Ostrowina
3930	3847	\N	Piszkawa
3931	3847	\N	Poniatowice
3932	3847	\N	Smardzów
3933	3847	\N	Smolna
3934	3847	\N	Sokołowice
3935	3847	\N	Spalice
3936	3847	\N	Świerzna
3937	3847	\N	Wszechświęte
3938	3847	\N	Wyszogród
3939	3847	\N	Zarzysko
3940	3847	\N	Zimnica
3941	3852	\N	Syców
3942	3852	\N	Biskupice
3943	3852	\N	Drołtowice
3944	3852	\N	Działosza
3945	3852	\N	Gaszowice
3946	3852	\N	Komorów
3947	3852	\N	Nowy Dwór
3948	3852	\N	Stradomia Wierzchnia
3949	3852	\N	Szczodrów
3950	3852	\N	Ślizów
3951	3852	\N	Wielowieś
3952	3852	\N	Wioska
3953	3852	\N	Zawada
3954	3853	\N	Twardogóra
3955	3853	\N	Brodowce
3956	3853	\N	Bukowinka
3957	3853	\N	Chełstów
3958	3853	\N	Chełstówek
3959	3853	\N	Domasławice
3960	3853	\N	Drągów
3961	3853	\N	Drogoszowice
3962	3853	\N	Droździęcin
3963	3853	\N	Gola Wielka
3964	3853	\N	Goszcz
3965	3853	\N	Grabowno Małe
3966	3853	\N	Grabowno Wielkie
3967	3853	\N	Łazisko
3968	3853	\N	Moszyce
3969	3853	\N	Nowa Wieś Goszczańska
3970	3853	\N	Olszówka
3971	3853	\N	Sądrożyce
3972	3853	\N	Sosnówka
3973	276	\N	Oława
3974	276	\N	Domaniów
3975	276	\N	Jelcz-Laskowice
3976	3973	\N	Oława
3977	3974	\N	Brzezimierz
3978	3974	\N	Chwastnica
3979	3974	\N	Danielowice
3980	3974	\N	Domaniów
3981	3974	\N	Gęsice
3982	3974	\N	Gostkowice
3983	3974	\N	Goszczyna
3984	3974	\N	Grodziszowice
3985	3974	\N	Janków
3986	3974	\N	Kończyce
3987	3974	\N	Kuchary
3988	3974	\N	Kuny
3989	3974	\N	Kurzątkowice
3990	3974	\N	Pełczyce
3991	3974	\N	Piskorzów
3992	3974	\N	Piskorzówek
3993	3974	\N	Polwica
3994	3974	\N	Radłowice
3995	3974	\N	Radoszkowice
3996	3974	\N	Skrzypnik
3997	3974	\N	Swojków
3998	3974	\N	Teodorów
3999	3974	\N	Wierzbno
4000	3974	\N	Wyszkowice
4001	3975	\N	Jelcz-Laskowice
4002	3975	\N	Biskupice Oławskie
4003	3975	\N	Brzezinki
4004	3975	\N	Chwałowice
4005	3975	\N	Dębina
4006	3975	\N	Dziuplina
4007	3975	\N	Grędzina
4008	3975	\N	Kopalina
4009	3975	\N	Łęg
4010	3975	\N	Miłocice
4011	3975	\N	Miłocice Małe
4012	3975	\N	Miłoszyce
4013	3975	\N	Minkowice Oławskie
4014	3975	\N	Mościsko
4015	3975	\N	Nowy Dwór
4016	3975	\N	Piekary
4017	3975	\N	Stanków
4018	3975	\N	Wójcice
4019	3973	\N	Bolechów
4020	3973	\N	Bystrzyca
4021	3973	\N	Chwalibożyce
4022	3973	\N	Drzemlikowice
4023	3973	\N	Gać
4024	3973	\N	Gaj Oławski
4025	3973	\N	Godzikowice
4026	3973	\N	Godzinowice
4027	3973	\N	Jaczkowice
4028	3973	\N	Jakubowice
4029	3973	\N	Janików
4030	3973	\N	Jankowice
4031	3973	\N	Jankowice Małe
4032	3973	\N	Lizawice
4033	3973	\N	Marcinkowice
4034	3973	\N	Marszowice
4035	3973	\N	Maszków
4036	3973	\N	Miłonów
4037	3973	\N	Niemil
4038	3973	\N	Niwnik
4039	3973	\N	Oleśnica Mała
4040	3973	\N	Osiek
4041	3973	\N	Owczary
4042	3973	\N	Psary
4043	3973	\N	Siecieborowice
4044	3973	\N	Siedlce
4045	3973	\N	Sobocisko
4046	3973	\N	Stanowice
4047	3973	\N	Stary Górnik
4048	3973	\N	Stary Otok
4049	3973	\N	Ścinawa
4050	3973	\N	Ścinawa Polska
4051	3973	\N	Zabardowice
4052	3973	\N	Zakrzów
4053	277	\N	Chocianów
4054	277	\N	Gaworzyce
4055	277	\N	Grębocice
4056	277	\N	Polkowice
4057	277	\N	Przemków
4058	277	\N	Radwanice
4059	4053	\N	Chocianów
4060	4053	\N	Brunów
4061	4053	\N	Chocianowiec
4062	4053	\N	Jabłonów
4063	4053	\N	Kąty
4064	4053	\N	Michałów
4065	4053	\N	Ogrodzisko
4066	4053	\N	Parchów
4067	4053	\N	Pogorzeliska
4068	4053	\N	Raków
4069	4053	\N	Szklary Dolne
4070	4053	\N	Trzebnice
4071	4053	\N	Trzmielów
4072	4053	\N	Żabice
4073	4054	\N	Dalków
4074	4054	\N	Dzików
4075	4054	\N	Gaworzyce
4076	4054	\N	Gostyń
4077	4054	\N	Grabik
4078	4054	\N	Kłobuczyn
4079	4054	\N	Korytów
4080	4054	\N	Koźlice
4081	4054	\N	Kurów Wielki
4082	4054	\N	Mieszków
4083	4054	\N	Śrem
4084	4054	\N	Wierzchowice
4085	4054	\N	Witanowice
4086	4055	\N	Bucze
4087	4055	\N	Czerńczyce
4088	4055	\N	Duża Wólka
4089	4055	\N	Grębocice
4090	4055	\N	Grodowiec
4091	4055	\N	Grodziszcze
4092	4055	\N	Krzydłowice
4093	4055	\N	Kwielice
4094	4055	\N	Kwieliczki
4095	4055	\N	Obiszów
4096	4055	\N	Obiszówek
4097	4055	\N	Ogorzelec
4098	4055	\N	Proszówek
4099	4055	\N	Proszyce
4100	4055	\N	Retków
4101	4055	\N	Rzeczyca
4102	4055	\N	Stara Rzeka
4103	4055	\N	Szymocin
4104	4055	\N	Świnino
4105	4055	\N	Trzęsów
4106	4055	\N	Wilczyn
4107	4055	\N	Żabice
4108	4056	\N	Polkowice
4109	4056	\N	Barszów
4110	4056	\N	Biedrzychowa
4111	4056	\N	Dąbrowa
4112	4056	\N	Guzice
4113	4056	\N	Jędrzychów
4114	4056	\N	Kaźmierzów
4115	4056	\N	Komorniki
4116	4056	\N	Moskorzyn
4117	4056	\N	Nowa Wieś Lubińska
4118	4056	\N	Nowinki
4119	4056	\N	Paulinów
4120	4056	\N	Pieszkowice
4121	4056	\N	Sobin
4122	4056	\N	Sucha Górna
4123	4056	\N	Tarnówek
4124	4056	\N	Trzebcz
4125	4056	\N	Włoszczów
4126	4056	\N	Żelazny Most
4127	4056	\N	Żuków
4128	4057	\N	Przemków
4129	4057	\N	Jakubowo Lubińskie
4130	4057	\N	Jędrzychówek
4131	4057	\N	Karpie
4132	4057	\N	Krępa
4133	4057	\N	Łężce
4134	4057	\N	Ostaszów
4135	4057	\N	Piotrowice
4136	4057	\N	Szklarki
4137	4057	\N	Wilkocin
4138	4057	\N	Wysoka
4139	4058	\N	Buczyna
4140	4058	\N	Drożów
4141	4058	\N	Drożyna
4142	4058	\N	Jakubów
4143	4058	\N	Kłębanowice
4144	4058	\N	Lipin
4145	4058	\N	Łagoszów Wielki
4146	4058	\N	Nowa Kuźnia
4147	4058	\N	Nowy Dwór
4148	4058	\N	Przesieczna
4149	4058	\N	Radwanice
4150	4058	\N	Sieroszowice
4151	4058	\N	Strogoborzyce
4152	278	\N	Borów
4153	278	\N	Kondratowice
4154	278	\N	Przeworno
4155	278	\N	Strzelin
4156	278	\N	Wiązów
4157	4152	\N	Bartoszowa
4158	4152	\N	Boguszyce
4159	4152	\N	Boreczek
4160	4152	\N	Borek Strzeliński
4161	4152	\N	Borów
4162	4152	\N	Brzezica
4163	4152	\N	Brzoza
4164	4152	\N	Głownin
4165	4152	\N	Jaksin
4166	4152	\N	Jelenin
4167	4152	\N	Kazimierzów
4168	4152	\N	Kępino
4169	4152	\N	Kojęcin
4170	4152	\N	Kręczków
4171	4152	\N	Kurczów
4172	4152	\N	Ludów Śląski
4173	4152	\N	Mańczyce
4174	4152	\N	Michałowice
4175	4152	\N	Opatowice
4176	4152	\N	Piotrków Borowski
4177	4152	\N	Rochowice
4178	4152	\N	Siemianów
4179	4152	\N	Stogi
4180	4152	\N	Suchowice
4181	4152	\N	Świnobród
4182	4152	\N	Zielenice
4183	4153	\N	Białobrzezie
4184	4153	\N	Błotnica
4185	4153	\N	Brochocinek
4186	4153	\N	Czerwieniec
4187	4153	\N	Edwardów
4188	4153	\N	Gołostowice
4189	4153	\N	Górka Sobocka
4190	4153	\N	Grzegorzów
4191	4153	\N	Janowiczki
4192	4153	\N	Karczyn
4193	4153	\N	Komorowice
4194	4153	\N	Kondratowice
4195	4153	\N	Kowalskie
4196	4153	\N	Księginice Wielkie
4197	4153	\N	Lipowa
4198	4153	\N	Maleszów
4199	4153	\N	Podgaj
4200	4153	\N	Prusy
4201	4153	\N	Stachów
4202	4153	\N	Strachów
4203	4153	\N	Zarzyca
4204	4153	\N	Żelowice
4205	4154	\N	Cierpice
4206	4154	\N	Dąbkowice
4207	4154	\N	Dobroszów
4208	4154	\N	Dzierzkowa
4209	4154	\N	Jagielnica
4210	4154	\N	Jagielno
4211	4154	\N	Jegłowa
4212	4154	\N	Kaczowice
4213	4154	\N	Karnków
4214	4154	\N	Kaszówka
4215	4154	\N	Konary
4216	4154	\N	Krzywina
4217	4154	\N	Miłocice
4218	4154	\N	Mników
4219	4154	\N	Ostrężna
4220	4154	\N	Przeworno
4221	4154	\N	Romanów
4222	4154	\N	Rożnów
4223	4154	\N	Samborowice
4224	4154	\N	Samborowiczki
4225	4154	\N	Sarby
4226	4154	\N	Strużyna
4227	4154	\N	Wieliczna
4228	4155	\N	Strzelin
4229	4155	\N	Biały Kościół
4230	4155	\N	Biedrzychów
4231	4155	\N	Bierzyn
4232	4155	\N	Brożec
4233	4155	\N	Chociwel
4234	4155	\N	Częszyce
4235	4155	\N	Dankowice
4236	4155	\N	Dębniki
4237	4155	\N	Dobrogoszcz
4238	4155	\N	Gębczyce
4239	4155	\N	Gębice
4240	4155	\N	Gęsiniec
4241	4155	\N	Głęboka
4242	4155	\N	Gościęcice
4243	4155	\N	Górzec
4244	4155	\N	Karszów
4245	4155	\N	Karszówek
4246	4155	\N	Kazanów
4247	4155	\N	Krzepice
4248	4155	\N	Kuropatnik
4249	4155	\N	Ludów Polski
4250	4155	\N	Mikoszów
4251	4155	\N	Muchowiec
4252	4155	\N	Nieszkowice
4253	4155	\N	Nowolesie
4254	4155	\N	Pęcz
4255	4155	\N	Piotrowice
4256	4155	\N	Pławna
4257	4155	\N	Skoroszowice
4258	4155	\N	Strzegów
4259	4155	\N	Szczawin
4260	4155	\N	Szczodrowice
4261	4155	\N	Trześnie
4262	4155	\N	Warkocz
4263	4155	\N	Wąwolnica
4264	4155	\N	Żeleźnik
4265	4156	\N	Wiązów
4266	4156	\N	Bryłów
4267	4156	\N	Bryłówek
4268	4156	\N	Częstocice
4269	4156	\N	Gułów
4270	4156	\N	Janowo
4271	4156	\N	Jaworów
4272	4156	\N	Jędrzychowice
4273	4156	\N	Jutrzyna
4274	4156	\N	Kalinowa
4275	4156	\N	Kłosów
4276	4156	\N	Kowalów
4277	4156	\N	Krajno
4278	4156	\N	Księżyce
4279	4156	\N	Kucharzowice
4280	4156	\N	Kurowskie Chałupy
4281	4156	\N	Kurów
4282	4156	\N	Łojowice
4283	4156	\N	Miechowice Oławskie
4284	4156	\N	Ośno
4285	4156	\N	Stary Wiązów
4286	4156	\N	Wawrzęcice
4287	4156	\N	Wawrzyszów
4288	4156	\N	Witowice
4289	4156	\N	Wyszonowice
4290	4156	\N	Zborowice
4291	284	\N	Kostomłoty
4292	284	\N	Malczyce
4293	284	\N	Miękinia
4294	284	\N	Środa Śląska
4295	284	\N	Udanin
4322	285	\N	Świdnica
4323	285	\N	Świebodzice
4324	285	\N	Dobromierz
4325	285	\N	Jaworzyna Śląska
4326	285	\N	Marcinowice
4327	285	\N	Strzegom
4328	285	\N	Żarów
4329	4322	\N	Świdnica
4330	4323	\N	Świebodzice
4331	4324	\N	Borów
4332	4324	\N	Bronów
4333	4324	\N	Bronówek
4334	4324	\N	Celów
4335	4324	\N	Czernica
4336	4324	\N	Dobromierz
4337	4324	\N	Dzierzków
4338	4324	\N	Gniewków
4339	4324	\N	Jaskulin
4340	4324	\N	Jugowa
4341	4324	\N	Kłaczyna
4342	4324	\N	Pietrzyków
4343	4324	\N	Roztoka
4344	4324	\N	Szymanów
4345	4325	\N	Jaworzyna Śląska
4346	4325	\N	Bagieniec
4347	4325	\N	Bolesławice
4348	4325	\N	Czechy
4349	4325	\N	Milikowice
4350	4325	\N	Nowice
4351	4325	\N	Nowy Jaworów
4352	4325	\N	Pasieczna
4353	4325	\N	Pastuchów
4354	4325	\N	Piotrowice Świdnickie
4355	4325	\N	Stary Jaworów
4356	4325	\N	Tomkowa
4357	4325	\N	Witków
4358	4326	\N	Biała
4359	4326	\N	Chwałków
4360	4326	\N	Gola Świdnicka
4361	4326	\N	Gruszów
4362	4326	\N	Kątki
4363	4326	\N	Klecin
4364	4326	\N	Krasków
4365	4326	\N	Marcinowice
4366	4326	\N	Mysłaków
4367	4326	\N	Sady
4368	4326	\N	Stefanowice
4369	4326	\N	Strzelce
4370	4326	\N	Szczepanów
4371	4326	\N	Śmiałowice
4372	4326	\N	Tąpadła
4373	4326	\N	Tworzyjanów
4374	4326	\N	Wirki
4375	4326	\N	Wiry
4376	4326	\N	Zebrzydów
4377	4327	\N	Strzegom
4378	4327	\N	Bartoszówek
4379	4327	\N	Goczałków
4380	4327	\N	Goczałków Górny
4381	4327	\N	Godzieszówek
4382	4327	\N	Granica
4383	4327	\N	Graniczna
4384	4327	\N	Grochotów
4385	4327	\N	Jaroszów
4386	4327	\N	Kostrza
4387	4327	\N	Międzyrzecze
4388	4327	\N	Modlęcin
4389	4327	\N	Morawa
4390	4327	\N	Olszany
4391	4327	\N	Rogoźnica
4392	4327	\N	Rusko
4393	4327	\N	Skarżyce
4394	4327	\N	Stanowice
4395	4327	\N	Stawiska
4396	4327	\N	Tomkowice
4397	4327	\N	Wieśnica
4398	4327	\N	Żelazów
4399	4327	\N	Żółkiewka
4400	4322	\N	Bojanice
4401	4322	\N	Boleścin
4402	4322	\N	Burkatów
4403	4322	\N	Bystrzyca Dolna
4404	4322	\N	Bystrzyca Górna
4405	4322	\N	Gogołów
4406	4322	\N	Grodziszcze
4407	4322	\N	Jagodnik
4408	4322	\N	Jakubów
4409	4322	\N	Komorów
4410	4322	\N	Krzczonów
4411	4322	\N	Krzyżowa
4412	4322	\N	Lubachów
4413	4322	\N	Lutomia Dolna
4414	4322	\N	Lutomia Górna
4415	4322	\N	Makowice
4416	4322	\N	Miłochów
4417	4322	\N	Modliszów
4418	4322	\N	Mokrzeszów
4419	4322	\N	Niegoszów
4420	4322	\N	Opoczka
4421	4322	\N	Panków
4422	4322	\N	Pogorzała
4423	4322	\N	Pszenno
4424	4322	\N	Słotwina
4425	4322	\N	Stachowice
4426	4322	\N	Sulisławice
4427	4322	\N	Wieruszów
4428	4322	\N	Wilków
4429	4322	\N	Wiśniowa
4430	4322	\N	Witoszów Dolny
4431	4322	\N	Witoszów Górny
4432	4322	\N	Zawiszów
4433	4322	\N	Złoty Las
4434	4328	\N	Żarów
4435	4328	\N	Bożanów
4436	4328	\N	Buków
4437	4328	\N	Gołaszyce
4438	4328	\N	Imbramowice
4439	4328	\N	Kalno
4440	4328	\N	Kruków
4441	4328	\N	Łażany
4442	4328	\N	Marcinowiczki
4443	4328	\N	Mielęcin
4444	4328	\N	Mikoszowa
4445	4328	\N	Mrowiny
4446	4328	\N	Pożarzysko
4447	4328	\N	Przyłęgów
4448	4328	\N	Pyszczyn
4449	4328	\N	Siedlimowice
4450	4328	\N	Tarnawa
4451	4328	\N	Wierzbna
4452	4328	\N	Zastruże
4453	280	\N	Oborniki Śląskie
4454	280	\N	Prusice
4455	280	\N	Trzebnica
4456	280	\N	Wisznia Mała
4457	280	\N	Zawonia
4458	280	\N	Żmigród
4459	4453	\N	Oborniki Śląskie
4460	4453	\N	Bagno
4461	4453	\N	Borkowice
4462	4453	\N	Golędzinów
4463	4453	\N	Jary
4464	4453	\N	Kotowice
4465	4453	\N	Kowale
4466	4453	\N	Kuraszków
4467	4453	\N	Lubnów
4468	4453	\N	Morzęcin Mały
4469	4453	\N	Morzęcin Wielki
4470	4453	\N	Osola
4471	4453	\N	Osolin
4472	4453	\N	Paniowice
4473	4453	\N	Pęgów
4474	4453	\N	Piekary
4475	4453	\N	Przecławice
4476	4453	\N	Raków
4477	4453	\N	Rościsławice
4478	4453	\N	Siemianice
4479	4453	\N	Uraz
4480	4453	\N	Wielka Lipa
4481	4453	\N	Wilczyn
4482	4453	\N	Zajączków
4483	4454	\N	Prusice
4484	4454	\N	Borów
4485	4454	\N	Borówek
4486	4454	\N	Brzeźno
4487	4454	\N	Budzicz
4488	4454	\N	Chodlewko
4489	4454	\N	Dębnica
4490	4454	\N	Gola
4491	4454	\N	Górowo
4492	4454	\N	Jagoszyce
4493	4454	\N	Kaszyce Wielkie
4494	4454	\N	Kopaszyn
4495	4454	\N	Kosinowo
4496	4454	\N	Krościna Mała
4497	4454	\N	Krościna Wielka
4498	4454	\N	Ligota Strupińska
4499	4454	\N	Ligotka
4500	4454	\N	Pawłów Trzebnicki
4501	4454	\N	Pększyn
4502	4454	\N	Pietrowice Małe
4503	4454	\N	Piotrkowice
4504	4454	\N	Raszowice
4505	4454	\N	Skokowa
4506	4454	\N	Strupina
4507	4454	\N	Świerzów
4508	4454	\N	Wilkowa
4509	4454	\N	Wszemirów
4510	4454	\N	Zakrzewo
4511	4455	\N	Trzebnica
4512	4455	\N	Będkowo
4513	4455	\N	Biedaszków Mały
4514	4455	\N	Biedaszków Wielki
4515	4455	\N	Blizocin
4516	4455	\N	Boleścin
4517	4455	\N	Brochocin
4518	4455	\N	Brzezie
4519	4455	\N	Brzyków
4520	4455	\N	Cerekwica
4521	4455	\N	Domanowice
4522	4455	\N	Droszów
4523	4455	\N	Głuchów Górny
4524	4455	\N	Janiszów
4525	4455	\N	Jaszyce
4526	4455	\N	Jaźwiny
4527	4455	\N	Kobylice
4528	4455	\N	Koczurki
4529	4455	\N	Komorowo
4530	4455	\N	Komorówko
4531	4455	\N	Koniowo
4532	4455	\N	Księginice
4533	4455	\N	Kuźniczysko
4534	4455	\N	Ligota
4535	4455	\N	Malczów
4536	4455	\N	Małuszyn
4537	4455	\N	Marcinowo
4538	4455	\N	Masłowiec
4539	4455	\N	Masłów
4540	4455	\N	Nowy Dwór
4541	4455	\N	Piersno
4542	4455	\N	Raszów
4543	4455	\N	Rzepotowice
4544	4455	\N	Skarszyn
4545	4455	\N	Skoroszów
4546	4455	\N	Sulisławice
4547	4455	\N	Szczytkowice
4548	4455	\N	Świątniki
4549	4455	\N	Taczów Mały
4550	4455	\N	Taczów Wielki
4551	4455	\N	Ujeździec Mały
4552	4455	\N	Ujeździec Wielki
4553	4455	\N	Węgrzynów
4554	4456	\N	Biskupice
4555	4456	\N	Cienin
4556	4456	\N	Kryniczno
4557	4456	\N	Krzyżanowice
4558	4456	\N	Ligota Piękna
4559	4456	\N	Machnice
4560	4456	\N	Malin
4561	4456	\N	Mienice
4562	4456	\N	Ozorowice
4563	4456	\N	Pierwoszów
4564	4456	\N	Piotrkowiczki
4565	4456	\N	Psary
4566	4456	\N	Raków
4567	4456	\N	Rogoż
4568	4456	\N	Strzeszów
4569	4456	\N	Szewce
4570	4456	\N	Szymanów
4571	4456	\N	Wisznia Mała
4572	4456	\N	Wysoki Kościół
4573	4457	\N	Budczyce
4574	4457	\N	Cielętniki
4575	4457	\N	Czachowo
4576	4457	\N	Czeszów
4577	4457	\N	Głuchów Dolny
4578	4457	\N	Grochowa
4579	4457	\N	Kałowice
4580	4457	\N	Ludgierzowice
4581	4457	\N	Lusina Górna
4582	4457	\N	Miłonowice
4583	4457	\N	Niedary
4584	4457	\N	Pęciszów
4585	4457	\N	Pomianowice
4586	4457	\N	Prawocice
4587	4457	\N	Pstrzejowice
4588	4457	\N	Radłów
4589	4457	\N	Rzędziszowice
4590	4457	\N	Sędzice
4591	4457	\N	Skotniki
4592	4457	\N	Stanięcice
4593	4457	\N	Sucha Wielka
4594	4457	\N	Tarnowiec
4595	4457	\N	Trzęsowice
4596	4457	\N	Zawonia
4597	4457	\N	Złotów
4598	4457	\N	Złotówek
4599	4458	\N	Żmigród
4600	4458	\N	Barkowo
4601	4458	\N	Borek
4602	4458	\N	Borzęcin
4603	4458	\N	Bukołowo
4604	4458	\N	Bychowo
4605	4458	\N	Chodlewo
4606	4458	\N	Dębno
4607	4458	\N	Dobrosławice
4608	4458	\N	Garbce
4609	4458	\N	Gatka
4610	4458	\N	Gola
4611	4458	\N	Góreczki
4612	4458	\N	Grądzik
4613	4458	\N	Jamnik
4614	4458	\N	Kanclerzowice
4615	4458	\N	Karnice
4616	4458	\N	Kaszyce Milickie
4617	4458	\N	Kędzie
4618	4458	\N	Kliszkowice
4619	4458	\N	Kliszkowice Małe
4620	4458	\N	Korzeńsko
4621	4458	\N	Książęca Wieś
4622	4458	\N	Laskowa
4623	4458	\N	Łabuzki
4624	4458	\N	Łapczyce
4625	4458	\N	Morzęcino
4626	4458	\N	Niezgoda
4627	4458	\N	Nowe Domy
4628	4458	\N	Nowik
4629	4458	\N	Osiek
4630	4458	\N	Powidzko
4631	4458	\N	Przedkowice
4632	4458	\N	Przywsie
4633	4458	\N	Radziądz
4634	4458	\N	Rogożowa
4635	4458	\N	Ruda Żmigrodzka
4636	4458	\N	Sanie
4637	4458	\N	Sieczków
4638	4458	\N	Stróże
4639	4458	\N	Szarlotka
4640	4458	\N	Szarzyna
4641	4458	\N	Węglewo
4642	4458	\N	Żmigródek
4643	288	\N	Boguszów-Gorce
4644	288	\N	Jedlina-Zdrój
4645	288	\N	Szczawno-Zdrój
4646	288	\N	Wałbrzych
4647	288	\N	Czarny Bór
4648	288	\N	Głuszyca
4649	288	\N	Mieroszów
4650	288	\N	Stare Bogaczowice
4651	288	\N	Walim
4652	4643	\N	Boguszów-Gorce
4653	4644	\N	Jedlina-Zdrój
4654	4645	\N	Szczawno-Zdrój
4655	4646	\N	Wałbrzych
4656	4647	\N	Borówno
4657	4647	\N	Czarny Bór
4658	4647	\N	Grzędy
4659	4647	\N	Grzędy Górne
4660	4647	\N	Jaczków
4661	4647	\N	Witków
4662	4648	\N	Głuszyca
4663	4648	\N	Głuszyca Górna
4664	4648	\N	Grzmiąca
4665	4648	\N	Kolce
4666	4648	\N	Łomnica
4667	4648	\N	Sierpnica
4668	4649	\N	Mieroszów
4669	4649	\N	Golińsk
4670	4649	\N	Kowalowa
4671	4649	\N	Łączna
4672	4649	\N	Nowe Siodło
4673	4649	\N	Różana
4674	4649	\N	Rybnica Leśna
4675	4649	\N	Sokołowsko
4676	4649	\N	Unisław Śląski
4677	4650	\N	Chwaliszów
4678	4650	\N	Cieszów
4679	4650	\N	Gostków
4680	4650	\N	Jabłów
4681	4650	\N	Lubomin
4682	4650	\N	Nowe Bogaczowice
4683	4650	\N	Stare Bogaczowice
4684	4650	\N	Struga
4685	4651	\N	Dziećmorowice
4686	4651	\N	Glinno
4687	4651	\N	Jugowice
4688	4651	\N	Michałkowa
4689	4651	\N	Niedźwiedzica
4690	4651	\N	Olszyniec
4691	4651	\N	Rzeczka
4692	4651	\N	Walim
4693	4651	\N	Zagórze Śląskie
4694	286	\N	Brzeg Dolny
4695	286	\N	Wińsko
4696	286	\N	Wołów
4697	4694	\N	Brzeg Dolny
4698	4694	\N	Bukowice
4699	4694	\N	Godzięcin
4700	4694	\N	Grodzanów
4701	4694	\N	Jodłowice
4702	4694	\N	Naborów
4703	4694	\N	Pogalewo Małe
4704	4694	\N	Pogalewo Wielkie
4705	4694	\N	Pysząca
4706	4694	\N	Radecz
4707	4694	\N	Stary Dwór
4708	4694	\N	Wały
4709	4694	\N	Żerków
4710	4694	\N	Żerkówek
4711	4695	\N	Aleksandrowice
4712	4695	\N	Baszyn
4713	4695	\N	Białawy Małe
4714	4695	\N	Białawy Wielkie
4715	4695	\N	Białków
4716	4695	\N	Boraszyce Małe
4717	4695	\N	Boraszyce Wielkie
4718	4695	\N	Brzózka
4719	4695	\N	Budków
4720	4695	\N	Buszkowice Małe
4721	4695	\N	Chwałkowice
4722	4695	\N	Dąbie
4723	4695	\N	Domanice
4724	4695	\N	Głębowice
4725	4695	\N	Gryżyce
4726	4695	\N	Grzeszyn
4727	4695	\N	Iwno
4728	4695	\N	Jakubikowice
4729	4695	\N	Kleszczowice
4730	4695	\N	Konary
4731	4695	\N	Kozowo
4732	4695	\N	Krzelów
4733	4695	\N	Łazy
4734	4695	\N	Małowice
4735	4695	\N	Moczydlnica Klasztorna
4736	4695	\N	Morzyna
4737	4695	\N	Orzeszków
4738	4695	\N	Piskorzyna
4739	4695	\N	Przyborów
4740	4695	\N	Rajczyn
4741	4695	\N	Rogów Wołowski
4742	4695	\N	Rudawa
4743	4695	\N	Słup
4744	4695	\N	Smogorzówek
4745	4695	\N	Smogorzów Wielki
4746	4695	\N	Staszowice
4747	4695	\N	Stryjno
4748	4695	\N	Trzcinica Wołowska
4749	4695	\N	Turzany
4750	4695	\N	Węgrzce
4751	4695	\N	Wińsko
4752	4695	\N	Wrzeszów
4753	4695	\N	Wyszęcice
4754	4696	\N	Wołów
4755	4696	\N	Boraszyn
4756	4696	\N	Bożeń
4757	4696	\N	Dębno
4758	4696	\N	Domaszków
4759	4696	\N	Garwół
4760	4696	\N	Gliniany
4761	4696	\N	Golina
4762	4696	\N	Gródek
4763	4696	\N	Krzydlina Mała
4764	4696	\N	Krzydlina Wielka
4765	4696	\N	Lipnica
4766	4696	\N	Lubiąż
4767	4696	\N	Łazarzowice
4768	4696	\N	Łososiowice
4769	4696	\N	Mikorzyce
4770	4696	\N	Miłcz
4771	4696	\N	Moczydlnica Dworska
4772	4696	\N	Mojęcice
4773	4696	\N	Nieszkowice
4774	4696	\N	Pawłoszewo
4775	4696	\N	Pełczyn
4776	4696	\N	Pierusza
4777	4696	\N	Piotroniowice
4778	4696	\N	Prawików
4779	4696	\N	Proszkowa
4780	4696	\N	Rataje
4781	4696	\N	Rudno
4782	4696	\N	Siodłkowice
4783	4696	\N	Sławowice
4784	4696	\N	Stary Wołów
4785	4696	\N	Stęszów
4786	4696	\N	Stobno
4787	4696	\N	Straszowice
4788	4696	\N	Straża
4789	4696	\N	Tarchalice
4790	4696	\N	Uskorz Mały
4791	4696	\N	Uskorz Wielki
4792	4696	\N	Warzęgowo
4793	4696	\N	Wróblewo
4794	4696	\N	Wrzosy
4795	4696	\N	Zagórzyce
4796	290	\N	Czernica
4797	290	\N	Długołęka
4798	290	\N	Jordanów Śląski
4799	290	\N	Kąty Wrocławskie
4800	290	\N	Kobierzyce
4801	290	\N	Mietków
4802	290	\N	Siechnice
4803	290	\N	Sobótka
4804	290	\N	Święta Katarzyna
4805	290	\N	Żórawina
4806	4796	\N	Chrząstawa Mała
4807	4796	\N	Chrząstawa Wielka
4808	4796	\N	Czernica
4809	4796	\N	Dobrzykowice
4810	4796	\N	Gajków
4811	4796	\N	Jeszkowice
4812	4796	\N	Kamieniec Wrocławski
4813	4796	\N	Krzyków
4814	4796	\N	Łany
4815	4796	\N	Nadolice Małe
4816	4796	\N	Nadolice Wielkie
4817	4796	\N	Ratowice
4818	4796	\N	Wojnowice
4819	4797	\N	Bąków
4820	4797	\N	Bielawa
4821	4797	\N	Bierzyce
4822	4797	\N	Borowa
4823	4797	\N	Brzezia Łąka
4824	4797	\N	Budziwojowice
4825	4797	\N	Bukowina
4826	4797	\N	Byków
4827	4797	\N	Dąbrowica
4828	4797	\N	Długołęka
4829	4797	\N	Dobroszów Oleśnicki
4830	4797	\N	Domaszczyn
4831	4797	\N	Godzieszowa
4832	4797	\N	Jaksonowice
4833	4797	\N	Januszkowice
4834	4797	\N	Kamień
4835	4797	\N	Kątna
4836	4797	\N	Kępa
4837	4797	\N	Kiełczów
4838	4797	\N	Kiełczówek
4839	4797	\N	Krakowiany
4840	4797	\N	Łosice
4841	4797	\N	Łozina
4842	4797	\N	Michałowice
4843	4797	\N	Mirków
4844	4797	\N	Mydlice
4845	4797	\N	Nowy Dwór
4846	4797	\N	Oleśniczka
4847	4797	\N	Pasikurowice
4848	4797	\N	Piecowice
4849	4797	\N	Pietrzykowice
4850	4797	\N	Pruszowice
4851	4797	\N	Raków
4852	4797	\N	Ramiszów
4853	4797	\N	Siedlec
4854	4797	\N	Skała
4855	4797	\N	Stępin
4856	4797	\N	Szczodre
4857	4797	\N	Śliwice
4858	4797	\N	Tokary
4859	4797	\N	Węgrów
4860	4797	\N	Wilczyce
4861	4797	\N	Zaprężyn
4862	4798	\N	Biskupice
4863	4798	\N	Dankowice
4864	4798	\N	Glinica
4865	4798	\N	Janówek
4866	4798	\N	Jezierzyce Wielkie
4867	4798	\N	Jordanów Śląski
4868	4798	\N	Mleczna
4869	4798	\N	Piotrówek
4870	4798	\N	Popowice
4871	4798	\N	Pożarzyce
4872	4798	\N	Tomice
4873	4798	\N	Wilczkowice
4874	4798	\N	Winna Góra
4875	4799	\N	Kąty Wrocławskie
4876	4799	\N	Baranowice
4877	4799	\N	Bogdaszowice
4878	4799	\N	Cesarzowice
4879	4799	\N	Czerńczyce
4880	4799	\N	Gądów
4881	4799	\N	Gniechowice
4882	4799	\N	Gniewoszów
4883	4799	\N	Górzyce
4884	4799	\N	Kamionna
4885	4799	\N	Kębłowice
4886	4799	\N	Kilianów
4887	4799	\N	Kozłów
4888	4799	\N	Krobielowice
4889	4799	\N	Krzeptów
4890	4799	\N	Małkowice
4891	4799	\N	Mokronos Dolny
4892	4799	\N	Mokronos Górny
4893	4799	\N	Nowa Wieś Kącka
4894	4799	\N	Nowa Wieś Wrocławska
4895	4799	\N	Pełcznica
4896	4799	\N	Pietrzykowice
4897	4799	\N	Romnów
4898	4799	\N	Różaniec
4899	4799	\N	Rybnica
4900	4799	\N	Sadków
4901	4799	\N	Sadowice
4902	4799	\N	Samotwór
4903	4799	\N	Skałka
4904	4799	\N	Smolec
4905	4799	\N	Sokolniki
4906	4799	\N	Sośnica
4907	4799	\N	Stary Dwór
4908	4799	\N	Stoszyce
4909	4799	\N	Stradów
4910	4799	\N	Strzeganowice
4911	4799	\N	Szymanów
4912	4799	\N	Wojtkowice
4913	4799	\N	Wszemiłowice
4914	4799	\N	Zabrodzie
4915	4799	\N	Zachowice
4916	4800	\N	Bąki
4917	4800	\N	Bielany Wrocławskie
4918	4800	\N	Biskupice Podgórne
4919	4800	\N	Budziszów
4920	4800	\N	Chrzanów
4921	4800	\N	Cieszyce
4922	4800	\N	Damianowice
4923	4800	\N	Dobkowice
4924	4800	\N	Domasław
4925	4800	\N	Jaszowice
4926	4800	\N	Kobierzyce
4927	4800	\N	Królikowice
4928	4800	\N	Krzyżowice
4929	4800	\N	Księginice
4930	4800	\N	Kuklice
4931	4800	\N	Magnice
4932	4800	\N	Małuszów
4933	4800	\N	Nowiny
4934	4800	\N	Owsianka
4935	4800	\N	Pełczyce
4936	4800	\N	Pustków Wilczkowski
4937	4800	\N	Pustków Żurawski
4938	4800	\N	Racławice Wielkie
4939	4800	\N	Rolantowice
4940	4800	\N	Solna
4941	4800	\N	Szczepankowice
4942	4800	\N	Ślęza
4943	4800	\N	Tyniec Mały
4944	4800	\N	Tyniec nad Ślężą
4945	4800	\N	Wierzbice
4946	4800	\N	Wysoka
4947	4800	\N	Żerniki Małe
4948	4800	\N	Żurawice
4949	4801	\N	Borzygniew
4950	4801	\N	Chwałów
4951	4801	\N	Domanice
4952	4801	\N	Dzikowa
4953	4801	\N	Maniów
4954	4801	\N	Maniów Mały
4955	4801	\N	Maniów Wielki
4956	4801	\N	Mietków
4957	4801	\N	Milin
4958	4801	\N	Piława
4959	4801	\N	Proszkowice
4960	4801	\N	Stróża
4961	4801	\N	Ujów
4962	4801	\N	Wawrzeńczyce
4963	4802	\N	Siechnice
4964	4803	\N	Sobótka
4965	4803	\N	Będkowice
4966	4803	\N	Garncarsko
4967	4803	\N	Kryształowice
4968	4803	\N	Księginice Małe
4969	4803	\N	Kunów
4970	4803	\N	Michałowice
4971	4803	\N	Mirosławice
4972	4803	\N	Nasławice
4973	4803	\N	Okulice
4974	4803	\N	Olbrachtowice
4975	4803	\N	Przezdrowice
4976	4803	\N	Ręków
4977	4803	\N	Rogów Sobócki
4978	4803	\N	Siedlakowice
4979	4803	\N	Stary Zamek
4980	4803	\N	Strachów
4981	4803	\N	Strzegomiany
4982	4803	\N	Sulistrowice
4983	4803	\N	Sulistrowiczki
4984	4803	\N	Świątniki
4985	4803	\N	Wojnarowice
4986	4803	\N	Żerzuszyce
4987	4804	\N	Biestrzyków
4988	4804	\N	Blizanowice
4989	4804	\N	Bogusławice
4990	4804	\N	Durok
4991	4804	\N	Groblice
4992	4804	\N	Grodziszów
4993	4804	\N	Iwiny
4994	4804	\N	Kotowice
4995	4804	\N	Łukaszowice
4996	4804	\N	Mokry Dwór
4997	4804	\N	Ozorzyce
4998	4804	\N	Radomierzyce
4999	4804	\N	Radwanice
5000	4804	\N	Smardzów
5001	4804	\N	Sulęcin
5002	4804	\N	Sulimów
5003	4804	\N	Święta Katarzyna
5004	4804	\N	Trestno
5005	4804	\N	Zacharzyce
5006	4804	\N	Zębice
5007	4804	\N	Żerniki Wrocławskie
5008	4805	\N	Bogunów
5009	4805	\N	Bratowice
5010	4805	\N	Brzeście
5011	4805	\N	Galowice
5012	4805	\N	Jaksonów
5013	4805	\N	Jarosławice
5014	4805	\N	Karwiany
5015	4805	\N	Komorowice
5016	4805	\N	Krajków
5017	4805	\N	Mędłów
5018	4805	\N	Milejowice
5019	4805	\N	Mnichowice
5020	4805	\N	Nowojowice
5021	4805	\N	Nowy Śleszów
5022	4805	\N	Okrzeszyce
5023	4805	\N	Pasterzyce
5024	4805	\N	Polakowice
5025	4805	\N	Przecławice
5026	4805	\N	Racławice Małe
5027	4805	\N	Rynakowice
5028	4805	\N	Rzeplin
5029	4805	\N	Stary Śleszów
5030	4805	\N	Suchy Dwór
5031	4805	\N	Szukalice
5032	4805	\N	Turów
5033	4805	\N	Węgry
5034	4805	\N	Wilczków
5035	4805	\N	Wilkowice
5036	4805	\N	Wojkowice
5037	4805	\N	Zagródki
5038	4805	\N	Żerniki Wielkie
5039	4805	\N	Żórawina
5040	283	\N	Bardo
5041	283	\N	Ciepłowody
5042	283	\N	Kamieniec Ząbkowicki
5043	283	\N	Stoszowice
5044	283	\N	Ząbkowice Śląskie
5045	283	\N	Ziębice
5046	283	\N	Złoty Stok
5047	5040	\N	Bardo
5048	5040	\N	Brzeźnica
5049	5040	\N	Dębowina
5050	5040	\N	Dzbanów
5051	5040	\N	Grochowa
5052	5040	\N	Janowiec
5053	5040	\N	Laskówka
5054	5040	\N	Opolnica
5055	5040	\N	Potworów
5056	5040	\N	Przyłęk
5057	5041	\N	Baldwinowice
5058	5041	\N	Brochocin
5059	5041	\N	Cienkowice
5060	5041	\N	Ciepłowody
5061	5041	\N	Czesławice
5062	5041	\N	Dobrzenice
5063	5041	\N	Jakubów
5064	5041	\N	Janówka
5065	5041	\N	Karczowice
5066	5041	\N	Kobyla Głowa
5067	5041	\N	Koźmice
5068	5041	\N	Muszkowice
5069	5041	\N	Piotrowice Polskie
5070	5041	\N	Stary Henryków
5071	5041	\N	Targowica
5072	5041	\N	Tomice
5073	5041	\N	Wilamowice
5074	5042	\N	Byczeń
5075	5042	\N	Chałupki
5076	5042	\N	Doboszowice
5077	5042	\N	Kamieniec Ząbkowicki
5078	5042	\N	Mrokocin
5079	5042	\N	Ożary
5080	5042	\N	Pilce
5081	5042	\N	Pomianów Górny
5082	5042	\N	Sławęcin
5083	5042	\N	Sosnowa
5084	5042	\N	Starczów
5085	5042	\N	Suszka
5086	5042	\N	Śrem
5087	5042	\N	Topola
5088	5043	\N	Budzów
5089	5043	\N	Grodziszcze
5090	5043	\N	Grodziszcze-Kolonia
5091	5043	\N	Jemna
5092	5043	\N	Lutomierz
5093	5043	\N	Lutomierz-Kolonia
5094	5043	\N	Mikołajów
5095	5043	\N	Przedborowa
5096	5043	\N	Różana
5097	5043	\N	Rudnica
5098	5043	\N	Srebrna Góra
5099	5043	\N	Stoszowice
5100	5043	\N	Stoszowice-Kolonia
5101	5043	\N	Żdanów
5102	5044	\N	Ząbkowice Śląskie
5103	5044	\N	Bobolice
5104	5044	\N	Braszowice
5105	5044	\N	Brodziszów
5106	5044	\N	Grochowiska
5107	5044	\N	Jaworek
5108	5044	\N	Kluczowa
5109	5044	\N	Koziniec
5110	5044	\N	Olbrachcice Wielkie
5111	5044	\N	Pawłowice
5112	5044	\N	Sieroszów
5113	5044	\N	Stolec
5114	5044	\N	Strąkowa
5115	5044	\N	Sulisławice
5116	5044	\N	Szklary
5117	5044	\N	Szklary-Huta
5118	5044	\N	Tarnów
5119	5044	\N	Zwrócona
5120	5045	\N	Ziębice
5121	5045	\N	Biernacice
5122	5045	\N	Bożnowice
5123	5045	\N	Brukalice
5124	5045	\N	Czerńczyce
5125	5045	\N	Dębowiec
5126	5045	\N	Głęboka
5127	5045	\N	Henryków
5128	5045	\N	Jasienica
5129	5045	\N	Jasłówek
5130	5045	\N	Kalinowice Dolne
5131	5045	\N	Kalinowice Górne
5132	5045	\N	Krzelków
5133	5045	\N	Lipa
5134	5045	\N	Lubnów
5135	5045	\N	Niedźwiednik
5136	5045	\N	Niedźwiedź
5137	5045	\N	Nowina
5138	5045	\N	Nowy Dwór
5139	5045	\N	Osina Mała
5140	5045	\N	Osina Wielka
5141	5045	\N	Pomianów Dolny
5142	5045	\N	Raczyce
5143	5045	\N	Rososznica
5144	5045	\N	Skalice
5145	5045	\N	Służejów
5146	5045	\N	Starczówek
5147	5045	\N	Wadochowice
5148	5045	\N	Wigańcice
5149	5045	\N	Witostowice
5150	5046	\N	Złoty Stok
5151	5046	\N	Błotnica
5152	5046	\N	Chwalisław
5153	5046	\N	Laski
5154	5046	\N	Mąkolno
5155	5046	\N	Płonica
5156	281	\N	Zawidów
5157	281	\N	Zgorzelec
5158	281	\N	Bogatynia
5159	281	\N	Pieńsk
5160	281	\N	Sulików
5161	281	\N	Węgliniec
5162	5156	\N	Zawidów
5163	5157	\N	Zgorzelec
5164	5158	\N	Bogatynia
5165	5158	\N	Białopole
5166	5158	\N	Bratków
5167	5158	\N	Działoszyn
5168	5158	\N	Jasna Góra
5169	5158	\N	Kopaczów
5170	5158	\N	Krzewina
5171	5158	\N	Lutogniewice
5172	5158	\N	Opolno-Zdrój
5173	5158	\N	Porajów
5174	5158	\N	Posada
5175	5158	\N	Rybarzowice
5176	5158	\N	Sieniawka
5177	5158	\N	Wigancice Żytawskie
5178	5158	\N	Wolanów
5179	5158	\N	Wyszków
5180	5159	\N	Pieńsk
5181	5159	\N	Bielawa Dolna
5182	5159	\N	Bielawa Górna
5183	5159	\N	Dłużyna Dolna
5184	5159	\N	Dłużyna Górna
5185	5159	\N	Lasów
5186	5159	\N	Sośniak
5187	5159	\N	Stojanów
5188	5159	\N	Strzelno
5189	5159	\N	Żarka nad Nysą
5190	5159	\N	Żarki Średnie
5191	5160	\N	Bierna
5192	5160	\N	Jabłoniec
5193	5160	\N	Ksawerów
5194	5160	\N	Łowin
5195	5160	\N	Mała Wieś Dolna
5196	5160	\N	Mała Wieś Górna
5197	5160	\N	Miedziana
5198	5160	\N	Mikułowa
5199	5160	\N	Podgórze
5200	5160	\N	Radzimów
5201	5160	\N	Skrzydlice
5202	5160	\N	Stary Zawidów
5203	5160	\N	Studniska Dolne
5204	5160	\N	Studniska Górne
5205	5160	\N	Sulików
5206	5160	\N	Wilka
5207	5160	\N	Wilka-Bory
5208	5160	\N	Wrociszów Dolny
5209	5160	\N	Wrociszów Górny
5210	5161	\N	Węgliniec
5211	5161	\N	Czerwona Woda
5212	5161	\N	Jagodzin
5213	5161	\N	Kościelna Wieś
5214	5161	\N	Okrąglica
5215	5161	\N	Piaseczna
5216	5161	\N	Polana
5217	5161	\N	Ruszów
5218	5161	\N	Stary Węgliniec
5219	5161	\N	Zielonka
5220	5157	\N	Białogórze
5221	5157	\N	Gozdanin
5222	5157	\N	Gronów
5223	5157	\N	Jerzmanki
5224	5157	\N	Jędrzychowice
5225	5157	\N	Kostrzyna
5226	5157	\N	Koźlice
5227	5157	\N	Koźmin
5228	5157	\N	Kunów
5229	5157	\N	Łagów
5230	5157	\N	Łomnica
5231	5157	\N	Niedów
5232	5157	\N	Osiek Łużycki
5233	5157	\N	Pokrzywnik
5234	5157	\N	Przesieczany
5235	5157	\N	Radomierzyce
5236	5157	\N	Ręczyn
5237	5157	\N	Sławnikowice
5238	5157	\N	Spytków
5239	5157	\N	Trójca
5240	5157	\N	Tylice
5241	5157	\N	Żarska Wieś
5242	282	\N	Wojcieszów
5243	282	\N	Złotoryja
5244	282	\N	Pielgrzymka
5245	282	\N	Świerzawa
5246	282	\N	Zagrodno
5247	5242	\N	Wojcieszów
5248	5243	\N	Złotoryja
5249	5244	\N	Czaple
5250	5244	\N	Jastrzębnik
5251	5244	\N	Nowa Wieś Grodziska
5252	5244	\N	Nowe Łąki
5253	5244	\N	Pielgrzymka
5254	5244	\N	Proboszczów
5255	5244	\N	Sędzimirów
5256	5244	\N	Twardocice
5257	5244	\N	Wojcieszyn
5258	5245	\N	Świerzawa
5259	5245	\N	Biegoszów
5260	5245	\N	Dobków
5261	5245	\N	Gozdno
5262	5245	\N	Lubiechowa
5263	5245	\N	Nowy Kościół
5264	5245	\N	Podgórki
5265	5245	\N	Rząśnik
5266	5245	\N	Rzeszówek
5267	5245	\N	Sędziszowa
5268	5245	\N	Sokołowiec
5269	5245	\N	Stara Kraśnica
5270	5246	\N	Brochocin
5271	5246	\N	Grodziec
5272	5246	\N	Jadwisin
5273	5246	\N	Łukaszów
5274	5246	\N	Modlikowice
5275	5246	\N	Olszanica
5276	5246	\N	Radziechów
5277	5246	\N	Uniejowice
5278	5246	\N	Wojciechów
5279	5246	\N	Zagrodno
5280	5243	\N	Brennik
5281	5243	\N	Czeszków
5282	5243	\N	Ernestynów
5283	5243	\N	Gierałtowiec
5284	5243	\N	Jerzmanice-Zdrój
5285	5243	\N	Kopacz
5286	5243	\N	Kozów
5287	5243	\N	Kwiatów
5288	5243	\N	Leszczyna
5289	5243	\N	Lubiatów
5290	5243	\N	Łaźniki
5291	5243	\N	Nowa Wieś Złotoryjska
5292	5243	\N	Nowa Ziemia
5293	5243	\N	Owczarki
5294	5243	\N	Podolany
5295	5243	\N	Prusice
5296	5243	\N	Pyskowice
5297	5243	\N	Rokitnica
5298	5243	\N	Rzymówka
5299	5243	\N	Wilków
5300	5243	\N	Wilków-Osiedle
5301	5243	\N	Wyskok
5302	5243	\N	Wysocko
5303	386	\N	M. Jelenia Góra
5304	390	\N	Legnica
5305	289	\N	M. Wrocław
5306	289	\N	Wrocław-Fabryczna
5307	289	\N	Wrocław-Krzyki
5308	289	\N	Wrocław-Psie Pole
5309	289	\N	Wrocław-Stare Miasto
5310	289	\N	Wrocław-Śródmieście
5314	4291	\N	Bogdanów
5315	4291	\N	Budziszów
5316	4291	\N	Chmielów
5317	4291	\N	Czechy
5318	4291	\N	Godków
5319	4291	\N	Jakubkowice
5320	4291	\N	Jarząbkowice
5321	4291	\N	Jenkowice
5322	4291	\N	Karczyce
5323	4291	\N	Kostomłoty
5324	4291	\N	Lisowice
5325	4291	\N	Mieczków
5326	4291	\N	Osiek
5327	4291	\N	Paździorno
5328	4291	\N	Piersno
5329	4291	\N	Piotrowice
5330	4291	\N	Ramułtowice
5331	4291	\N	Samborz
5332	4291	\N	Samsonowice
5333	4291	\N	Siemidrożyce
5334	4291	\N	Sikorzyce
5335	4291	\N	Sobkowice
5336	4291	\N	Szymanowice
5337	4291	\N	Świdnica Polska
5338	4291	\N	Wichrów
5339	4291	\N	Wilków Średzki
5340	4291	\N	Zabłoto
5341	4292	\N	Chełm
5342	4292	\N	Chomiąża
5343	4292	\N	Dębice
5344	4292	\N	Kwietno
5345	4292	\N	Malczyce
5346	4292	\N	Mazurowice
5347	4292	\N	Rachów
5348	4292	\N	Rusko
5349	4292	\N	Szymanów
5350	4292	\N	Wilczków
5351	4293	\N	Białków
5352	4293	\N	Błonie
5353	4293	\N	Brzezina
5354	4293	\N	Brzezinka Średzka
5355	4293	\N	Czerna
5356	4293	\N	Gałów
5357	4293	\N	Głoska
5358	4293	\N	Gosławice
5359	4293	\N	Kadłub
5360	4293	\N	Krępice
5361	4293	\N	Księginice
5362	4293	\N	Lenartowice
5363	4293	\N	Lutynia
5364	4293	\N	Łowęcice
5365	4293	\N	Miękinia
5366	4293	\N	Mrozów
5367	4293	\N	Pisarzowice
5368	4293	\N	Piskorzowice
5369	4293	\N	Prężyce
5370	4293	\N	Radakowice
5371	4293	\N	Wilkostów
5372	4293	\N	Wilkszyn
5373	4293	\N	Wróblowice
5374	4293	\N	Zabór Wielki
5375	4293	\N	Zakrzyce
5376	4293	\N	Źródła
5377	4293	\N	Żurawiniec
5378	4294	\N	Środa Śląska
5379	4294	\N	Brodno
5380	4294	\N	Bukówek
5381	4294	\N	Cesarzowice
5382	4294	\N	Chwalimierz
5383	4294	\N	Ciechów
5384	4294	\N	Gozdawa
5385	4294	\N	Jastrzębce
5386	4294	\N	Jugowiec
5387	4294	\N	Juszczyn
5388	4294	\N	Kobylniki
5389	4294	\N	Komorniki
5390	4294	\N	Kryniczno
5391	4294	\N	Kulin
5392	4294	\N	Ligotka
5393	4294	\N	Lipnica
5394	4294	\N	Michałów
5395	4294	\N	Ogrodnica
5396	4294	\N	Pęczków
5397	4294	\N	Proszków
5398	4294	\N	Przedmoście
5399	4294	\N	Rakoszyce
5400	4294	\N	Rzeczyca
5401	4294	\N	Słup
5402	4294	\N	Szczepanów
5403	4294	\N	Święte
5404	4294	\N	Wojczyce
5405	4294	\N	Wrocisławice
5406	4294	\N	Zakrzów
5407	4295	\N	Damianowo
5408	4295	\N	Drogomiłowice
5409	4295	\N	Dziwigórz
5410	4295	\N	Gościsław
5411	4295	\N	Jarosław
5412	4295	\N	Jarostów
5413	4295	\N	Karnice
5414	4295	\N	Konary
5415	4295	\N	Lasek
5416	4295	\N	Lusina
5417	4295	\N	Łagiewniki Średzkie
5418	4295	\N	Pichorowice
5419	4295	\N	Piekary
5420	4295	\N	Pielaszkowice
5421	4295	\N	Różana
5422	4295	\N	Sokolniki
5423	4295	\N	Udanin
5424	4295	\N	Ujazd Dolny
5425	4295	\N	Ujazd Górny
5431	291	\N	Aleksandrów Kujawski
5432	291	\N	Ciechocinek
5433	291	\N	Nieszawa
5434	291	\N	Bądkowo
5435	291	\N	Koneck
5436	291	\N	Raciążek
5437	291	\N	Waganiec
5438	291	\N	Zakrzewo
5439	5431	\N	Aleksandrów Kujawski
5440	5432	\N	Ciechocinek
5441	5433	\N	Nieszawa
5442	5431	\N	Białe Błota
5443	5431	\N	Broniszewo
5444	5431	\N	Chrusty
5445	5431	\N	Goszczewo
5446	5431	\N	Grabie
5447	5431	\N	Kazin
5448	5431	\N	Kolonia Przybranowska
5449	5431	\N	Konradowo
5450	5431	\N	Kuczek
5451	5431	\N	Łazieniec
5452	5431	\N	Nowa Wieś
5453	5431	\N	Nowy Ciechocinek
5454	5431	\N	Odolion
5455	5431	\N	Opoczki
5456	5431	\N	Opoki
5457	5431	\N	Ostrowąs
5458	5431	\N	Ośno
5459	5431	\N	Ośno Drugie
5460	5431	\N	Otłoczyn
5461	5431	\N	Otłoczynek
5462	5431	\N	Otłoczyn-Stacja
5463	5431	\N	Pinino
5464	5431	\N	Plebanka
5465	5431	\N	Poczałkowo
5466	5431	\N	Podgaj
5467	5431	\N	Przybranowo
5468	5431	\N	Przybranówek
5469	5431	\N	Rożno-Parcele
5470	5431	\N	Rudunki
5471	5431	\N	Słomkowo
5472	5431	\N	Słońsk Dolny
5473	5431	\N	Służewo
5474	5431	\N	Służewo-Pole
5475	5431	\N	Stara Wieś
5476	5431	\N	Stare Rożno
5477	5431	\N	Stawki
5478	5431	\N	Wilkostowo
5479	5431	\N	Wołuszewo
5480	5431	\N	Wólka
5481	5431	\N	Wygoda
5482	5431	\N	Zduny
5483	5431	\N	Zgoda
5484	5434	\N	Antoniewo
5485	5434	\N	Bądkowo
5486	5434	\N	Bądkówek
5487	5434	\N	Biele
5488	5434	\N	Jaranowo
5489	5434	\N	Jaranowo-Majątek
5490	5434	\N	Kalinowiec
5491	5434	\N	Kaniewo
5492	5434	\N	Kolonia Łowiczek
5493	5434	\N	Kryńsk
5494	5434	\N	Kujawka
5495	5434	\N	Kwiatkowo
5496	5434	\N	Łowiczek
5497	5434	\N	Łówkowice
5498	5434	\N	Olszynka
5499	5434	\N	Sinki
5500	5434	\N	Słupy Duże
5501	5434	\N	Słupy Małe
5502	5434	\N	Tomaszewo
5503	5434	\N	Toporzyszczewo
5504	5434	\N	Toporzyszczewo Stare
5505	5434	\N	Wójtówka
5506	5434	\N	Wysocin
5507	5434	\N	Wysocinek
5508	5434	\N	Zieleniec
5509	5434	\N	Żabieniec
5510	5435	\N	Brzeźno
5511	5435	\N	Chromowola
5512	5435	\N	Jeziorno
5513	5435	\N	Kajetanowo
5514	5435	\N	Kamieniec
5515	5435	\N	Kolonia Straszewska
5516	5435	\N	Koneck
5517	5435	\N	Kruszynek
5518	5435	\N	Kruszynek-Kolonia
5519	5435	\N	Młynek
5520	5435	\N	Opalanka
5521	5435	\N	Ossówka
5522	5435	\N	Pomiany
5523	5435	\N	Romanowo
5524	5435	\N	Rybno
5525	5435	\N	Spoczynek
5526	5435	\N	Straszewo
5527	5435	\N	Święte
5528	5435	\N	Wincentowo
5529	5435	\N	Zapustek
5530	5435	\N	Zazdromin
5531	5435	\N	Żołnowo
5532	5436	\N	Dąbrówka Duża
5533	5436	\N	Niestuszewo
5534	5436	\N	Podole
5535	5436	\N	Podzamcze
5536	5436	\N	Raciążek
5537	5436	\N	Siarzewo
5538	5436	\N	Turzno
5539	5436	\N	Turzynek
5540	5437	\N	Ariany
5541	5437	\N	Bertowo
5542	5437	\N	Brudnowo
5543	5437	\N	Byzie
5544	5437	\N	Janowo
5545	5437	\N	Józefowo
5546	5437	\N	Kaźmierzyn
5547	5437	\N	Kolonia Święte
5548	5437	\N	Konstantynowo
5549	5437	\N	Lewin
5550	5437	\N	Michalin
5551	5437	\N	Michalinek
5552	5437	\N	Niszczewy
5553	5437	\N	Nowy Zbrachlin
5554	5437	\N	Plebanka
5555	5437	\N	Przypust
5556	5437	\N	Sierzchowo
5557	5437	\N	Siutkowo
5558	5437	\N	Stary Zbrachlin
5559	5437	\N	Szpitalka
5560	5437	\N	Śliwkowo
5561	5437	\N	Waganiec
5562	5437	\N	Wiktoryn
5563	5437	\N	Włoszyca
5564	5437	\N	Wójtówka
5565	5437	\N	Wólne
5566	5437	\N	Zakrzewo
5567	5437	\N	Zbrachlin
5568	5437	\N	Zosin
5569	5438	\N	Bachorza
5570	5438	\N	Gęsin
5571	5438	\N	Gosławice
5572	5438	\N	Kobielice
5573	5438	\N	Kolonia Bodzanowska
5574	5438	\N	Kolonia Serocka
5575	5438	\N	Kuczkowo
5576	5438	\N	Lepsze
5577	5438	\N	Michałowo
5578	5438	\N	Seroczki
5579	5438	\N	Sędzin
5580	5438	\N	Sędzinek
5581	5438	\N	Sędzin-Kolonia
5582	5438	\N	Siniarzewo
5583	5438	\N	Sinki
5584	5438	\N	Ujma Duża
5585	5438	\N	Wola Bachorna
5586	5438	\N	Zakrzewo
5587	5438	\N	Zarębowo
5588	292	\N	Brodnica
5589	292	\N	Bartniczka
5590	292	\N	Bobrowo
5591	292	\N	Brzozie
5592	292	\N	Górzno
5593	292	\N	Jabłonowo Pomorskie
5594	292	\N	Osiek
5595	292	\N	Świedziebnia
5596	292	\N	Zbiczno
5597	5588	\N	Brodnica
5598	5589	\N	Bartniczka
5599	5589	\N	Belfort
5600	5589	\N	Długi Most
5601	5589	\N	Gołkówko
5602	5589	\N	Grążawy
5603	5589	\N	Gutowo
5604	5589	\N	Igliczyzna
5605	5589	\N	Iły
5606	5589	\N	Jastrzębie
5607	5589	\N	Jastrzębie-Przydatki
5608	5589	\N	Komorowo
5609	5589	\N	Koziary
5610	5589	\N	Łaszewo
5611	5589	\N	Nowe Świerczyny
5612	5589	\N	Radoszki
5613	5589	\N	Samin
5614	5589	\N	Skrobacja
5615	5589	\N	Sokołowo
5616	5589	\N	Stare Świerczyny
5617	5589	\N	Świerczynki
5618	5589	\N	Wilamowo
5619	5589	\N	Zdroje
5620	5590	\N	Anielewo
5621	5590	\N	Bobrowo
5622	5590	\N	Bobrowo-Kolonia
5623	5590	\N	Bogumiłki
5624	5590	\N	Brudzawy
5625	5590	\N	Buczek
5626	5590	\N	Budy
5627	5590	\N	Chojno
5628	5590	\N	Czekanowo
5629	5590	\N	Dąbrówka
5630	5590	\N	Drużyny
5631	5590	\N	Florencja
5632	5590	\N	Foluszek
5633	5590	\N	Grabówiec
5634	5590	\N	Grzybno
5635	5590	\N	Kawki
5636	5590	\N	Kruszyny
5637	5590	\N	Kruszyny-Rumunki
5638	5590	\N	Kruszyny Szlacheckie
5639	5590	\N	Lisa Młyn
5640	5590	\N	Małki
5641	5590	\N	Nieżywięć
5642	5590	\N	Pasieki
5643	5590	\N	Słoszewy
5644	5590	\N	Smolniki
5645	5590	\N	Tylice
5646	5590	\N	Wądzyn
5647	5590	\N	Wichulec
5648	5590	\N	Wymokłe
5649	5590	\N	Zarośle
5650	5590	\N	Zgniłobłoty
5651	5588	\N	Bartniki
5652	5588	\N	Bobrowiska
5653	5588	\N	Cielęta
5654	5588	\N	Drużyny
5655	5588	\N	Dzierżno
5656	5588	\N	Gorczenica
5657	5588	\N	Gorczeniczka
5658	5588	\N	Gortatowo
5659	5588	\N	Karbowo
5660	5588	\N	Kominy
5661	5588	\N	Kozi Róg
5662	5588	\N	Kruszynki
5663	5588	\N	Kurlaga
5664	5588	\N	Małgorzatka
5665	5588	\N	Moczadła
5666	5588	\N	Mszano
5667	5588	\N	Niewierz
5668	5588	\N	Nowe Moczadła
5669	5588	\N	Nowy Dwór
5670	5588	\N	Opalenica
5671	5588	\N	Podgórz
5672	5588	\N	Przydatki
5673	5588	\N	Rybaki
5674	5588	\N	Sobiesierzno
5675	5588	\N	Szabda
5676	5588	\N	Szczuka
5677	5588	\N	Szymkowo
5678	5588	\N	Szymkówko
5679	5588	\N	Tama Brodzka
5680	5588	\N	Tywola
5681	5588	\N	Wybudowanie Michałowo
5682	5591	\N	Augustowo
5683	5591	\N	Brzozie
5684	5591	\N	Długi Most
5685	5591	\N	Jajkowo
5686	5591	\N	Janówko
5687	5591	\N	Kantyła
5688	5591	\N	Kuligi
5689	5591	\N	Małe Leźno
5690	5591	\N	Mały Głęboczek
5691	5591	\N	Pokrzywnia
5692	5591	\N	Sośno Królewskie
5693	5591	\N	Sugajno
5694	5591	\N	Szerokie
5695	5591	\N	Świecie
5696	5591	\N	Trepki
5697	5591	\N	Wielkie Leźno
5698	5591	\N	Wielki Głęboczek
5699	5591	\N	Zembrze
5700	5592	\N	Górzno
5701	5592	\N	Bachor
5702	5592	\N	Borek
5703	5592	\N	Bryńsk Królewski
5704	5592	\N	Brzeziny
5705	5592	\N	Buczkowo
5706	5592	\N	Czarny Bryńsk
5707	5592	\N	Diabelec
5708	5592	\N	Falk
5709	5592	\N	Fiałki
5710	5592	\N	Gać
5711	5592	\N	Gołkowo
5712	5592	\N	Górzno-Wybudowanie
5713	5592	\N	Karw
5714	5592	\N	Kocioł
5715	5592	\N	Kozie Błotko
5716	5592	\N	Miesiączkowo
5717	5592	\N	Nowy Świat
5718	5592	\N	Pólko
5719	5592	\N	Ruda
5720	5592	\N	Szczutowo
5721	5592	\N	Szynkówko
5722	5592	\N	Traczyska
5723	5592	\N	Wierzchownia
5724	5592	\N	Zaborowo
5725	5593	\N	Jabłonowo Pomorskie
5726	5593	\N	Adamowo
5727	5593	\N	Budziszewo
5728	5593	\N	Buk Góralski
5729	5593	\N	Bukowiec
5730	5593	\N	Buk Pomorski
5731	5593	\N	Gorzechówko
5732	5593	\N	Górale
5733	5593	\N	Góraliki
5734	5593	\N	Jabłonowo-Zamek
5735	5593	\N	Jaguszewice
5736	5593	\N	Kamień
5737	5593	\N	Konojady
5738	5593	\N	Lembarg
5739	5593	\N	Mileszewy
5740	5593	\N	Nowa Wieś
5741	5593	\N	Piecewo
5742	5593	\N	Płowęż
5743	5593	\N	Płowężek
5744	5593	\N	Szczepanki
5745	5594	\N	Dębowo
5746	5594	\N	Dzierzenek
5747	5594	\N	Jeziorki
5748	5594	\N	Kretki Duże
5749	5594	\N	Kretki Małe
5750	5594	\N	Kujawa
5751	5594	\N	Łapinóż
5752	5594	\N	Obórki
5753	5594	\N	Osiek
5754	5594	\N	Osiek-Kolonia
5755	5594	\N	Strzygi
5756	5594	\N	Sumin
5757	5594	\N	Sumówko
5758	5594	\N	Szynkowizna
5759	5594	\N	Tadajewo
5760	5594	\N	Tomaszewo
5761	5594	\N	Warpalice
5762	5594	\N	Wrzeszewo
5763	5595	\N	Brodniczka
5764	5595	\N	Chlebowo
5765	5595	\N	Dzierzno
5766	5595	\N	Granaty
5767	5595	\N	Grzęby
5768	5595	\N	Janowo
5769	5595	\N	Kłuśno
5770	5595	\N	Księte
5771	5595	\N	Mełno
5772	5595	\N	Michałki
5773	5595	\N	Niemojewo
5774	5595	\N	Nowa Rokitnica
5775	5595	\N	Nowe Zasady
5776	5595	\N	Okalewko
5777	5595	\N	Ostrów
5778	5595	\N	Rokitnica-Wieś
5779	5595	\N	Stare Zasady
5780	5595	\N	Świedziebnia
5781	5595	\N	Zasadki
5782	5595	\N	Zduny
5783	5596	\N	Bachotek
5784	5596	\N	Brzezinka
5785	5596	\N	Ciche
5786	5596	\N	Czyste Błota
5787	5596	\N	Gaj-Grzmięca
5788	5596	\N	Głowin
5789	5596	\N	Godziszka
5790	5596	\N	Grabiny
5791	5596	\N	Grzmięca
5792	5596	\N	Kaługa
5793	5596	\N	Karaś
5794	5596	\N	Koń
5795	5596	\N	Lipowiec
5796	5596	\N	Ładnówko
5797	5596	\N	Ławy Drwęczne
5798	5596	\N	Najmowo
5799	5596	\N	Pokrzydowo
5800	5596	\N	Robotno
5801	5596	\N	Rosochy
5802	5596	\N	Równica
5803	5596	\N	Rytebłota
5804	5596	\N	Sosno Szlacheckie
5805	5596	\N	Strzemiuszczek
5806	5596	\N	Sumowo
5807	5596	\N	Sumówko
5808	5596	\N	Szramowo
5809	5596	\N	Tęgowiec
5810	5596	\N	Tomki
5811	5596	\N	Wysokie Brodno
5812	5596	\N	Zarośle
5813	5596	\N	Zastawie
5814	5596	\N	Zbiczno
5815	5596	\N	Żmijewko
5816	5596	\N	Żmijewo
5817	307	\N	Białe Błota
5818	307	\N	Dąbrowa Chełmińska
5819	307	\N	Dobrcz
5820	307	\N	Koronowo
5821	307	\N	Nowa Wieś Wielka
5822	307	\N	Osielsko
5823	307	\N	Sicienko
5824	307	\N	Solec Kujawski
5825	5817	\N	Białe Błota
5826	5817	\N	Ciele
5827	5817	\N	Drzewce
5828	5817	\N	Jasiniec
5829	5817	\N	Kruszyn Krajeński
5830	5817	\N	Lipniki
5831	5817	\N	Lisi Ogon
5832	5817	\N	Łochowice
5833	5817	\N	Łochowo
5834	5817	\N	Murowaniec
5835	5817	\N	Prądki
5836	5817	\N	Przyłęki
5837	5817	\N	Trzciniec
5838	5817	\N	Zielonka
5839	5818	\N	Bolumin
5840	5818	\N	Boluminek
5841	5818	\N	Borki
5842	5818	\N	Czarże
5843	5818	\N	Czemlewo
5844	5818	\N	Dąbrowa Chełmińska
5845	5818	\N	Dębowiec
5846	5818	\N	Gzin
5847	5818	\N	Gzin Dolny
5848	5818	\N	Janowo
5849	5818	\N	Linia
5850	5818	\N	Mała Kępa
5851	5818	\N	Mozgowina
5852	5818	\N	Nowy Dwór
5853	5818	\N	Oktowo
5854	5818	\N	Ostromecko
5855	5818	\N	Otowice
5856	5818	\N	Pień
5857	5818	\N	Rafa
5858	5818	\N	Reptowo
5859	5818	\N	Słończ
5860	5818	\N	Strzyżawa
5861	5818	\N	Wałdowo Królewskie
5862	5818	\N	Wielka Kępa
5863	5819	\N	Aleksandrowiec
5864	5819	\N	Aleksandrowo
5865	5819	\N	Augustowo
5866	5819	\N	Borówno
5867	5819	\N	Dobrcz
5868	5819	\N	Gądecz
5869	5819	\N	Hutna Wieś
5870	5819	\N	Karolewo
5871	5819	\N	Kotomierz
5872	5819	\N	Kozielec
5873	5819	\N	Kusowo
5874	5819	\N	Magdalenka
5875	5819	\N	Marcelewo
5876	5819	\N	Nekla
5877	5819	\N	Pauliny
5878	5819	\N	Pyszczyn
5879	5819	\N	Sienno
5880	5819	\N	Stronno
5881	5819	\N	Strzelce Dolne
5882	5819	\N	Strzelce Górne
5883	5819	\N	Suponin
5884	5819	\N	Trzebień
5885	5819	\N	Trzeciewiec
5886	5819	\N	Trzęsacz
5887	5819	\N	Włóki
5888	5819	\N	Wudzyn
5889	5819	\N	Wudzynek
5890	5819	\N	Zalesie
5891	5819	\N	Zła Wieś
5892	5820	\N	Koronowo
5893	5820	\N	Białe
5894	5820	\N	Bieskowo
5895	5820	\N	Brzozowo
5896	5820	\N	Buszkowo
5897	5820	\N	Byszewo
5898	5820	\N	Bytkowice
5899	5820	\N	Dziedzinek
5900	5820	\N	Glinki
5901	5820	\N	Gogolin
5902	5820	\N	Gogolinek
5903	5820	\N	Gościeradz
5904	5820	\N	Huta
5905	5820	\N	Kadzionka
5906	5820	\N	Krąpiewo
5907	5820	\N	Krówka
5908	5820	\N	Lucim
5909	5820	\N	Łąsko Małe
5910	5820	\N	Łąsko Wielkie
5911	5820	\N	Ługowo
5912	5820	\N	Mąkowarsko
5913	5820	\N	Młynkowo
5914	5820	\N	Morzewiec
5915	5820	\N	Motyl
5916	5820	\N	Nowy Dwór
5917	5820	\N	Nowy Jasiniec
5918	5820	\N	Okole
5919	5820	\N	Olszyniec
5920	5820	\N	Osiedle Awaryjne
5921	5820	\N	Osiek
5922	5820	\N	Pobrdzie
5923	5820	\N	Popielewo
5924	5820	\N	Puszczyn
5925	5820	\N	Różana
5926	5820	\N	Rudno
5927	5820	\N	Salno
5928	5820	\N	Samociążek
5929	5820	\N	Sitowiec
5930	5820	\N	Skarbiewo
5931	5820	\N	Sokole-Kuźnica
5932	5820	\N	Stary Dwór
5933	5820	\N	Stary Jasiniec
5934	5820	\N	Stefanowo
5935	5820	\N	Stopka
5936	5820	\N	Stronno
5937	5820	\N	Tryszczyn
5938	5820	\N	Tylna Góra
5939	5820	\N	Wierzchucin Królewski
5940	5820	\N	Więzowno
5941	5820	\N	Wilcze
5942	5820	\N	Wilcze Gardło
5943	5820	\N	Wiskitno
5944	5820	\N	Witoldowo
5945	5820	\N	Wtelno
5946	5820	\N	Wymysłowo
5947	5821	\N	Brzoza
5948	5821	\N	Chmielniki
5949	5821	\N	Dąbrowa Wielka
5950	5821	\N	Dębinka
5951	5821	\N	Dobromierz
5952	5821	\N	Dziemionna
5953	5821	\N	Emilianowo
5954	5821	\N	Jakubowo
5955	5821	\N	Januszkowo
5956	5821	\N	Kobylarnia
5957	5821	\N	Kolankowo
5958	5821	\N	Leszyce
5959	5821	\N	Łażyn
5960	5821	\N	Nowa Wieś Wielka
5961	5821	\N	Nowa Wioska
5962	5821	\N	Nowe Smolno
5963	5821	\N	Olimpin
5964	5821	\N	Piecki
5965	5821	\N	Prądocin
5966	5821	\N	Tarkowo Dolne
5967	5821	\N	Wałownica
5968	5822	\N	Bożenkowo
5969	5822	\N	Czarnówczyn
5970	5822	\N	Jagodowo
5971	5822	\N	Jarużyn
5972	5822	\N	Jastrzębie
5973	5822	\N	Maksymilianowo
5974	5822	\N	Myślęcinek
5975	5822	\N	Niemcz
5976	5822	\N	Niwy
5977	5822	\N	Nowy Mostek
5978	5822	\N	Osielsko
5979	5822	\N	Strzelce Leśne
5980	5822	\N	Wilcze
5981	5822	\N	Zamczysko
5982	5822	\N	Zdroje
5983	5822	\N	Żołędowo
5984	5823	\N	Chmielewo
5985	5823	\N	Dąbrówczyn
5986	5823	\N	Dąbrówka Nowa
5987	5823	\N	Gliszcz
5988	5823	\N	Goncarzewy
5989	5823	\N	Janin
5990	5823	\N	Kamieniec
5991	5823	\N	Kasprowo
5992	5823	\N	Kruszyn
5993	5823	\N	Kruszyniec
5994	5823	\N	Łukowiec
5995	5823	\N	Marynin
5996	5823	\N	Mochle
5997	5823	\N	Murucin
5998	5823	\N	Nowaczkowo
5999	5823	\N	Nowa Ruda
6000	5823	\N	Osówiec
6001	5823	\N	Pawłówek
6002	5823	\N	Piotrkówko
6003	5823	\N	Samsieczno
6004	5823	\N	Sicienko
6005	5823	\N	Sitno
6006	5823	\N	Słupowo
6007	5823	\N	Smolary
6008	5823	\N	Strzelewo
6009	5823	\N	Szczutki
6010	5823	\N	Teresin
6011	5823	\N	Trzciniec
6012	5823	\N	Trzemiętowo
6013	5823	\N	Trzemiętówko
6014	5823	\N	Ugoda
6015	5823	\N	Wierzchucice
6016	5823	\N	Wierzchucinek
6017	5823	\N	Wojnowo
6018	5823	\N	Zawada
6019	5823	\N	Zielonczyn
6020	5824	\N	Solec Kujawski
6021	5824	\N	Chojnaty
6022	5824	\N	Chrośna
6023	5824	\N	Gajtowo
6024	5824	\N	Grodzyna
6025	5824	\N	Jarzębiec
6026	5824	\N	Jezierce
6027	5824	\N	Lesisko
6028	5824	\N	Łażyn
6029	5824	\N	Makowiska
6030	5824	\N	Osiek
6031	5824	\N	Otorowo
6032	5824	\N	Przyłubie
6033	5824	\N	Rudy
6034	5824	\N	Trzcianka
6035	5824	\N	Ustronie
6036	5824	\N	Wypaleniska
6037	293	\N	Chełmno
6038	293	\N	Kijewo Królewskie
6039	293	\N	Lisewo
6040	293	\N	Papowo Biskupie
6041	293	\N	Stolno
6042	293	\N	Unisław
6043	6037	\N	Chełmno
6044	6037	\N	Bieńkówka
6045	6037	\N	Borówno
6046	6037	\N	Dolne Wymiary
6047	6037	\N	Dołki
6048	6037	\N	Dorposz Chełmiński
6049	6037	\N	Górne Wymiary
6050	6037	\N	Kałdus
6051	6037	\N	Klamry
6052	6037	\N	Kolenki
6053	6037	\N	Kolno
6054	6037	\N	Łęg
6055	6037	\N	Małe Łunawy
6056	6037	\N	Nowawieś Chełmińska
6057	6037	\N	Nowe Dobra
6058	6037	\N	Osnowo
6059	6037	\N	Ostrów Świecki
6060	6037	\N	Panieński Ostrów
6061	6037	\N	Podwiesk
6062	6037	\N	Różnowo
6063	6037	\N	Starogród
6064	6037	\N	Starogród Dolny
6065	6037	\N	Uść
6066	6037	\N	Wielkie Łunawy
6067	6038	\N	Bajerze
6068	6038	\N	Bągart
6069	6038	\N	Brzozowo
6070	6038	\N	Dorposz Szlachecki
6071	6038	\N	Kiełp
6072	6038	\N	Kijewo Królewskie
6073	6038	\N	Kijewo Szlacheckie
6074	6038	\N	Kosowizna
6075	6038	\N	Napole
6076	6038	\N	Płutowo
6077	6038	\N	Szymborno
6078	6038	\N	Trzebcz Królewski
6079	6038	\N	Trzebcz Szlachecki
6080	6038	\N	Trzebczyk
6081	6038	\N	Watorowo
6082	6039	\N	Bartlewo
6083	6039	\N	Błachta
6084	6039	\N	Chrusty
6085	6039	\N	Drzonowo
6086	6039	\N	Kamlarki
6087	6039	\N	Kornatowo
6088	6039	\N	Krajęcin
6089	6039	\N	Krusin
6090	6039	\N	Linowiec
6091	6039	\N	Lipienek
6092	6039	\N	Lisewo
6093	6039	\N	Malankowo
6094	6039	\N	Mgoszcz
6095	6039	\N	Piątkowo
6096	6039	\N	Pniewite
6097	6039	\N	Strucfoń
6098	6039	\N	Tytlewo
6099	6039	\N	Wierzbowo
6100	6040	\N	Dubielno
6101	6040	\N	Falęcin
6102	6040	\N	Firlus
6103	6040	\N	Folgowo
6104	6040	\N	Jeleniec
6105	6040	\N	Kucborek
6106	6040	\N	Młyńsk
6107	6040	\N	Niemczyk
6108	6040	\N	Nowy Dwór Królewski
6109	6040	\N	Papowo Biskupie
6110	6040	\N	Staw
6111	6040	\N	Storlus
6112	6040	\N	Wrocławki
6113	6040	\N	Zegartowice
6114	6040	\N	Żygląd
6115	6041	\N	Cepno
6116	6041	\N	Gorzuchowo
6117	6041	\N	Grubno
6118	6041	\N	Klęczkowo
6119	6041	\N	Kobyły
6120	6041	\N	Łyniec
6121	6041	\N	Małe Czyste
6122	6041	\N	Obory
6123	6041	\N	Paparzyn
6124	6041	\N	Pilewice
6125	6041	\N	Robakowo
6126	6041	\N	Rybieniec
6127	6041	\N	Sarnowo
6128	6041	\N	Stolno
6129	6041	\N	Trzebiełuch
6130	6041	\N	Wabcz
6131	6041	\N	Wabcz-Kolonia
6132	6041	\N	Wichorze
6133	6041	\N	Wielkie Czyste
6134	6041	\N	Zakrzewo
6135	6042	\N	Błoto
6136	6042	\N	Bruki Kokocka
6137	6042	\N	Bruki Unisławskie
6138	6042	\N	Głażewo
6139	6042	\N	Gołoty
6140	6042	\N	Grzybno
6141	6042	\N	Kokocko
6142	6042	\N	Raciniewo
6143	6042	\N	Stablewice
6144	6042	\N	Unisław
6145	294	\N	Golub-Dobrzyń
6146	294	\N	Ciechocin
6147	294	\N	Kowalewo Pomorskie
6148	294	\N	Radomin
6149	294	\N	Zbójno
6150	6145	\N	Golub-Dobrzyń
6151	6146	\N	Ciechocin
6152	6146	\N	Dulnik
6153	6146	\N	Elgiszewo
6154	6146	\N	Franksztyn
6155	6146	\N	Gapa
6156	6146	\N	Gierszówka
6157	6146	\N	Jesionka
6158	6146	\N	Kałdunek
6159	6146	\N	Kępa
6160	6146	\N	Kujawy
6161	6146	\N	Leśno
6162	6146	\N	Łęga
6163	6146	\N	Małszyce
6164	6146	\N	Miliszewy
6165	6146	\N	Morgowo
6166	6146	\N	Nowa Wieś
6167	6146	\N	Okonin
6168	6146	\N	Piotrkowo
6169	6146	\N	Rudaw
6170	6146	\N	Sęk
6171	6146	\N	Strębaczno
6172	6146	\N	Świętosław
6173	6146	\N	Tobółka
6174	6146	\N	Topielec
6175	6145	\N	Antoniewo
6176	6145	\N	Babiak
6177	6145	\N	Baraniec
6178	6145	\N	Białkowo
6179	6145	\N	Bobrowisko
6180	6145	\N	Cieszyny
6181	6145	\N	Duża Kujawa
6182	6145	\N	Gajewo
6183	6145	\N	Gałczewko
6184	6145	\N	Gałczewo
6185	6145	\N	Hamer
6186	6145	\N	Handlowy Młyn
6187	6145	\N	Józefat
6188	6145	\N	Kamienny Smug
6189	6145	\N	Karczewo
6190	6145	\N	Konstancjewo
6191	6145	\N	Krążno
6192	6145	\N	Lipnica
6193	6145	\N	Lisak
6194	6145	\N	Lisewo
6195	6145	\N	Lisewski Młyn
6196	6145	\N	Macikowo
6197	6145	\N	Mokry Las
6198	6145	\N	Nowa Wieś
6199	6145	\N	Nowogród
6200	6145	\N	Nowy Młyn
6201	6145	\N	Olszówka
6202	6145	\N	Ostrowite
6203	6145	\N	Owieczkowo
6204	6145	\N	Paliwodzizna
6205	6145	\N	Pasieka
6206	6145	\N	Piekiełko
6207	6145	\N	Pląchoty
6208	6145	\N	Poćwiardowo
6209	6145	\N	Podzamek Golubski
6210	6145	\N	Praczka
6211	6145	\N	Przeszkoda
6212	6145	\N	Pusta Dąbrówka
6213	6145	\N	Ruziec
6214	6145	\N	Sadykierz
6215	6145	\N	Skępsk
6216	6145	\N	Słuchaj
6217	6145	\N	Sokoligóra
6218	6145	\N	Sokołowo
6219	6145	\N	Sokołowskie Rumunki
6220	6145	\N	Sortyka
6221	6145	\N	Suwała
6222	6145	\N	Tokary
6223	6145	\N	Węgiersk
6224	6145	\N	Wrocki
6225	6145	\N	Zaręba
6226	6145	\N	Zawada
6227	6147	\N	Kowalewo Pomorskie
6228	6147	\N	Bielsk
6229	6147	\N	Borek
6230	6147	\N	Borówno
6231	6147	\N	Chełmonie
6232	6147	\N	Chełmoniec
6233	6147	\N	Dylewo
6234	6147	\N	Elzanowo
6235	6147	\N	Frydrychowo
6236	6147	\N	Gapa
6237	6147	\N	Józefat
6238	6147	\N	Kiełpiny
6239	6147	\N	Lądy
6240	6147	\N	Lipienica
6241	6147	\N	Mariany
6242	6147	\N	Martyniec
6243	6147	\N	Mlewiec
6244	6147	\N	Mlewo
6245	6147	\N	Napole
6246	6147	\N	Nowy Dwór
6247	6147	\N	Otoruda
6248	6147	\N	Piątkowo
6249	6147	\N	Pluskowęsy
6250	6147	\N	Podborek
6251	6147	\N	Pruska Łąka
6252	6147	\N	Sierakowo
6253	6147	\N	Srebrniki
6254	6147	\N	Szewa
6255	6147	\N	Szychowo
6256	6147	\N	Wielka Łąka
6257	6147	\N	Wielkie Rychnowo
6258	6147	\N	Zapluskowęsy
6259	6148	\N	Bocheniec
6260	6148	\N	Dulsk
6261	6148	\N	Dulsk-Frankowo
6262	6148	\N	Dulsk-Spiczyny
6263	6148	\N	Gaj
6264	6148	\N	Jakubkowo
6265	6148	\N	Kamionka
6266	6148	\N	Łubki
6267	6148	\N	Piórkowo
6268	6148	\N	Płonko
6269	6148	\N	Płonne
6270	6148	\N	Płonne-Plebanka
6271	6148	\N	Radomin
6272	6148	\N	Rętwiny
6273	6148	\N	Rodzone
6274	6148	\N	Smólniki
6275	6148	\N	Szafarnia
6276	6148	\N	Szczutowo
6277	6148	\N	Wilczewko
6278	6148	\N	Wilczewo
6279	6149	\N	Adamki
6280	6149	\N	Ciechanówek
6281	6149	\N	Ciepień
6282	6149	\N	Działyń
6283	6149	\N	Imbirkowo
6284	6149	\N	Kazimierzewo
6285	6149	\N	Klonowo
6286	6149	\N	Łukaszewo
6287	6149	\N	Nowy Działyń
6288	6149	\N	Obory
6289	6149	\N	Podolina
6290	6149	\N	Przystań
6291	6149	\N	Pustki Działyńskie
6292	6149	\N	Rembiesznica
6293	6149	\N	Rembiocha
6294	6149	\N	Rudusk
6295	6149	\N	Ruże
6296	6149	\N	Sitno
6297	6149	\N	Wielgie
6298	6149	\N	Wojnowo
6299	6149	\N	Zbójenko
6300	6149	\N	Zbójno
6301	6149	\N	Zosin
6302	309	\N	Grudziądz
6303	309	\N	Gruta
6304	309	\N	Łasin
6305	309	\N	Radzyń Chełmiński
6306	309	\N	Rogóźno
6307	309	\N	Świecie nad Osą
6308	6302	\N	Biały Bór
6309	6302	\N	Brankówka
6310	6302	\N	Dusocin
6311	6302	\N	Gać
6312	6302	\N	Gogolin
6313	6302	\N	Grabowiec
6314	6302	\N	Hanowo
6315	6302	\N	Kobylanka
6316	6302	\N	Leśniewo
6317	6302	\N	Linarczyk
6318	6302	\N	Lisie Kąty
6319	6302	\N	Małe Lniska
6320	6302	\N	Mały Rudnik
6321	6302	\N	Marusza
6322	6302	\N	Mokre
6323	6302	\N	Nowa Wieś
6324	6302	\N	Parski
6325	6302	\N	Piaski
6326	6302	\N	Pieńki Królewskie
6327	6302	\N	Rozgarty
6328	6302	\N	Ruda
6329	6302	\N	Sadowo
6330	6302	\N	Skarszewy
6331	6302	\N	Sosnówka
6332	6302	\N	Stary Folwark
6333	6302	\N	Sztynwag
6334	6302	\N	Szynych
6335	6302	\N	Świerkocin
6336	6302	\N	Turznice
6337	6302	\N	Wałdowo Szlacheckie
6338	6302	\N	Węgrowo
6339	6302	\N	Wielkie Lniska
6340	6302	\N	Wielki Wełcz
6341	6302	\N	Zakurzewo
6342	6302	\N	Grudziądz
6343	6303	\N	Annowo
6344	6303	\N	Boguszewo
6345	6303	\N	Dąbrówka Królewska
6346	6303	\N	Gołębiewko
6347	6303	\N	Gruta
6348	6303	\N	Jasiewo
6349	6303	\N	Karasek
6350	6303	\N	Kitnowo
6351	6303	\N	Mełno
6352	6303	\N	Nicwałd
6353	6303	\N	Okonin
6354	6303	\N	Orle
6355	6303	\N	Plemięta
6356	6303	\N	Pokrzywno
6357	6303	\N	Salno
6358	6303	\N	Słup
6359	6303	\N	Słupski Młyn
6360	6303	\N	Wiktorowo
6361	6304	\N	Łasin
6362	6304	\N	Bogdanki
6363	6304	\N	Goczałki
6364	6304	\N	Huta-Strzelce
6365	6304	\N	Jakubkowo
6366	6304	\N	Jankowice
6367	6304	\N	Kozłowo
6368	6304	\N	Nogat
6369	6304	\N	Nowe Błonowo
6370	6304	\N	Nowe Jankowice
6371	6304	\N	Nowe Mosty
6372	6304	\N	Plesewo
6373	6304	\N	Przesławice
6374	6304	\N	Stare Błonowo
6375	6304	\N	Strzelce
6376	6304	\N	Szczepanki
6377	6304	\N	Szonowo Szlacheckie
6378	6304	\N	Szynwałd
6379	6304	\N	Święte
6380	6304	\N	Wybudowanie Łasińskie
6381	6304	\N	Wydrzno
6382	6304	\N	Zawda
6383	6304	\N	Zawdzka Wola
6384	6305	\N	Radzyń Chełmiński
6385	6305	\N	Czeczewo
6386	6305	\N	Dębieniec
6387	6305	\N	Fijewo
6388	6305	\N	Gawłowice
6389	6305	\N	Gołębiewo
6390	6305	\N	Gziki
6391	6305	\N	Janowo
6392	6305	\N	Kneblowo
6393	6305	\N	Mazanki
6394	6305	\N	Nowy Dwór
6395	6305	\N	Radzyń-Wieś
6396	6305	\N	Radzyń-Wybudowanie
6397	6305	\N	Rozental
6398	6305	\N	Rywałd
6399	6305	\N	Stara Ruda
6400	6305	\N	Szumiłowo
6401	6305	\N	Zakrzewo
6402	6305	\N	Zielnowo
6403	6306	\N	Białochowo
6404	6306	\N	Budy
6405	6306	\N	Bukowiec
6406	6306	\N	Gubiny
6407	6306	\N	Jamy
6408	6306	\N	Kłódka
6409	6306	\N	Rogóźno
6410	6306	\N	Rogóźno-Zamek
6411	6306	\N	Skurgwy
6412	6306	\N	Sobótka
6413	6306	\N	Szembruczek
6414	6306	\N	Szembruk
6415	6306	\N	Zarośle
6416	6306	\N	Zwierzyniec
6417	6307	\N	Białobłoty
6418	6307	\N	Bursztynowo
6419	6307	\N	Dębniaki
6420	6307	\N	Karolewo
6421	6307	\N	Kitnówko
6422	6307	\N	Linowo
6423	6307	\N	Lisnowo
6424	6307	\N	Lisnówko
6425	6307	\N	Mędrzyce
6426	6307	\N	Nowy Młyn
6427	6307	\N	Partęczyny
6428	6307	\N	Rychnowo
6429	6307	\N	Szarnoś
6430	6307	\N	Świecie nad Osą
6431	6307	\N	Widlice
6432	6307	\N	Zamek
6433	295	\N	Inowrocław
6434	295	\N	Dąbrowa Biskupia
6435	295	\N	Gniewkowo
6436	295	\N	Janikowo
6437	295	\N	Kruszwica
6438	295	\N	Pakość
6439	295	\N	Rojewo
6440	295	\N	Złotniki Kujawskie
6441	6433	\N	Inowrocław
6442	6434	\N	Bąkowo
6443	6434	\N	Brudnia
6444	6434	\N	Chlewiska
6445	6434	\N	Chróstowo
6446	6434	\N	Dąbrowa Biskupia
6447	6434	\N	Dziewa
6448	6434	\N	Głojkowo
6449	6434	\N	Konary
6450	6434	\N	Mleczkowo
6451	6434	\N	Modliborzyce
6452	6434	\N	Niemojewo
6453	6434	\N	Nowy Dwór
6454	6434	\N	Ośniszczewko
6455	6434	\N	Ośniszczewo
6456	6434	\N	Parchanie
6457	6434	\N	Parchanki
6458	6434	\N	Pieczyska
6459	6434	\N	Pieranie
6460	6434	\N	Przybysław
6461	6434	\N	Radojewice
6462	6434	\N	Rejna
6463	6434	\N	Sobiesiernie
6464	6434	\N	Stanomin
6465	6434	\N	Walentynowo
6466	6434	\N	Wola Stanomińska
6467	6434	\N	Wonorze
6468	6434	\N	Zagajewice
6469	6434	\N	Zagajewiczki
6470	6435	\N	Gniewkowo
6471	6435	\N	Bąbolin
6472	6435	\N	Branno
6473	6435	\N	Buczkowo
6474	6435	\N	Chrząstowo
6475	6435	\N	Dąblin
6476	6435	\N	Edwinowo
6477	6435	\N	Gąski
6478	6435	\N	Godzięba
6479	6435	\N	Kaczkowo
6480	6435	\N	Kawęczyn
6481	6435	\N	Kępa Kujawska
6482	6435	\N	Kijewo
6483	6435	\N	Klepary
6484	6435	\N	Lipie
6485	6435	\N	Lipionka
6486	6435	\N	Markowo
6487	6435	\N	Murzynko
6488	6435	\N	Murzynno
6489	6435	\N	Ostrowo
6490	6435	\N	Perkowo
6491	6435	\N	Perkowo Dolne
6492	6435	\N	Perkowo Górne
6493	6435	\N	Podlesie
6494	6435	\N	Skalmierowice
6495	6435	\N	Suchatówka
6496	6435	\N	Szadłowice
6497	6435	\N	Szpital
6498	6435	\N	Truszczyzna
6499	6435	\N	Warzyn
6500	6435	\N	Wielowieś
6501	6435	\N	Wierzbiczany
6502	6435	\N	Wierzchosławice
6503	6435	\N	Więcławice
6504	6435	\N	Zajezierze
6505	6435	\N	Żyrosławice
6506	6433	\N	Balczewo
6507	6433	\N	Balin
6508	6433	\N	Batkowo
6509	6433	\N	Borkowo
6510	6433	\N	Cieślin
6511	6433	\N	Czyste
6512	6433	\N	Dulsk
6513	6433	\N	Dziennice
6514	6433	\N	Gnojno
6515	6433	\N	Góra
6516	6433	\N	Jacewo
6517	6433	\N	Jaksice
6518	6433	\N	Jaksiczki
6519	6433	\N	Jaronty
6520	6433	\N	Karczyn-Wieś
6521	6433	\N	Kłopot
6522	6433	\N	Komaszyce
6523	6433	\N	Krusza Duchowna
6524	6433	\N	Krusza Podlotowa
6525	6433	\N	Krusza Zamkowa
6526	6433	\N	Kruśliwiec
6527	6433	\N	Latkowo
6528	6433	\N	Łąkocin
6529	6433	\N	Łojewo
6530	6433	\N	Marcinkowo
6531	6433	\N	Marulewy
6532	6433	\N	Miechowice
6533	6433	\N	Mimowola
6534	6433	\N	Olszewice
6535	6433	\N	Oporówek
6536	6433	\N	Orłowo
6537	6433	\N	Ostrowo Krzyckie
6538	6433	\N	Piotrkowice
6539	6433	\N	Pławin
6540	6433	\N	Pławinek
6541	6433	\N	Popowice
6542	6433	\N	Radłówek
6543	6433	\N	Sikorowo
6544	6433	\N	Sławęcin
6545	6433	\N	Sławęcinek
6546	6433	\N	Słońsko
6547	6433	\N	Sójkowo
6548	6433	\N	Stefanowo
6549	6433	\N	Strzemkowo
6550	6433	\N	Szarlejskie Huby
6551	6433	\N	Trzaski
6552	6433	\N	Tupadły
6553	6433	\N	Turlejewo
6554	6433	\N	Turzany
6555	6433	\N	Witowy
6556	6433	\N	Żalinowo
6557	6436	\N	Janikowo
6558	6436	\N	Balice
6559	6436	\N	Broniewice
6560	6436	\N	Dębina
6561	6436	\N	Dębowo
6562	6436	\N	Dobieszewice
6563	6436	\N	Dobieszewiczki
6564	6436	\N	Głogówiec
6565	6436	\N	Góry
6566	6436	\N	Kołodziejewo
6567	6436	\N	Kołuda Mała
6568	6436	\N	Kołuda Wielka
6569	6436	\N	Ludzisko
6570	6436	\N	Nowe Osiedle
6571	6436	\N	Ołdrzychowo
6572	6436	\N	Pałuczyna
6573	6436	\N	Sielec
6574	6436	\N	Skalmierowice
6575	6436	\N	Sosnowiec
6576	6436	\N	Trląg
6577	6436	\N	Wierzejewice
6578	6437	\N	Kruszwica
6579	6437	\N	Arturowo
6580	6437	\N	Bachorce
6581	6437	\N	Baranowo
6582	6437	\N	Bródzki
6583	6437	\N	Brześć
6584	6437	\N	Chełmce
6585	6437	\N	Chełmiczki
6586	6437	\N	Chrosno
6587	6437	\N	Giżewo
6588	6437	\N	Głębokie
6589	6437	\N	Gocanowo
6590	6437	\N	Gocanówko
6591	6437	\N	Grodztwo
6592	6437	\N	Janikowo
6593	6437	\N	Janocin
6594	6437	\N	Janowice
6595	6437	\N	Karczyn
6596	6437	\N	Karsk
6597	6437	\N	Kicko
6598	6437	\N	Kobylnica
6599	6437	\N	Kobylniki
6600	6437	\N	Kraszyce
6601	6437	\N	Lachmirowice
6602	6437	\N	Lachmirowicki Potrzymiech
6603	6437	\N	Łagiewniki
6604	6437	\N	Maszenice
6605	6437	\N	Mietlica
6606	6437	\N	Morgi
6607	6437	\N	Orpikowo
6608	6437	\N	Ostrowo
6609	6437	\N	Ostrówek
6610	6437	\N	Papros
6611	6437	\N	Piaski
6612	6437	\N	Piecki
6613	6437	\N	Polanowice
6614	6437	\N	Popowo
6615	6437	\N	Przedbojewice
6616	6437	\N	Racice
6617	6437	\N	Rożniaty
6618	6437	\N	Rusinowo
6619	6437	\N	Rzepiszyn
6620	6437	\N	Rzepowo
6621	6437	\N	Skotniki
6622	6437	\N	Słabęcin
6623	6437	\N	Sławsk Wielki
6624	6437	\N	Sokolniki
6625	6437	\N	Sukowy
6626	6437	\N	Szarlej
6627	6437	\N	Tarnowo
6628	6437	\N	Tarnówko
6629	6437	\N	Witowice
6630	6437	\N	Witowiczki
6631	6437	\N	Wolany
6632	6437	\N	Wola Wapowska
6633	6437	\N	Wróble
6634	6437	\N	Zaborowo
6635	6437	\N	Zakupie
6636	6437	\N	Złotowo
6637	6437	\N	Żerniki
6638	6438	\N	Pakość
6639	6438	\N	Dziarnowo
6640	6438	\N	Giebnia
6641	6438	\N	Gorzany
6642	6438	\N	Jankowo
6643	6438	\N	Kościelec
6644	6438	\N	Leszczyce
6645	6438	\N	Ludkowo
6646	6438	\N	Ludwiniec
6647	6438	\N	Łącko
6648	6438	\N	Mielno
6649	6438	\N	Radłowo
6650	6438	\N	Rybitwy
6651	6438	\N	Rycerzewko
6652	6438	\N	Rycerzewo
6653	6438	\N	Węgierce
6654	6438	\N	Wielowieś
6655	6438	\N	Wojdal
6656	6439	\N	Bród Kamienny
6657	6439	\N	Budziaki
6658	6439	\N	Dąbie
6659	6439	\N	Dąbrowa Mała
6660	6439	\N	Dobiesławice
6661	6439	\N	Glinki
6662	6439	\N	Glinno Wielkie
6663	6439	\N	Jarki
6664	6439	\N	Jaszczołtowo
6665	6439	\N	Jezuicka Struga
6666	6439	\N	Jurańcice
6667	6439	\N	Leśnianki
6668	6439	\N	Liszkowice
6669	6439	\N	Liszkowo
6670	6439	\N	Magdaleniec
6671	6439	\N	Mierogoniewice
6672	6439	\N	Osieczek
6673	6439	\N	Osiek Wielki
6674	6439	\N	Płonkowo
6675	6439	\N	Płonkówko
6676	6439	\N	Rojewice
6677	6439	\N	Rojewo
6678	6439	\N	Stara Wieś
6679	6439	\N	Ściborze
6680	6439	\N	Topola
6681	6439	\N	Wybranowo
6682	6439	\N	Zawiszyn
6683	6439	\N	Żelechlin
6684	6440	\N	Będzitowo
6685	6440	\N	Będzitowskie Huby
6686	6440	\N	Będzitówek
6687	6440	\N	Broniewo
6688	6440	\N	Bronimierz Mały
6689	6440	\N	Bronimierz Wielki
6690	6440	\N	Dąbrówka Kujawska
6691	6440	\N	Dobrogościce
6692	6440	\N	Dźwierzchno
6693	6440	\N	Gniewkówiec
6694	6440	\N	Helenowo
6695	6440	\N	Ignacewo
6696	6440	\N	Jordanowo
6697	6440	\N	Julianowo
6698	6440	\N	Karczówka
6699	6440	\N	Kobelniki
6700	6440	\N	Krążkowo
6701	6440	\N	Krężoły
6702	6440	\N	Leszcze
6703	6440	\N	Lisewo Kościelne
6704	6440	\N	Mierzwin
6705	6440	\N	Niszczewice
6706	6440	\N	Palczyn
6707	6440	\N	Pęchowo
6708	6440	\N	Podgaj
6709	6440	\N	Popowiczki
6710	6440	\N	Rucewko
6711	6440	\N	Rucewo
6712	6440	\N	Tarkowo Górne
6713	6440	\N	Tuczno
6714	6440	\N	Tupadły
6715	6440	\N	Złotniki Kujawskie
6716	296	\N	Lipno
6717	296	\N	Bobrowniki
6718	296	\N	Chrostkowo
6719	296	\N	Dobrzyń nad Wisłą
6720	296	\N	Kikół
6721	296	\N	Skępe
6722	296	\N	Tłuchowo
6723	296	\N	Wielgie
6724	6716	\N	Lipno
6725	6717	\N	Białe Błota
6726	6717	\N	Bobrownickie Pole
6727	6717	\N	Bobrowniki
6728	6717	\N	Brzustowa
6729	6717	\N	Dębowiec
6730	6717	\N	Gnojno
6731	6717	\N	Nowy Bógpomóż
6732	6717	\N	Oparczyska
6733	6717	\N	Polichnowo
6734	6717	\N	Rachcin
6735	6717	\N	Stara Rzeczna
6736	6717	\N	Stare Rybitwy
6737	6717	\N	Stary Bógpomóż
6738	6717	\N	Winduga
6739	6718	\N	Adamowo
6740	6718	\N	Bruziek
6741	6718	\N	Chojno
6742	6718	\N	Chrostkowo
6743	6718	\N	Głęboczek
6744	6718	\N	Gołuchowo
6745	6718	\N	Janiszewo
6746	6718	\N	Kawno
6747	6718	\N	Ksawery
6748	6718	\N	Lubianki
6749	6718	\N	Majdany
6750	6718	\N	Makowiec
6751	6718	\N	Nowa Wieś
6752	6718	\N	Nowe Chrostkowo
6753	6718	\N	Sikórz
6754	6718	\N	Stalmierz
6755	6718	\N	Wildno
6756	6719	\N	Dobrzyń nad Wisłą
6757	6719	\N	Bachorzewo
6758	6719	\N	Chalin
6759	6719	\N	Chudzewo
6760	6719	\N	Czartowo
6761	6719	\N	Dyblin
6762	6719	\N	Glewo
6763	6719	\N	Główczyn
6764	6719	\N	Grochowalsk
6765	6719	\N	Kamienica
6766	6719	\N	Kisielewo
6767	6719	\N	Kochoń
6768	6719	\N	Kolonia Chalin
6769	6719	\N	Krępa
6770	6719	\N	Krojczyn
6771	6719	\N	Lenie Wielkie
6772	6719	\N	Łagiewniki
6773	6719	\N	Michałkowo
6774	6719	\N	Mokowo
6775	6719	\N	Mokówko
6776	6719	\N	Mokre
6777	6719	\N	Płomiany
6778	6719	\N	Ruszkowo
6779	6719	\N	Skaszewo
6780	6719	\N	Strachoń
6781	6719	\N	Stróżewo
6782	6719	\N	Szpiegowo
6783	6719	\N	Tulibowo
6784	6719	\N	Wierznica
6785	6719	\N	Wierzniczka
6786	6719	\N	Zbyszewo
6787	6720	\N	Ciełuchowo
6788	6720	\N	Dąbrówka
6789	6720	\N	Grodzeń
6790	6720	\N	Hornówek
6791	6720	\N	Janowo
6792	6720	\N	Jarczechowo
6793	6720	\N	Kikół
6794	6720	\N	Kikół-Wieś
6795	6720	\N	Kołat-Rybniki
6796	6720	\N	Konotopie
6797	6720	\N	Lubin
6798	6720	\N	Moszczonne
6799	6720	\N	Niedźwiedź
6800	6720	\N	Sumin
6801	6720	\N	Trutowo
6802	6720	\N	Walentowo
6803	6720	\N	Wawrzonkowo
6804	6720	\N	Wola
6805	6720	\N	Wolęcin
6806	6720	\N	Wymyślin
6807	6720	\N	Zajeziorze
6808	6716	\N	Aleksandrowo
6809	6716	\N	Barany
6810	6716	\N	Białowieżyn
6811	6716	\N	Biskupin
6812	6716	\N	Borek
6813	6716	\N	Brzeźno
6814	6716	\N	Chlebowo
6815	6716	\N	Chodorążek
6816	6716	\N	Drozdowiec
6817	6716	\N	Elzanowo
6818	6716	\N	Głodowo
6819	6716	\N	Głogi
6820	6716	\N	Grabiny
6821	6716	\N	Huta Głodowska
6822	6716	\N	Ignackowo
6823	6716	\N	Jankowo
6824	6716	\N	Jastrzębie
6825	6716	\N	Karnkowo
6826	6716	\N	Karnkowskie Rumunki
6827	6716	\N	Kłokock
6828	6716	\N	Kolankowo
6829	6716	\N	Komorowo
6830	6716	\N	Krzyżówki
6831	6716	\N	Łochocin
6832	6716	\N	Maliszewo
6833	6716	\N	Okrąg
6834	6716	\N	Ostrowite
6835	6716	\N	Ostrowitko
6836	6716	\N	Ośmiałowo
6837	6716	\N	Piątki
6838	6716	\N	Popowo
6839	6716	\N	Pólko
6840	6716	\N	Radomice
6841	6716	\N	Rumunki Głodowskie
6842	6716	\N	Rumunki Podgłodowskie
6843	6716	\N	Ryszewek
6844	6716	\N	Suradowo
6845	6716	\N	Tomaszewo
6846	6716	\N	Trzebiegoszcz
6847	6716	\N	Wąkole
6848	6716	\N	Wichowo
6849	6716	\N	Wierzbick
6850	6716	\N	Zbytkowo
6851	6716	\N	Złotopole
6852	6716	\N	Żabieniec
6853	6721	\N	Skępe
6854	6721	\N	Babie Ławy
6855	6721	\N	Boguchwała
6856	6721	\N	Czarny Las
6857	6721	\N	Czermno
6858	6721	\N	Franciszkowo
6859	6721	\N	Głęboczek
6860	6721	\N	Gorzeszyn
6861	6721	\N	Grabówiec
6862	6721	\N	Guzowatka
6863	6721	\N	Huta
6864	6721	\N	Jarczewo
6865	6721	\N	Józefkowo
6866	6721	\N	Kamienica
6867	6721	\N	Kierz
6868	6721	\N	Koziołek
6869	6721	\N	Kukowo
6870	6721	\N	Likiec
6871	6721	\N	Lubówiec
6872	6721	\N	Ławiczek
6873	6721	\N	Łąkie
6874	6721	\N	Mała Wólka
6875	6721	\N	Moczadła
6876	6721	\N	Modrzewie
6877	6721	\N	Narutowo
6878	6721	\N	Obóz
6879	6721	\N	Pokrzywnik
6880	6721	\N	Radziochy
6881	6721	\N	Rumunki Skępskie
6882	6721	\N	Sarnowo
6883	6721	\N	Szczekarzewo
6884	6721	\N	Turka
6885	6721	\N	Wioska
6886	6721	\N	Wólka
6887	6721	\N	Zajeziorze
6888	6721	\N	Żagno
6889	6721	\N	Żuchowo
6890	6722	\N	Borowo
6891	6722	\N	Jasień
6892	6722	\N	Julkowo
6893	6722	\N	Kamień Kmiecy
6894	6722	\N	Kamień Kotowy
6895	6722	\N	Kłobukowo
6896	6722	\N	Koziróg Leśny
6897	6722	\N	Koziróg Rzeczny
6898	6722	\N	Małomin
6899	6722	\N	Marianki
6900	6722	\N	Michałkowo
6901	6722	\N	Mysłakowo
6902	6722	\N	Mysłakówko
6903	6722	\N	Nowa Turza
6904	6722	\N	Podole
6905	6722	\N	Popowo
6906	6722	\N	Rumunki Jasieńskie
6907	6722	\N	Suminek
6908	6722	\N	Tłuchowo
6909	6722	\N	Tłuchówek
6910	6722	\N	Trzcianka
6911	6722	\N	Turza Wilcza
6912	6722	\N	Wyczałkowo
6913	6722	\N	Źródła
6914	6723	\N	Bałdowo
6915	6723	\N	Będzeń
6916	6723	\N	Bętlewo
6917	6723	\N	Czarne
6918	6723	\N	Czerskie Rumunki
6919	6723	\N	Kamienne Brody
6920	6723	\N	Lipiny
6921	6723	\N	Nowa Wieś
6922	6723	\N	Oleszno
6923	6723	\N	Orłowo
6924	6723	\N	Piaseczno
6925	6723	\N	Płonczyn
6926	6723	\N	Płonczynek
6927	6723	\N	Podkłokock
6928	6723	\N	Rumunki Oleszeńskie
6929	6723	\N	Rumunki Tupadelskie
6930	6723	\N	Rumunki Witkowskie
6931	6723	\N	Suradówek
6932	6723	\N	Suszewo
6933	6723	\N	Szczepanki
6934	6723	\N	Teodorowo
6935	6723	\N	Tupadły
6936	6723	\N	Wielgie
6937	6723	\N	Witkowo
6938	6723	\N	Wylazłowo
6939	6723	\N	Zaduszniki
6940	6723	\N	Zakrzewo
6941	6723	\N	Złowody
6942	297	\N	Dąbrowa
6943	297	\N	Jeziora Wielkie
6944	297	\N	Mogilno
6945	297	\N	Strzelno
6946	6942	\N	Białe Błota
6947	6942	\N	Błonie
6948	6942	\N	Broniewiczki
6949	6942	\N	Dąbrowa
6950	6942	\N	Krzekotowo
6951	6942	\N	Mierucin
6952	6942	\N	Mierucinek
6953	6942	\N	Mokre
6954	6942	\N	Parlin
6955	6942	\N	Parlinek
6956	6942	\N	Sędowo
6957	6942	\N	Sędówko
6958	6942	\N	Słaboszewko
6959	6942	\N	Słaboszewo
6960	6942	\N	Sucharzewo
6961	6942	\N	Szczepankowo
6962	6942	\N	Szczepanowo
6963	6942	\N	Szubinek
6964	6943	\N	Babki
6965	6943	\N	Berlinek
6966	6943	\N	Budy
6967	6943	\N	Dobsko
6968	6943	\N	Gaj
6969	6943	\N	Golejewo
6970	6943	\N	Gopło
6971	6943	\N	Jeziora Małe
6972	6943	\N	Jeziora Wielkie
6973	6943	\N	Kościeszki
6974	6943	\N	Kozie Doły
6975	6943	\N	Kożuszkowo
6976	6943	\N	Krzywe Kolano
6977	6943	\N	Kuśnierz
6978	6943	\N	Lenartowo
6979	6943	\N	Lubstówek
6980	6943	\N	Nowa Wieś
6981	6943	\N	Nożyczyn
6982	6943	\N	Pomiany
6983	6943	\N	Potrzymiech Rzeszynkowski
6984	6943	\N	Potrzymiech Siemioński
6985	6943	\N	Proszyska
6986	6943	\N	Przyjezierze
6987	6943	\N	Radunek
6988	6943	\N	Rzeszyn
6989	6943	\N	Rzeszynek
6990	6943	\N	Siedlimowo
6991	6943	\N	Siemionki
6992	6943	\N	Sierakowo
6993	6943	\N	Włostowo
6994	6943	\N	Wola Kożuszkowa
6995	6943	\N	Wójcin
6996	6943	\N	Wycinki
6997	6943	\N	Wysoki Most
6998	6943	\N	Żółwiny
6999	6944	\N	Mogilno
7000	6944	\N	Baba
7001	6944	\N	Babka
7002	6944	\N	Bąbowo
7003	6944	\N	Białotul
7004	6944	\N	Bielice
7005	6944	\N	Bystrzyca
7006	6944	\N	Bzówiec
7007	6944	\N	Chabsko
7008	6944	\N	Chałupska
7009	6944	\N	Chwałowo
7010	6944	\N	Czaganiec
7011	6944	\N	Czarne Olendry
7012	6944	\N	Czarnotul
7013	6944	\N	Czerniak
7014	6944	\N	Dąbrówka
7015	6944	\N	Dębno
7016	6944	\N	Dzierzążno
7017	6944	\N	Gębice
7018	6944	\N	Głęboczek
7019	6944	\N	Goryszewo
7020	6944	\N	Gozdanin
7021	6944	\N	Gozdawa
7022	6944	\N	Góra
7023	6944	\N	Huta Padniewska
7024	6944	\N	Huta Palędzka
7025	6944	\N	Iskra
7026	6944	\N	Izdby
7027	6944	\N	Jerkowo
7028	6944	\N	Józefowo
7029	6944	\N	Kamionek
7030	6944	\N	Kątno
7031	6944	\N	Kołodziejewko
7032	6944	\N	Kopce
7033	6944	\N	Kopczyn
7034	6944	\N	Krzyżanna
7035	6944	\N	Krzyżownica
7036	6944	\N	Kunowo
7037	6944	\N	Kunowo Kujawskie
7038	6944	\N	Kwieciszewo
7039	6944	\N	Leśnik
7040	6944	\N	Lubieszewo
7041	6944	\N	Łosośniki
7042	6944	\N	Marcinkowo
7043	6944	\N	Mielenko
7044	6944	\N	Mielno
7045	6944	\N	Morasy
7046	6944	\N	Niestronno
7047	6944	\N	Olsza
7048	6944	\N	Padniewko
7049	6944	\N	Padniewo
7050	6944	\N	Palędzie Dolne
7051	6944	\N	Palędzie Kościelne
7052	6944	\N	Płaczkówko
7053	6944	\N	Popielary
7054	6944	\N	Procyń
7055	6944	\N	Przyjma
7056	6944	\N	Ratowo
7057	6944	\N	Sadowiec
7058	6944	\N	Siedluchna
7059	6944	\N	Skrzeszewo
7060	6944	\N	Stary Gaj
7061	6944	\N	Stawiska
7062	6944	\N	Strzelce
7063	6944	\N	Szczeglin
7064	6944	\N	Szerzawy
7065	6944	\N	Szydłówko
7066	6944	\N	Świerkówiec
7067	6944	\N	Targownica
7068	6944	\N	Twierdziń
7069	6944	\N	Urlikowo
7070	6944	\N	Wasielewko
7071	6944	\N	Wiecanowo
7072	6944	\N	Wieniec
7073	6944	\N	Wszedzień
7074	6944	\N	Wylatowo
7075	6944	\N	Wymysłowo Szlacheckie
7076	6944	\N	Wyrobki
7077	6944	\N	Zazdrość
7078	6944	\N	Zbytowo
7079	6944	\N	Żabienko
7080	6944	\N	Żabno
7081	6945	\N	Strzelno
7082	6945	\N	Bławatki
7083	6945	\N	Bławaty
7084	6945	\N	Bożejewice
7085	6945	\N	Bronisław
7086	6945	\N	Busewo
7087	6945	\N	Ciechrz
7088	6945	\N	Ciencisko
7089	6945	\N	Górki
7090	6945	\N	Jaworowo
7091	6945	\N	Jeziorki
7092	6945	\N	Kijewice
7093	6945	\N	Kopanie
7094	6945	\N	Książ
7095	6945	\N	Łąkie
7096	6945	\N	Markowice
7097	6945	\N	Międzybór
7098	6945	\N	Miradz
7099	6945	\N	Mirosławice
7100	6945	\N	Młynice
7101	6945	\N	Młyny
7102	6945	\N	Niemojewko
7103	6945	\N	Ostrowo
7104	6945	\N	Przedbórz
7105	6945	\N	Rzadkwin
7106	6945	\N	Sławsko Dolne
7107	6945	\N	Starczewo
7108	6945	\N	Stodoły
7109	6945	\N	Stodólno
7110	6945	\N	Strzelno Klasztorne
7111	6945	\N	Witkowo
7112	6945	\N	Wronowy
7113	6945	\N	Wymysłowice
7114	6945	\N	Wymysłowo
7115	6945	\N	Żegotki
7116	298	\N	Kcynia
7117	298	\N	Mrocza
7118	298	\N	Nakło nad Notecią
7119	298	\N	Sadki
7120	298	\N	Szubin
7121	7116	\N	Kcynia
7122	7116	\N	Bąk
7123	7116	\N	Chwaliszewo
7124	7116	\N	Czerwoniak
7125	7116	\N	Dębogóra
7126	7116	\N	Dębogórski Młyn
7127	7116	\N	Dobieszewko
7128	7116	\N	Dobieszewo
7129	7116	\N	Dziewierzewo
7130	7116	\N	Elizewo
7131	7116	\N	Głogowiniec
7132	7116	\N	Górki Dąbskie
7133	7116	\N	Górki Zagajne
7134	7116	\N	Grocholin
7135	7116	\N	Gromadno
7136	7116	\N	Iwno
7137	7116	\N	Józefkowo
7138	7116	\N	Karmelita
7139	7116	\N	Karolinowo
7140	7116	\N	Kazimierzewo
7141	7116	\N	Kocewka
7142	7116	\N	Kowalewko
7143	7116	\N	Kowalewko-Folwark
7144	7116	\N	Krzepiszyn
7145	7116	\N	Laskownica
7146	7116	\N	Ludwikowo
7147	7116	\N	Łankowice
7148	7116	\N	Malice
7149	7116	\N	Miaskowo
7150	7116	\N	Miastowice
7151	7116	\N	Mieczkowo
7152	7116	\N	Mycielewo
7153	7116	\N	Nowa Wieś Notecka
7154	7116	\N	Palmierowo
7155	7116	\N	Paulina
7156	7116	\N	Piotrowo
7157	7116	\N	Rozpętek
7158	7116	\N	Rozstrzębowo
7159	7116	\N	Rzemieniewice
7160	7116	\N	Sierniki
7161	7116	\N	Sipiory
7162	7116	\N	Skórzewo
7163	7116	\N	Słupowa
7164	7116	\N	Słupowiec
7165	7116	\N	Smogulecka Wieś
7166	7116	\N	Stalówka
7167	7116	\N	Studzienki
7168	7116	\N	Suchoręcz
7169	7116	\N	Suchoręczek
7170	7116	\N	Szczepice
7171	7116	\N	Tupadły
7172	7116	\N	Turzyn
7173	7116	\N	Ujazd
7174	7116	\N	Weronika
7175	7116	\N	Włodzimierzewo
7176	7116	\N	Zabłocie
7177	7116	\N	Żarczyn
7178	7116	\N	Żurawia
7179	7117	\N	Mrocza
7180	7117	\N	Białowieża
7181	7117	\N	Chwałka
7182	7117	\N	Dąbrowice
7183	7117	\N	Drążno
7184	7117	\N	Drążonek
7185	7117	\N	Drzewianowo
7186	7117	\N	Izabela
7187	7117	\N	Jadwigowo
7188	7117	\N	Janowo
7189	7117	\N	Jeziorki Zabartowskie
7190	7117	\N	Kaźmierzewo
7191	7117	\N	Konstantowo
7192	7117	\N	Kosowo
7193	7117	\N	Kozia Góra Krajeńska
7194	7117	\N	Krukówko
7195	7117	\N	Matyldzin
7196	7117	\N	Modrakowo
7197	7117	\N	Orle
7198	7117	\N	Orlinek
7199	7117	\N	Ostrowo
7200	7117	\N	Podgórz
7201	7117	\N	Rajgród
7202	7117	\N	Rościmin
7203	7117	\N	Samsieczynek
7204	7117	\N	Słupówko
7205	7117	\N	Wiele
7206	7117	\N	Witosław
7207	7117	\N	Wyrza
7208	7117	\N	Zdrogowo
7209	7118	\N	Nakło nad Notecią
7210	7118	\N	Anielin
7211	7118	\N	Bielawy
7212	7118	\N	Bogacin
7213	7118	\N	Chrząstowo
7214	7118	\N	Elżbiecin
7215	7118	\N	Gabrielin
7216	7118	\N	Gorzeń
7217	7118	\N	Gumnowice
7218	7118	\N	Janowo
7219	7118	\N	Karnowo
7220	7118	\N	Karnówko
7221	7118	\N	Kazin
7222	7118	\N	Lubaszcz
7223	7118	\N	Małocin
7224	7118	\N	Michalin
7225	7118	\N	Minikowo
7226	7118	\N	Niedola
7227	7118	\N	Olszewka
7228	7118	\N	Paterek
7229	7118	\N	Piętacz
7230	7118	\N	Polichno
7231	7118	\N	Potulice
7232	7118	\N	Rozwarzyn
7233	7118	\N	Suchary
7234	7118	\N	Ślesin
7235	7118	\N	Trzeciewnica
7236	7118	\N	Urszulin
7237	7118	\N	Wieszki
7238	7118	\N	Występ
7239	7119	\N	Anieliny
7240	7119	\N	Bnin
7241	7119	\N	Borek
7242	7119	\N	Broniewo
7243	7119	\N	Dębionek
7244	7119	\N	Dębowo
7245	7119	\N	Glinki
7246	7119	\N	Jadwiżyn
7247	7119	\N	Kraczki
7248	7119	\N	Liszkówko
7249	7119	\N	Łodzia
7250	7119	\N	Machowo
7251	7119	\N	Mrozowo
7252	7119	\N	Ostrówiec
7253	7119	\N	Pólko
7254	7119	\N	Radzicz
7255	7119	\N	Sadki
7256	7119	\N	Sadkowski Młyn
7257	7119	\N	Samostrzel
7258	7119	\N	Śmielin
7259	7119	\N	Wybitowo
7260	7120	\N	Szubin
7261	7120	\N	Ameryczka
7262	7120	\N	Brzózki
7263	7120	\N	Chobielin
7264	7120	\N	Chomętowo
7265	7120	\N	Chraplewo
7266	7120	\N	Ciężkowo
7267	7120	\N	Dąbrowa
7268	7120	\N	Dąbrówka Słupska
7269	7120	\N	Drogosław
7270	7120	\N	Gąbin
7271	7120	\N	Głęboczek
7272	7120	\N	Godzimierz
7273	7120	\N	Grzeczna Panna
7274	7120	\N	Jeziorowo
7275	7120	\N	Kołaczkowo
7276	7120	\N	Kornelin
7277	7120	\N	Kowalewo
7278	7120	\N	Królikowo
7279	7120	\N	Łachowo
7280	7120	\N	Małe Rudy
7281	7120	\N	Mąkoszyn
7282	7120	\N	Niedźwiady
7283	7120	\N	Olek
7284	7120	\N	Pińsko
7285	7120	\N	Retkowo
7286	7120	\N	Rynarzewo
7287	7120	\N	Rzemieniewice
7288	7120	\N	Samoklęski Duże
7289	7120	\N	Samoklęski Małe
7290	7120	\N	Siedliska
7291	7120	\N	Skórzewo
7292	7120	\N	Słonawy
7293	7120	\N	Słupy
7294	7120	\N	Smarzykowo
7295	7120	\N	Smolniki
7296	7120	\N	Stanisławka
7297	7120	\N	Stary Jarużyn
7298	7120	\N	Szaradowo
7299	7120	\N	Szkocja
7300	7120	\N	Szubin-Wieś
7301	7120	\N	Tur
7302	7120	\N	Wąsosz
7303	7120	\N	Wolwark
7304	7120	\N	Wrzosy
7305	7120	\N	Wymysłowo
7306	7120	\N	Zalesie
7307	7120	\N	Zamość
7308	7120	\N	Zazdrość
7309	7120	\N	Zielonowo
7310	7120	\N	Żędowo
7311	7120	\N	Żurczyn
7312	299	\N	Radziejów
7313	299	\N	Bytoń
7314	299	\N	Dobre
7315	299	\N	Osięciny
7316	299	\N	Piotrków Kujawski
7317	299	\N	Topólka
7318	7312	\N	Radziejów
7319	7313	\N	Borowo
7320	7313	\N	Brylewo
7321	7313	\N	Budzisław
7322	7313	\N	Bytoń
7323	7313	\N	Czarnocice
7324	7313	\N	Dąbrowa
7325	7313	\N	Dąbrówka
7326	7313	\N	Faliszewo
7327	7313	\N	Głuszyn
7328	7313	\N	Góry Witowskie
7329	7313	\N	Grodziska
7330	7313	\N	Holendry Bytońskie
7331	7313	\N	Litychowo
7332	7313	\N	Ludwikowo
7333	7313	\N	Morzyce
7334	7313	\N	Nasiłowo
7335	7313	\N	Niegibalice
7336	7313	\N	Nowe Witowo
7337	7313	\N	Nowy Dwór
7338	7313	\N	Oszczywilk
7339	7313	\N	Potołówek
7340	7313	\N	Pścinek
7341	7313	\N	Pścinno
7342	7313	\N	Sokołowo
7343	7313	\N	Stefanowo
7344	7313	\N	Stróżewo
7345	7313	\N	Świesz
7346	7313	\N	Wandynowo
7347	7313	\N	Witowo
7348	7313	\N	Witowo-Kolonia
7349	7314	\N	Altana
7350	7314	\N	Bodzanowo
7351	7314	\N	Bodzanowo Drugie
7352	7314	\N	Borowo
7353	7314	\N	Bronisław
7354	7314	\N	Byczyna
7355	7314	\N	Byczyna-Kolonia
7356	7314	\N	Czołpin
7357	7314	\N	Dęby
7358	7314	\N	Dobre
7359	7314	\N	Dobre-Kolonia
7360	7314	\N	Dobre-Wieś
7361	7314	\N	Kłonowo
7362	7314	\N	Koszczały
7363	7314	\N	Krzywosądz
7364	7314	\N	Ludwikowo
7365	7314	\N	Morawy
7366	7314	\N	Narkowo
7367	7314	\N	Przysiek
7368	7314	\N	Smarglin
7369	7314	\N	Szczeblotowo
7370	7314	\N	Ułomie
7371	7315	\N	Bartłomiejowice
7372	7315	\N	Bełszewo
7373	7315	\N	Bełszewo-Kolonia
7374	7315	\N	Bilno
7375	7315	\N	Bodzanówek
7376	7315	\N	Borucin
7377	7315	\N	Borucinek
7378	7315	\N	Jarantowice
7379	7315	\N	Konary
7380	7315	\N	Kościelna Wieś
7381	7315	\N	Krotoszyn
7382	7315	\N	Latkowo
7383	7315	\N	Lekarzewice
7384	7315	\N	Leonowo
7385	7315	\N	Nagórki
7386	7315	\N	Osięciny
7387	7315	\N	Osłonki
7388	7315	\N	Pieńki Kościelskie
7389	7315	\N	Pilichowo
7390	7315	\N	Pocierzyn
7391	7315	\N	Powałkowice
7392	7315	\N	Pułkownikowo
7393	7315	\N	Ruszki
7394	7315	\N	Samszyce
7395	7315	\N	Sęczkowo
7396	7315	\N	Szalonki
7397	7315	\N	Ujma Mała
7398	7315	\N	Witoldowo
7399	7315	\N	Włodzimierka
7400	7315	\N	Wola Skarbkowa
7401	7315	\N	Zagajewice
7402	7315	\N	Zblęg
7403	7315	\N	Zielińsk
7404	7315	\N	Żakowice
7405	7316	\N	Piotrków Kujawski
7406	7316	\N	Anusin
7407	7316	\N	Bycz
7408	7316	\N	Byszewo
7409	7316	\N	Czarnotka
7410	7316	\N	Dębołęka
7411	7316	\N	Gradowo
7412	7316	\N	Higieniewo
7413	7316	\N	Jerzyce
7414	7316	\N	Józefowo
7415	7316	\N	Kaczewo
7416	7316	\N	Kaspral
7417	7316	\N	Katarzyna
7418	7316	\N	Kozy
7419	7316	\N	Krogulec
7420	7316	\N	Leszcze
7421	7316	\N	Lubsin
7422	7316	\N	Łabędzin
7423	7316	\N	Łączki
7424	7316	\N	Malina
7425	7316	\N	Nowa Wieś
7426	7316	\N	Palczewo
7427	7316	\N	Połajewek
7428	7316	\N	Połajewo
7429	7316	\N	Przedłuż
7430	7316	\N	Przewóz
7431	7316	\N	Rogalin
7432	7316	\N	Rudzk Duży
7433	7316	\N	Rudzk Mały
7434	7316	\N	Rzeczyca
7435	7316	\N	Rzepiska
7436	7316	\N	Sokoły
7437	7316	\N	Stawiska
7438	7316	\N	Szewce
7439	7316	\N	Świątniki
7440	7316	\N	Teodorowo
7441	7316	\N	Trojaczek
7442	7316	\N	Wąsewo
7443	7316	\N	Wincentowo
7444	7316	\N	Wójcin
7445	7316	\N	Zakręta
7446	7316	\N	Zborowczyk
7447	7316	\N	Zborowiec
7448	7312	\N	Bieganowo
7449	7312	\N	Biskupice
7450	7312	\N	Broniewek
7451	7312	\N	Broniewo
7452	7312	\N	Czołowo
7453	7312	\N	Czołówek
7454	7312	\N	Kłonówek
7455	7312	\N	Kwilno
7456	7312	\N	Leonowo
7457	7312	\N	Opatowice
7458	7312	\N	Piołunowo
7459	7312	\N	Plebanka
7460	7312	\N	Płowce
7461	7312	\N	Płowce Drugie
7462	7312	\N	Pruchnowo
7463	7312	\N	Przemystka
7464	7312	\N	Skibin
7465	7312	\N	Stara Kolonia
7466	7312	\N	Stare Płowki
7467	7312	\N	Stary Radziejów
7468	7312	\N	Szostka Duża
7469	7312	\N	Szostka Mała
7470	7312	\N	Tarnówka
7471	7312	\N	Wąsewo
7472	7312	\N	Zagorzyce
7473	7317	\N	Bielki
7474	7317	\N	Borek
7475	7317	\N	Chalno
7476	7317	\N	Chalno-Parcele
7477	7317	\N	Czamanin
7478	7317	\N	Czamaninek
7479	7317	\N	Czamanin-Kolonia
7480	7317	\N	Dębianki
7481	7317	\N	Galonki
7482	7317	\N	Gawroniec
7483	7317	\N	Głuszynek
7484	7317	\N	Iłowo
7485	7317	\N	Jurkowo
7486	7317	\N	Kamieniec
7487	7317	\N	Kamieńczyk
7488	7317	\N	Karczówek
7489	7317	\N	Kozjaty
7490	7317	\N	Miałkie
7491	7317	\N	Miłachówek
7492	7317	\N	Opielanka
7493	7317	\N	Orle
7494	7317	\N	Paniewek
7495	7317	\N	Paniewo
7496	7317	\N	Rogalki
7497	7317	\N	Rybiny
7498	7317	\N	Rybiny Leśne
7499	7317	\N	Sadłóg
7500	7317	\N	Sadłóżek
7501	7317	\N	Sierakowy
7502	7317	\N	Świerczyn
7503	7317	\N	Świerczynek
7504	7317	\N	Świnki
7505	7317	\N	Topólka
7506	7317	\N	Torzewo
7507	7317	\N	Wola Jurkowa
7508	7317	\N	Wyrobki
7509	7317	\N	Zgniły Głuszynek
7510	7317	\N	Znaniewo
7511	7317	\N	Żabiniec
7512	300	\N	Rypin
7513	300	\N	Brzuze
7514	300	\N	Rogowo
7515	300	\N	Skrwilno
7516	300	\N	Wąpielsk
7517	7512	\N	Rypin
7518	7513	\N	Brzuze
7519	7513	\N	Dobre
7520	7513	\N	Duszoty
7521	7513	\N	Giżynek
7522	7513	\N	Gulbiny
7523	7513	\N	Julianowo
7524	7513	\N	Kleszczyn
7525	7513	\N	Krystianowo
7526	7513	\N	Łączonek
7527	7513	\N	Marianowo
7528	7513	\N	Mościska
7529	7513	\N	Okonin
7530	7513	\N	Ostrowite
7531	7513	\N	Piskorczyn
7532	7513	\N	Przyrowa
7533	7513	\N	Radzynek
7534	7513	\N	Somsiory
7535	7513	\N	Trąbin-Rumunki
7536	7513	\N	Trąbin-Wieś
7537	7513	\N	Ugoszcz
7538	7513	\N	Żałe
7539	7514	\N	Borowo
7540	7514	\N	Brzeszczki Duże
7541	7514	\N	Brzeszczki Małe
7542	7514	\N	Charszewo
7543	7514	\N	Czumsk Duży
7544	7514	\N	Czumsk Mały
7545	7514	\N	Huta
7546	7514	\N	Huta-Chojno
7547	7514	\N	Karbowizna
7548	7514	\N	Kordyszewo
7549	7514	\N	Korzeniewo
7550	7514	\N	Kosiory
7551	7514	\N	Lasoty
7552	7514	\N	Lisiny
7553	7514	\N	Ławki
7554	7514	\N	Nadróż
7555	7514	\N	Narty
7556	7514	\N	Nowy Kobrzyniec
7557	7514	\N	Pinino
7558	7514	\N	Pręczki
7559	7514	\N	Reszki
7560	7514	\N	Rogowo
7561	7514	\N	Rogówko
7562	7514	\N	Rojewo
7563	7514	\N	Ruda
7564	7514	\N	Rumunki Likieckie
7565	7514	\N	Seperak
7566	7514	\N	Sosnowo
7567	7514	\N	Stary Kobrzyniec
7568	7514	\N	Szczerby
7569	7514	\N	Świeżawy
7570	7514	\N	Tartak
7571	7514	\N	Urszulewo
7572	7514	\N	Wierzchowiska
7573	7514	\N	Zamość
7574	7514	\N	Zasadki
7575	7512	\N	Balin
7576	7512	\N	Borzymin
7577	7512	\N	Cetki
7578	7512	\N	Czyżewo
7579	7512	\N	Dębiany
7580	7512	\N	Dylewo
7581	7512	\N	Głowińsk
7582	7512	\N	Godziszewy
7583	7512	\N	Iwany
7584	7512	\N	Jasin
7585	7512	\N	Kowalki
7586	7512	\N	Kwiatkowo
7587	7512	\N	Linne
7588	7512	\N	Ławy
7589	7512	\N	Marianki
7590	7512	\N	Nowe Sadłowo
7591	7512	\N	Podole
7592	7512	\N	Puszcza Miejska
7593	7512	\N	Puszcza Rządowa
7594	7512	\N	Rakowo
7595	7512	\N	Rusinowo
7596	7512	\N	Rypałki Prywatne
7597	7512	\N	Sadłowo
7598	7512	\N	Sadłowo-Rumunki
7599	7512	\N	Sikory
7600	7512	\N	Starorypin Prywatny
7601	7512	\N	Starorypin Rządowy
7602	7512	\N	Stawiska
7603	7512	\N	Stępowo
7604	7512	\N	Zakrocz
7605	7515	\N	Baba
7606	7515	\N	Baranie Góry
7607	7515	\N	Borki
7608	7515	\N	Budziska
7609	7515	\N	Czarnia Duża
7610	7515	\N	Czarnia Mała
7611	7515	\N	Czerwonka
7612	7515	\N	Gumowszczyzna
7613	7515	\N	Karczemka
7614	7515	\N	Klepczarnia
7615	7515	\N	Kotowy
7616	7515	\N	Modlin
7617	7515	\N	Mościska
7618	7515	\N	Niemcowizna
7619	7515	\N	Niemcowizna Okalewska
7620	7515	\N	Niemcowizna Szustkowska
7621	7515	\N	Nowe Skudzawy
7622	7515	\N	Nowy Młyn
7623	7515	\N	Okalewo
7624	7515	\N	Otocznia
7625	7515	\N	Przywitowo
7626	7515	\N	Rak
7627	7515	\N	Ruda
7628	7515	\N	Skrwilno
7629	7515	\N	Skudzawy
7630	7515	\N	Szczawno
7631	7515	\N	Szucie
7632	7515	\N	Szucie Okalewskie
7633	7515	\N	Szustek
7634	7515	\N	Toki
7635	7515	\N	Urszulewo
7636	7515	\N	Warszawka
7637	7515	\N	Warszawka-Kolonia
7638	7515	\N	Wólka
7639	7515	\N	Zambrzyca
7640	7515	\N	Zofiewo
7641	7516	\N	Bielawki
7642	7516	\N	Chorab
7643	7516	\N	Długie
7644	7516	\N	Kiełpiny
7645	7516	\N	Kierz Półwieski
7646	7516	\N	Kierz Radzikowski
7647	7516	\N	Kupno
7648	7516	\N	Lamkowizna
7649	7516	\N	Łapinóżek
7650	7516	\N	Łapinóż-Rumunki
7651	7516	\N	Półwiesk Duży
7652	7516	\N	Półwiesk Mały
7653	7516	\N	Radziki Duże
7654	7516	\N	Radziki Małe
7655	7516	\N	Ruszkowo
7656	7516	\N	Tomkowo
7657	7516	\N	Wąpielsk
7658	301	\N	Kamień Krajeński
7659	301	\N	Sępólno Krajeńskie
7660	301	\N	Sośno
7661	301	\N	Więcbork
7662	7658	\N	Kamień Krajeński
7663	7658	\N	Dąbrowa
7664	7658	\N	Dąbrówka
7665	7658	\N	Duża Cerkwica
7666	7658	\N	Jerzmionki
7667	7658	\N	Mała Cerkwica
7668	7658	\N	Niwy
7669	7658	\N	Nowa Wieś
7670	7658	\N	Obkas
7671	7658	\N	Orzełek
7672	7658	\N	Osady Jerzmionckie
7673	7658	\N	Płocicz
7674	7658	\N	Radzim
7675	7658	\N	Witkowo
7676	7658	\N	Witkowski Młyn
7677	7658	\N	Zamarte
7678	7659	\N	Sępólno Krajeńskie
7679	7659	\N	Chmielniki
7680	7659	\N	Diabli Kąt
7681	7659	\N	Dziechowo
7682	7659	\N	Firlant
7683	7659	\N	Gaj
7684	7659	\N	Grochowiec
7685	7659	\N	Iłowo
7686	7659	\N	Jazdrowo
7687	7659	\N	Kacze Doły
7688	7659	\N	Kacze Raje
7689	7659	\N	Kawle
7690	7659	\N	Komierowo
7691	7659	\N	Komierówko
7692	7659	\N	Lutowo
7693	7659	\N	Lutówko
7694	7659	\N	Lutówko-Młyn
7695	7659	\N	Niechorz
7696	7659	\N	Piaseczno
7697	7659	\N	Radońsk
7698	7659	\N	Siedlisko
7699	7659	\N	Sikorz
7700	7659	\N	Skarpa
7701	7659	\N	Świdwie
7702	7659	\N	Teklanowo
7703	7659	\N	Toboła
7704	7659	\N	Trzciany
7705	7659	\N	Wałdowo
7706	7659	\N	Wałdówko
7707	7659	\N	Wilkowo
7708	7659	\N	Wiśniewa
7709	7659	\N	Wiśniewka
7710	7659	\N	Włościborek
7711	7659	\N	Włościbórz
7712	7659	\N	Wysoka Krajeńska
7713	7659	\N	Zalesie
7714	7659	\N	Zaleśniak
7715	7659	\N	Zboże
7716	7660	\N	Borówki
7717	7660	\N	Dębiny
7718	7660	\N	Dziedno
7719	7660	\N	Jaszkowo
7720	7660	\N	Mierucin
7721	7660	\N	Obodowo
7722	7660	\N	Olszewka
7723	7660	\N	Ostrówek
7724	7660	\N	Płosków
7725	7660	\N	Przepałkowo
7726	7660	\N	Rogalin
7727	7660	\N	Roztoki
7728	7660	\N	Sitno
7729	7660	\N	Skoraczewo
7730	7660	\N	Sośno
7731	7660	\N	Szynwałd
7732	7660	\N	Tonin
7733	7660	\N	Toninek
7734	7660	\N	Tuszkowo
7735	7660	\N	Wąwelno
7736	7660	\N	Wielowicz
7737	7660	\N	Wielowiczek
7738	7660	\N	Zielonka
7739	7661	\N	Więcbork
7740	7661	\N	Adamowo
7741	7661	\N	Adamowo-Leśnictwo
7742	7661	\N	Borzyszkowo
7743	7661	\N	Chłopigozd-Gajówka
7744	7661	\N	Chłopigozd-Leśnictwo
7745	7661	\N	Czarmuń
7746	7661	\N	Dalkowo
7747	7661	\N	Dorotowo
7748	7661	\N	Frydrychowo
7749	7661	\N	Górowatki
7750	7661	\N	Jastrzębiec
7751	7661	\N	Jeleń
7752	7661	\N	Karolewo
7753	7661	\N	Katarzyniec
7754	7661	\N	Klarynowo
7755	7661	\N	Klementynowo
7756	7661	\N	Lubcza
7757	7661	\N	Łukowo
7758	7661	\N	Młynki
7759	7661	\N	Nowy Dwór
7760	7661	\N	Pęperzyn
7761	7661	\N	Puszcza
7762	7661	\N	Runowo Krajeńskie
7763	7661	\N	Suchorączek
7764	7661	\N	Sypniewo
7765	7661	\N	Sypniewo-Leśnictwo
7766	7661	\N	Śmiłowo
7767	7661	\N	Werski Most
7768	7661	\N	Wilcze Jary
7769	7661	\N	Witunia
7770	7661	\N	Wymysłowo
7771	7661	\N	Zabartowo
7772	7661	\N	Zakrzewek
7773	7661	\N	Zakrzewska Osada
7774	7661	\N	Zgniłka
7775	304	\N	Bukowiec
7776	304	\N	Dragacz
7777	304	\N	Drzycim
7778	304	\N	Jeżewo
7779	304	\N	Lniano
7780	304	\N	Nowe
7781	304	\N	Osie
7782	304	\N	Pruszcz
7783	304	\N	Świecie
7784	304	\N	Świekatowo
7785	304	\N	Warlubie
7786	7775	\N	Bramka
7787	7775	\N	Branica
7788	7775	\N	Budyń
7789	7775	\N	Bukowiec
7790	7775	\N	Dolny Młyn
7791	7775	\N	Franciszkowo
7792	7775	\N	Gawroniec
7793	7775	\N	Jarzębieniec
7794	7775	\N	Kawęcin
7795	7775	\N	Korytowo
7796	7775	\N	Krupocin
7797	7775	\N	Plewno
7798	7775	\N	Poledno
7799	7775	\N	Polskie Łąki
7800	7775	\N	Przysiersk
7801	7775	\N	Różanna
7802	7775	\N	Stanisławie
7803	7775	\N	Tuszynki
7804	7776	\N	Bojanowo
7805	7776	\N	Bratwin
7806	7776	\N	Dolna Grupa
7807	7776	\N	Dragacz
7808	7776	\N	Fletnowo
7809	7776	\N	Górna Grupa
7810	7776	\N	Grupa
7811	7776	\N	Michale
7812	7776	\N	Mniszek
7813	7776	\N	Nowe Marzy
7814	7776	\N	Polskie Stwolno
7815	7776	\N	Stare Marzy
7816	7776	\N	Wiąskie Piaski
7817	7776	\N	Wielkie Stwolno
7818	7776	\N	Wielkie Zajączkowo
7819	7776	\N	Wielki Lubień
7820	7777	\N	Bedlenki
7821	7777	\N	Biechowo
7822	7777	\N	Biechówko
7823	7777	\N	Dąbrówka
7824	7777	\N	Dólsk
7825	7777	\N	Drzycim
7826	7777	\N	Gacki
7827	7777	\N	Gródek
7828	7777	\N	Jastrzębie
7829	7777	\N	Kaliska
7830	7777	\N	Krakówek
7831	7777	\N	Leosia
7832	7777	\N	Lubocheń
7833	7777	\N	Mały Dólsk
7834	7777	\N	Rówienica
7835	7777	\N	Sierosław
7836	7777	\N	Sierosławek
7837	7777	\N	Spławie
7838	7777	\N	Wery
7839	7778	\N	Belno
7840	7778	\N	Białe
7841	7778	\N	Białe Błota
7842	7778	\N	Brzozowy Most
7843	7778	\N	Buczek
7844	7778	\N	Ciemniki
7845	7778	\N	Czersk Świecki
7846	7778	\N	Dąbrowa
7847	7778	\N	Dubielno
7848	7778	\N	Jeżewo
7849	7778	\N	Kotówka
7850	7778	\N	Krąplewice
7851	7778	\N	Kwiatki
7852	7778	\N	Laskowice
7853	7778	\N	Lipno
7854	7778	\N	Nowy Młynek
7855	7778	\N	Osłowo
7856	7778	\N	Papiernia
7857	7778	\N	Pięćmorgi
7858	7778	\N	Piła-Młyn
7859	7778	\N	Piskarki
7860	7778	\N	Rozgarty
7861	7778	\N	Skrzynki
7862	7778	\N	Taszewko
7863	7778	\N	Taszewo
7864	7778	\N	Taszewskie Pole
7865	7779	\N	Błądzim
7866	7779	\N	Brzemiona
7867	7779	\N	Bukowiec
7868	7779	\N	Cisiny
7869	7779	\N	Dąbrowa
7870	7779	\N	Dębowo
7871	7779	\N	Huta
7872	7779	\N	Jakubowo
7873	7779	\N	Jania Góra
7874	7779	\N	Jeziorki
7875	7779	\N	Jędrzejewo
7876	7779	\N	Karolewo
7877	7779	\N	Lnianek
7878	7779	\N	Lniano
7879	7779	\N	Lubodzież
7880	7779	\N	Mszano
7881	7779	\N	Mukrz
7882	7779	\N	Ostrowite
7883	7779	\N	Rykowisko
7884	7779	\N	Siemkowo
7885	7779	\N	Słępiska
7886	7779	\N	Wętfie
7887	7779	\N	Zalesie Szlacheckie
7888	7780	\N	Nowe
7889	7780	\N	Bochlin
7890	7780	\N	Dobre
7891	7780	\N	Gajewo
7892	7780	\N	Głodowo
7893	7780	\N	Kończyce
7894	7780	\N	Kozielec
7895	7780	\N	Mały Komorsk
7896	7780	\N	Mątawy
7897	7780	\N	Milewko
7898	7780	\N	Milewo
7899	7780	\N	Morgi
7900	7780	\N	Osiny
7901	7780	\N	Pastwiska
7902	7780	\N	Przyny
7903	7780	\N	Rychława
7904	7780	\N	Tryl
7905	7780	\N	Twarda Góra
7906	7780	\N	Zdrojewo
7907	7781	\N	Brzeziny
7908	7781	\N	Czarna Woda
7909	7781	\N	Dębowiec
7910	7781	\N	Grabowa Buchta
7911	7781	\N	Grzybek
7912	7781	\N	Jaszcz
7913	7781	\N	Łążek
7914	7781	\N	Miedzno
7915	7781	\N	Nowy Jaszcz
7916	7781	\N	Orli Dwór
7917	7781	\N	Osie
7918	7781	\N	Pohulanka
7919	7781	\N	Pruskie
7920	7781	\N	Radańska
7921	7781	\N	Ryszka
7922	7781	\N	Sarnia Góra
7923	7781	\N	Skrzyniska
7924	7781	\N	Smolarnia
7925	7781	\N	Sobiny
7926	7781	\N	Stara Rzeka
7927	7781	\N	Swatno
7928	7781	\N	Szarłata
7929	7781	\N	Tleń
7930	7781	\N	Wałkowiska
7931	7781	\N	Wierzchy
7932	7781	\N	Wygoda
7933	7781	\N	Zacisze
7934	7781	\N	Zazdrość
7935	7781	\N	Zgorzały Most
7936	7781	\N	Żur
7937	7782	\N	Bagniewko
7938	7782	\N	Bagniewo
7939	7782	\N	Brzeźno
7940	7782	\N	Cieleszyn
7941	7782	\N	Gołuszyce
7942	7782	\N	Grabowo
7943	7782	\N	Grabówko
7944	7782	\N	Konstantowo
7945	7782	\N	Luszkowo
7946	7782	\N	Luszkówko
7947	7782	\N	Łaszewo
7948	7782	\N	Łowinek
7949	7782	\N	Łowiń
7950	7782	\N	Małociechowo
7951	7782	\N	Mirowice
7952	7782	\N	Nieciszewo
7953	7782	\N	Niewieścin
7954	7782	\N	Parlin
7955	7782	\N	Pruszcz
7956	7782	\N	Rudki
7957	7782	\N	Serock
7958	7782	\N	Topolno
7959	7782	\N	Trępel
7960	7782	\N	Wałdowo
7961	7782	\N	Zawada
7962	7782	\N	Zbrachlin
7963	7783	\N	Świecie
7964	7783	\N	Chrystkowo
7965	7783	\N	Czapelki
7966	7783	\N	Czaple
7967	7783	\N	Drozdowo
7968	7783	\N	Dworzysko
7969	7783	\N	Dziki
7970	7783	\N	Ernestowo
7971	7783	\N	Głogówko Królewskie
7972	7783	\N	Gruczno
7973	7783	\N	Kosowo
7974	7783	\N	Kozłowo
7975	7783	\N	Małe Bedlenki
7976	7783	\N	Morsk
7977	7783	\N	Niedźwiedź
7978	7783	\N	Nowe Dobra
7979	7783	\N	Polski Konopat
7980	7783	\N	Przechówko
7981	7783	\N	Sartowice
7982	7783	\N	Skarszewo
7983	7783	\N	Sulnowo
7984	7783	\N	Sulnówko
7985	7783	\N	Święte
7986	7783	\N	Terespol Pomorski
7987	7783	\N	Topolinek
7988	7783	\N	Wiąg
7989	7783	\N	Wielki Konopat
7990	7783	\N	Wyrwa
7991	7784	\N	Jania Góra
7992	7784	\N	Lipienica
7993	7784	\N	Lubania-Lipiny
7994	7784	\N	Małe Łąkie
7995	7784	\N	Stążki
7996	7784	\N	Szewno
7997	7784	\N	Świekatowo
7998	7784	\N	Tuszyny
7999	7784	\N	Zalesie Królewskie
8000	7785	\N	Bąkowo
8001	7785	\N	Bąkowski Młyn
8002	7785	\N	Blizawy
8003	7785	\N	Borowy Młyn
8004	7785	\N	Borsukowo
8005	7785	\N	Bursztynowo
8006	7785	\N	Buśnia
8007	7785	\N	Bzowo
8008	7785	\N	Ciemny Las
8009	7785	\N	Dębowe
8010	7785	\N	Grabowa Góra
8011	7785	\N	Gzelowe
8012	7785	\N	Jeżewnica
8013	7785	\N	Kamionka
8014	7785	\N	Krusze
8015	7785	\N	Krzewiny
8016	7785	\N	Kurzejewo
8017	7785	\N	Kuźnica
8018	7785	\N	Lipinki
8019	7785	\N	Mątasek
8020	7785	\N	Nowa Huta
8021	7785	\N	Płochocin
8022	7785	\N	Płochocinek
8023	7785	\N	Przewodnik
8024	7785	\N	Rulewo
8025	7785	\N	Rybno
8026	7785	\N	Rynków
8027	7785	\N	Stara Huta
8028	7785	\N	Średnia Huta
8029	7785	\N	Warlubie
8030	7785	\N	Wielki Komorsk
8031	7785	\N	Zamczyska
8032	311	\N	Chełmża
8033	311	\N	Czernikowo
8034	311	\N	Lubicz
8035	311	\N	Łubianka
8036	311	\N	Łysomice
8037	311	\N	Obrowo
8038	311	\N	Wielka Nieszawka
8039	311	\N	Zławieś Wielka
8040	8032	\N	Chełmża
8041	8032	\N	Bielczyny
8042	8032	\N	Bocień
8043	8032	\N	Bogusławki
8044	8032	\N	Brąchnówko
8045	8032	\N	Browina
8046	8032	\N	Buczek
8047	8032	\N	Drzonówko
8048	8032	\N	Dziemiony
8049	8032	\N	Dźwierzno
8050	8032	\N	Głuchowo
8051	8032	\N	Grodno
8052	8032	\N	Grzegorz
8053	8032	\N	Grzywna
8054	8032	\N	Januszewo
8055	8032	\N	Kiełbasin
8056	8032	\N	Kiełbasinek
8057	8032	\N	Knapówka
8058	8032	\N	Kończewice
8059	8032	\N	Kuchnia
8060	8032	\N	Kuczwały
8061	8032	\N	Liznowo
8062	8032	\N	Mirakowo
8063	8032	\N	Morczyny
8064	8032	\N	Nawra
8065	8032	\N	Nowa Chełmża
8066	8032	\N	Osiedle pod Kończewicami
8067	8032	\N	Parowa Falęcka
8068	8032	\N	Pluskowęsy
8069	8032	\N	Skąpe
8070	8032	\N	Sławkowo
8071	8032	\N	Strużal
8072	8032	\N	Szerokopas
8073	8032	\N	Świętosław
8074	8032	\N	Wilmanowo
8075	8032	\N	Windak
8076	8032	\N	Witkowo
8077	8032	\N	Zajączkowo
8078	8032	\N	Zalesie
8079	8032	\N	Zelgno
8080	8032	\N	Zelgno-Bezdół
8081	8033	\N	Bernardowo
8082	8033	\N	Czernikowo
8083	8033	\N	Czernikówko
8084	8033	\N	Dąbrówka
8085	8033	\N	Jackowo
8086	8033	\N	Jaźwiny
8087	8033	\N	Kępiacz
8088	8033	\N	Kiełpiny
8089	8033	\N	Kijaszkowo
8090	8033	\N	Kijaszkówiec
8091	8033	\N	Liciszewy
8092	8033	\N	Łazy
8093	8033	\N	Makowiska
8094	8033	\N	Mazowsze
8095	8033	\N	Mazowsze-Parcele
8096	8033	\N	Nowogródek
8097	8033	\N	Ograszka
8098	8033	\N	Osówka
8099	8033	\N	Osówka-Kolonia
8100	8033	\N	Piaski
8101	8033	\N	Pokrzywno
8102	8033	\N	Rozstrzały
8103	8033	\N	Rudno
8104	8033	\N	Skwirynowo
8105	8033	\N	Stajęczyny
8106	8033	\N	Steklin
8107	8033	\N	Steklinek
8108	8033	\N	Steklin-Kolonia
8109	8033	\N	Szkleniec
8110	8033	\N	Wieprzeniec
8111	8033	\N	Witowąż
8112	8033	\N	Włęcz
8113	8033	\N	Wygoda
8114	8033	\N	Wylewy
8115	8033	\N	Zabłocie
8116	8033	\N	Zieleńszczyzna
8117	8033	\N	Zimny Zdrój
8118	8034	\N	Brzezinko
8119	8034	\N	Brzeźno
8120	8034	\N	Grabowiec
8121	8034	\N	Grębocin
8122	8034	\N	Gronowo
8123	8034	\N	Gronówko
8124	8034	\N	Jedwabno
8125	8034	\N	Józefowo
8126	8034	\N	Kopanino
8127	8034	\N	Krobia
8128	8034	\N	Lubicz Dolny
8129	8034	\N	Lubicz Górny
8130	8034	\N	Mierzynek
8131	8034	\N	Młyniec Drugi
8132	8034	\N	Młyniec Pierwszy
8133	8034	\N	Nowa Wieś
8134	8034	\N	Rogowo
8135	8034	\N	Rogówko
8136	8034	\N	Złotoria
8137	8034	\N	Lubicz
8138	8035	\N	Bierzgłowo
8139	8035	\N	Biskupice
8140	8035	\N	Brąchnowo
8141	8035	\N	Dębiny
8142	8035	\N	Leszcz
8143	8035	\N	Łubianka
8144	8035	\N	Pigża
8145	8035	\N	Przeczno
8146	8035	\N	Słomowo
8147	8035	\N	Warszewice
8148	8035	\N	Wybcz
8149	8035	\N	Wybczyk
8150	8035	\N	Wymysłowo
8151	8035	\N	Zamek Bierzgłowski
8152	8035	\N	Zawiszówka
8153	8036	\N	Chorab
8154	8036	\N	Gapa
8155	8036	\N	Gostkowo
8156	8036	\N	Kamionki Duże
8157	8036	\N	Kamionki Małe
8158	8036	\N	Koniczynka
8159	8036	\N	Kowróz
8160	8036	\N	Kowrózek
8161	8036	\N	Lipniczki
8162	8036	\N	Lulkowo
8163	8036	\N	Łysomice
8164	8036	\N	Łysomice-Leśniczówka
8165	8036	\N	Olek
8166	8036	\N	Ostaszewo
8167	8036	\N	Papowo Toruńskie
8168	8036	\N	Piwnice
8169	8036	\N	Różankowo
8170	8036	\N	Smaruj
8171	8036	\N	Świerczynki
8172	8036	\N	Świerczyny
8173	8036	\N	Turzno
8174	8036	\N	Tylice
8175	8036	\N	Wytrębowice
8176	8036	\N	Zabijak
8177	8036	\N	Zakrzewko
8178	8036	\N	Zęgwirt
8179	8037	\N	Bartoszewo
8180	8037	\N	Brzozówka
8181	8037	\N	Chrapy
8182	8037	\N	Dobrzejewice
8183	8037	\N	Dzikowo
8184	8037	\N	Głogowo
8185	8037	\N	Kawęczyn
8186	8037	\N	Kazimierzewo
8187	8037	\N	Kolonia Obrowska
8188	8037	\N	Kuźniki
8189	8037	\N	Łążyn
8190	8037	\N	Łążynek
8191	8037	\N	Łęk-Osiek
8192	8037	\N	Obory
8193	8037	\N	Obrowo
8194	8037	\N	Osiek
8195	8037	\N	Sąsieczno
8196	8037	\N	Silno
8197	8037	\N	Skrzypkowo
8198	8037	\N	Smogorzewiec
8199	8037	\N	Stajenczynki
8200	8037	\N	Szembekowo
8201	8037	\N	Zawały
8202	8037	\N	Zębowo
8203	8037	\N	Zębówiec
8204	8038	\N	Brzeczka
8205	8038	\N	Brzoza
8206	8038	\N	Cierpice
8207	8038	\N	Cierpiszewo
8208	8038	\N	Maciejewo
8209	8038	\N	Mała Nieszawka
8210	8038	\N	Wielka Nieszawka
8211	8039	\N	Błotka
8212	8039	\N	Cegielnik
8213	8039	\N	Cichoradz
8214	8039	\N	Czarne Błoto
8215	8039	\N	Czarnowo
8216	8039	\N	Górsk
8217	8039	\N	Gutowo
8218	8039	\N	Gutowo-Leśnictwo
8219	8039	\N	Kamieniec
8220	8039	\N	Łążyn
8221	8039	\N	Pędzewo
8222	8039	\N	Przysiek
8223	8039	\N	Rozgarty
8224	8039	\N	Rzęczkowo
8225	8039	\N	Siemoń
8226	8039	\N	Skłudzewo
8227	8039	\N	Smolno
8228	8039	\N	Stanisławka
8229	8039	\N	Stary Toruń
8230	8039	\N	Toporzysko
8231	8039	\N	Zarośle Cienkie
8232	8039	\N	Zławieś Mała
8233	8039	\N	Zławieś Wielka
8234	302	\N	Cekcyn
8235	302	\N	Gostycyn
8236	302	\N	Kęsowo
8237	302	\N	Lubiewo
8238	302	\N	Śliwice
8239	302	\N	Tuchola
8240	8234	\N	Bieszewo
8241	8234	\N	Błądzim
8242	8234	\N	Brzozie
8243	8234	\N	Cekcyn
8244	8234	\N	Dębowiec
8245	8234	\N	Duża Huta
8246	8234	\N	Gołąbek
8247	8234	\N	Hamer
8248	8234	\N	Iwiec
8249	8234	\N	Jelenia Góra
8250	8234	\N	Kiełpiński Most
8251	8234	\N	Knieja
8252	8234	\N	Kosowo
8253	8234	\N	Kowalskie Błota
8254	8234	\N	Kruszka
8255	8234	\N	Krzywogoniec
8256	8234	\N	Lisiny
8257	8234	\N	Lubiewice
8258	8234	\N	Lubińsk
8259	8234	\N	Ludwichowo
8260	8234	\N	Łosiny
8261	8234	\N	Łyskowo
8262	8234	\N	Mała Huta
8263	8234	\N	Małe Budziska
8264	8234	\N	Małe Gacno
8265	8234	\N	Mikołajskie
8266	8234	\N	Nowy Młyn
8267	8234	\N	Nowy Sumin
8268	8234	\N	Okiersk
8269	8234	\N	Okoninek
8270	8234	\N	Ostrowo
8271	8234	\N	Piła-Młyn
8272	8234	\N	Plaskosz
8273	8234	\N	Pustelnia
8274	8234	\N	Rudzki Młyn
8275	8234	\N	Sarnówek
8276	8234	\N	Siwe Bagno
8277	8234	\N	Skrajna
8278	8234	\N	Sławno
8279	8234	\N	Stary Sumin
8280	8234	\N	Stary Wierzchucin
8281	8234	\N	Suchom
8282	8234	\N	Szczuczanek
8283	8234	\N	Szklana Huta
8284	8234	\N	Świt
8285	8234	\N	Trzebciny
8286	8234	\N	Wielkie Budziska
8287	8234	\N	Wielkie Gacno
8288	8234	\N	Wierzchlas
8289	8234	\N	Wierzchucin
8290	8234	\N	Wrzosowisko
8291	8234	\N	Wysoka
8292	8234	\N	Zalesie
8293	8234	\N	Zamarte
8294	8234	\N	Zdroje
8295	8234	\N	Zielonka
8296	8235	\N	Bagienica
8297	8235	\N	Gostycyn
8298	8235	\N	Kamienica
8299	8235	\N	Karczewo
8300	8235	\N	Leontynowo
8301	8235	\N	Łyskowo
8302	8235	\N	Mała Klonia
8303	8235	\N	Motyl
8304	8235	\N	Pieńkowo
8305	8235	\N	Piła
8306	8235	\N	Pruszcz
8307	8235	\N	Przyrowa
8308	8235	\N	Świt
8309	8235	\N	Wapiennik
8310	8235	\N	Wielka Klonia
8311	8235	\N	Wielki Mędromierz
8312	8235	\N	Żółwiniec
8313	8236	\N	Adamkowo
8314	8236	\N	Bralewnica
8315	8236	\N	Brzuchowo
8316	8236	\N	Drożdzienica
8317	8236	\N	Grochowo
8318	8236	\N	Jeleńcz
8319	8236	\N	Kęsowo
8320	8236	\N	Krajenki
8321	8236	\N	Ludwichowo
8322	8236	\N	Małe Wieszczyce
8323	8236	\N	Nowe Żalno
8324	8236	\N	Obrowo
8325	8236	\N	Pamiętowo
8326	8236	\N	Piastoszyn
8327	8236	\N	Przymuszewo
8328	8236	\N	Sicinki
8329	8236	\N	Siciny
8330	8236	\N	Tuchółka
8331	8236	\N	Wieszczyce
8332	8236	\N	Żalno
8333	8237	\N	Bruchniewo
8334	8237	\N	Brukniewo
8335	8237	\N	Bysław
8336	8237	\N	Bysławek
8337	8237	\N	Cierplewo
8338	8237	\N	Klonowo
8339	8237	\N	Koźliny
8340	8237	\N	Lubiewice
8341	8237	\N	Lubiewo
8342	8237	\N	Minikowo
8343	8237	\N	Płazowo
8344	8237	\N	Sielanka
8345	8237	\N	Sucha
8346	8237	\N	Szumiąca
8347	8237	\N	Teolog
8348	8237	\N	Trutnowo
8349	8237	\N	Wandowo
8350	8237	\N	Wełpin
8351	8237	\N	Zamrza
8352	8237	\N	Zamrzenica
8353	8238	\N	Brzeźno
8354	8238	\N	Brzozowe Błota
8355	8238	\N	Byłyczek
8356	8238	\N	Główka
8357	8238	\N	Jabłonka
8358	8238	\N	Kamionka
8359	8238	\N	Krąg
8360	8238	\N	Laski
8361	8238	\N	Linówek
8362	8238	\N	Lińsk
8363	8238	\N	Lipowa
8364	8238	\N	Lisiny
8365	8238	\N	Lubocień
8366	8238	\N	Łąski Piec
8367	8238	\N	Łoboda
8368	8238	\N	Niedźwiedziniec
8369	8238	\N	Okoniny
8370	8238	\N	Okoniny Nadjeziorne
8371	8238	\N	Rosochatka
8372	8238	\N	Śliwice
8373	8238	\N	Śliwiczki
8374	8238	\N	Zarośla
8375	8238	\N	Zarośle
8376	8238	\N	Zazdrość
8377	8238	\N	Zwierzyniec
8378	8239	\N	Tuchola
8379	8239	\N	Barłogi
8380	8239	\N	Biała
8381	8239	\N	Białowieża
8382	8239	\N	Bielska Struga
8383	8239	\N	Bladowo
8384	8239	\N	Brody
8385	8239	\N	Dąbrówka
8386	8239	\N	Dziekcz
8387	8239	\N	Fojutowo
8388	8239	\N	Jaty
8389	8239	\N	Kiełpin
8390	8239	\N	Klocek
8391	8239	\N	Końskie Błota
8392	8239	\N	Koślinka
8393	8239	\N	Lasek
8394	8239	\N	Legbąd
8395	8239	\N	Lubierzyn
8396	8239	\N	Łosiny
8397	8239	\N	Mała Komorza
8398	8239	\N	Mały Mędromierz
8399	8239	\N	Mrowiniec
8400	8239	\N	Nadolna Karczma
8401	8239	\N	Nadolnik
8402	8239	\N	Niwki
8403	8239	\N	Raciąski Młyn
8404	8239	\N	Raciąż
8405	8239	\N	Radonek
8406	8239	\N	Rzepiczna
8407	8239	\N	Słupy
8408	8239	\N	Stobno
8409	8239	\N	Wielka Komorza
8410	8239	\N	Woziwoda
8411	8239	\N	Wymysłowo
8412	8239	\N	Wysocki Młyn
8413	8239	\N	Wysoka
8414	8239	\N	Zielona Łąka
8415	8239	\N	Zielonka
8416	303	\N	Wąbrzeźno
8417	303	\N	Dębowa Łąka
8418	303	\N	Książki
8419	303	\N	Płużnica
8420	8416	\N	Wąbrzeźno
8421	8417	\N	Dębowa Łąka
8422	8417	\N	Feliksowo
8423	8417	\N	Głodowo
8424	8417	\N	Kurkocin
8425	8417	\N	Lipnica
8426	8417	\N	Łobdowo
8427	8417	\N	Małe Pułkowo
8428	8417	\N	Niedźwiedź
8429	8417	\N	Wielkie Pułkowo
8430	8417	\N	Wielkie Radowiska
8431	8417	\N	Wymyślanka
8432	8418	\N	Blizienko
8433	8418	\N	Blizno
8434	8418	\N	Brudzawki
8435	8418	\N	Książki
8436	8418	\N	Łopatki
8437	8418	\N	Łopatki Polskie
8438	8418	\N	Osieczek
8439	8418	\N	Szczuplinki
8440	8418	\N	Zaskocz
8441	8419	\N	Bartoszewice
8442	8419	\N	Bągart
8443	8419	\N	Bielawy
8444	8419	\N	Błędowo
8445	8419	\N	Czapelki
8446	8419	\N	Czaple
8447	8419	\N	Dąbrówka
8448	8419	\N	Dębie
8449	8419	\N	Działowo
8450	8419	\N	Goryń
8451	8419	\N	Józefkowo
8452	8419	\N	Kotnowo
8453	8419	\N	Mgowo
8454	8419	\N	Nowa Wieś Królewska
8455	8419	\N	Orłowo
8456	8419	\N	Ostrowo
8457	8419	\N	Pieńki
8458	8419	\N	Płąchawy
8459	8419	\N	Płużnica
8460	8419	\N	Pólko
8461	8419	\N	Szczerosługi
8462	8419	\N	Uciąż
8463	8419	\N	Wieldządz
8464	8419	\N	Wiewiórki
8465	8416	\N	Bugeria
8466	8416	\N	Buk
8467	8416	\N	Cymbark
8468	8416	\N	Czystochleb
8469	8416	\N	Frydrychowo
8470	8416	\N	Jarantowice
8471	8416	\N	Jarantowiczki
8472	8416	\N	Jaworze
8473	8416	\N	Katarzynki
8474	8416	\N	Ludowice
8475	8416	\N	Łabędź
8476	8416	\N	Małe Radowiska
8477	8416	\N	Michałki
8478	8416	\N	Młynik
8479	8416	\N	Myśliwiec
8480	8416	\N	Nielub
8481	8416	\N	Orzechowo
8482	8416	\N	Orzechowo-Majątek
8483	8416	\N	Orzechówko
8484	8416	\N	Pigża
8485	8416	\N	Plebanka
8486	8416	\N	Pływaczewo
8487	8416	\N	Prochy
8488	8416	\N	Przydwórz
8489	8416	\N	Rozgard
8490	8416	\N	Ryńsk
8491	8416	\N	Seperanka
8492	8416	\N	Seperunki
8493	8416	\N	Sicinek
8494	8416	\N	Sitno
8495	8416	\N	Sosnówka
8496	8416	\N	Stanisławki
8497	8416	\N	Trzcianek
8498	8416	\N	Trzciano
8499	8416	\N	Wałycz
8500	8416	\N	Wałyczyk
8501	8416	\N	Węgorzyn
8502	8416	\N	Wronie
8503	8416	\N	Zaradowiska
8504	8416	\N	Zieleń
8505	8416	\N	Zieleńskie Góry
8506	313	\N	Kowal
8507	313	\N	Baruchowo
8508	313	\N	Boniewo
8509	313	\N	Brześć Kujawski
8510	313	\N	Choceń
8511	313	\N	Chodecz
8512	313	\N	Fabianki
8513	313	\N	Izbica Kujawska
8514	313	\N	Lubanie
8515	313	\N	Lubień Kujawski
8516	313	\N	Lubraniec
8517	313	\N	Włocławek
8518	8506	\N	Kowal
8519	8507	\N	Baruchowo
8520	8507	\N	Boża Wola
8521	8507	\N	Goreń Duży
8522	8507	\N	Goreń Nowy
8523	8507	\N	Grodno
8524	8507	\N	Kłótno
8525	8507	\N	Kociołek
8526	8507	\N	Kurowo-Kolonia
8527	8507	\N	Kurowo-Parcele
8528	8507	\N	Lubaty
8529	8507	\N	Niedźwiedź
8530	8507	\N	Nowa Zawada
8531	8507	\N	Okna
8532	8507	\N	Patrowo
8533	8507	\N	Patrówek
8534	8507	\N	Skrzynki
8535	8507	\N	Stawek
8536	8507	\N	Świątkowice
8537	8507	\N	Telążna-Kanał
8538	8507	\N	Trzebowo
8539	8507	\N	Więsławice
8540	8507	\N	Zakrzewo
8541	8507	\N	Zakrzewo-Parcele
8542	8507	\N	Zawada
8543	8508	\N	Anielin
8544	8508	\N	Arciszewo
8545	8508	\N	Bierzyn
8546	8508	\N	Bnin
8547	8508	\N	Boniewo
8548	8508	\N	Czuple
8549	8508	\N	Grójczyk
8550	8508	\N	Grójec
8551	8508	\N	Janowo
8552	8508	\N	Jerzmanowo
8553	8508	\N	Kaniewo
8554	8508	\N	Krajanki
8555	8508	\N	Lubomin
8556	8508	\N	Lubomin Leśny
8557	8508	\N	Lubomin Rządowy
8558	8508	\N	Łączewna
8559	8508	\N	Łąki Markowe
8560	8508	\N	Łąki Wielkie
8561	8508	\N	Łąki Zwiastowe
8562	8508	\N	Mikołajki
8563	8508	\N	Osiecz Mały
8564	8508	\N	Osiecz Wielki
8565	8508	\N	Otmianowo
8566	8508	\N	Sarnowo
8567	8508	\N	Sieroszewo
8568	8508	\N	Sułkówek
8569	8508	\N	Wólka Paruszewska
8570	8508	\N	Żurawice
8571	8509	\N	Brześć Kujawski
8572	8509	\N	Aleksandrowo
8573	8509	\N	Brzezie
8574	8509	\N	Dolina Pierwsza
8575	8509	\N	Dolina-Źródło
8576	8509	\N	Dubielewo
8577	8509	\N	Falborek
8578	8509	\N	Falborz
8579	8509	\N	Falborz-Kolonia
8580	8509	\N	Gustorzyn
8581	8509	\N	Guźlin
8582	8509	\N	Jaranówek
8583	8509	\N	Jądrowice
8584	8509	\N	Kąkowa Wola
8585	8509	\N	Kąkowa Wola-Parcele
8586	8509	\N	Kąty
8587	8509	\N	Klementynowo
8588	8509	\N	Kuczyna
8589	8509	\N	Lipiny
8590	8509	\N	Machnacz
8591	8509	\N	Marianki
8592	8509	\N	Mazury
8593	8509	\N	Mazury Wieniec
8594	8509	\N	Miechowice
8595	8509	\N	Miechowice Duże
8596	8509	\N	Parcele Sokołowskie
8597	8509	\N	Pikutkowo
8598	8509	\N	Poraza
8599	8509	\N	Redecz Krukowy
8600	8509	\N	Rzadka Wola
8601	8509	\N	Rzadka Wola-Parcele
8602	8509	\N	Słone
8603	8509	\N	Sokołowo
8604	8509	\N	Starobrzeska Kolonia
8605	8509	\N	Stary Brześć
8606	8509	\N	Studniska
8607	8509	\N	Trzy Kopce
8608	8509	\N	Wieniec
8609	8509	\N	Wieniec-Zalesie
8610	8509	\N	Wieniec-Zdrój
8611	8509	\N	Witoldowo
8612	8509	\N	Wolica
8613	8510	\N	Bodzanowo
8614	8510	\N	Bodzanówek
8615	8510	\N	Borzymie
8616	8510	\N	Borzymowice
8617	8510	\N	Choceń
8618	8510	\N	Czerniewice
8619	8510	\N	Filipki
8620	8510	\N	Grabówka
8621	8510	\N	Janowo
8622	8510	\N	Jarantowice
8623	8510	\N	Jerzewo
8624	8510	\N	Krukowo
8625	8510	\N	Księża Kępka
8626	8510	\N	Kuźnice
8627	8510	\N	Lutobórz
8628	8510	\N	Ługowiska
8629	8510	\N	Niemojewo
8630	8510	\N	Nowa Wola
8631	8510	\N	Olganowo
8632	8510	\N	Pustki Śmiłowskie
8633	8510	\N	Siewiersk
8634	8510	\N	Skibice
8635	8510	\N	Stare Nakonowo
8636	8510	\N	Szatki
8637	8510	\N	Szczutkowo
8638	8510	\N	Szczytno
8639	8510	\N	Śmiłowice
8640	8510	\N	Świerkowo
8641	8510	\N	Wichrowice
8642	8510	\N	Wilkowice
8643	8510	\N	Wilkowiczki
8644	8510	\N	Wola Nakonowska
8645	8510	\N	Zakrzewek
8646	8510	\N	Ząbin
8647	8511	\N	Chodecz
8648	8511	\N	Bogołomia
8649	8511	\N	Brzyszewo
8650	8511	\N	Cetty
8651	8511	\N	Chodeczek
8652	8511	\N	Florkowizna
8653	8511	\N	Gawin
8654	8511	\N	Huta Chodecka
8655	8511	\N	Ignalin
8656	8511	\N	Kromszewice
8657	8511	\N	Kubłowo
8658	8511	\N	Kubłowo Małe
8659	8511	\N	Lubieniec
8660	8511	\N	Łakno
8661	8511	\N	Łania
8662	8511	\N	Łanięta
8663	8511	\N	Mielinek
8664	8511	\N	Mielno
8665	8511	\N	Mstowo
8666	8511	\N	Niwki
8667	8511	\N	Nowiny
8668	8511	\N	Ogorzelewo
8669	8511	\N	Piotrowo
8670	8511	\N	Prosno
8671	8511	\N	Przysypka
8672	8511	\N	Psary
8673	8511	\N	Pyszkowo
8674	8511	\N	Ruda Lubieniecka
8675	8511	\N	Sobiczewy
8676	8511	\N	Strzygi
8677	8511	\N	Strzygowska Kolonia
8678	8511	\N	Strzyżki
8679	8511	\N	Szczecin
8680	8511	\N	Trzeszczon
8681	8511	\N	Witoldowo
8682	8511	\N	Wola Adamowa
8683	8511	\N	Zalesie
8684	8511	\N	Zbijewo
8685	8511	\N	Zieleniewo
8686	8512	\N	Bogucin
8687	8512	\N	Chełmica-Cukrownia
8688	8512	\N	Chełmica Duża
8689	8512	\N	Chełmica Mała
8690	8512	\N	Cyprianka
8691	8512	\N	Fabianki
8692	8512	\N	Krępiny
8693	8512	\N	Lisek
8694	8512	\N	Łęg Witoszyn
8695	8512	\N	Nasiegniewo
8696	8512	\N	Nowy Witoszyn
8697	8512	\N	Osiek
8698	8512	\N	Skórzno
8699	8512	\N	Stary Witoszyn
8700	8512	\N	Szpetal Górny
8701	8512	\N	Świątkowizna
8702	8512	\N	Uniechowo
8703	8512	\N	Wilczeniec Bogucki
8704	8512	\N	Wilczeniec Fabiański
8705	8512	\N	Zarzeczewo
8706	8513	\N	Izbica Kujawska
8707	8513	\N	Augustynowo
8708	8513	\N	Błenna
8709	8513	\N	Błenna A
8710	8513	\N	Błenna B
8711	8513	\N	Błenna-Budy
8712	8513	\N	Błenna Trzecia
8713	8513	\N	Chociszewo
8714	8513	\N	Chotel
8715	8513	\N	Cieplinki
8716	8513	\N	Ciepliny
8717	8513	\N	Ciepliny-Budy
8718	8513	\N	Dębianki
8719	8513	\N	Długie
8720	8513	\N	Długie Parcele
8721	8513	\N	Dziewczopole
8722	8513	\N	Gaj Stolarski
8723	8513	\N	Gąsiorowo
8724	8513	\N	Gogoły
8725	8513	\N	Grochowiska
8726	8513	\N	Helenowo
8727	8513	\N	Hulanka
8728	8513	\N	Joasin
8729	8513	\N	Józefowo
8730	8513	\N	Kazanki
8731	8513	\N	Kazimierowo
8732	8513	\N	Komorowo
8733	8513	\N	Martanowo-Folwark
8734	8513	\N	Mchówek
8735	8513	\N	Mieczysławowo
8736	8513	\N	Modzerowo
8737	8513	\N	Naczachowo
8738	8513	\N	Nowa Wieś
8739	8513	\N	Obałki
8740	8513	\N	Pasieka
8741	8513	\N	Podhulanka
8742	8513	\N	Podtymień
8743	8513	\N	Pustki
8744	8513	\N	Rogóżki
8745	8513	\N	Skarbanowo
8746	8513	\N	Słubin
8747	8513	\N	Sokołowo
8748	8513	\N	Szczkowo
8749	8513	\N	Szczkówek
8750	8513	\N	Ślazewo
8751	8513	\N	Śmielnik
8752	8513	\N	Śmieły
8753	8513	\N	Świętosławice
8754	8513	\N	Świszewy
8755	8513	\N	Świszewy-Kolonia
8756	8513	\N	Tymień
8757	8513	\N	Wietrzychowice
8758	8513	\N	Wiszczelice
8759	8513	\N	Wólka Komorowska
8760	8513	\N	Zaborowo
8761	8513	\N	Zakręty
8762	8513	\N	Zdrojówka
8763	8513	\N	Zdzisławin
8764	8506	\N	Bogusławice
8765	8506	\N	Czerniewiczki
8766	8506	\N	Dąbrówka
8767	8506	\N	Dębniaki
8768	8506	\N	Dobrzelewice
8769	8506	\N	Dziardonice
8770	8506	\N	Gołaszewo
8771	8506	\N	Grabkowo
8772	8506	\N	Grodztwo
8773	8506	\N	Kępka Szlachecka
8774	8506	\N	Krzewent
8775	8506	\N	Nakonowo
8776	8506	\N	Przydatki Gołaszewskie
8777	8506	\N	Rakutowo
8778	8506	\N	Strzały
8779	8506	\N	Szosa Włocławska
8780	8506	\N	Unisławice
8781	8506	\N	Więsławice
8782	8506	\N	Więsławice-Parcele
8783	8514	\N	Barcikowo
8784	8514	\N	Bodzia
8785	8514	\N	Dąbrówka
8786	8514	\N	Gąbinek
8787	8514	\N	Janowice
8788	8514	\N	Kałęczynek
8789	8514	\N	Kaźmierzewo
8790	8514	\N	Kocia Górka
8791	8514	\N	Kolonia Ustrońska
8792	8514	\N	Kucerz
8793	8514	\N	Lubanie
8794	8514	\N	Mikanowo
8795	8514	\N	Mikorzyn
8796	8514	\N	Probostwo Dolne
8797	8514	\N	Probostwo Górne
8798	8514	\N	Przywieczerzyn
8799	8514	\N	Przywieczerzynek
8800	8514	\N	Sarnówka
8801	8514	\N	Siutkówek
8802	8514	\N	Tadzin
8803	8514	\N	Ustronie
8804	8514	\N	Włoszyca Lubańska
8805	8514	\N	Zapomnianowo
8806	8514	\N	Zosin
8807	8515	\N	Lubień Kujawski
8808	8515	\N	Antoniewo
8809	8515	\N	Bagno
8810	8515	\N	Beszyn
8811	8515	\N	Bileńska Kolonia
8812	8515	\N	Bilno
8813	8515	\N	Błędowo
8814	8515	\N	Błonie
8815	8515	\N	Chojny
8816	8515	\N	Chwalibogowo
8817	8515	\N	Czaple
8818	8515	\N	Dziankowo
8819	8515	\N	Dziankówek
8820	8515	\N	Gliznowo
8821	8515	\N	Gocław
8822	8515	\N	Gole
8823	8515	\N	Golska Huta
8824	8515	\N	Henryków
8825	8515	\N	Kaczawka
8826	8515	\N	Kaliska
8827	8515	\N	Kamienna
8828	8515	\N	Kanibród
8829	8515	\N	Kąty
8830	8515	\N	Kłóbka
8831	8515	\N	Kłóbska Kolonia
8832	8515	\N	Kobyla Łąka
8833	8515	\N	Kołomia
8834	8515	\N	Kostulin
8835	8515	\N	Krzewie
8836	8515	\N	Krzewie Drugie
8837	8515	\N	Modlibórz
8838	8515	\N	Morzyce
8839	8515	\N	Narty
8840	8515	\N	Nowa Wieś
8841	8515	\N	Nowe Czaple
8842	8515	\N	Nowe Gagowy
8843	8515	\N	Nowy Młyn
8844	8515	\N	Podgórze
8845	8515	\N	Rutkowice
8846	8515	\N	Rzegocin
8847	8515	\N	Rzeżewo Małe
8848	8515	\N	Rzeżewo-Morzyce
8849	8515	\N	Siemiony
8850	8515	\N	Sławęcin
8851	8515	\N	Sławęckie Góry
8852	8515	\N	Stare Gagowy
8853	8515	\N	Stępka
8854	8515	\N	Stróże
8855	8515	\N	Szewo
8856	8515	\N	Świerna
8857	8515	\N	Uchodze
8858	8515	\N	Walentowo
8859	8515	\N	Wąwał
8860	8515	\N	Wiktorowo
8861	8515	\N	Wola Dziankowska
8862	8515	\N	Wola Olszowa
8863	8515	\N	Wola Olszowa-Parcele
8864	8516	\N	Lubraniec
8865	8516	\N	Agnieszkowo
8866	8516	\N	Annowo
8867	8516	\N	Bielawy
8868	8516	\N	Biernatki
8869	8516	\N	Bodzanowo
8870	8516	\N	Borek
8871	8516	\N	Czajno
8872	8516	\N	Dąbie Kujawskie
8873	8516	\N	Dąbie Poduchowne
8874	8516	\N	Dęby Janiszewskie
8875	8516	\N	Dobierzyn
8876	8516	\N	Florianowo
8877	8516	\N	Gołębin
8878	8516	\N	Gołębin-Parcele
8879	8516	\N	Górniak
8880	8516	\N	Janiszewo
8881	8516	\N	Józefowo
8882	8516	\N	Kazanie
8883	8516	\N	Kłobia
8884	8516	\N	Kłobia Nowa
8885	8516	\N	Kolonia Łódź
8886	8516	\N	Kolonia Piaski
8887	8516	\N	Koniec
8888	8516	\N	Korzeszynek
8889	8516	\N	Krowice
8890	8516	\N	Lubraniec-Parcele
8891	8516	\N	Lubrańczyk
8892	8516	\N	Marysin
8893	8516	\N	Mieczysławowo
8894	8516	\N	Milżyn
8895	8516	\N	Milżynek
8896	8516	\N	Ossowo
8897	8516	\N	Rabinowo
8898	8516	\N	Redecz Kalny
8899	8516	\N	Redecz Wielki-Parcele
8900	8516	\N	Redecz Wielki-Wieś
8901	8516	\N	Sarnowo
8902	8516	\N	Siarczyce
8903	8516	\N	Siemnówek
8904	8516	\N	Skaszyn
8905	8516	\N	Smogorzewo
8906	8516	\N	Stok
8907	8516	\N	Sułkowo
8908	8516	\N	Świątniki
8909	8516	\N	Turowo
8910	8516	\N	Wiktorowo
8911	8516	\N	Wola Sosnowa
8912	8516	\N	Zgłowiączka
8913	8516	\N	Żydowo
8914	8517	\N	Adaminowo
8915	8517	\N	Dąb Mały
8916	8517	\N	Dąb Polski
8917	8517	\N	Dąb Wielki
8918	8517	\N	Dębice
8919	8517	\N	Dobiegniewo
8920	8517	\N	Dobra Wola
8921	8517	\N	Gróbce
8922	8517	\N	Jazy
8923	8517	\N	Józefowo
8924	8517	\N	Kolonia Dębice
8925	8517	\N	Kosinowo
8926	8517	\N	Koszanowo
8927	8517	\N	Kruszyn
8928	8517	\N	Kruszynek
8929	8517	\N	Ludwinowo
8930	8517	\N	Ładne
8931	8517	\N	Łagiewniki
8932	8517	\N	Łuba Druga
8933	8517	\N	Markowo
8934	8517	\N	Modzerowo
8935	8517	\N	Mostki
8936	8517	\N	Mursk
8937	8517	\N	Nowa Wieś
8938	8517	\N	Pińczata
8939	8517	\N	Poddębice
8940	8517	\N	Potok
8941	8517	\N	Przerytka
8942	8517	\N	Przyruda
8943	8517	\N	Radyszyn
8944	8517	\N	Ruda
8945	8517	\N	Skoki Duże
8946	8517	\N	Skoki Małe
8947	8517	\N	Smolarskie
8948	8517	\N	Smólnik
8949	8517	\N	Smólsk
8950	8517	\N	Sykuła
8951	8517	\N	Świętosław
8952	8517	\N	Telążna Leśna
8953	8517	\N	Telążna Stara
8954	8517	\N	Warząchewka Królewska
8955	8517	\N	Warząchewka Nowa
8956	8517	\N	Warząchewka Polska
8957	8517	\N	Widoń
8958	8517	\N	Wikaryjskie
8959	8517	\N	Wistka Królewska
8960	8517	\N	Wistka Szlachecka
8961	8517	\N	Wójtowskie
8962	8517	\N	Zuzałka
8963	8517	\N	Włocławek
8964	305	\N	Barcin
8965	305	\N	Gąsawa
8966	305	\N	Janowiec Wielkopolski
8967	305	\N	Łabiszyn
8968	305	\N	Rogowo
8969	305	\N	Żnin
8970	8964	\N	Barcin
8971	8964	\N	Aleksandrowo
8972	8964	\N	Augustowo
8973	8964	\N	Barcin-Wieś
8974	8964	\N	Bielawy
8975	8964	\N	Dąbrówka Barcińska
8976	8964	\N	Gulczewo
8977	8964	\N	Józefinka
8978	8964	\N	Julianowo
8979	8964	\N	Kania
8980	8964	\N	Knieja
8981	8964	\N	Krotoszyn
8982	8964	\N	Mamlicz
8983	8964	\N	Młodocin
8984	8964	\N	Piechcin
8985	8964	\N	Pturek
8986	8964	\N	Sadłogoszcz
8987	8964	\N	Szeroki Kamień
8988	8964	\N	Wapienno
8989	8964	\N	Wolice
8990	8964	\N	Zalesie Barcińskie
8991	8964	\N	Złotowo
8992	8965	\N	Annowo
8993	8965	\N	Biskupin
8994	8965	\N	Chomiąża Szlachecka
8995	8965	\N	Drewno
8996	8965	\N	Folusz
8997	8965	\N	Gąsawa
8998	8965	\N	Głowy
8999	8965	\N	Godawy
9000	8965	\N	Gogółkowo
9001	8965	\N	Komratowo
9002	8965	\N	Laski Małe
9003	8965	\N	Laski Wielkie
9004	8965	\N	Łysinin
9005	8965	\N	Marcinkowo Dolne
9006	8965	\N	Marcinkowo Górne
9007	8965	\N	Nowawieś Pałucka
9008	8965	\N	Obudno
9009	8965	\N	Oćwieka
9010	8965	\N	Ostrówce
9011	8965	\N	Piastowo
9012	8965	\N	Pniewy
9013	8965	\N	Rozalinowo
9014	8965	\N	Ryszewko
9015	8965	\N	Szelejewo
9016	8965	\N	Wiktorowo
9017	8966	\N	Janowiec Wielkopolski
9018	8966	\N	Bielawy
9019	8966	\N	Brudzyń
9020	8966	\N	Chrzanowo
9021	8966	\N	Dębiec
9022	8966	\N	Dziekszyn
9023	8966	\N	Flantrowo
9024	8966	\N	Gącz
9025	8966	\N	Janowiec-Wieś
9026	8966	\N	Juncewo
9027	8966	\N	Kołdrąb
9028	8966	\N	Laskowo
9029	8966	\N	Łapaj
9030	8966	\N	Miniszewo
9031	8966	\N	Obiecanowo
9032	8966	\N	Ośno
9033	8966	\N	Posługowo
9034	8966	\N	Puzdrowiec
9035	8966	\N	Sarbinowo Drugie
9036	8966	\N	Świątkowo
9037	8966	\N	Tonowo
9038	8966	\N	Wełna
9039	8966	\N	Włoszanowo
9040	8966	\N	Wybranowo
9041	8966	\N	Zrazim
9042	8966	\N	Żerniki
9043	8966	\N	Żużoły
9044	8967	\N	Łabiszyn
9045	8967	\N	Annowo
9046	8967	\N	Buszkowo
9047	8967	\N	Jabłowo Pałuckie
9048	8967	\N	Jabłówko
9049	8967	\N	Jeżewice
9050	8967	\N	Jeżewo
9051	8967	\N	Kaliska
9052	8967	\N	Kąpie
9053	8967	\N	Klotyldowo
9054	8967	\N	Kłodzin
9055	8967	\N	Lubostroń
9056	8967	\N	Łabiszyn-Wieś
9057	8967	\N	Nowe Dąbie
9058	8967	\N	Obielewo
9059	8967	\N	Obórznia
9060	8967	\N	Ojrzanowo
9061	8967	\N	Oporowo
9062	8967	\N	Oporówek
9063	8967	\N	Ostatkowo
9064	8967	\N	Pszczółczyn
9065	8967	\N	Rzywno
9066	8967	\N	Smerzyn
9067	8967	\N	Smogorzewo
9068	8967	\N	Wielki Sosnowiec
9069	8967	\N	Władysławowo
9070	8967	\N	Wyręba
9071	8967	\N	Załachowo
9072	8967	\N	Zdziersk
9073	8968	\N	Bielawka
9074	8968	\N	Biskupiec
9075	8968	\N	Bożacin
9076	8968	\N	Budzisław
9077	8968	\N	Cegielnia
9078	8968	\N	Cotoń
9079	8968	\N	Czewujewo
9080	8968	\N	Długi Bród
9081	8968	\N	Gałęzewko
9082	8968	\N	Gałęzewo
9083	8968	\N	Głęboczek
9084	8968	\N	Gołąbki
9085	8968	\N	Gostomka
9086	8968	\N	Gościeszyn
9087	8968	\N	Gościeszynek
9088	8968	\N	Grochowiska Księże
9089	8968	\N	Grochowiska Szlacheckie
9090	8968	\N	Izdebno
9091	8968	\N	Jeziora
9092	8968	\N	Kępniak
9093	8968	\N	Lubcz
9094	8968	\N	Lubczynek
9095	8968	\N	Łaziska
9096	8968	\N	Mięcierzyn
9097	8968	\N	Niedźwiady
9098	8968	\N	Recz
9099	8968	\N	Rogowo
9100	8968	\N	Rogówko
9101	8968	\N	Rudunek
9102	8968	\N	Ryszewo
9103	8968	\N	Rzym
9104	8968	\N	Sarnówko
9105	8968	\N	Skórki
9106	8968	\N	Szkółki
9107	8968	\N	Ustroń
9108	8968	\N	Wiewiórczyn
9109	8968	\N	Wiktorowo
9110	8968	\N	Wola
9111	8969	\N	Żnin
9112	8969	\N	Bekanówka
9113	8969	\N	Białożewin
9114	8969	\N	Bożejewice
9115	8969	\N	Bożejewiczki
9116	8969	\N	Brzyskorzystew
9117	8969	\N	Brzyskorzystewko
9118	8969	\N	Cerekwica
9119	8969	\N	Chomiąża Księża
9120	8969	\N	Daronice
9121	8969	\N	Dobrylewo
9122	8969	\N	Dochanowo
9123	8969	\N	Gorzyce
9124	8969	\N	Jadowniki Bielskie
9125	8969	\N	Jadowniki Rycerskie
9126	8969	\N	Januszkowo
9127	8969	\N	Jaroszewo
9128	8969	\N	Kaczkowo
9129	8969	\N	Kaczkówko
9130	8969	\N	Kępa
9131	8969	\N	Kierzkowo
9132	8969	\N	Murczyn
9133	8969	\N	Murczynek
9134	8969	\N	Nadborowo
9135	8969	\N	Nowiny
9136	8969	\N	Obrona Leśna
9137	8969	\N	Paryż
9138	8969	\N	Podgórzyn
9139	8969	\N	Podobowice
9140	8969	\N	Probostwo
9141	8969	\N	Redczyce
9142	8969	\N	Rydlewo
9143	8969	\N	Sarbinowo
9144	8969	\N	Sielec
9145	8969	\N	Skarbienice
9146	8969	\N	Słabomierz
9147	8969	\N	Sławoszewo
9148	8969	\N	Słębowo
9149	8969	\N	Sobiejuchy
9150	8969	\N	Sulinowo
9151	8969	\N	Świerczewo
9152	8969	\N	Ustaszewo
9153	8969	\N	Uścikowo
9154	8969	\N	Wawrzynki
9155	8969	\N	Wenecja
9156	8969	\N	Wilczkowo
9157	8969	\N	Wójcin
9158	8969	\N	Żnin-Wieś
9159	306	\N	Bydgoszcz
9160	308	\N	Grudziądz
9161	310	\N	Toruń
9162	312	\N	Włocławek
9163	332	\N	Międzyrzec Podlaski
9164	332	\N	Terespol
9165	332	\N	Biała Podlaska
9166	332	\N	Drelów
9167	332	\N	Janów Podlaski
9168	332	\N	Kodeń
9169	332	\N	Konstantynów
9170	332	\N	Leśna Podlaska
9171	332	\N	Łomazy
9172	332	\N	Piszczac
9173	332	\N	Rokitno
9174	332	\N	Rossosz
9175	332	\N	Sławatycze
9176	332	\N	Sosnówka
9177	332	\N	Tuczna
9178	332	\N	Wisznice
9179	332	\N	Zalesie
9180	9163	\N	Międzyrzec Podlaski
9181	9164	\N	Terespol
9182	9165	\N	Bagonica
9183	9165	\N	Budziszew
9184	9165	\N	Cełujki
9185	9165	\N	Cicibór Duży
9186	9165	\N	Cicibór Mały
9187	9165	\N	Czosnówka
9188	9165	\N	Dokudów Drugi
9189	9165	\N	Dokudów Pierwszy
9190	9165	\N	Franopol
9191	9165	\N	Grabanów
9192	9165	\N	Grabanów-Kolonia
9193	9165	\N	Grabarka
9194	9165	\N	Helenów
9195	9165	\N	Hola
9196	9165	\N	Hrud
9197	9165	\N	Hulanka
9198	9165	\N	Husinka
9199	9165	\N	Janówka
9200	9165	\N	Jaźwiny
9201	9165	\N	Julków
9202	9165	\N	Kaliłów
9203	9165	\N	Kamieniczne
9204	9165	\N	Kępa
9205	9165	\N	Kijowiec
9206	9165	\N	Koślawe
9207	9165	\N	Kownackie
9208	9165	\N	Kozula
9209	9165	\N	Krąglik
9210	9165	\N	Krzymowskie
9211	9165	\N	Lisy
9212	9165	\N	Łukowce
9213	9165	\N	Michałówka
9214	9165	\N	Młyniec
9215	9165	\N	Nowy Sławacinek
9216	9165	\N	Ogrodniki
9217	9165	\N	Ortel Książęcy Drugi
9218	9165	\N	Ortel Książęcy Pierwszy
9219	9165	\N	Osienniki
9220	9165	\N	Perkowice
9221	9165	\N	Planowa
9222	9165	\N	Podłąka
9223	9165	\N	Podszosa
9224	9165	\N	Pojelce
9225	9165	\N	Porosiuki
9226	9165	\N	Pólko
9227	9165	\N	Rakowiska
9228	9165	\N	Roskosz
9229	9165	\N	Sitnik
9230	9165	\N	Smolne Piece
9231	9165	\N	Stary Sławacinek
9232	9165	\N	Styrzyniec
9233	9165	\N	Surmacze
9234	9165	\N	Swory
9235	9165	\N	Sycyna
9236	9165	\N	Terebela
9237	9165	\N	Tolusin
9238	9165	\N	Wilczyn
9239	9165	\N	Woroniec
9240	9165	\N	Woskrzenice Duże
9241	9165	\N	Woskrzenice Małe
9242	9165	\N	Wozareckie Pieńki
9243	9165	\N	Wólka Plebańska
9244	9165	\N	Zabłocie
9245	9165	\N	Zacisze
9246	9165	\N	Zagóra
9247	9165	\N	Zielone
9248	9165	\N	Biała Podlaska
9249	9166	\N	Aleksandrówka
9250	9166	\N	Byk
9251	9166	\N	Danówka
9252	9166	\N	Dołha
9253	9166	\N	Drelów
9254	9166	\N	Krasna
9255	9166	\N	Kwasówka
9256	9166	\N	Leszczanka
9257	9166	\N	Łan
9258	9166	\N	Łózki
9259	9166	\N	Nowiny
9260	9166	\N	Okopy
9261	9166	\N	Pereszczówka
9262	9166	\N	Przechodzisko
9263	9166	\N	Sokule
9264	9166	\N	Strzyżówka
9265	9166	\N	Szachy
9266	9166	\N	Szóstka
9267	9166	\N	Witoroż
9268	9166	\N	Worsy
9269	9166	\N	Wólka Łózecka
9270	9166	\N	Zahajki
9271	9166	\N	Żerocin
9272	9167	\N	Błonie
9273	9167	\N	Bubel-Granna
9274	9167	\N	Bubel-Łukowiska
9275	9167	\N	Jakówki
9276	9167	\N	Janów Podlaski
9277	9167	\N	Kajetanka
9278	9167	\N	Klonownica Mała
9279	9167	\N	Klonownica-Plac
9280	9167	\N	Nowinki
9281	9167	\N	Nowy Pawłów
9282	9167	\N	Ostrów
9283	9167	\N	Peredyło
9284	9167	\N	Piaski
9285	9167	\N	Pieczyska
9286	9167	\N	Polinów
9287	9167	\N	Romanów
9288	9167	\N	Stare Buczyce
9289	9167	\N	Stary Bubel
9290	9167	\N	Stary Pawłów
9291	9167	\N	Werchliś
9292	9167	\N	Woroblin
9293	9167	\N	Wygoda
9294	9168	\N	Dobratycze
9295	9168	\N	Dobromyśl
9296	9168	\N	Elżbiecin
9297	9168	\N	Futera
9298	9168	\N	Haczki
9299	9168	\N	Kąty
9300	9168	\N	Kodeń
9301	9168	\N	Kopytów
9302	9168	\N	Kopytów-Kolonia
9303	9168	\N	Kostomłoty
9304	9168	\N	Kożanówka
9305	9168	\N	Okczyn
9306	9168	\N	Olszanki
9307	9168	\N	Podlas
9308	9168	\N	Podstawek
9309	9168	\N	Rapcze
9310	9168	\N	Szostaki
9311	9168	\N	Zabłocie
9312	9168	\N	Zabłocie-Kolonia
9313	9168	\N	Zagacie
9314	9168	\N	Zalewsze
9315	9169	\N	Antolin
9316	9169	\N	Głuchowo
9317	9169	\N	Gnojno
9318	9169	\N	Komarno
9319	9169	\N	Komarno-Kolonia
9320	9169	\N	Konstantynów
9321	9169	\N	Ludwinów
9322	9169	\N	Międzylesie
9323	9169	\N	Siekierka
9324	9169	\N	Solinki
9325	9169	\N	Wandopol
9326	9169	\N	Wichowicze
9327	9169	\N	Witoldów
9328	9169	\N	Wólka Polinowska
9329	9169	\N	Zakalinki
9330	9169	\N	Zakanale
9331	9170	\N	Abisynia
9332	9170	\N	Bukowice
9333	9170	\N	Bukowice-Kolonia
9334	9170	\N	Droblin
9335	9170	\N	Dwór
9336	9170	\N	Góry
9337	9170	\N	Haczki
9338	9170	\N	Jagodnica
9339	9170	\N	Klukowszczyzna
9340	9170	\N	Kolonia Poprzeczna
9341	9170	\N	Leśna Podlaska
9342	9170	\N	Ludwinów
9343	9170	\N	Mariampol
9344	9170	\N	Nosów
9345	9170	\N	Nosów-Kolonia
9346	9170	\N	Nowa Bordziłówka
9347	9170	\N	Ossówka
9348	9170	\N	Pieściucha
9349	9170	\N	Przesmyki
9350	9170	\N	Stara Bordziłówka
9351	9170	\N	Witulin
9352	9170	\N	Witulin-Kolonia
9353	9170	\N	Worgule
9354	9170	\N	Wycinka
9355	9170	\N	Zaberbecze
9356	9170	\N	Żabowo
9357	9171	\N	Bielany
9358	9171	\N	Burwin
9359	9171	\N	Dubów
9360	9171	\N	Działy
9361	9171	\N	Grabowszczyzna
9362	9171	\N	Huszcza
9363	9171	\N	Janicka
9364	9171	\N	Jaworówka
9365	9171	\N	Jusaki-Zarzeka
9366	9171	\N	Kamienie
9367	9171	\N	Kolonie Koszołowskie
9368	9171	\N	Koło Boksińskiej Drogi
9369	9171	\N	Końce
9370	9171	\N	Kopytnik
9371	9171	\N	Korczówka
9372	9171	\N	Koszoły
9373	9171	\N	Kozły
9374	9171	\N	Krasówka
9375	9171	\N	Krymki
9376	9171	\N	Lorcin
9377	9171	\N	Lubenka
9378	9171	\N	Łomazówka
9379	9171	\N	Łomazy
9380	9171	\N	Łysa Góra
9381	9171	\N	Malinowszczyzna
9382	9171	\N	Międzydroże
9383	9171	\N	Moszczona
9384	9171	\N	Naddatki
9385	9171	\N	Niedźwiedzica
9386	9171	\N	Nowa Zienkowizna
9387	9171	\N	Ochoża
9388	9171	\N	Ostrówek
9389	9171	\N	Podbrzezina
9390	9171	\N	Pod Kozłami
9391	9171	\N	Puchaczówka
9392	9171	\N	Stasiówka
9393	9171	\N	Stepki
9394	9171	\N	Stroniec
9395	9171	\N	Studzianka
9396	9171	\N	Szymanowo
9397	9171	\N	Wola Dubowska
9398	9171	\N	Wólka Korczowska
9399	9171	\N	Zarówka
9400	9171	\N	Zaścianek
9401	9171	\N	Zawąskie
9402	9163	\N	Bereza
9403	9163	\N	Dołhołęka
9404	9163	\N	Halasy
9405	9163	\N	Jelnica
9406	9163	\N	Kolonia Wolańska
9407	9163	\N	Koszeliki
9408	9163	\N	Kożuszki
9409	9163	\N	Krzewica
9410	9163	\N	Krzymoszyce
9411	9163	\N	Łuby
9412	9163	\N	Łukowisko
9413	9163	\N	Łuniew
9414	9163	\N	Manie
9415	9163	\N	Misie
9416	9163	\N	Pościsze
9417	9163	\N	Przychody
9418	9163	\N	Przyłuki
9419	9163	\N	Puchacze
9420	9163	\N	Rogoźnica
9421	9163	\N	Rogoźnica-Kolonia
9422	9163	\N	Rogoźniczka
9423	9163	\N	Rudniki
9424	9163	\N	Rzeczyca
9425	9163	\N	Sawki
9426	9163	\N	Sitno
9427	9163	\N	Strzakły
9428	9163	\N	Tłuściec
9429	9163	\N	Tuliłów
9430	9163	\N	Utrówka
9431	9163	\N	Wólka Krzymowska
9432	9163	\N	Wysokie
9433	9163	\N	Zasiadki
9434	9163	\N	Zaścianki
9435	9163	\N	Zawadki
9436	9163	\N	Żabce
9437	9172	\N	Borowe
9438	9172	\N	Chmielne
9439	9172	\N	Chotyłów
9440	9172	\N	Czworaki
9441	9172	\N	Dąbrowica Mała
9442	9172	\N	Dobrynka
9443	9172	\N	Hulcze
9444	9172	\N	Janówka
9445	9172	\N	Kościeniewicze
9446	9172	\N	Nowe Połoski
9447	9172	\N	Nowy Dwór
9448	9172	\N	Ogrodniki
9449	9172	\N	Ortel Królewski Drugi
9450	9172	\N	Ortel Królewski Pierwszy
9451	9172	\N	Parcela
9452	9172	\N	Piszczac
9453	9172	\N	Piszczac-Kolonia
9454	9172	\N	Pod Lasem
9455	9172	\N	Podpołoski
9456	9172	\N	Pod Torem
9457	9172	\N	Połoski
9458	9172	\N	Popiel
9459	9172	\N	Puhary A
9460	9172	\N	Ratarków
9461	9172	\N	Stare Połoski
9462	9172	\N	Trojanów
9463	9172	\N	Wołoszki
9464	9172	\N	Wólka Kościeniewicka
9465	9172	\N	Wyczółki
9466	9172	\N	Zahorów
9467	9172	\N	Zalutyń
9468	9172	\N	Za Torem
9469	9173	\N	Cieleśnica
9470	9173	\N	Derło
9471	9173	\N	Hołodnica
9472	9173	\N	Klonownica Duża
9473	9173	\N	Kołczyn
9474	9173	\N	Lipnica
9475	9173	\N	Michałki
9476	9173	\N	Olszyn
9477	9173	\N	Pokinianka
9478	9173	\N	Pratulin
9479	9173	\N	Rokitno
9480	9173	\N	Zaczopki
9481	9174	\N	Bordziłówka
9482	9174	\N	Karaczony
9483	9174	\N	Kożanówka
9484	9174	\N	Mokre
9485	9174	\N	Musiejówka
9486	9174	\N	Romaszki
9487	9174	\N	Rossosz
9488	9174	\N	Zagórek
9489	9174	\N	Zagrobla
9490	9174	\N	Zaolzie
9491	9175	\N	Jabłeczna
9492	9175	\N	Krzywowólka
9493	9175	\N	Krzywowólka-Kolonia
9494	9175	\N	Kuzawka
9495	9175	\N	Liszna
9496	9175	\N	Monastyr
9497	9175	\N	Mościce Dolne
9498	9175	\N	Nowosiółki
9499	9175	\N	Parośla
9500	9175	\N	Sajówka
9501	9175	\N	Sławatycze
9502	9175	\N	Sławatycze-Kolonia
9503	9175	\N	Stynówszczyzna
9504	9175	\N	Terebiski
9505	9175	\N	Zańków
9506	9175	\N	Zaręka
9507	9176	\N	Czeputka
9508	9176	\N	Dębów
9509	9176	\N	Lipinki
9510	9176	\N	Motwica
9511	9176	\N	Pogorzelec
9512	9176	\N	Przechód
9513	9176	\N	Romanów
9514	9176	\N	Rozwadówka
9515	9176	\N	Rozwadówka-Folwark
9516	9176	\N	Sapiehów
9517	9176	\N	Sosnówka
9518	9176	\N	Wygnanka
9519	9176	\N	Zawyhary
9520	9176	\N	Żeszczynka
9521	9164	\N	Bohukały
9522	9164	\N	Dobratycze-Kolonia
9523	9164	\N	Kobylany
9524	9164	\N	Kołpin-Ogrodniki
9525	9164	\N	Koroszczyn
9526	9164	\N	Krzyczew
9527	9164	\N	Kukuryki
9528	9164	\N	Kuzawka
9529	9164	\N	Lebiedziew
9530	9164	\N	Lechuty Duże
9531	9164	\N	Lechuty Małe
9532	9164	\N	Łęgi
9533	9164	\N	Łobaczew Duży
9534	9164	\N	Łobaczew Mały
9535	9164	\N	Małaszewicze
9536	9164	\N	Małaszewicze Duże
9537	9164	\N	Małaszewicze Małe
9538	9164	\N	Michalków
9539	9164	\N	Murawiec
9540	9164	\N	Neple
9541	9164	\N	Podolanka
9542	9164	\N	Polatycze
9543	9164	\N	Samowicze
9544	9164	\N	Starzynka
9545	9164	\N	Surowo
9546	9164	\N	Wielkie Pole
9547	9164	\N	Zastawek
9548	9164	\N	Żuki
9549	9177	\N	Bokinka Królewska
9550	9177	\N	Bokinka Pańska
9551	9177	\N	Choroszczynka
9552	9177	\N	Dąbrowica Duża
9553	9177	\N	Kalichowszczyzna
9554	9177	\N	Leniuszki
9555	9177	\N	Matiaszówka
9556	9177	\N	Mazanówka
9557	9177	\N	Międzyleś
9558	9177	\N	Ogrodniki
9559	9177	\N	Rozbitówka
9560	9177	\N	Tuczna
9561	9177	\N	Wiski
9562	9177	\N	Władysławów
9563	9177	\N	Wólka Zabłocka
9564	9177	\N	Wólka Zabłocka-Kolonia
9565	9177	\N	Żuki
9566	9178	\N	Curyn
9567	9178	\N	Dołholiska
9568	9178	\N	Dubica Dolna
9569	9178	\N	Dubica Górna
9570	9178	\N	Horodyszcze
9571	9178	\N	Łyniew
9572	9178	\N	Małgorzacin
9573	9178	\N	Marylin
9574	9178	\N	Polubicze Dworskie
9575	9178	\N	Polubicze Wiejskie
9576	9178	\N	Ratajewicze
9577	9178	\N	Rowiny
9578	9178	\N	Sewerynówka
9579	9178	\N	Wisznice
9580	9178	\N	Wisznice-Kolonia
9581	9178	\N	Wygoda
9582	9178	\N	Zacisze
9583	9179	\N	Berezówka
9584	9179	\N	Dereczanka
9585	9179	\N	Dobryń Duży
9586	9179	\N	Dobryń-Kolonia
9587	9179	\N	Dobryń Mały
9588	9179	\N	Horbów
9589	9179	\N	Horbów-Kolonia
9590	9179	\N	Kijowiec
9591	9179	\N	Kijowiec-Kolonia
9592	9179	\N	Kłoda Duża
9593	9179	\N	Kłoda Mała
9594	9179	\N	Koczukówka
9595	9179	\N	Lachówka Duża
9596	9179	\N	Lachówka Mała
9597	9179	\N	Malowa Góra
9598	9179	\N	Młyńskie
9599	9179	\N	Mokrany Nowe
9600	9179	\N	Mokrany Stare
9601	9179	\N	Nowosiółki
9602	9179	\N	Wólka Dobryńska
9603	9179	\N	Zalesie
9604	314	\N	Biłgoraj
9605	314	\N	Aleksandrów
9606	314	\N	Biszcza
9607	314	\N	Frampol
9608	314	\N	Goraj
9609	314	\N	Józefów
9610	314	\N	Księżpol
9611	314	\N	Łukowa
9612	314	\N	Obsza
9613	314	\N	Potok Górny
9614	314	\N	Tarnogród
9615	314	\N	Tereszpol
9616	314	\N	Turobin
9617	9604	\N	Biłgoraj
9618	9605	\N	Aleksandrów
9619	9605	\N	Bukowiec
9620	9605	\N	Dąbrowa
9621	9605	\N	Margole
9622	9605	\N	Podlas
9623	9605	\N	Sigła
9624	9605	\N	Trzepietniak
9625	9604	\N	Andrzejówka
9626	9604	\N	Brodziaki
9627	9604	\N	Bukowa
9628	9604	\N	Ciosmy
9629	9604	\N	Dąbrowica
9630	9604	\N	Dereźnia Majdańska
9631	9604	\N	Dereźnia Solska
9632	9604	\N	Dereźnia-Zagrody
9633	9604	\N	Dyle
9634	9604	\N	Edwardów
9635	9604	\N	Gromada
9636	9604	\N	Hedwiżyn
9637	9604	\N	Ignatówka
9638	9604	\N	Kajetanówka
9639	9604	\N	Korczów
9640	9604	\N	Korytków Duży
9641	9604	\N	Majdan Gromadzki
9642	9604	\N	Nadrzecze
9643	9604	\N	Nowy Bidaczów
9644	9604	\N	Okrągłe
9645	9604	\N	Podlesie
9646	9604	\N	Rapy Dylańskie
9647	9604	\N	Ratwica
9648	9604	\N	Ruda Solska
9649	9604	\N	Ruda-Zagrody
9650	9604	\N	Siedem Chałup
9651	9604	\N	Smólsko Duże
9652	9604	\N	Smólsko Małe
9653	9604	\N	Sól
9654	9604	\N	Stary Bidaczów
9655	9604	\N	Teodorówka
9656	9604	\N	Wola Dereźniańska
9657	9604	\N	Wola Duża
9658	9604	\N	Wola Mała
9659	9604	\N	Wolaniny
9660	9604	\N	Żelebsko
9661	9606	\N	Biszcza
9662	9606	\N	Budziarze
9663	9606	\N	Bukowina
9664	9606	\N	Gózd Lipiński
9665	9606	\N	Suszka
9666	9606	\N	Wola Kulońska
9667	9606	\N	Wólka Biska
9668	9606	\N	Żary
9669	9607	\N	Frampol
9670	9607	\N	Chłopków
9671	9607	\N	Karolówka
9672	9607	\N	Kąty
9673	9607	\N	Kolonia Kąty
9674	9607	\N	Komodzianka
9675	9607	\N	Korytków Mały
9676	9607	\N	Lisie Góry
9677	9607	\N	Niemirów
9678	9607	\N	Pulczynów
9679	9607	\N	Radzięcin
9680	9607	\N	Rzeczyce
9681	9607	\N	Smoryń
9682	9607	\N	Sokołówka
9683	9607	\N	Sokołówka-Kolonia
9684	9607	\N	Stara Wieś
9685	9607	\N	Teodorówka
9686	9607	\N	Teodorówka-Kolonia
9687	9607	\N	Wola Kątecka
9688	9607	\N	Wola Radzięcka
9689	9608	\N	Abramów
9690	9608	\N	Albinów Duży
9691	9608	\N	Albinów Mały
9692	9608	\N	Bononia
9693	9608	\N	Gilów
9694	9608	\N	Goraj
9695	9608	\N	Hosznia Abramowska
9696	9608	\N	Hosznia Ordynacka
9697	9608	\N	Jędrzejówka
9698	9608	\N	Kondraty
9699	9608	\N	Majdan Abramowski
9700	9608	\N	Średniówka
9701	9608	\N	Średniówka-Kolonia
9702	9608	\N	Wólka Abramowska
9703	9608	\N	Zagrody
9704	9608	\N	Zastawie
9705	9609	\N	Józefów
9706	9609	\N	Borowina
9707	9609	\N	Brzeziny
9708	9609	\N	Czarny Las-Kolonia
9709	9609	\N	Długi Kąt
9710	9609	\N	Florianka
9711	9609	\N	Futymówka
9712	9609	\N	Górecko Kościelne
9713	9609	\N	Górecko Stare
9714	9609	\N	Górniki
9715	9609	\N	Hamernia
9716	9609	\N	Józefów Roztoczański
9717	9609	\N	Majdan Kasztelański
9718	9609	\N	Majdan Nepryski
9719	9609	\N	Pastuszki
9720	9609	\N	Samsonówka
9721	9609	\N	Siedliska
9722	9609	\N	Stanisławów
9723	9609	\N	Szopowe
9724	9609	\N	Tarnowola
9725	9610	\N	Borki
9726	9610	\N	Budzyń
9727	9610	\N	Cegielnia-Markowicze
9728	9610	\N	Gliny
9729	9610	\N	Kamionka
9730	9610	\N	Korchów Drugi
9731	9610	\N	Korchów Pierwszy
9732	9610	\N	Księżpol
9733	9610	\N	Kucły
9734	9610	\N	Kulasze
9735	9610	\N	Majdan Nowy
9736	9610	\N	Majdan Stary
9737	9610	\N	Marianka
9738	9610	\N	Markowicze
9739	9610	\N	Nowy Lipowiec
9740	9610	\N	Pawlichy
9741	9610	\N	Płusy
9742	9610	\N	Przymiarki
9743	9610	\N	Rakówka
9744	9610	\N	Rogale
9745	9610	\N	Stare Króle
9746	9610	\N	Stary Lipowiec
9747	9610	\N	Zanie
9748	9610	\N	Zawadka
9749	9610	\N	Zynie
9750	9611	\N	Borowiec
9751	9611	\N	Chmielek
9752	9611	\N	Kozaki Osuchowskie
9753	9611	\N	Łukowa
9754	9611	\N	Osuchy
9755	9611	\N	Pisklaki
9756	9611	\N	Podsośnina
9757	9611	\N	Szarajówka-Kolonia
9758	9611	\N	Szostaki
9759	9612	\N	Babice
9760	9612	\N	Dorbozy
9761	9612	\N	Obsza
9762	9612	\N	Olchowiec
9763	9612	\N	Wola Obszańska
9764	9612	\N	Zamch
9765	9613	\N	Dąbrówka
9766	9613	\N	Jasiennik Stary
9767	9613	\N	Jedlinki
9768	9613	\N	Kolonia Malennik
9769	9613	\N	Lipiny Dolne
9770	9613	\N	Lipiny Dolne-Kolonia
9771	9613	\N	Lipiny Górne-Borowina
9772	9613	\N	Lipiny Górne-Lewki
9773	9613	\N	Naklik
9774	9613	\N	Potok Górny
9775	9613	\N	Szyszków
9776	9613	\N	Zagródki
9777	9614	\N	Tarnogród
9778	9614	\N	Luchów Dolny
9779	9614	\N	Luchów Górny
9780	9614	\N	Różaniec
9781	9614	\N	Wola Różaniecka
9782	9615	\N	Bukownica
9783	9615	\N	Lipowiec
9784	9615	\N	Panasówka
9785	9615	\N	Szozdy
9786	9615	\N	Tereszpol-Kukiełki
9787	9615	\N	Tereszpol-Zaorenda
9788	9615	\N	Tereszpol-Zygmunty
9789	9615	\N	Tereszpol
9790	9616	\N	Czernięcin Główny
9791	9616	\N	Czernięcin Poduchowny
9792	9616	\N	Elizówka
9793	9616	\N	Gaj Czernięciński
9794	9616	\N	Gródki
9795	9616	\N	Guzówka-Kolonia
9796	9616	\N	Huta Turobińska
9797	9616	\N	Nowa Wieś
9798	9616	\N	Olszanka
9799	9616	\N	Przedmieście Szczebrzeszyńskie
9800	9616	\N	Rokitów
9801	9616	\N	Tarnawa Duża
9802	9616	\N	Tarnawa-Kolonia
9803	9616	\N	Tarnawa Mała
9804	9616	\N	Tokary
9805	9616	\N	Turobin
9806	9616	\N	Wólka Czernięcińska
9807	9616	\N	Zabłocie
9808	9616	\N	Zagroble
9809	9616	\N	Załawcze
9810	9616	\N	Żabno
9811	9616	\N	Żabno-Kolonia
9812	9616	\N	Żurawie
9813	334	\N	Rejowiec Fabryczny
9814	334	\N	Białopole
9815	334	\N	Chełm
9816	334	\N	Dorohusk
9817	334	\N	Dubienka
9818	334	\N	Kamień
9819	334	\N	Leśniowice
9820	334	\N	Rejowiec
9821	334	\N	Ruda-Huta
9822	334	\N	Sawin
9823	334	\N	Siedliszcze
9824	334	\N	Wierzbica
9825	334	\N	Wojsławice
9826	334	\N	Żmudź
9827	9813	\N	Rejowiec Fabryczny
9828	9814	\N	Białopole
9829	9814	\N	Bogdanówka
9830	9814	\N	Busieniec
9831	9814	\N	Buśno
9832	9814	\N	Grobelki
9833	9814	\N	Horeszkowice
9834	9814	\N	Kicin
9835	9814	\N	Kurmanów
9836	9814	\N	Maziarnia Strzelecka
9837	9814	\N	Raciborowice
9838	9814	\N	Raciborowice-Kolonia
9839	9814	\N	Strzelce
9840	9814	\N	Strzelce-Kolonia
9841	9814	\N	Teremiec
9842	9814	\N	Teresin
9843	9814	\N	Zabudnowo
9844	9814	\N	Zaniże
9845	9815	\N	Cegielnia
9846	9815	\N	Depułtycze
9847	9815	\N	Depułtycze Królewskie
9848	9815	\N	Depułtycze Królewskie-Kolonia
9849	9815	\N	Henrysin
9850	9815	\N	Horodyszcze
9851	9815	\N	Horodyszcze-Kolonia
9852	9815	\N	Janów
9853	9815	\N	Józefin
9854	9815	\N	Koza-Gotówka
9855	9815	\N	Krzywice
9856	9815	\N	Krzywice-Kolonia
9857	9815	\N	Krzywiczki
9858	9815	\N	Ludwinów
9859	9815	\N	Nowe Depułtycze
9860	9815	\N	Nowiny
9861	9815	\N	Nowosiółki
9862	9815	\N	Nowosiółki-Kolonia
9863	9815	\N	Ochoża-Kolonia
9864	9815	\N	Okszów
9865	9815	\N	Okszów-Kolonia
9866	9815	\N	Parypse
9867	9815	\N	Podgórze
9868	9815	\N	Pokrówka
9869	9815	\N	Rożdżałów
9870	9815	\N	Rożdżałów-Kolonia
9871	9815	\N	Rudka
9872	9815	\N	Sajczyce
9873	9815	\N	Sobowice
9874	9815	\N	Srebrzyszcze
9875	9815	\N	Stańków
9876	9815	\N	Stare Depułtycze
9877	9815	\N	Staw
9878	9815	\N	Stołpie
9879	9815	\N	Strupin Duży
9880	9815	\N	Strupin Łanowy
9881	9815	\N	Strupin Mały
9882	9815	\N	Tytusin
9883	9815	\N	Uher
9884	9815	\N	Weremowice
9885	9815	\N	Wojniaki
9886	9815	\N	Wólka Czułczycka
9887	9815	\N	Zagroda
9888	9815	\N	Zarzecze
9889	9815	\N	Zawadówka
9890	9815	\N	Żółtańce
9891	9815	\N	Żółtańce-Kolonia
9892	9815	\N	Chełm
9893	9816	\N	Barbarówka
9894	9816	\N	Berdyszcze
9895	9816	\N	Brzeźno
9896	9816	\N	Dobryłówka
9897	9816	\N	Dorohusk
9898	9816	\N	Dorohusk-Osada
9899	9816	\N	Husynne
9900	9816	\N	Kępa
9901	9816	\N	Kolemczyce
9902	9816	\N	Kolonia
9903	9816	\N	Kroczyn
9904	9816	\N	Ladeniska
9905	9816	\N	Ludwinów
9906	9816	\N	Majdan Skordiowski
9907	9816	\N	Michałówka
9908	9816	\N	Mościska
9909	9816	\N	Myszkowiec
9910	9816	\N	Okopy
9911	9816	\N	Okopy-Kolonia
9912	9816	\N	Olenówka
9913	9816	\N	Ostrów
9914	9816	\N	Pogranicze
9915	9816	\N	Puszki
9916	9816	\N	Rozkosz
9917	9816	\N	Skordiów
9918	9816	\N	Stefanów
9919	9816	\N	Suchomiła
9920	9816	\N	Świerże
9921	9816	\N	Świerże-Kolonia
9922	9816	\N	Teosin
9923	9816	\N	Turka
9924	9816	\N	Wólka Okopska
9925	9816	\N	Zalasocze
9926	9816	\N	Zamieście
9927	9816	\N	Zanowinie
9928	9817	\N	Brzozowiec
9929	9817	\N	Dubienka
9930	9817	\N	Holendry
9931	9817	\N	Janostrów
9932	9817	\N	Jasienica
9933	9817	\N	Józefów
9934	9817	\N	Kajetanówka
9935	9817	\N	Krynica
9936	9817	\N	Lipniki
9937	9817	\N	Mateuszowo
9938	9817	\N	Nowokajetanówka
9939	9817	\N	Poduchańka
9940	9817	\N	Radziejów
9941	9817	\N	Rogatka
9942	9817	\N	Rudka
9943	9817	\N	Siedliszcze
9944	9817	\N	Skryhiczyn
9945	9817	\N	Stanisławówka
9946	9817	\N	Starosiele
9947	9817	\N	Tuchanie
9948	9817	\N	Tursko
9949	9817	\N	Uchańka
9950	9817	\N	Zagórnik
9951	9818	\N	Andrzejów
9952	9818	\N	Andrzejów-Kolonia
9953	9818	\N	Czerniejów
9954	9818	\N	Haliczany
9955	9818	\N	Ignatów
9956	9818	\N	Ignatów-Kolonia
9957	9818	\N	Józefin
9958	9818	\N	Kamień
9959	9818	\N	Kamień-Kolonia
9960	9818	\N	Koczów
9961	9818	\N	Las
9962	9818	\N	Majdan Pławanicki
9963	9818	\N	Mołodutyn
9964	9818	\N	Natalin
9965	9818	\N	Pławanice
9966	9818	\N	Pławanice-Kolonia
9967	9818	\N	Rudolfin
9968	9818	\N	Strachosław
9969	9818	\N	Wolawce
9970	9819	\N	Alojzów
9971	9819	\N	Dębina
9972	9819	\N	Horodysko
9973	9819	\N	Janówka
9974	9819	\N	Kasiłan
9975	9819	\N	Kumów Majoracki
9976	9819	\N	Kumów Plebański
9977	9819	\N	Leśniowice
9978	9819	\N	Leśniowice-Kolonia
9979	9819	\N	Majdan Leśniowski
9980	9819	\N	Nowy Folwark
9981	9819	\N	Plisków
9982	9819	\N	Plisków-Kolonia
9983	9819	\N	Politówka
9984	9819	\N	Poniatówka
9985	9819	\N	Rakołupy
9986	9819	\N	Rakołupy Duże
9987	9819	\N	Rakołupy Małe
9988	9819	\N	Sarniak
9989	9819	\N	Sielec
9990	9819	\N	Teresin
9991	9819	\N	Wierzbica
9992	9819	\N	Wygnańce
9993	9820	\N	Adamów
9994	9820	\N	Aleksandria Krzywowolska
9995	9820	\N	Aleksandria Niedziałowska
9996	9820	\N	Bańkowszczyzna
9997	9820	\N	Bieniów
9998	9820	\N	Czechów Kąt
9999	9820	\N	Elżbiecin
10000	9820	\N	Hruszów
10001	9820	\N	Kobyle
10002	9820	\N	Leonów
10003	9820	\N	Marynin
10004	9820	\N	Marysin
10005	9820	\N	Niedziałowice Drugie
10006	9820	\N	Niedziałowice Pierwsze
10007	9820	\N	Niemirów
10008	9820	\N	Rejowiec
10009	9820	\N	Rejowiec-Kolonia
10010	9820	\N	Rybie
10011	9820	\N	Siedliszczki
10012	9820	\N	Stary Majdan
10013	9820	\N	Wereszcze Duże
10014	9820	\N	Wereszcze Małe
10015	9820	\N	Wólka Rejowiecka
10016	9820	\N	Zagrody
10017	9820	\N	Zawadówka
10018	9820	\N	Zyngierówka
10019	9813	\N	Gołąb
10020	9813	\N	Józefin
10021	9813	\N	Kanie
10022	9813	\N	Kanie-Stacja
10023	9813	\N	Krasne
10024	9813	\N	Krzywowola
10025	9813	\N	Leszczanka
10026	9813	\N	Liszno
10027	9813	\N	Liszno-Kolonia
10028	9813	\N	Nikodemówka
10029	9813	\N	Pawłów
10030	9813	\N	Toruń
10031	9813	\N	Wólka Kańska
10032	9813	\N	Wólka Kańska-Kolonia
10033	9813	\N	Zalesie Kańskie
10034	9813	\N	Zalesie Krasieńskie
10035	9821	\N	Chromówka
10036	9821	\N	Dobryłów
10037	9821	\N	Gdola
10038	9821	\N	Gotówka
10039	9821	\N	Hniszów
10040	9821	\N	Hniszów-Kolonia
10041	9821	\N	Iłowa
10042	9821	\N	Jazików
10043	9821	\N	Karolinów
10044	9821	\N	Konotopa
10045	9821	\N	Leśniczówka
10046	9821	\N	Marynin
10047	9821	\N	Marysin
10048	9821	\N	Miłosław
10049	9821	\N	Poczekajka
10050	9821	\N	Ruda
10051	9821	\N	Ruda-Huta
10052	9821	\N	Ruda-Kolonia
10053	9821	\N	Ruda-Opalin
10054	9821	\N	Rudka
10055	9821	\N	Rudka-Kolonia
10056	9821	\N	Tarnówka
10057	9821	\N	Zarudnia
10058	9821	\N	Żalin
10059	9821	\N	Żalin-Kolonia
10060	9822	\N	Aleksandrówka
10061	9822	\N	Bachus
10062	9822	\N	Bukowa Mała
10063	9822	\N	Bukowa Wielka
10064	9822	\N	Chutcze
10065	9822	\N	Czułczyce
10066	9822	\N	Czułczyce-Kolonia
10067	9822	\N	Czułczyce Małe
10068	9822	\N	Hredków
10069	9822	\N	Jagodne
10070	9822	\N	Krobonosz
10071	9822	\N	Krobonosz-Kolonia
10072	9822	\N	Łowcza
10073	9822	\N	Łowcza-Kolonia
10074	9822	\N	Łukówek
10075	9822	\N	Malinówka
10076	9822	\N	Petryłów
10077	9822	\N	Podpakule
10078	9822	\N	Przysiółek
10079	9822	\N	Radzanów
10080	9822	\N	Sajczyce
10081	9822	\N	Sawin
10082	9822	\N	Serniawy
10083	9822	\N	Serniawy-Kolonia
10084	9822	\N	Średni Łan
10085	9822	\N	Tomaszówka
10086	9822	\N	Wólka Petryłowska
10087	9823	\N	Adolfin
10088	9823	\N	Anusin
10089	9823	\N	Bezek
10090	9823	\N	Bezek Dębiński
10091	9823	\N	Bezek-Kolonia
10092	9823	\N	Borowo
10093	9823	\N	Brzeziny
10094	9823	\N	Chojeniec
10095	9823	\N	Chojeniec-Kolonia
10096	9823	\N	Dobromyśl
10097	9823	\N	Dworki
10098	9823	\N	Gliny
10099	9823	\N	Jankowice
10100	9823	\N	Janowica
10101	9823	\N	Julianów
10102	9823	\N	Kamionka
10103	9823	\N	Krowica
10104	9823	\N	Kulik
10105	9823	\N	Kulik-Kolonia
10106	9823	\N	Lechówka
10107	9823	\N	Lipówki
10108	9823	\N	Majdan Zahorodyński
10109	9823	\N	Marynin
10110	9823	\N	Mogilnica
10111	9823	\N	Nowe Chojno
10112	9823	\N	Romanówka
10113	9823	\N	Siedliszcze
10114	9823	\N	Siedliszcze-Kolonia
10115	9823	\N	Siedliszcze-Osada
10116	9823	\N	Stare Chojno
10117	9823	\N	Stasin Dolny
10118	9823	\N	Wojciechów
10119	9823	\N	Wola Korybutowa Druga
10120	9823	\N	Wola Korybutowa-Kolonia
10121	9823	\N	Wola Korybutowa Pierwsza
10122	9823	\N	Zabitek
10123	9824	\N	Bakus-Wanda
10124	9824	\N	Busówno
10125	9824	\N	Busówno-Kolonia
10126	9824	\N	Buza
10127	9824	\N	Chylin
10128	9824	\N	Chylin Mały
10129	9824	\N	Chylin Wielki
10130	9824	\N	Helenów
10131	9824	\N	Kamienna Góra
10132	9824	\N	Karczunek
10133	9824	\N	Kozia Góra
10134	9824	\N	Leonówka
10135	9824	\N	Ochoża
10136	9824	\N	Ochoża-Pniaki
10137	9824	\N	Olchowiec
10138	9824	\N	Olchowiec-Kolonia
10139	9824	\N	Pniówno
10140	9824	\N	Staszyce
10141	9824	\N	Syczyn
10142	9824	\N	Święcica
10143	9824	\N	Tarnów
10144	9824	\N	Terenin
10145	9824	\N	Werejce
10146	9824	\N	Wierzbica
10147	9824	\N	Wierzbica-Osiedle
10148	9824	\N	Władysławów
10149	9824	\N	Wólka Tarnowska
10150	9824	\N	Wygoda
10151	9825	\N	Czarnołozy
10152	9825	\N	Huta
10153	9825	\N	Kolonia
10154	9825	\N	Krasne
10155	9825	\N	Kukawka
10156	9825	\N	Majdan
10157	9825	\N	Majdanek
10158	9825	\N	Majdan Kukawiecki
10159	9825	\N	Majdan Ostrowski
10160	9825	\N	Nowy Majdan
10161	9825	\N	Ostrów
10162	9825	\N	Ostrów-Kolonia
10163	9825	\N	Partyzancka Kolonia
10164	9825	\N	Popławy
10165	9825	\N	Putnowice-Kolonia
10166	9825	\N	Putnowice Wielkie
10167	9825	\N	Rozięcin
10168	9825	\N	Stadarnia
10169	9825	\N	Stary Majdan
10170	9825	\N	Trościanka
10171	9825	\N	Turowiec
10172	9825	\N	Witoldów
10173	9825	\N	Wojsławice
10174	9825	\N	Wojsławice-Kolonia
10175	9825	\N	Wólka Putnowicka
10176	9826	\N	Annopol
10177	9826	\N	Bielin
10178	9826	\N	Dryszczów
10179	9826	\N	Gałęzów
10180	9826	\N	Kazimierówka
10181	9826	\N	Klesztów
10182	9826	\N	Ksawerów
10183	9826	\N	Leszczany
10184	9826	\N	Leszczany-Kolonia
10185	9826	\N	Lipinki
10186	9826	\N	Majdan
10187	9826	\N	Maziarnia
10188	9826	\N	Pobołowice
10189	9826	\N	Pobołowice-Kolonia
10190	9826	\N	Podlaski
10191	9826	\N	Puszcza
10192	9826	\N	Roztoka
10193	9826	\N	Roztoka-Kolonia
10194	9826	\N	Rudno
10195	9826	\N	Stanisławów
10196	9826	\N	Syczów
10197	9826	\N	Teresin
10198	9826	\N	Wołkowiany
10199	9826	\N	Wólka Leszczańska
10200	9826	\N	Żmudź
10201	9826	\N	Żmudź-Kolonia
10202	315	\N	Hrubieszów
10203	315	\N	Dołhobyczów
10204	315	\N	Horodło
10205	315	\N	Mircze
10206	315	\N	Trzeszczany
10207	315	\N	Uchanie
10208	315	\N	Werbkowice
10209	10202	\N	Hrubieszów
10210	10203	\N	Białystok
10211	10203	\N	Chłopiatyn
10212	10203	\N	Chochłów
10213	10203	\N	Dłużniów
10214	10203	\N	Dołhobyczów
10215	10203	\N	Dołhobyczów-Kolonia
10216	10203	\N	Gołębie
10217	10203	\N	Honiatyn
10218	10203	\N	Horodyszcze
10219	10203	\N	Horoszczyce
10220	10203	\N	Hulcze
10221	10203	\N	Kadłubiska
10222	10203	\N	Korczunek
10223	10203	\N	Kościaszyn
10224	10203	\N	Lipina
10225	10203	\N	Liski
10226	10203	\N	Liwcze
10227	10203	\N	Majdan
10228	10203	\N	Myców
10229	10203	\N	Oszczów
10230	10203	\N	Oszczów-Kolonia
10231	10203	\N	Podhajczyki
10232	10203	\N	Przewodów
10233	10203	\N	Setniki
10234	10203	\N	Siekierzyńce
10235	10203	\N	Sulimów
10236	10203	\N	Uśmierz
10237	10203	\N	Witków
10238	10203	\N	Wólka Poturzyńska
10239	10203	\N	Wyżłów
10240	10203	\N	Zaręka
10241	10203	\N	Żabcze
10242	10203	\N	Żniatyn
10243	10204	\N	Bereżnica
10244	10204	\N	Cegielnia
10245	10204	\N	Ciołki
10246	10204	\N	Horodło
10247	10204	\N	Hrebenne
10248	10204	\N	Janki
10249	10204	\N	Kobło-Kolonia
10250	10204	\N	Kopyłów
10251	10204	\N	Liski
10252	10204	\N	Łuszków
10253	10204	\N	Matcze
10254	10204	\N	Poraj
10255	10204	\N	Rogalin
10256	10204	\N	Strzyżów
10257	10204	\N	Zosin
10258	10202	\N	Annopol
10259	10202	\N	Białoskóry
10260	10202	\N	Brodzica
10261	10202	\N	Cichobórz
10262	10202	\N	Czerniczyn
10263	10202	\N	Czortowice
10264	10202	\N	Czumów
10265	10202	\N	Dąbrowa
10266	10202	\N	Dziekanów
10267	10202	\N	Gródek
10268	10202	\N	Husynne
10269	10202	\N	Janki
10270	10202	\N	Kobło
10271	10202	\N	Kosmów
10272	10202	\N	Kozodawy
10273	10202	\N	Kułakowice Drugie
10274	10202	\N	Kułakowice Pierwsze
10275	10202	\N	Kułakowice Trzecie
10276	10202	\N	Łotoszyny
10277	10202	\N	Masłomęcz
10278	10202	\N	Metelin
10279	10202	\N	Mieniany
10280	10202	\N	Moniatycze
10281	10202	\N	Moniatycze-Kolonia
10282	10202	\N	Moroczyn
10283	10202	\N	Nowosiółki
10284	10202	\N	Obrowiec
10285	10202	\N	Stefankowice
10286	10202	\N	Stefankowice-Kolonia
10287	10202	\N	Szpikołosy
10288	10202	\N	Ślipcze
10289	10202	\N	Świerszczów
10290	10202	\N	Teptiuków
10291	10202	\N	Turkołówka
10292	10202	\N	Ubrodowice
10293	10202	\N	Wolica
10294	10202	\N	Wołajowice
10295	10205	\N	Ameryka
10296	10205	\N	Andrzejówka
10297	10205	\N	Borsuk
10298	10205	\N	Dąbrowa
10299	10205	\N	Górka-Zabłocie
10300	10205	\N	Kryłów
10301	10205	\N	Kryłów-Kolonia
10302	10205	\N	Łasków
10303	10205	\N	Małków
10304	10205	\N	Małków-Kolonia
10305	10205	\N	Małków Nowy
10306	10205	\N	Marysin
10307	10205	\N	Miętkie
10308	10205	\N	Miętkie-Kolonia
10309	10205	\N	Mircze
10310	10205	\N	Modryniec
10311	10205	\N	Modryń
10312	10205	\N	Modryń-Kolonia
10313	10205	\N	Mołożów
10314	10205	\N	Mołożów-Kolonia
10315	10205	\N	Prehoryłe
10316	10205	\N	Radostów
10317	10205	\N	Rulikówka
10318	10205	\N	Smoligów
10319	10205	\N	Stara Wieś
10320	10205	\N	Szychowice
10321	10205	\N	Szychowice Nowe
10322	10205	\N	Tuczapy
10323	10205	\N	Wereszyn
10324	10205	\N	Wiszniów
10325	10206	\N	Bogucice
10326	10206	\N	Drogojówka
10327	10206	\N	Józefin
10328	10206	\N	Korytyna
10329	10206	\N	Leopoldów
10330	10206	\N	Majdan Wielki
10331	10206	\N	Mołodiatycze
10332	10206	\N	Nieledew
10333	10206	\N	Ostrówek
10334	10206	\N	Trzeszczany Drugie
10335	10206	\N	Trzeszczany Pierwsze
10336	10206	\N	Zaborce
10337	10206	\N	Zadębce
10338	10206	\N	Zadębce-Kolonia
10339	10206	\N	Trzeszczany
10340	10207	\N	Aurelin
10341	10207	\N	Białowody
10342	10207	\N	Bokinia
10343	10207	\N	Chyżowice
10344	10207	\N	Dąbrowa
10345	10207	\N	Dębina
10346	10207	\N	Drohiczany
10347	10207	\N	Feliksów
10348	10207	\N	Gliniska
10349	10207	\N	Jarosławiec
10350	10207	\N	Lemieszów
10351	10207	\N	Łuszczów
10352	10207	\N	Łuszczów-Kolonia
10353	10207	\N	Marysin
10354	10207	\N	Miedniki
10355	10207	\N	Mojsławice
10356	10207	\N	Mojsławice-Kolonia
10357	10207	\N	Odletajka
10358	10207	\N	Pielaki
10359	10207	\N	Putnowice Górne
10360	10207	\N	Rozkoszówka
10361	10207	\N	Staszic
10362	10207	\N	Teratyn
10363	10207	\N	Teratyn-Kolonia
10364	10207	\N	Uchanie
10365	10207	\N	Uchanie-Kolonia
10366	10207	\N	Wandzin
10367	10207	\N	Wola Uchańska
10368	10207	\N	Wysokie
10369	10208	\N	Adelina
10370	10208	\N	Alojzów
10371	10208	\N	Dobromierzyce
10372	10208	\N	Dobromierzyce-Kolonia
10373	10208	\N	Gozdów
10374	10208	\N	Honiatycze
10375	10208	\N	Honiatycze-Kolonia
10376	10208	\N	Honiatyczki
10377	10208	\N	Hostynne
10378	10208	\N	Hostynne-Kolonia
10379	10208	\N	Konopne
10380	10208	\N	Kotorów
10381	10208	\N	Łotów
10382	10208	\N	Łysa Góra
10383	10208	\N	Malice
10384	10208	\N	Peresołowice
10385	10208	\N	Podhorce
10386	10208	\N	Podhorce-Kolonia
10387	10208	\N	Sahryń
10388	10208	\N	Sahryń-Kolonia
10389	10208	\N	Strzyżowiec
10390	10208	\N	Terebiniec
10391	10208	\N	Terebiń
10392	10208	\N	Turkowice
10393	10208	\N	Werbkowice
10394	10208	\N	Wilków
10395	10208	\N	Wronowice
10396	10208	\N	Zagajnik
10397	316	\N	Batorz
10398	316	\N	Chrzanów
10399	316	\N	Dzwola
10400	316	\N	Godziszów
10401	316	\N	Janów Lubelski
10402	316	\N	Modliborzyce
10403	316	\N	Potok Wielki
10404	10397	\N	Aleksandrówka
10405	10397	\N	Batorz
10406	10397	\N	Błażek
10407	10397	\N	Nowe Moczydła
10408	10397	\N	Samary
10409	10397	\N	Stawce
10410	10397	\N	Stawce-Kolonia
10411	10397	\N	Węglinek
10412	10397	\N	Wola Studzieńska
10413	10397	\N	Wola Studzieńska-Kolonia
10414	10397	\N	Wólka Batorska
10415	10397	\N	Wólka Batorska-Kolonia
10416	10398	\N	Chrzanów
10417	10398	\N	Chrzanów-Kolonia
10418	10398	\N	Łada
10419	10398	\N	Malinie
10420	10398	\N	Otrocz
10421	10399	\N	Branew
10422	10399	\N	Branewka
10423	10399	\N	Branewka-Kolonia
10424	10399	\N	Celinki
10425	10399	\N	Dzwola
10426	10399	\N	Flisy
10427	10399	\N	Kapronie
10428	10399	\N	Kocudza Druga
10429	10399	\N	Kocudza Górna
10430	10399	\N	Kocudza Pierwsza
10431	10399	\N	Kocudza Trzecia
10432	10399	\N	Konstantów
10433	10399	\N	Krzemień Drugi
10434	10399	\N	Krzemień Pierwszy
10435	10399	\N	Władysławów
10436	10399	\N	Zdzisławice
10437	10399	\N	Zofianka Dolna
10438	10400	\N	Andrzejów
10439	10400	\N	Godziszów
10440	10400	\N	Kawęczyn
10441	10400	\N	Nowa Osada
10442	10400	\N	Piłatka
10443	10400	\N	Rataj Ordynacki
10444	10400	\N	Rataj Poduchowny
10445	10400	\N	Wólka Ratajska
10446	10400	\N	Zdziłowice
10447	10401	\N	Janów Lubelski
10448	10401	\N	Biała Druga
10449	10401	\N	Biała Pierwsza
10450	10401	\N	Borownica
10451	10401	\N	Cegielnia
10452	10401	\N	Gierlachy
10453	10401	\N	Jakuby
10454	10401	\N	Jonaki
10455	10401	\N	Kiszki
10456	10401	\N	Kopce
10457	10401	\N	Łążek Garncarski
10458	10401	\N	Łążek Ordynacki
10459	10401	\N	Momoty Dolne
10460	10401	\N	Momoty Górne
10461	10401	\N	Pikule
10462	10401	\N	Ruda
10463	10401	\N	Szewce
10464	10401	\N	Szklarnia
10465	10401	\N	Ujście
10466	10401	\N	Zofianka Górna
10467	10402	\N	Antolin
10468	10402	\N	Bilsko
10469	10402	\N	Brzeziny
10470	10402	\N	Ciechocin
10471	10402	\N	Dąbie
10472	10402	\N	Dąbrocz
10473	10402	\N	Felinów
10474	10402	\N	Gwizdów
10475	10402	\N	Janówek
10476	10402	\N	Kalenne
10477	10402	\N	Kolonia Zamek
10478	10402	\N	Krasonie
10479	10402	\N	Lute
10480	10402	\N	Lute Doły
10481	10402	\N	Majdan
10482	10402	\N	Majdan-Kolonia
10483	10402	\N	Michałówka
10484	10402	\N	Modliborzyce
10485	10402	\N	Pasieka
10486	10402	\N	Słupie
10487	10402	\N	Stojeszyn Drugi
10488	10402	\N	Stojeszyn-Kolonia
10489	10402	\N	Stojeszyn Pierwszy
10490	10402	\N	Świnki
10491	10402	\N	Węgliska
10492	10402	\N	Wierzchowiska Drugie
10493	10402	\N	Wierzchowiska Pierwsze
10494	10402	\N	Wolica Druga
10495	10402	\N	Wolica-Kolonia
10496	10402	\N	Wolica Pierwsza
10497	10402	\N	Zarajec
10498	10403	\N	Dąbrowica
10499	10403	\N	Dąbrówka
10500	10403	\N	Kolonia Potok Wielki
10501	10403	\N	Maliniec
10502	10403	\N	Osinki
10503	10403	\N	Osówek
10504	10403	\N	Potoczek
10505	10403	\N	Potok-Stany
10506	10403	\N	Potok-Stany Kolonia
10507	10403	\N	Potok Wielki
10508	10403	\N	Radwanówka
10509	10403	\N	Stany Nowe
10510	10403	\N	Stawki
10511	10403	\N	Wola Potocka
10512	10403	\N	Zarajec Potocki
10513	317	\N	Krasnystaw
10514	317	\N	Fajsławice
10515	317	\N	Gorzków
10516	317	\N	Izbica
10517	317	\N	Kraśniczyn
10518	317	\N	Łopiennik Górny
10519	317	\N	Rudnik
10520	317	\N	Siennica Różana
10521	317	\N	Żółkiewka
10522	10513	\N	Krasnystaw
10523	10514	\N	Bielecha
10524	10514	\N	Boniewo
10525	10514	\N	Dziecinin
10526	10514	\N	Fajsławice
10527	10514	\N	Ignasin
10528	10514	\N	Kosnowiec
10529	10514	\N	Ksawerówka
10530	10514	\N	Marysin
10531	10514	\N	Siedliska Drugie
10532	10514	\N	Siedliska Pierwsze
10533	10514	\N	Suchodoły
10534	10514	\N	Wola Idzikowska
10535	10514	\N	Zosin
10536	10515	\N	Antoniówka
10537	10515	\N	Baranica
10538	10515	\N	Bobrowe
10539	10515	\N	Bogusław
10540	10515	\N	Borów
10541	10515	\N	Borów-Kolonia
10542	10515	\N	Borsuk
10543	10515	\N	Chorupnik
10544	10515	\N	Chorupnik-Kolonia
10545	10515	\N	Czysta Dębina
10546	10515	\N	Czysta Dębina-Kolonia
10547	10515	\N	Felicjan
10548	10515	\N	Gorzków-Osada
10549	10515	\N	Gorzków-Wieś
10550	10515	\N	Góry
10551	10515	\N	Józefów
10552	10515	\N	Olesin
10553	10515	\N	Orchowiec
10554	10515	\N	Piaski Szlacheckie
10555	10515	\N	Widniówka
10556	10515	\N	Wielkopole
10557	10515	\N	Wielobycz
10558	10515	\N	Wiśniów
10559	10515	\N	Zamostek
10560	10516	\N	Bobliwo
10561	10516	\N	Dworzyska
10562	10516	\N	Izbica
10563	10516	\N	Izbica-Wieś
10564	10516	\N	Kryniczki
10565	10516	\N	Majdan Krynicki
10566	10516	\N	Mchy
10567	10516	\N	Orłów Drewniany
10568	10516	\N	Orłów Drewniany-Kolonia
10569	10516	\N	Orłów Murowany
10570	10516	\N	Orłów Murowany-Kolonia
10571	10516	\N	Ostrówek
10572	10516	\N	Ostrzyca
10573	10516	\N	Romanów
10574	10516	\N	Stryjów
10575	10516	\N	Tarnogóra
10576	10516	\N	Tarnogóra-Kolonia
10577	10516	\N	Tarzymiechy Drugie
10578	10516	\N	Tarzymiechy Pierwsze
10579	10516	\N	Tarzymiechy Trzecie
10580	10516	\N	Topola
10581	10516	\N	Wał
10582	10516	\N	Wirkowice Drugie
10583	10516	\N	Wirkowice Pierwsze
10584	10516	\N	Wólka Orłowska
10585	10516	\N	Zalesie
10586	10513	\N	Białka
10587	10513	\N	Bzite
10588	10513	\N	Czarnoziem
10589	10513	\N	Jaślików
10590	10513	\N	Józefów
10591	10513	\N	Krupe
10592	10513	\N	Krupiec
10593	10513	\N	Krynica
10594	10513	\N	Latyczów
10595	10513	\N	Łany
10596	10513	\N	Małochwiej Duży
10597	10513	\N	Małochwiej Mały
10598	10513	\N	Namule
10599	10513	\N	Niemienice
10600	10513	\N	Niemienice-Kolonia
10601	10513	\N	Ostrów Krupski
10602	10513	\N	Rońsko
10603	10513	\N	Siennica Nadolna
10604	10513	\N	Stężyca-Kolonia
10605	10513	\N	Stężyca Łęczyńska
10606	10513	\N	Stężyca Nadwieprzańska
10607	10513	\N	Tuligłowy
10608	10513	\N	Widniówka
10609	10513	\N	Wincentów
10610	10513	\N	Zakręcie
10611	10513	\N	Zastawie-Kolonia
10612	10513	\N	Zażółkiew
10613	10517	\N	Anielpol
10614	10517	\N	Bończa
10615	10517	\N	Bończa-Kolonia
10616	10517	\N	Brzeziny
10617	10517	\N	Chełmiec
10618	10517	\N	Czajki
10619	10517	\N	Drewniki
10620	10517	\N	Franciszków
10621	10517	\N	Kraśniczyn
10622	10517	\N	Łukaszówka
10623	10517	\N	Majdan Surhowski
10624	10517	\N	Olszanka
10625	10517	\N	Pniaki
10626	10517	\N	Stara Wieś
10627	10517	\N	Surhów
10628	10517	\N	Surhów-Kolonia
10629	10517	\N	Wolica
10630	10517	\N	Wólka Kraśniczyńska
10631	10517	\N	Zalesie
10632	10517	\N	Zastawie
10633	10518	\N	Borowica
10634	10518	\N	Dobryniów
10635	10518	\N	Dobryniów-Kolonia
10636	10518	\N	Gliniska
10637	10518	\N	Krzywe
10638	10518	\N	Łopiennik Dolny
10639	10518	\N	Łopiennik Dolny-Kolonia
10640	10518	\N	Łopiennik Górny
10641	10518	\N	Łopiennik Nadrzeczny
10642	10518	\N	Łopiennik Podleśny
10643	10518	\N	Majdan Krzywski
10644	10518	\N	Nowiny
10645	10518	\N	Olszanka
10646	10518	\N	Wola Żulińska
10647	10518	\N	Żulin
10648	10519	\N	Bzowiec
10649	10519	\N	Joanin
10650	10519	\N	Kaszuby
10651	10519	\N	Majdan Borowski Drugi
10652	10519	\N	Majdan Borowski Pierwszy
10653	10519	\N	Majdan Kobylański
10654	10519	\N	Majdan Łuczycki
10655	10519	\N	Majdan Średni
10656	10519	\N	Maszów
10657	10519	\N	Mościska
10658	10519	\N	Mościska-Kolonia
10659	10519	\N	Nowiny
10660	10519	\N	Płonka
10661	10519	\N	Płonka-Kolonia
10662	10519	\N	Płonka Poleśna
10663	10519	\N	Potasznia
10664	10519	\N	Równianki
10665	10519	\N	Rudnik
10666	10519	\N	Suche Lipie
10667	10519	\N	Suszeń
10668	10519	\N	Wierzbica
10669	10520	\N	Baraki
10670	10520	\N	Boruń
10671	10520	\N	Kozieniec
10672	10520	\N	Maciejów
10673	10520	\N	Rudka
10674	10520	\N	Siennica Królewska Duża
10675	10520	\N	Siennica Królewska Mała
10676	10520	\N	Siennica Różana
10677	10520	\N	Stójło
10678	10520	\N	Wierzchowiny
10679	10520	\N	Wola Siennicka
10680	10520	\N	Zagroda
10681	10520	\N	Zwierzyniec
10682	10520	\N	Żdżanne
10683	10521	\N	Adamówka
10684	10521	\N	Borowina
10685	10521	\N	Borówek
10686	10521	\N	Borówek-Kolonia
10687	10521	\N	Celin
10688	10521	\N	Chłaniów
10689	10521	\N	Chłaniówek
10690	10521	\N	Chłaniów-Kolonia
10691	10521	\N	Chruściechów
10692	10521	\N	Dąbie
10693	10521	\N	Gany
10694	10521	\N	Huta
10695	10521	\N	Koszarsko
10696	10521	\N	Majdan Wierzchowiński
10697	10521	\N	Makowiska
10698	10521	\N	Olchowiec
10699	10521	\N	Olchowiec-Kolonia
10700	10521	\N	Poperczyn
10701	10521	\N	Rożki
10702	10521	\N	Rożki-Kolonia
10703	10521	\N	Siniec
10704	10521	\N	Średnia Wieś
10705	10521	\N	Tokarówka
10706	10521	\N	Wierzchowina
10707	10521	\N	Władysławin
10708	10521	\N	Wola Żółkiewska
10709	10521	\N	Wólka
10710	10521	\N	Zaburze
10711	10521	\N	Żółkiew
10712	10521	\N	Żółkiewka-Osada
10713	10521	\N	Żółkiew-Kolonia
10714	10521	\N	Żółkiewka
10715	10515	\N	Gorzków
10716	318	\N	Kraśnik
10717	318	\N	Annopol
10718	318	\N	Dzierzkowice
10719	318	\N	Gościeradów
10720	318	\N	Szastarka
10721	318	\N	Trzydnik Duży
10722	318	\N	Urzędów
10723	318	\N	Wilkołaz
10724	318	\N	Zakrzówek
10725	10716	\N	Kraśnik
10726	10717	\N	Annopol
10727	10717	\N	Anielin
10728	10717	\N	Baraki
10729	10717	\N	Bliskowice
10730	10717	\N	Borów
10731	10717	\N	Chamówka
10732	10717	\N	Dąbrowa
10733	10717	\N	Grabówka
10734	10717	\N	Grabówka-Kolonia
10735	10717	\N	Grabówka Ukazowa
10736	10717	\N	Huta
10737	10717	\N	Jakubowice
10738	10717	\N	Janiszów
10739	10717	\N	Józefin
10740	10717	\N	Kopiec
10741	10717	\N	Kosin
10742	10717	\N	Kozłówka
10743	10717	\N	Lasek
10744	10717	\N	Michalin
10745	10717	\N	Natalin
10746	10717	\N	Niedbałki
10747	10717	\N	Nowy Rachów
10748	10717	\N	Opoczka Mała
10749	10717	\N	Opoka Duża
10750	10717	\N	Opoka-Kolonia
10751	10717	\N	Popów
10752	10717	\N	Stary Rachów
10753	10717	\N	Sucha Wólka
10754	10717	\N	Świeciechów Duży
10755	10717	\N	Świeciechów Poduchowny
10756	10717	\N	Wymysłów
10757	10717	\N	Zabełcze
10758	10717	\N	Zastocze
10759	10717	\N	Zofipole
10760	10717	\N	Zychówki
10761	10718	\N	Dębina
10762	10718	\N	Dzierzkowice-Góry
10763	10718	\N	Dzierzkowice-Podwody
10764	10718	\N	Dzierzkowice-Rynek
10765	10718	\N	Dzierzkowice-Wola
10766	10718	\N	Dzierzkowice-Zastawie
10767	10718	\N	Krzywie
10768	10718	\N	Ludmiłówka
10769	10718	\N	Sosnowa Wola
10770	10718	\N	Terpentyna
10771	10718	\N	Wyżnianka
10772	10718	\N	Wyżnianka-Kolonia
10773	10718	\N	Wyżnica
10774	10718	\N	Wyżnica-Kolonia
10775	10718	\N	Zwierzyniec
10776	10718	\N	Dzierzkowice
10777	10719	\N	Agatówka
10778	10719	\N	Aleksandrów
10779	10719	\N	Baraki
10780	10719	\N	Belweder
10781	10719	\N	Borów-Gajówka
10782	10719	\N	Gościeradów-Folwark
10783	10719	\N	Gościeradów-Kolonia
10784	10719	\N	Gościeradów Plebański
10785	10719	\N	Gościeradów Ukazowy
10786	10719	\N	Kotowszczany Dół
10787	10719	\N	Księżomierz
10788	10719	\N	Księżomierz Dzierzkowska
10789	10719	\N	Księżomierz Gościeradowska
10790	10719	\N	Księżomierz-Kolonia
10791	10719	\N	Księżomierz-Osada
10792	10719	\N	Liśnik
10793	10719	\N	Liśnik Duży
10794	10719	\N	Liśnik Duży-Kolonia
10795	10719	\N	Łany
10796	10719	\N	Marynopole
10797	10719	\N	Maziarka
10798	10719	\N	Mniszek
10799	10719	\N	Sadki
10800	10719	\N	Salomin
10801	10719	\N	Sosnowa Wola
10802	10719	\N	Suchodoły
10803	10719	\N	Szczecyn
10804	10719	\N	Wólka Gościeradowska
10805	10719	\N	Wólka Szczecka
10806	10719	\N	Wymysłów
10807	10719	\N	Zawólcze
10808	10719	\N	Gościeradów
10809	10716	\N	Dąbrowa-Bór
10810	10716	\N	Góry
10811	10716	\N	Karpiówka
10812	10716	\N	Kowalin
10813	10716	\N	Lasy
10814	10716	\N	Mikulin
10815	10716	\N	Mosty
10816	10716	\N	Ośrodek-Wyżnica
10817	10716	\N	Pasieka
10818	10716	\N	Pasieka-Kolonia
10819	10716	\N	Podlesie
10820	10716	\N	Rudki
10821	10716	\N	Słodków Drugi
10822	10716	\N	Słodków Pierwszy
10823	10716	\N	Słodków Trzeci
10824	10716	\N	Spławy Drugie
10825	10716	\N	Spławy Pierwsze
10826	10716	\N	Stróża
10827	10716	\N	Stróża-Kolonia
10828	10716	\N	Suchynia
10829	10720	\N	Blinów Drugi
10830	10720	\N	Blinów-Kolonia
10831	10720	\N	Blinów Pierwszy
10832	10720	\N	Brzozówka
10833	10720	\N	Brzozówka-Kolonia
10834	10720	\N	Cieślanki
10835	10720	\N	Huta Józefów
10836	10720	\N	Majdan-Obleszcze
10837	10720	\N	Nowy Kaczyniec
10838	10720	\N	Polichna
10839	10720	\N	Rzeczyca-Kolonia
10840	10720	\N	Stare Moczydła
10841	10720	\N	Szastarka
10842	10720	\N	Wojciechów
10843	10720	\N	Wojciechów-Kolonia
10844	10721	\N	Agatówka
10845	10721	\N	Budki
10846	10721	\N	Dabrowa-Choiny
10847	10721	\N	Dąbrowa
10848	10721	\N	Dąbrowa-Kolonia
10849	10721	\N	Dębowiec
10850	10721	\N	Liśnik Mały
10851	10721	\N	Łychów Gościeradowski
10852	10721	\N	Łychów Szlachecki
10853	10721	\N	Olbięcin
10854	10721	\N	Owczarnia
10855	10721	\N	Rzeczyca Księża
10856	10721	\N	Rzeczyca Ziemiańska
10857	10721	\N	Rzeczyca Ziemiańska-Kolonia
10858	10721	\N	Trzydnik Duży
10859	10721	\N	Trzydnik Duży-Kolonia
10860	10721	\N	Trzydnik Mały
10861	10721	\N	Węglin
10862	10721	\N	Węglinek
10863	10721	\N	Wola Trzydnicka
10864	10721	\N	Wólka Olbięcka
10865	10721	\N	Zielonka
10866	10722	\N	Bęczyn
10867	10722	\N	Boby-Kolonia
10868	10722	\N	Boby-Księże
10869	10722	\N	Boby-Wieś
10870	10722	\N	Dębniak
10871	10722	\N	Góry
10872	10722	\N	Józefin
10873	10722	\N	Kajetanówka
10874	10722	\N	Konradów
10875	10722	\N	Kozarów
10876	10722	\N	Leszczyna
10877	10722	\N	Leśniczówka
10878	10722	\N	Majdan Bobowski
10879	10722	\N	Majdan Moniacki
10880	10722	\N	Metelin
10881	10722	\N	Mikołajówka
10882	10722	\N	Mikuszewskie
10883	10722	\N	Moniaki
10884	10722	\N	Moniaki-Kolonia
10885	10722	\N	Natalin
10886	10722	\N	Okręglica-Kolonia
10887	10722	\N	Popkowice
10888	10722	\N	Popkowice Księże
10889	10722	\N	Rankowskie
10890	10722	\N	Skorczyce
10891	10722	\N	Urzędów
10892	10722	\N	Wierzbica
10893	10722	\N	Wierzbica-Kolonia
10894	10722	\N	Zadworze
10895	10722	\N	Zakościelne
10896	10723	\N	Ewunin
10897	10723	\N	Marianówka
10898	10723	\N	Obroki
10899	10723	\N	Ostrów
10900	10723	\N	Ostrów-Kolonia
10901	10723	\N	Pułankowice
10902	10723	\N	Rudnik-Kolonia
10903	10723	\N	Rudnik Szlachecki
10904	10723	\N	Wilkołaz Dolny
10905	10723	\N	Wilkołaz Drugi
10906	10723	\N	Wilkołaz Górny
10907	10723	\N	Wilkołaz Pierwszy
10908	10723	\N	Wilkołaz-Stacja Kolejowa
10909	10723	\N	Wilkołaz Trzeci
10910	10723	\N	Wólka Rudnicka
10911	10723	\N	Zalesie
10912	10723	\N	Zamajdanie
10913	10723	\N	Zdrapy
10914	10723	\N	Wilkołaz
10915	10724	\N	Bystrzyca
10916	10724	\N	Góry
10917	10724	\N	Józefin
10918	10724	\N	Lipno
10919	10724	\N	Majdan-Grabina
10920	10724	\N	Majorat
10921	10724	\N	Rudki
10922	10724	\N	Rudnik Drugi
10923	10724	\N	Rudnik Pierwszy
10924	10724	\N	Studzianki
10925	10724	\N	Studzianki-Kolonia
10926	10724	\N	Sulów
10927	10724	\N	Świerczyna
10928	10724	\N	Zakrzówek
10929	10724	\N	Zakrzówek Nowy
10930	10724	\N	Zakrzówek-Wieś
10931	319	\N	Lubartów
10932	319	\N	Abramów
10933	319	\N	Firlej
10934	319	\N	Jeziorzany
10935	319	\N	Kamionka
10936	319	\N	Kock
10937	319	\N	Michów
10938	319	\N	Niedźwiada
10939	319	\N	Ostrów Lubelski
10940	319	\N	Ostrówek
10941	319	\N	Serniki
10942	319	\N	Uścimów
10943	10931	\N	Lubartów
10944	10932	\N	Abramów
10945	10932	\N	Ciotcza
10946	10932	\N	Dębiny
10947	10932	\N	Glinnik
10948	10932	\N	Izabelmont
10949	10932	\N	Marcinów
10950	10932	\N	Michałówka
10951	10932	\N	Sosnówka
10952	10932	\N	Wielkie
10953	10932	\N	Wielkolas
10954	10932	\N	Wolica
10955	10933	\N	Baran
10956	10933	\N	Bykowszczyzna
10957	10933	\N	Czerwonka-Gozdów
10958	10933	\N	Czerwonka Poleśna
10959	10933	\N	Firlej
10960	10933	\N	Kunów
10961	10933	\N	Łukówiec
10962	10933	\N	Majdan Sobolewski
10963	10933	\N	Nowy Antonin
10964	10933	\N	Pożarów
10965	10933	\N	Przypisówka
10966	10933	\N	Serock
10967	10933	\N	Sobolew
10968	10933	\N	Sobolew-Kolonia
10969	10933	\N	Stary Antonin
10970	10933	\N	Sułoszyn
10971	10933	\N	Wola Skromowska
10972	10933	\N	Wólka Mieczysławska
10973	10933	\N	Wólka Rozwadowska
10974	10933	\N	Zagrody Łukowieckie
10975	10934	\N	Blizocin
10976	10934	\N	Jeziorzany
10977	10934	\N	Krępa
10978	10934	\N	Nowiny Przytockie
10979	10934	\N	Przytoczno
10980	10934	\N	Skarbiciesz
10981	10934	\N	Stawik
10982	10934	\N	Stoczek Kocki
10983	10934	\N	Walentynów
10984	10934	\N	Wola Blizocka
10985	10935	\N	Amelin
10986	10935	\N	Biadaczka
10987	10935	\N	Bratnik
10988	10935	\N	Ciemno
10989	10935	\N	Dąbrówka
10990	10935	\N	Kamionka
10991	10935	\N	Kierzkówka
10992	10935	\N	Kierzkówka-Kolonia
10993	10935	\N	Kozłówka
10994	10935	\N	Olszyna
10995	10935	\N	Rudka Gołębska
10996	10935	\N	Samoklęski
10997	10935	\N	Samoklęski-Kolonia Druga
10998	10935	\N	Samoklęski-Kolonia Pierwsza
10999	10935	\N	Siedliska
11000	10935	\N	Stanisławów Duży
11001	10935	\N	Starościn
11002	10935	\N	Starościn-Kolonia
11003	10935	\N	Syry
11004	10935	\N	Wólka Krasienińska
11005	10935	\N	Zofian
11006	10936	\N	Kock
11007	10936	\N	Annopol
11008	10936	\N	Annówka
11009	10936	\N	Białobrzegi
11010	10936	\N	Białobrzegi-Kolonia
11011	10936	\N	Bożniewice
11012	10936	\N	Górecka Kolonia
11013	10936	\N	Górka
11014	10936	\N	Lebiedziów
11015	10936	\N	Lipniak
11016	10936	\N	Ług
11017	10936	\N	Mostkowy Dół
11018	10936	\N	Nowe Białobrzegi
11019	10936	\N	Podbielek
11020	10936	\N	Poizdów
11021	10936	\N	Poizdów-Kolonia
11022	10936	\N	Ruska Wieś
11023	10936	\N	Talczyn
11024	10936	\N	Talczyn-Kolonia
11025	10936	\N	Wygnanka
11026	10936	\N	Zakalew
11027	10931	\N	Annobór
11028	10931	\N	Annobór-Kolonia
11029	10931	\N	Baranówka
11030	10931	\N	Brzeziny
11031	10931	\N	Chlewiska
11032	10931	\N	Kopanina
11033	10931	\N	Lisów
11034	10931	\N	Łucka
11035	10931	\N	Łucka-Kolonia
11036	10931	\N	Majdan Kozłowiecki
11037	10931	\N	Mieczysławka
11038	10931	\N	Nowodwór
11039	10931	\N	Nowodwór-Piaski
11040	10931	\N	Rokitno
11041	10931	\N	Skrobów
11042	10931	\N	Skrobów-Kolonia
11043	10931	\N	Stróżek
11044	10931	\N	Szczekarków
11045	10931	\N	Trójnia
11046	10931	\N	Trzciniec
11047	10931	\N	Wandzin
11048	10931	\N	Wincentów
11049	10931	\N	Wola Lisowska
11050	10931	\N	Wola Mieczysławska
11051	10931	\N	Wólka Rokicka
11052	10931	\N	Wólka Rokicka-Kolonia
11053	10937	\N	Aleksandrówka
11054	10937	\N	Anielówka
11055	10937	\N	Chudowola
11056	10937	\N	Elżbietów
11057	10937	\N	Gawłówka
11058	10937	\N	Giżyce
11059	10937	\N	Gołąb
11060	10937	\N	Gołąb-Kolonia
11061	10937	\N	Katarzyn
11062	10937	\N	Kolonia Giżyce
11063	10937	\N	Krupy
11064	10937	\N	Kruszyna
11065	10937	\N	Lipniak
11066	10937	\N	Mejznerzyn
11067	10937	\N	Meszno
11068	10937	\N	Miastkówek
11069	10937	\N	Michów
11070	10937	\N	Młyniska
11071	10937	\N	Natalin
11072	10937	\N	Ostrów
11073	10937	\N	Podlodówek
11074	10937	\N	Rawa
11075	10937	\N	Rudno
11076	10937	\N	Rudzienko
11077	10937	\N	Rudzienko-Kolonia
11078	10937	\N	Trzciniec
11079	10937	\N	Węgielce
11080	10937	\N	Wólka Michowska
11081	10937	\N	Wypnicha
11082	10937	\N	Zofianówka
11083	10938	\N	Berejów
11084	10938	\N	Brzeźnica Bychawska
11085	10938	\N	Brzeźnica Bychawska-Kolonia
11086	10938	\N	Brzeźnica Książęca
11087	10938	\N	Brzeźnica Leśna
11088	10938	\N	Górka Lubartowska
11089	10938	\N	Karczunek
11090	10938	\N	Klementynów
11091	10938	\N	Niedźwiada
11092	10938	\N	Pałecznica
11093	10938	\N	Pałecznica-Kolonia
11094	10938	\N	Tarło
11095	10938	\N	Tarło-Kolonia
11096	10938	\N	Zabiele
11097	10939	\N	Ostrów Lubelski
11098	10939	\N	Bójki
11099	10939	\N	Jamy
11100	10939	\N	Kaznów
11101	10939	\N	Kaznów-Kolonia
11102	10939	\N	Kolechowice
11103	10939	\N	Kolechowice-Folwark
11104	10939	\N	Kolechowice-Kolonia
11105	10939	\N	Rozkopaczew
11106	10939	\N	Rudka Kijańska
11107	10939	\N	Wólka Stara Kijańska
11108	10940	\N	Antoniówka
11109	10940	\N	Babczyzna
11110	10940	\N	Cegielnia
11111	10940	\N	Dębica
11112	10940	\N	Dębica-Kolonia
11113	10940	\N	Jeleń
11114	10940	\N	Kamienowola
11115	10940	\N	Leszkowice
11116	10940	\N	Luszawa
11117	10940	\N	Ostrówek
11118	10940	\N	Ostrówek-Kolonia
11119	10940	\N	Tarkawica
11120	10940	\N	Zawada
11121	10940	\N	Żurawiniec
11122	10940	\N	Żurawiniec-Kolonia
11123	10941	\N	Brzostówka
11124	10941	\N	Czerniejów
11125	10941	\N	Las-Baran
11126	10941	\N	Nowa Wieś
11127	10941	\N	Nowa Wola
11128	10941	\N	Serniki
11129	10941	\N	Serniki-Kolonia
11130	10941	\N	Wola Sernicka
11131	10941	\N	Wola Sernicka-Kolonia
11132	10941	\N	Wólka Zabłocka
11133	10941	\N	Wólka Zawieprzycka
11134	10942	\N	Drozdówka
11135	10942	\N	Głębokie
11136	10942	\N	Krasne
11137	10942	\N	Maśluchy
11138	10942	\N	Nowa Jedlanka
11139	10942	\N	Nowy Uścimów
11140	10942	\N	Ochoża
11141	10942	\N	Orzechów-Kolonia
11142	10942	\N	Rudka Starościańska
11143	10942	\N	Stara Jedlanka
11144	10942	\N	Stary Uścimów
11145	10942	\N	Uścimów
11146	336	\N	Bełżyce
11147	336	\N	Borzechów
11148	336	\N	Bychawa
11149	336	\N	Garbów
11150	336	\N	Głusk
11151	336	\N	Jabłonna
11152	336	\N	Jastków
11153	336	\N	Konopnica
11154	336	\N	Krzczonów
11155	336	\N	Niedrzwica Duża
11156	336	\N	Niemce
11157	336	\N	Strzyżewice
11158	336	\N	Wojciechów
11159	336	\N	Wólka
11160	336	\N	Wysokie
11161	11146	\N	Bełżyce
11162	11146	\N	Babin
11163	11146	\N	Chmielnik
11164	11146	\N	Chmielnik-Kolonia
11165	11146	\N	Cuple
11166	11146	\N	Dylążki
11167	11146	\N	Jaroszewice
11168	11146	\N	Jaroszewice-Kolonia
11169	11146	\N	Kierz
11170	11146	\N	Krężnica Okrągła
11171	11146	\N	Malinowszczyzna
11172	11146	\N	Matczyn
11173	11146	\N	Płowizny
11174	11146	\N	Podole
11175	11146	\N	Skrzyniec
11176	11146	\N	Skrzyniec-Kolonia
11177	11146	\N	Stare Wierzchowiska
11178	11146	\N	Wierzchowiska Dolne
11179	11146	\N	Wierzchowiska Górne
11180	11146	\N	Wojcieszyn
11181	11146	\N	Wronów
11182	11146	\N	Wronów-Kolonia
11183	11146	\N	Wymysłówka
11184	11146	\N	Zagórze
11185	11146	\N	Zalesie
11186	11146	\N	Zosin
11187	11147	\N	Białawoda
11188	11147	\N	Borzechów
11189	11147	\N	Borzechów-Kolonia
11190	11147	\N	Dąbrowa
11191	11147	\N	Dobrowola
11192	11147	\N	Grabówka
11193	11147	\N	Kaźmierów
11194	11147	\N	Kępa
11195	11147	\N	Kępa Borzechowska
11196	11147	\N	Kępa-Kolonia
11197	11147	\N	Kłodnica Dolna
11198	11147	\N	Kłodnica Górna
11199	11147	\N	Ludwinów
11200	11147	\N	Łączki-Pawłówek
11201	11147	\N	Łopiennik
11202	11147	\N	Majdan Borzechowski
11203	11147	\N	Majdan Radliński
11204	11147	\N	Majdan Skrzyniecki
11205	11147	\N	Osina
11206	11147	\N	Ryczydół
11207	11147	\N	Wały Kępskie
11208	11147	\N	Zakącie
11209	11148	\N	Bychawa
11210	11148	\N	Bychawka Druga
11211	11148	\N	Bychawka Druga-Kolonia
11212	11148	\N	Bychawka Pierwsza
11213	11148	\N	Bychawka Trzecia
11214	11148	\N	Bychawka Trzecia-Kolonia
11215	11148	\N	Gałęzów
11216	11148	\N	Gałęzów-Kolonia Druga
11217	11148	\N	Gałęzów-Kolonia Pierwsza
11218	11148	\N	Józwów
11219	11148	\N	Kąty
11220	11148	\N	Kolonia Ośniak
11221	11148	\N	Kosarzew Dolny-Kolonia
11222	11148	\N	Kowersk
11223	11148	\N	Leśniczówka
11224	11148	\N	Łęczyca
11225	11148	\N	Marysin
11226	11148	\N	Olszowiec
11227	11148	\N	Olszowiec-Kolonia
11228	11148	\N	Osowa
11229	11148	\N	Osowa-Kolonia
11230	11148	\N	Podzamcze
11231	11148	\N	Romanów
11232	11148	\N	Skawinek
11233	11148	\N	Stara Wieś Druga
11234	11148	\N	Stara Wieś Pierwsza
11235	11148	\N	Stara Wieś Trzecia
11236	11148	\N	Urszulin
11237	11148	\N	Wandzin
11238	11148	\N	Wincentówek
11239	11148	\N	Władysławów
11240	11148	\N	Wola Duża
11241	11148	\N	Wola Duża-Kolonia
11242	11148	\N	Wola Gałęzowska
11243	11148	\N	Wola Gałęzowska-Kolonia
11244	11148	\N	Wólka Osowska
11245	11148	\N	Zadębie
11246	11148	\N	Zaraszów
11247	11148	\N	Zaraszów-Kolonia
11248	11148	\N	Zdrapy
11249	11149	\N	Bogucin
11250	11149	\N	Borków
11251	11149	\N	Garbów
11252	11149	\N	Gutanów
11253	11149	\N	Janów
11254	11149	\N	Karolin
11255	11149	\N	Leśce
11256	11149	\N	Meszno
11257	11149	\N	Piotrowice-Kolonia
11258	11149	\N	Piotrowice Wielkie
11259	11149	\N	Przybysławice
11260	11149	\N	Wola Przybysławska
11261	11149	\N	Zagrody
11262	11150	\N	Abramowice Kościelne
11263	11150	\N	Abramowice Prywatne
11264	11150	\N	Ćmiłów
11265	11150	\N	Dominów
11266	11150	\N	Głusk
11267	11150	\N	Głuszczyzna
11268	11150	\N	Kalinówka
11269	11150	\N	Kazimierzówka
11270	11150	\N	Kliny
11271	11150	\N	Majdan Mętowski
11272	11150	\N	Mętów
11273	11150	\N	Nowiny
11274	11150	\N	Prawiedniki
11275	11150	\N	Prawiedniki-Kolonia
11276	11150	\N	Wilczopole
11277	11150	\N	Wilczopole-Kolonia
11278	11150	\N	Wólka Abramowicka
11279	11150	\N	Żabia Wola
11280	11151	\N	Chmiel Drugi
11281	11151	\N	Chmiel-Kolonia
11282	11151	\N	Chmiel Pierwszy
11283	11151	\N	Czerniejów
11284	11151	\N	Czerniejów-Kolonia
11285	11151	\N	Jabłonna Druga
11286	11151	\N	Jabłonna-Majątek
11287	11151	\N	Jabłonna Pierwsza
11288	11151	\N	Piotrków Drugi
11289	11151	\N	Piotrków-Kolonia
11290	11151	\N	Piotrków Pierwszy
11291	11151	\N	Skrzynice Drugie
11292	11151	\N	Skrzynice-Kolonia
11293	11151	\N	Skrzynice Pierwsze
11294	11151	\N	Tuszów
11295	11151	\N	Wierciszów
11296	11151	\N	Wolnica
11297	11151	\N	Jabłonna
11298	11152	\N	Barak
11299	11152	\N	Dąbrowica
11300	11152	\N	Dębówka
11301	11152	\N	Jastków
11302	11152	\N	Józefów-Pociecha
11303	11152	\N	Ługów
11304	11152	\N	Marysin
11305	11152	\N	Miłocin
11306	11152	\N	Moszenki
11307	11152	\N	Moszna
11308	11152	\N	Moszna-Kolonia
11309	11152	\N	Natalin
11310	11152	\N	Ożarów
11311	11152	\N	Panieńszczyzna
11312	11152	\N	Piotrawin
11313	11152	\N	Płouszowice
11314	11152	\N	Płouszowice-Kolonia
11315	11152	\N	Sieprawice
11316	11152	\N	Sieprawki
11317	11152	\N	Sługocin
11318	11152	\N	Smugi
11319	11152	\N	Snopków
11320	11152	\N	Tomaszowice
11321	11152	\N	Tomaszowice-Kolonia
11322	11152	\N	Wysokie
11323	11153	\N	Konopnica
11324	11153	\N	Kozubszczyzna
11325	11153	\N	Lipniak
11326	11153	\N	Marynin
11327	11153	\N	Motycz
11328	11153	\N	Motycz-Józefin
11329	11153	\N	Motycz Leśny
11330	11153	\N	Pawlin
11331	11153	\N	Radawczyk
11332	11153	\N	Radawczyk Drugi
11333	11153	\N	Radawiec Duży
11334	11153	\N	Radawiec Mały
11335	11153	\N	Sporniak
11336	11153	\N	Stasin
11337	11153	\N	Szerokie
11338	11153	\N	Tereszyn
11339	11153	\N	Uniszowice
11340	11153	\N	Zemborzyce Dolne
11341	11153	\N	Zemborzyce Podleśne
11342	11153	\N	Zemborzyce Tereszyńskie
11343	11153	\N	Zemborzyce Wojciechowskie
11344	11154	\N	Antoniówka
11345	11154	\N	Boży Dar
11346	11154	\N	Gierniak
11347	11154	\N	Kosarzew Dolny
11348	11154	\N	Kosarzew Górny
11349	11154	\N	Kosarzew-Stróża
11350	11154	\N	Krzczonów Drugi
11351	11154	\N	Krzczonów-Folwark
11352	11154	\N	Krzczonów Pierwszy
11353	11154	\N	Krzczonów-Sołtysy
11354	11154	\N	Krzczonów Trzeci
11355	11154	\N	Krzczonów-Wójtowstwo
11356	11154	\N	Lewandowszczyzna
11357	11154	\N	Majdan Policki
11358	11154	\N	Nowiny Żukowskie
11359	11154	\N	Olszanka
11360	11154	\N	Piotrkówek
11361	11154	\N	Policzyzna
11362	11154	\N	Pustelnik
11363	11154	\N	Sobieska Wola Druga
11364	11154	\N	Sobieska Wola Pierwsza
11365	11154	\N	Teklin
11366	11154	\N	Walentynów
11367	11154	\N	Zielona
11368	11154	\N	Żuków Drugi
11369	11154	\N	Żuków-Kolonia
11370	11154	\N	Żuków Pierwszy
11371	11154	\N	Krzczonów
11372	11155	\N	Borkowizna
11373	11155	\N	Czółna
11374	11155	\N	Krebsówka
11375	11155	\N	Krężnica Jara
11376	11155	\N	Majdan Sobieszczański
11377	11155	\N	Marianka
11378	11155	\N	Niedrzwica Duża
11379	11155	\N	Niedrzwica Kościelna
11380	11155	\N	Niedrzwica Kościelna-Kolonia
11381	11155	\N	Osmolice-Kolonia
11382	11155	\N	Radawczyk
11383	11155	\N	Radawczyk-Kolonia Pierwsza
11384	11155	\N	Sobieszczany
11385	11155	\N	Sobieszczany-Kolonia
11386	11155	\N	Strzeszkowice Duże
11387	11155	\N	Strzeszkowice Małe
11388	11155	\N	Tomaszówka
11389	11155	\N	Trojaszkowice
11390	11155	\N	Warszawiaki
11391	11155	\N	Załucze
11392	11156	\N	Baszki
11393	11156	\N	Boduszyn
11394	11156	\N	Ciecierzyn
11395	11156	\N	Dys
11396	11156	\N	Dziuchów
11397	11156	\N	Elizówka
11398	11156	\N	Jakubowice Konińskie
11399	11156	\N	Jakubowice Konińskie-Kolonia
11400	11156	\N	Kawka
11401	11156	\N	Kolonia Bystrzyca
11402	11156	\N	Krasienin
11403	11156	\N	Krasienin-Kolonia
11404	11156	\N	Ludwinów
11405	11156	\N	Łagiewniki
11406	11156	\N	Majdan Krasieniński
11407	11156	\N	Nasutów
11408	11156	\N	Niemce
11409	11156	\N	Nowy Staw
11410	11156	\N	Osówka
11411	11156	\N	Pólko
11412	11156	\N	Pryszczowa Góra
11413	11156	\N	Rudka Kozłowiecka
11414	11156	\N	Stoczek
11415	11156	\N	Stoczek-Kolonia
11416	11156	\N	Swoboda
11417	11156	\N	Wola Krasienińska
11418	11156	\N	Wola Niemiecka
11419	11156	\N	Zalesie
11420	11157	\N	Borkowizna
11421	11157	\N	Bystrzyca Nowa
11422	11157	\N	Bystrzyca Stara
11423	11157	\N	Dębina
11424	11157	\N	Dębszczyzna
11425	11157	\N	Franciszków
11426	11157	\N	Iżyce
11427	11157	\N	Kajetanówka
11428	11157	\N	Kiełczewice Dolne
11429	11157	\N	Kiełczewice Górne
11430	11157	\N	Kiełczewice Maryjskie
11431	11157	\N	Kiełczewice Pierwsze
11432	11157	\N	Kolonia Kiełczewice Dolne
11433	11157	\N	Osmolice Drugie
11434	11157	\N	Osmolice Pierwsze
11435	11157	\N	Pawłów
11436	11157	\N	Pawłówek
11437	11157	\N	Piotrowice
11438	11157	\N	Polanówka
11439	11157	\N	Pszczela Wola
11440	11157	\N	Strzyżewice
11441	11157	\N	Żabia Wola
11442	11158	\N	Cyganówka
11443	11158	\N	Góra
11444	11158	\N	Halinówka
11445	11158	\N	Ignaców
11446	11158	\N	Łubki
11447	11158	\N	Łubki-Kolonia
11448	11158	\N	Łubki-Szlachta
11449	11158	\N	Maszki
11450	11158	\N	Maszki k. Wojciechowa
11451	11158	\N	Miłocin
11452	11158	\N	Nowy Gaj
11453	11158	\N	Palikije Drugie
11454	11158	\N	Palikije Pierwsze
11455	11158	\N	Romanówka
11456	11158	\N	Saganów
11457	11158	\N	Sporniak
11458	11158	\N	Stary Gaj
11459	11158	\N	Stasin
11460	11158	\N	Szczuczki
11461	11158	\N	Szczuczki VI Kolonia
11462	11158	\N	Tomaszówka
11463	11158	\N	Wojciechów
11464	11158	\N	Wojciechów-Kolonia Piąta
11465	11158	\N	Wojciechów-Kolonia Pierwsza
11466	11159	\N	Biskupie-Kolonia
11467	11159	\N	Bystrzyca
11468	11159	\N	Długie
11469	11159	\N	Jakubowice Murowane
11470	11159	\N	Kolonia Świdnik Mały
11471	11159	\N	Łuszczów Drugi
11472	11159	\N	Łuszczów Pierwszy
11473	11159	\N	Łysaków
11474	11159	\N	Pliszczyn
11475	11159	\N	Rudnik
11476	11159	\N	Sobianowice
11477	11159	\N	Świdniczek
11478	11159	\N	Świdnik Duży
11479	11159	\N	Świdnik Mały
11480	11159	\N	Turka
11481	11159	\N	Wólka
11482	11160	\N	Antoniówka
11483	11160	\N	Biskupie
11484	11160	\N	Biskupie-Kolonia
11485	11160	\N	Cegielnia
11486	11160	\N	Dragany
11487	11160	\N	Giełczew
11488	11160	\N	Giełczew-Doły
11489	11160	\N	Guzówka
11490	11160	\N	Jabłonowo
11491	11160	\N	Kajetanów
11492	11160	\N	Łosień
11493	11160	\N	Nowy Dwór
11494	11160	\N	Nowy Maciejów
11495	11160	\N	Radomirka
11496	11160	\N	Rezerwa
11497	11160	\N	Słupeczno
11498	11160	\N	Spławy
11499	11160	\N	Stary Maciejów
11500	11160	\N	Stolnikowizna
11501	11160	\N	Wysokie
11502	11160	\N	Zabłocie
11503	336	\N	Zakrzew
11504	11503	\N	Annów
11505	11503	\N	Baraki
11506	11503	\N	Boża Wola
11507	11503	\N	Dębina
11508	11503	\N	Emilin
11509	11503	\N	Karolin
11510	11503	\N	Majdan Starowiejski
11511	11503	\N	Nikodemów
11512	11503	\N	Ponikwy
11513	11503	\N	Szklarnia
11514	11503	\N	Targowisko
11515	11503	\N	Targowisko-Kolonia
11516	11503	\N	Tarnawka Druga
11517	11503	\N	Tarnawka Pierwsza
11518	11503	\N	Wojdat Annowski
11519	11503	\N	Wólka Ponikiewska
11520	11503	\N	Zakrzew
11521	11503	\N	Zakrzew-Kolonia
11522	329	\N	Cyców
11523	329	\N	Ludwin
11524	329	\N	Łęczna
11525	329	\N	Milejów
11526	329	\N	Puchaczów
11527	329	\N	Spiczyn
11528	11522	\N	Adamów
11529	11522	\N	Barki
11530	11522	\N	Bekiesza
11531	11522	\N	Biesiadki
11532	11522	\N	Cyców
11533	11522	\N	Cyców-Kolonia Druga
11534	11522	\N	Garbatówka
11535	11522	\N	Garbatówka-Kolonia
11536	11522	\N	Głębokie
11537	11522	\N	Janowica
11538	11522	\N	Józefin
11539	11522	\N	Kopina
11540	11522	\N	Ludwinów
11541	11522	\N	Malinówka
11542	11522	\N	Małków
11543	11522	\N	Marynka
11544	11522	\N	Nowy Stręczyn
11545	11522	\N	Ostrówek Podyski
11546	11522	\N	Podgłębokie
11547	11522	\N	Sewerynów
11548	11522	\N	Stary Stręczyn
11549	11522	\N	Stawek
11550	11522	\N	Stawek-Kolonia
11551	11522	\N	Stefanów
11552	11522	\N	Szczupak
11553	11522	\N	Świerszczów
11554	11522	\N	Świerszczów-Kolonia
11555	11522	\N	Wólka Cycowska
11556	11522	\N	Wólka Nadrybska
11557	11522	\N	Zagórze
11558	11522	\N	Zaróbka
11559	11522	\N	Zosin
11560	11523	\N	Czarny Las
11561	11523	\N	Dąbrowa
11562	11523	\N	Dratów
11563	11523	\N	Dratów-Kolonia
11564	11523	\N	Godziembów
11565	11523	\N	Grądy
11566	11523	\N	Jagodno
11567	11523	\N	Kaniwola
11568	11523	\N	Kobyłki
11569	11523	\N	Kocia Góra
11570	11523	\N	Krzczeń
11571	11523	\N	Ludwin
11572	11523	\N	Ludwin-Kolonia
11573	11523	\N	Piaseczno
11574	11523	\N	Rogóźno
11575	11523	\N	Rozpłucie Drugie
11576	11523	\N	Rozpłucie Pierwsze
11577	11523	\N	Stary Radzic
11578	11523	\N	Uciekajka
11579	11523	\N	Zezulin Drugi
11580	11523	\N	Zezulin Niższy
11581	11523	\N	Zezulin Pierwszy
11582	11524	\N	Łęczna
11583	11524	\N	Ciechanki Krzesimowskie
11584	11524	\N	Ciechanki Łęczyńskie
11585	11524	\N	Karolin
11586	11524	\N	Leopoldów
11587	11524	\N	Łuszczów-Kolonia
11588	11524	\N	Nowogród
11589	11524	\N	Piotrówek Drugi
11590	11524	\N	Podzamcze
11591	11524	\N	Rossosz
11592	11524	\N	Stara Wieś
11593	11524	\N	Stara Wieś-Kolonia
11594	11524	\N	Stara Wieś-Stasin
11595	11524	\N	Trębaczów
11596	11524	\N	Witaniów
11597	11524	\N	Zakrzów
11598	11524	\N	Zofiówka
11599	11525	\N	Antoniów
11600	11525	\N	Antoniów-Kolonia
11601	11525	\N	Białka
11602	11525	\N	Białka-Kolonia
11603	11525	\N	Cyganka
11604	11525	\N	Dąbrowa
11605	11525	\N	Górne
11606	11525	\N	Jaszczów
11607	11525	\N	Jaszczów-Kolonia
11608	11525	\N	Kajetanówka
11609	11525	\N	Klarów
11610	11525	\N	Łańcuchów
11611	11525	\N	Łysołaje
11612	11525	\N	Łysołaje-Kolonia
11613	11525	\N	Maryniów
11614	11525	\N	Milejów
11615	11525	\N	Milejów-Osada
11616	11525	\N	Ostrówek-Kolonia
11617	11525	\N	Popławy
11618	11525	\N	Starościce
11619	11525	\N	Wólka Bielecka
11620	11525	\N	Wólka Łańcuchowska
11621	11525	\N	Zalesie
11622	11525	\N	Zgniła Struga
11623	11526	\N	Albertów
11624	11526	\N	Bogdanka
11625	11526	\N	Brzeziny
11626	11526	\N	Ciechanki
11627	11526	\N	Jasieniec
11628	11526	\N	Nadrybie-Dwór
11629	11526	\N	Nadrybie Ukazowe
11630	11526	\N	Nadrybie-Wieś
11631	11526	\N	Ostrówek
11632	11526	\N	Puchaczów
11633	11526	\N	Puchaczów-Kolonia
11634	11526	\N	Stara Wieś
11635	11526	\N	Szpica
11636	11526	\N	Turowola
11637	11526	\N	Turowola-Kolonia
11638	11526	\N	Wesołówka
11639	11526	\N	Zawadów
11640	11527	\N	Charlęż
11641	11527	\N	Januszówka
11642	11527	\N	Jawidz
11643	11527	\N	Kijany
11644	11527	\N	Ludwików
11645	11527	\N	Nowa Wólka
11646	11527	\N	Nowy Radzic
11647	11527	\N	Spiczyn
11648	11527	\N	Stawek
11649	11527	\N	Stoczek
11650	11527	\N	Zawieprzyce
11651	11527	\N	Zawieprzyce-Kolonia
11652	11527	\N	Ziółków
11653	328	\N	Łuków
11654	328	\N	Stoczek Łukowski
11655	328	\N	Adamów
11656	328	\N	Krzywda
11657	328	\N	Serokomla
11658	328	\N	Stanin
11659	328	\N	Trzebieszów
11660	328	\N	Wojcieszków
11661	328	\N	Wola Mysłowska
11662	11653	\N	Łuków
11663	11654	\N	Stoczek Łukowski
11664	11655	\N	Adamów
11665	11655	\N	Budziska
11666	11655	\N	Dąbrówka
11667	11655	\N	Dębowica
11668	11655	\N	Dobrowola
11669	11655	\N	Ferdynandów
11670	11655	\N	Gułów
11671	11655	\N	Helenów
11672	11655	\N	Hordzieżka
11673	11655	\N	Kalinowy Dół
11674	11655	\N	Konorzatka
11675	11655	\N	Korwin
11676	11655	\N	Księżyzna
11677	11655	\N	Lipiny
11678	11655	\N	Michałówka
11679	11655	\N	Natalin
11680	11655	\N	Ofiara
11681	11655	\N	Praga
11682	11655	\N	Ruszcza
11683	11655	\N	Sitnik
11684	11655	\N	Sobiska
11685	11655	\N	Turzystwo
11686	11655	\N	Władysławów
11687	11655	\N	Wola Gułowska
11688	11655	\N	Zakępie
11689	11655	\N	Zaździebulichy
11690	11655	\N	Żurawiec
11691	11656	\N	Budki
11692	11656	\N	Cisownik
11693	11656	\N	Drożdżak
11694	11656	\N	Feliksin
11695	11656	\N	Fiukówka
11696	11656	\N	Gołe Łazy
11697	11656	\N	Huta-Dąbrowa
11698	11656	\N	Huta Radoryska
11699	11656	\N	Jakubówka
11700	11656	\N	Kasyldów
11701	11656	\N	Kobylczyk
11702	11656	\N	Kosiorki
11703	11656	\N	Kożuchówka
11704	11656	\N	Krzywda
11705	11656	\N	Laski
11706	11656	\N	Nowy Patok
11707	11656	\N	Okrzeja
11708	11656	\N	Orle Gniazdo
11709	11656	\N	Pasmug
11710	11656	\N	Podosie
11711	11656	\N	Radoryż
11712	11656	\N	Radoryż Kościelny
11713	11656	\N	Radoryż Smolany
11714	11656	\N	Rozłąki
11715	11656	\N	Ruda
11716	11656	\N	Stary Patok
11717	11656	\N	Szczałb
11718	11656	\N	Teodorów
11719	11656	\N	Wielgolas
11720	11656	\N	Wola Okrzejska
11721	11656	\N	Zagóry
11722	11656	\N	Zagórze
11723	11656	\N	Zimna Woda
11724	11653	\N	Aleksandrów
11725	11653	\N	Biardy
11726	11653	\N	Blekicie
11727	11653	\N	Borki
11728	11653	\N	Czerśl
11729	11653	\N	Czerśl-Kolonia
11730	11653	\N	Dąbie
11731	11653	\N	Dąbrówka
11732	11653	\N	Dminin
11733	11653	\N	Gaj
11734	11653	\N	Gołaszyn
11735	11653	\N	Gołąbki
11736	11653	\N	Gręzówka
11737	11653	\N	Gręzówka-Kolonia
11738	11653	\N	Jadwisin
11739	11653	\N	Jata
11740	11653	\N	Jata Druga
11741	11653	\N	Jata Pierwsza
11742	11653	\N	Jeziory
11743	11653	\N	Kantor
11744	11653	\N	Karwacz
11745	11653	\N	Klimki
11746	11653	\N	Klimki Drugie
11747	11653	\N	Kownatki
11748	11653	\N	Krężnica
11749	11653	\N	Krynka
11750	11653	\N	Kryńszczak
11751	11653	\N	Krzywobór
11752	11653	\N	Lasek
11753	11653	\N	Ławki
11754	11653	\N	Łazy
11755	11653	\N	Łazy-Kolonia Trzecia
11756	11653	\N	Malcanów
11757	11653	\N	Nowinki
11758	11653	\N	Podgaj
11759	11653	\N	Podgłębinie
11760	11653	\N	Podgórze
11761	11653	\N	Podlipie
11762	11653	\N	Role
11763	11653	\N	Ryżki
11764	11653	\N	Rzymy-Las
11765	11653	\N	Rzymy-Rzymki
11766	11653	\N	Sięciaszka Druga
11767	11653	\N	Sięciaszka Pierwsza
11768	11653	\N	Sięciaszka Trzecia
11769	11653	\N	Smolarz
11770	11653	\N	Strzyżew
11771	11653	\N	Suchocin
11772	11653	\N	Suleje
11773	11653	\N	Szczygły Dolne
11774	11653	\N	Szczygły Górne
11775	11653	\N	Świdry
11776	11653	\N	Topór
11777	11653	\N	Turze Rogi
11778	11653	\N	Wagram
11779	11653	\N	Widok
11780	11653	\N	Wólka Świątkowa
11781	11653	\N	Zabrodzie
11782	11653	\N	Zagórna
11783	11653	\N	Zagórze
11784	11653	\N	Za Koleją
11785	11653	\N	Zalesie
11786	11653	\N	Zarzecz Łukowski
11787	11653	\N	Zimna Woda
11788	11653	\N	Żdżary
11789	11657	\N	Bielany Duże
11790	11657	\N	Bielany Małe
11791	11657	\N	Bielany Trzecie
11792	11657	\N	Bronisławów Duży
11793	11657	\N	Bronisławów Mały
11794	11657	\N	Charlejów
11795	11657	\N	Czarna
11796	11657	\N	Ernestynów
11797	11657	\N	Hordzież
11798	11657	\N	Józefów Duży
11799	11657	\N	Józefów Mały
11800	11657	\N	Karolina
11801	11657	\N	Kolonia Wólka
11802	11657	\N	Krzówka
11803	11657	\N	Krzywda
11804	11657	\N	Leonardów
11805	11657	\N	Nowa Ruda
11806	11657	\N	Pieńki
11807	11657	\N	Poznań
11808	11657	\N	Ruda
11809	11657	\N	Serokomla
11810	11657	\N	Wola Bukowska
11811	11657	\N	Wólka
11812	11658	\N	Aleksandrów
11813	11658	\N	Anonin
11814	11658	\N	Borowina
11815	11658	\N	Celiny Szlacheckie
11816	11658	\N	Celiny Włościańskie
11817	11658	\N	Gózd
11818	11658	\N	Jarczówek
11819	11658	\N	Jedlanka
11820	11658	\N	Jeleniec
11821	11658	\N	Jonnik
11822	11658	\N	Józefów
11823	11658	\N	Kierzków
11824	11658	\N	Kij
11825	11658	\N	Kolonia Celiny Włościańskie
11826	11658	\N	Kolonia Kosuty
11827	11658	\N	Kopina
11828	11658	\N	Kosuty
11829	11658	\N	Kujawy
11830	11658	\N	Lipniak
11831	11658	\N	Niedźwiadka
11832	11658	\N	Nowa Wróblina
11833	11658	\N	Nowy Stanin
11834	11658	\N	Ogniwo
11835	11658	\N	Sarnów
11836	11658	\N	Stajki
11837	11658	\N	Stanin
11838	11658	\N	Stanisławów
11839	11658	\N	Stara Gąska
11840	11658	\N	Stara Wróblina
11841	11658	\N	Tuchowicz
11842	11658	\N	Wesołówka
11843	11658	\N	Wnętrzne
11844	11658	\N	Wólka Zastawska
11845	11658	\N	Zagoździe
11846	11658	\N	Zastawie
11847	11658	\N	Zastawie-Kolonia
11848	11658	\N	Zawodzie
11849	11658	\N	Zawywozie
11850	11654	\N	Aleksandrówka
11851	11654	\N	Błażejki
11852	11654	\N	Borki
11853	11654	\N	Celej
11854	11654	\N	Chrusty
11855	11654	\N	Guzówka
11856	11654	\N	Huta Łukacz
11857	11654	\N	Jagodne
11858	11654	\N	Jamielne
11859	11654	\N	Jamielnik
11860	11654	\N	Jamielnik-Kolonia
11861	11654	\N	Januszówka
11862	11654	\N	Jedlanka
11863	11654	\N	Kamionka
11864	11654	\N	Kapice
11865	11654	\N	Kienkówka
11866	11654	\N	Kisielsk
11867	11654	\N	Łosiniec
11868	11654	\N	Mizary
11869	11654	\N	Nowa Guzówka
11870	11654	\N	Nowa Prawda
11871	11654	\N	Nowe Kobiałki
11872	11654	\N	Nowy Jamielnik
11873	11654	\N	Rosy
11874	11654	\N	Róża
11875	11654	\N	Róża Podgórna
11876	11654	\N	Ruda
11877	11654	\N	Stara Prawda
11878	11654	\N	Stara Róża
11879	11654	\N	Stare Kobiałki
11880	11654	\N	Stary Jamielnik
11881	11654	\N	Szyszki
11882	11654	\N	Toczyska
11883	11654	\N	Turzec
11884	11654	\N	Warkocz
11885	11654	\N	Wiśniówka
11886	11654	\N	Wola Kisielska
11887	11654	\N	Wólka Poznańska
11888	11654	\N	Wólka Różańska
11889	11654	\N	Zabiele
11890	11654	\N	Zgórznica
11891	11659	\N	Celiny
11892	11659	\N	Dębowica
11893	11659	\N	Dębowierzchy
11894	11659	\N	Gołowierzchy
11895	11659	\N	Jakusze
11896	11659	\N	Karwów
11897	11659	\N	Kurów
11898	11659	\N	Leszczanka
11899	11659	\N	Mikłusy
11900	11659	\N	Mikłusy-Kolonia
11901	11659	\N	Nalesie
11902	11659	\N	Nurzyna
11903	11659	\N	Płudy
11904	11659	\N	Popławy-Rogale
11905	11659	\N	Rąbież
11906	11659	\N	Sierakówka
11907	11659	\N	Szaniawy-Matysy
11908	11659	\N	Szaniawy-Poniaty
11909	11659	\N	Świercze
11910	11659	\N	Trzebieszów
11911	11659	\N	Trzebieszów Drugi
11912	11659	\N	Trzebieszów-Kolonia
11913	11659	\N	Trzebieszów Pierwszy
11914	11659	\N	Wierzejki
11915	11659	\N	Wólka Konopna
11916	11659	\N	Wylany
11917	11659	\N	Zabiałcze-Kolonia
11918	11659	\N	Zaolszynie
11919	11659	\N	Zawycienna
11920	11659	\N	Zembry
11921	11660	\N	Burzec
11922	11660	\N	Bystrzyca
11923	11660	\N	Ciężkie
11924	11660	\N	Dąbrowa
11925	11660	\N	Glinne
11926	11660	\N	Helenów
11927	11660	\N	Hermanów
11928	11660	\N	Kolonia Bystrzycka
11929	11660	\N	Kolonia Siedliska
11930	11660	\N	Marianów Rogowski
11931	11660	\N	Nowinki
11932	11660	\N	Nowiny
11933	11660	\N	Oszczepalin Drugi
11934	11660	\N	Oszczepalin Pierwszy
11935	11660	\N	Otylin
11936	11660	\N	Przytulin
11937	11660	\N	Siedliska
11938	11660	\N	Świderki
11939	11660	\N	Wojcieszków
11940	11660	\N	Wola Bobrowa
11941	11660	\N	Wola Burzecka
11942	11660	\N	Wola Burzecka-Kolonia
11943	11660	\N	Wola Bystrzycka
11944	11660	\N	Wólka Domaszewska
11945	11660	\N	Zofibór
11946	11660	\N	Zofijówka
11947	11661	\N	Baczków
11948	11661	\N	Błażków
11949	11661	\N	Budki
11950	11661	\N	Chojniak
11951	11661	\N	Ciechomin
11952	11661	\N	Dwornia
11953	11661	\N	Dychawica
11954	11661	\N	Germanicha
11955	11661	\N	Głupianki
11956	11661	\N	Grudź
11957	11661	\N	Jarczew
11958	11661	\N	Kamień
11959	11661	\N	Kolonia Mysłów
11960	11661	\N	Ksawerynów
11961	11661	\N	Lisikierz
11962	11661	\N	Mysłów
11963	11661	\N	Nowy Świat
11964	11661	\N	Osiny
11965	11661	\N	Płóski
11966	11661	\N	Powały
11967	11661	\N	Pszczelnik
11968	11661	\N	Stara Huta
11969	11661	\N	Świder
11970	11661	\N	Wandów
11971	11661	\N	Wilczyska
11972	11661	\N	Wola Mysłowska
11973	11661	\N	Wólka Ciechomska
11974	11661	\N	Zadole
11975	11661	\N	Zawaliny
11976	320	\N	Chodel
11977	320	\N	Józefów nad Wisłą
11978	320	\N	Karczmiska
11979	320	\N	Łaziska
11980	320	\N	Opole Lubelskie
11981	320	\N	Poniatowa
11982	320	\N	Wilków
11983	11976	\N	Adelina
11984	11976	\N	Antonówka
11985	11976	\N	Borów
11986	11976	\N	Borów-Kolonia
11987	11976	\N	Budzyń
11988	11976	\N	Chodel
11989	11976	\N	Godów
11990	11976	\N	Granice
11991	11976	\N	Grądy
11992	11976	\N	Huta Borowska
11993	11976	\N	Jeżów
11994	11976	\N	Kawęczyn
11995	11976	\N	Książ
11996	11976	\N	Lipiny
11997	11976	\N	Majdan Borowski
11998	11976	\N	Osiny
11999	11976	\N	Przytyki
12000	11976	\N	Radlin
12001	11976	\N	Ratoszyn Drugi
12002	11976	\N	Ratoszyn Pierwszy
12003	11976	\N	Siewalka
12004	11976	\N	Stasin
12005	11976	\N	Świdno
12006	11976	\N	Trzciniec
12007	11976	\N	Zastawki
12008	11976	\N	Zosinek
12009	11977	\N	Basonia
12010	11977	\N	Boiska-Kolonia
12011	11977	\N	Bór
12012	11977	\N	Chruślanki Józefowskie
12013	11977	\N	Chruślanki Mazanowskie
12014	11977	\N	Chruślina
12015	11977	\N	Chruślina-Kolonia
12016	11977	\N	Dębniak
12017	11977	\N	Graniczna
12018	11977	\N	Idalin
12019	11977	\N	Józefów nad Wisłą
12020	11977	\N	Kaliszany-Kolonia
12021	11977	\N	Kolczyn
12022	11977	\N	Kolonia Nieszawa
12023	11977	\N	Łopoczno
12024	11977	\N	Mariampol
12025	11977	\N	Mazanów
12026	11977	\N	Miłoszówka
12027	11977	\N	Niesiołowice
12028	11977	\N	Nieszawa
12029	11977	\N	Nietrzeba
12030	11977	\N	Owczarnia
12031	11977	\N	Pielgrzymka
12032	11977	\N	Pocześle
12033	11977	\N	Prawno
12034	11977	\N	Rybitwy
12035	11977	\N	Spławy
12036	11977	\N	Stare Boiska
12037	11977	\N	Stare Kaliszany
12038	11977	\N	Stasin
12039	11977	\N	Stefanówka
12040	11977	\N	Studnisko
12041	11977	\N	Ugory
12042	11977	\N	Wałowice
12043	11977	\N	Wałowice-Kolonia
12044	11977	\N	Wólka Kolczyńska
12045	11978	\N	Bielsko
12046	11978	\N	Chodlik
12047	11978	\N	Głusko Duże
12048	11978	\N	Głusko Duże-Kolonia
12049	11978	\N	Głusko Małe
12050	11978	\N	Górki
12051	11978	\N	Jaworce
12052	11978	\N	Karczmiska Drugie
12053	11978	\N	Karczmiska Pierwsze
12054	11978	\N	Mieczysławka
12055	11978	\N	Noworąblów
12056	11978	\N	Słotwiny
12057	11978	\N	Uściąż
12058	11978	\N	Uściąż-Kolonia
12059	11978	\N	Wolica
12060	11978	\N	Wolica-Kolonia
12061	11978	\N	Wymysłów
12062	11978	\N	Zaborze
12063	11978	\N	Zaborze-Kolonia
12064	11978	\N	Zagajdzie
12065	11978	\N	Karczmiska
12066	11979	\N	Braciejowice
12067	11979	\N	Głodno
12068	11979	\N	Grabowiec
12069	11979	\N	Janiszów
12070	11979	\N	Kamień
12071	11979	\N	Kamień-Kolonia
12072	11979	\N	Kępa Gostecka
12073	11979	\N	Kępa Piotrawińska
12074	11979	\N	Kępa Solecka
12075	11979	\N	Kolonia Łaziska
12076	11979	\N	Koło
12077	11979	\N	Kopanina Kaliszańska
12078	11979	\N	Kopanina Kamieńska
12079	11979	\N	Kosiorów
12080	11979	\N	Las Dębowy
12081	11979	\N	Łaziska
12082	11979	\N	Niedźwiada Duża
12083	11979	\N	Niedźwiada Mała
12084	11979	\N	Piotrawin
12085	11979	\N	Piotrawin-Kolonia
12086	11979	\N	Trzciniec
12087	11979	\N	Wojciechów
12088	11979	\N	Wrzelów
12089	11979	\N	Zakrzów
12090	11979	\N	Zgoda
12091	11980	\N	Opole Lubelskie
12092	11980	\N	Białowoda
12093	11980	\N	Ćwiętalka
12094	11980	\N	Darowne
12095	11980	\N	Dąbrowa Godowska
12096	11980	\N	Dębiny
12097	11980	\N	Elżbieta
12098	11980	\N	Elżbieta-Kolonia
12099	11980	\N	Emilcin
12100	11980	\N	Górna Owczarnia
12101	11980	\N	Góry Kluczkowickie
12102	11980	\N	Góry Opolskie
12103	11980	\N	Grabówka
12104	11980	\N	Jankowa
12105	11980	\N	Kamionka
12106	11980	\N	Kazimierzów
12107	11980	\N	Kleniewo
12108	11980	\N	Kluczkowice
12109	11980	\N	Kluczkowice-Osiedle
12110	11980	\N	Kręciszówka
12111	11980	\N	Leonin
12112	11980	\N	Ludwików
12113	11980	\N	Majdan Trzebieski
12114	11980	\N	Niezdów
12115	11980	\N	Nowe Komaszyce
12116	11980	\N	Nowy Franciszków
12117	11980	\N	Ożarów Drugi
12118	11980	\N	Ożarów Pierwszy
12119	11980	\N	Pomorze
12120	11980	\N	Puszno Godowskie
12121	11980	\N	Puszno Skokowskie
12122	11980	\N	Rozalin
12123	11980	\N	Ruda Godowska
12124	11980	\N	Ruda Maciejowska
12125	11980	\N	Sewerynówka
12126	11980	\N	Skoków
12127	11980	\N	Stanisławów
12128	11980	\N	Stare Komaszyce
12129	11980	\N	Stary Franciszków
12130	11980	\N	Świdry
12131	11980	\N	Truszków
12132	11980	\N	Trzebiesza
12133	11980	\N	Wandalin
12134	11980	\N	Wola Rudzka
12135	11980	\N	Wólka Komaszycka
12136	11980	\N	Wrzelowiec
12137	11980	\N	Zadole
12138	11980	\N	Zajączków
12139	11980	\N	Zosin
12140	11981	\N	Poniatowa
12141	11981	\N	Dąbrowa Wronowska
12142	11981	\N	Henin
12143	11981	\N	Kocianów
12144	11981	\N	Kowala Druga
12145	11981	\N	Kowala Pierwsza
12146	11981	\N	Kraczewice Prywatne
12147	11981	\N	Kraczewice Rządowe
12148	11981	\N	Niezabitów
12149	11981	\N	Niezabitów-Kolonia
12150	11981	\N	Obliźniak
12151	11981	\N	Plizin
12152	11981	\N	Poniatowa-Kolonia
12153	11981	\N	Spławy
12154	11981	\N	Szczuczki-Kolonia
12155	11981	\N	Wólka Łubkowska
12156	11981	\N	Zofianka
12157	11982	\N	Brzozowa
12158	11982	\N	Dobre
12159	11982	\N	Kąty
12160	11982	\N	Kępa Chotecka
12161	11982	\N	Kłodnica
12162	11982	\N	Kolonia Wrzelów
12163	11982	\N	Kosiorów
12164	11982	\N	Lubomirka
12165	11982	\N	Machów
12166	11982	\N	Majdany
12167	11982	\N	Podgórz
12168	11982	\N	Polanówka
12169	11982	\N	Rogów
12170	11982	\N	Rybaki
12171	11982	\N	Szczekarków
12172	11982	\N	Szczekarków-Kolonia
12173	11982	\N	Szkuciska
12174	11982	\N	Urządków
12175	11982	\N	Wilków
12176	11982	\N	Wilków-Kolonia
12177	11982	\N	Wólka Polanowska
12178	11982	\N	Zagłoba
12179	11982	\N	Zarudki
12180	11982	\N	Zastów Karczmiski
12181	11982	\N	Zastów Polanowski
12182	11982	\N	Żmijowiska
12183	321	\N	Dębowa Kłoda
12184	321	\N	Jabłoń
12185	321	\N	Milanów
12186	321	\N	Parczew
12187	321	\N	Podedwórze
12188	321	\N	Siemień
12189	321	\N	Sosnowica
12190	12183	\N	Bednarzówka
12191	12183	\N	Białka
12192	12183	\N	Chmielów
12193	12183	\N	Dębowa Kłoda
12194	12183	\N	Hanów
12195	12183	\N	Kodeniec
12196	12183	\N	Korona
12197	12183	\N	Krzywowierzba-Kolonia
12198	12183	\N	Leitnie
12199	12183	\N	Lubiczyn
12200	12183	\N	Makoszka
12201	12183	\N	Marianówka
12202	12183	\N	Nietiahy
12203	12183	\N	Pachole
12204	12183	\N	Plebania Wola
12205	12183	\N	Smolarz
12206	12183	\N	Stępków
12207	12183	\N	Uhnin
12208	12183	\N	Wyhalew
12209	12183	\N	Zadębie
12210	12183	\N	Żmiarki
12211	12184	\N	Dawidy
12212	12184	\N	Gęś
12213	12184	\N	Holendernia
12214	12184	\N	Jabłoń
12215	12184	\N	Kalinka
12216	12184	\N	Kolano
12217	12184	\N	Kolano-Kolonia
12218	12184	\N	Kudry
12219	12184	\N	Łubno
12220	12184	\N	Paszenki
12221	12184	\N	Puchowa Góra
12222	12184	\N	Wantopol
12223	12185	\N	Cichostów
12224	12185	\N	Czarny Las
12225	12185	\N	Czeberaki
12226	12185	\N	Góry Brzeziny
12227	12185	\N	Kopina
12228	12185	\N	Kostry
12229	12185	\N	Milanów
12230	12185	\N	Milanów-Kolonia
12231	12185	\N	Okalew
12232	12185	\N	Radcze
12233	12185	\N	Rudno
12234	12185	\N	Rudzieniec
12235	12185	\N	Zieleniec
12236	12186	\N	Parczew
12237	12186	\N	Babianka
12238	12186	\N	Brudno
12239	12186	\N	Buradów
12240	12186	\N	Jasionka
12241	12186	\N	Jedlanka
12242	12186	\N	Koczergi
12243	12186	\N	Komarne
12244	12186	\N	Królewski Dwór
12245	12186	\N	Laski
12246	12186	\N	Michałówka
12247	12186	\N	Pohulanka
12248	12186	\N	Prokop
12249	12186	\N	Przewłoka
12250	12186	\N	Siedliki
12251	12186	\N	Sowin
12252	12186	\N	Szytki
12253	12186	\N	Tyśmienica
12254	12186	\N	Welin
12255	12186	\N	Wierzbówka
12256	12186	\N	Wola Przewłocka
12257	12186	\N	Zaniówka
12258	12187	\N	Antopol
12259	12187	\N	Bojary
12260	12187	\N	Grabówka
12261	12187	\N	Hołowno
12262	12187	\N	Kaniuki
12263	12187	\N	Mosty
12264	12187	\N	Niecielin
12265	12187	\N	Nowe Mosty
12266	12187	\N	Opole
12267	12187	\N	Piechy
12268	12187	\N	Podedwórze
12269	12187	\N	Rusiły
12270	12187	\N	Zaliszcze
12271	12188	\N	Amelin
12272	12188	\N	Augustówka
12273	12188	\N	Działyń
12274	12188	\N	Glinny Stok
12275	12188	\N	Gródek Szlachecki
12276	12188	\N	Jezioro
12277	12188	\N	Juliopol
12278	12188	\N	Łubka
12279	12188	\N	Miłków
12280	12188	\N	Miłków-Kolonia
12281	12188	\N	Nadzieja
12282	12188	\N	Pomyków
12283	12188	\N	Sewerynówka
12284	12188	\N	Siemień
12285	12188	\N	Siemień-Kolonia
12286	12188	\N	Tulniki
12287	12188	\N	Wierzchowiny
12288	12188	\N	Władysławów
12289	12188	\N	Wola Tulnicka
12290	12188	\N	Wólka Siemieńska
12291	12188	\N	Żminne
12292	12189	\N	Bohutyn
12293	12189	\N	Górki
12294	12189	\N	Izabelin
12295	12189	\N	Karolin
12296	12189	\N	Komarówka
12297	12189	\N	Kropiwki
12298	12189	\N	Lejno
12299	12189	\N	Libiszów
12300	12189	\N	Lipniak
12301	12189	\N	Mościska
12302	12189	\N	Nowy Orzechów
12303	12189	\N	Olchówka
12304	12189	\N	Pasieka
12305	12189	\N	Pieszowola
12306	12189	\N	Sosnowica
12307	12189	\N	Sosnowica-Dwór
12308	12189	\N	Stary Orzechów
12309	12189	\N	Turno
12310	12189	\N	Walerianów
12311	12189	\N	Zacisze
12312	12189	\N	Zbójno
12313	12189	\N	Zienki
12314	322	\N	Puławy
12315	322	\N	Baranów
12316	322	\N	Janowiec
12317	322	\N	Kazimierz Dolny
12318	322	\N	Końskowola
12319	322	\N	Kurów
12320	322	\N	Markuszów
12321	322	\N	Nałęczów
12322	322	\N	Wąwolnica
12323	322	\N	Żyrzyn
12324	12314	\N	Puławy
12325	12315	\N	Baranów
12326	12315	\N	Czołna
12327	12315	\N	Dębczyna
12328	12315	\N	Gródek
12329	12315	\N	Huta
12330	12315	\N	Karczunek
12331	12315	\N	Klin
12332	12315	\N	Kozioł
12333	12315	\N	Łukawica
12334	12315	\N	Łukawka
12335	12315	\N	Łysa Góra
12336	12315	\N	Motoga
12337	12315	\N	Niwa
12338	12315	\N	Nowomichowska
12339	12315	\N	Pogonów
12340	12315	\N	Składów
12341	12315	\N	Śniadówka
12342	12315	\N	Wola Czołnowska
12343	12315	\N	Zagóźdź
12344	12316	\N	Brześce
12345	12316	\N	Brześce-Kolonia
12346	12316	\N	Janowice
12347	12316	\N	Janowiec
12348	12316	\N	Nasiłów
12349	12316	\N	Oblasy
12350	12316	\N	Trzcianki
12351	12316	\N	Wojszyn
12352	12317	\N	Kazimierz Dolny
12353	12317	\N	Bochotnica
12354	12317	\N	Parchatka
12355	12317	\N	Rzeczyca
12356	12317	\N	Rzeczyca-Kolonia
12357	12317	\N	Skowieszynek
12358	12317	\N	Wierzchoniów
12359	12317	\N	Witoszyn
12360	12317	\N	Zbędowice
12361	12318	\N	Chrząchów
12362	12318	\N	Chrząchówek
12363	12318	\N	Końskowola
12364	12318	\N	Las Stocki
12365	12318	\N	Młynki
12366	12318	\N	Nowy Pożóg
12367	12318	\N	Opoka
12368	12318	\N	Pulki
12369	12318	\N	Rudy
12370	12318	\N	Sielce
12371	12318	\N	Skowieszyn
12372	12318	\N	Stara Wieś
12373	12318	\N	Stary Pożóg
12374	12318	\N	Stok
12375	12318	\N	Witowice
12376	12318	\N	Wronów
12377	12319	\N	Barłogi
12378	12319	\N	Bronisławka
12379	12319	\N	Brzozowa Gać
12380	12319	\N	Buchałowice
12381	12319	\N	Choszczów
12382	12319	\N	Dęba
12383	12319	\N	Józefów
12384	12319	\N	Klementowice
12385	12319	\N	Kłoda
12386	12319	\N	Kozi Las
12387	12319	\N	Kurów
12388	12319	\N	Łąkoć
12389	12319	\N	Marianka
12390	12319	\N	Olesin
12391	12319	\N	Płonki
12392	12319	\N	Posiołek
12393	12319	\N	Szumów
12394	12319	\N	Wólka Nowodworska
12395	12319	\N	Zastawie
12396	12320	\N	Bobowiska
12397	12320	\N	Góry
12398	12320	\N	Góry-Kolonia
12399	12320	\N	Kaleń
12400	12320	\N	Łany
12401	12320	\N	Markuszów
12402	12320	\N	Olempin
12403	12320	\N	Olszowiec
12404	12320	\N	Wólka Kątna
12405	12320	\N	Zabłocie
12406	12321	\N	Nałęczów
12407	12321	\N	Bochotnica-Kolonia
12408	12321	\N	Bronice
12409	12321	\N	Bronice-Kolonia
12410	12321	\N	Chruszczów-Kolonia
12411	12321	\N	Cynków
12412	12321	\N	Czesławice
12413	12321	\N	Drzewce
12414	12321	\N	Drzewce-Kolonia
12415	12321	\N	Ludwinów
12416	12321	\N	Paulinów
12417	12321	\N	Piotrowice
12418	12321	\N	Sadurki
12419	12321	\N	Strzelce
12420	12314	\N	Anielin
12421	12314	\N	Borowa
12422	12314	\N	Borowina
12423	12314	\N	Bronowice
12424	12314	\N	Dobrosławów
12425	12314	\N	Gołąb
12426	12314	\N	Góra Puławska
12427	12314	\N	Janów
12428	12314	\N	Jaroszyn
12429	12314	\N	Kajetanów
12430	12314	\N	Klikawa
12431	12314	\N	Kochanów
12432	12314	\N	Kolonia Góra Puławska
12433	12314	\N	Kowala
12434	12314	\N	Leokadiów
12435	12314	\N	Łęka
12436	12314	\N	Matygi
12437	12314	\N	Niebrzegów
12438	12314	\N	Nieciecz
12439	12314	\N	Opatkowice
12440	12314	\N	Pachnowola
12441	12314	\N	Piskorów
12442	12314	\N	Polesie
12443	12314	\N	Sadłowice
12444	12314	\N	Skoki
12445	12314	\N	Smogorzów
12446	12314	\N	Sosnów
12447	12314	\N	Tomaszów
12448	12314	\N	Wólka Gołębska
12449	12314	\N	Zarzecze
12450	12322	\N	Bartłomiejowice
12451	12322	\N	Celejów
12452	12322	\N	Grabówki
12453	12322	\N	Huta
12454	12322	\N	Karmanowice
12455	12322	\N	Kębło
12456	12322	\N	Łąki
12457	12322	\N	Łopatki
12458	12322	\N	Łopatki-Kolonia
12459	12322	\N	Mareczki
12460	12322	\N	Rąblów
12461	12322	\N	Rogalów
12462	12322	\N	Stanisławka
12463	12322	\N	Wąwolnica
12464	12322	\N	Zarzeka
12465	12322	\N	Zawada
12466	12322	\N	Zgórzyńskie
12467	12323	\N	Bałtów
12468	12323	\N	Borysów
12469	12323	\N	Cezaryn
12470	12323	\N	Jaworów
12471	12323	\N	Kośmin
12472	12323	\N	Kotliny
12473	12323	\N	Las-Grzęba
12474	12323	\N	Las-Jawor
12475	12323	\N	Osiny
12476	12323	\N	Parafianka
12477	12323	\N	Skrudki
12478	12323	\N	Strzyżowice
12479	12323	\N	Wilczanka
12480	12323	\N	Wola Osińska
12481	12323	\N	Zagrody
12482	12323	\N	Żerdź
12483	12323	\N	Żyrzyn
12484	323	\N	Radzyń Podlaski
12485	323	\N	Borki
12486	323	\N	Czemierniki
12487	323	\N	Kąkolewnica Wschodnia
12488	323	\N	Komarówka Podlaska
12489	323	\N	Ulan-Majorat
12490	323	\N	Wohyń
12491	12484	\N	Radzyń Podlaski
12492	12485	\N	Borki
12493	12485	\N	Borowe
12494	12485	\N	Krasew
12495	12485	\N	Maruszewiec
12496	12485	\N	Maruszewiec Pofolwarczny
12497	12485	\N	Nowiny
12498	12485	\N	Olszewnica
12499	12485	\N	Osowno
12500	12485	\N	Pasieka
12501	12485	\N	Pasmugi
12502	12485	\N	Podlasie
12503	12485	\N	Sitno
12504	12485	\N	Skrzynka
12505	12485	\N	Stara Wieś
12506	12485	\N	Tchórzew
12507	12485	\N	Tchórzewek
12508	12485	\N	Tchórzew-Kolonia
12509	12485	\N	Wola Chomejowa
12510	12485	\N	Wola Osowińska
12511	12485	\N	Wrzosów
12512	12486	\N	Awuls
12513	12486	\N	Bełcząc
12514	12486	\N	Czemierniki
12515	12486	\N	Lichty
12516	12486	\N	Niewęgłosz
12517	12486	\N	Skoki
12518	12486	\N	Stoczek
12519	12486	\N	Stójka
12520	12486	\N	Wygnanów
12521	12487	\N	Brzozowica Duża
12522	12487	\N	Brzozowica Mała
12523	12487	\N	Grabowiec
12524	12487	\N	Jurki
12525	12487	\N	Kąkolewnica Południowa
12526	12487	\N	Kąkolewnica Północna
12527	12487	\N	Kąkolewnica Wschodnia
12528	12487	\N	Lipniaki
12529	12487	\N	Miłolas
12530	12487	\N	Mościska
12531	12487	\N	Olszewnica
12532	12487	\N	Polskowola
12533	12487	\N	Rudnik
12534	12487	\N	Sokule
12535	12487	\N	Turów
12536	12487	\N	Wygnanka
12537	12487	\N	Zosinowo
12538	12487	\N	Żakowola Poprzeczna
12539	12487	\N	Żakowola Radzyńska
12540	12487	\N	Żakowola Stara
12541	12488	\N	Bagna
12542	12488	\N	Brzeziny
12543	12488	\N	Brzozowy Kąt
12544	12488	\N	Derewiczna
12545	12488	\N	Gradowiec
12546	12488	\N	Kolembrody
12547	12488	\N	Komarówka Podlaska
12548	12488	\N	Martynów
12549	12488	\N	Przegaliny Duże
12550	12488	\N	Przegaliny Małe
12551	12488	\N	Walinna
12552	12488	\N	Wiski
12553	12488	\N	Woroniec
12554	12488	\N	Wólka Komarowska
12555	12488	\N	Żelizna
12556	12488	\N	Żulinki
12557	12484	\N	Bedlno
12558	12484	\N	Bedlno Radzyńskie
12559	12484	\N	Biała
12560	12484	\N	Białka
12561	12484	\N	Branica Radzyńska
12562	12484	\N	Branica Radzyńska-Kolonia
12563	12484	\N	Brzostówiec
12564	12484	\N	Dwór
12565	12484	\N	Główne
12566	12484	\N	Jaski
12567	12484	\N	Józefów
12568	12484	\N	Kolonia Paszkowska
12569	12484	\N	Marynin
12570	12484	\N	Paszki Duże
12571	12484	\N	Paszki Małe
12572	12484	\N	Płudy
12573	12484	\N	Radowiec
12574	12484	\N	Siedlanów
12575	12484	\N	Stasinów
12576	12484	\N	Ustrzesz
12577	12484	\N	Zabiele
12578	12484	\N	Zbulitów Duży
12579	12484	\N	Żabików
12580	12489	\N	Domaszewnica
12581	12489	\N	Domaszki
12582	12489	\N	Gąsiory
12583	12489	\N	Kępki
12584	12489	\N	Klębów
12585	12489	\N	Kolonia Domaszewnica
12586	12489	\N	Kolonia Domaszewska
12587	12489	\N	Paskudy
12588	12489	\N	Rozwadów
12589	12489	\N	Sętki
12590	12489	\N	Skrzyszew
12591	12489	\N	Sobole
12592	12489	\N	Stanisławów
12593	12489	\N	Stok
12594	12489	\N	Ulan Duży
12595	12489	\N	Ulan-Majorat
12596	12489	\N	Ulan Mały
12597	12489	\N	Wierzchowiny
12598	12489	\N	Zakrzew
12599	12489	\N	Zarzec Ulański
12600	12489	\N	Zarzecz Ulański
12601	12489	\N	Żyłki
12602	12490	\N	Bezwola
12603	12490	\N	Bojanówka
12604	12490	\N	Branica-Kolonia
12605	12490	\N	Branica Suchowolska
12606	12490	\N	Gradowiec
12607	12490	\N	Kuraszew
12608	12490	\N	Lipiec
12609	12490	\N	Lisiowólka
12610	12490	\N	Ossowa
12611	12490	\N	Ostrówki
12612	12490	\N	Planta
12613	12490	\N	Suchowola
12614	12490	\N	Świerże
12615	12490	\N	Wohyń
12616	12490	\N	Wólka Zdunkówka
12617	12490	\N	Zbulitów Mały
12618	324	\N	Dęblin
12619	324	\N	Kłoczew
12620	324	\N	Nowodwór
12621	324	\N	Ryki
12622	324	\N	Stężyca
12623	324	\N	Ułęż
12624	12618	\N	Dęblin
12625	12619	\N	Borucicha
12626	12619	\N	Bramka
12627	12619	\N	Czernic
12628	12619	\N	Gęsia Wólka
12629	12619	\N	Gózd
12630	12619	\N	Huta Zadybska
12631	12619	\N	Jagodne
12632	12619	\N	Janopol
12633	12619	\N	Julianów
12634	12619	\N	Kawęczyn
12635	12619	\N	Kąty
12636	12619	\N	Kłoczew
12637	12619	\N	Kokoszka
12638	12619	\N	Kurzelaty
12639	12619	\N	Nowe Zadybie
12640	12619	\N	Padarz
12641	12619	\N	Przykwa
12642	12619	\N	Rybaki
12643	12619	\N	Rzyczyna
12644	12619	\N	Sokola
12645	12619	\N	Sosnówka
12646	12619	\N	Stare Zadybie
12647	12619	\N	Stryj
12648	12619	\N	Wojciechówka
12649	12619	\N	Wola Zadybska
12650	12619	\N	Wola Zadybska-Kolonia
12651	12619	\N	Wygranka
12652	12619	\N	Wylezin
12653	12619	\N	Zaryte
12654	12619	\N	Żwadnik
12655	12620	\N	Borki
12656	12620	\N	Grabowce Dolne
12657	12620	\N	Grabowce Górne
12658	12620	\N	Grabów Rycki
12659	12620	\N	Grabów Szlachecki
12660	12620	\N	Jakubówka
12661	12620	\N	Lendo Wielkie
12662	12620	\N	Niedźwiedź
12663	12620	\N	Nowodwór
12664	12620	\N	Przestrzeń
12665	12620	\N	Rycza
12666	12620	\N	Trzcianki
12667	12620	\N	Urszulin
12668	12620	\N	Wrzosówka
12669	12620	\N	Zawitała
12670	12620	\N	Zielony Kąt
12671	12621	\N	Ryki
12672	12621	\N	Bobrowniki
12673	12621	\N	Brusów
12674	12621	\N	Budki-Rososz
12675	12621	\N	Chrustne
12676	12621	\N	Edwardów
12677	12621	\N	Janisze
12678	12621	\N	Kleszczówka
12679	12621	\N	Krasnogliny
12680	12621	\N	Lasocin
12681	12621	\N	Lasoń
12682	12621	\N	Leopoldów
12683	12621	\N	Moszczanka
12684	12621	\N	Niwa Babicka
12685	12621	\N	Nowa Dąbia
12686	12621	\N	Nowy Bazanów
12687	12621	\N	Nowy Dęblin
12688	12621	\N	Ogonów
12689	12621	\N	Oszczywilk
12690	12621	\N	Ownia
12691	12621	\N	Podwierzbie
12692	12621	\N	Potok
12693	12621	\N	Rososz
12694	12621	\N	Sędowice
12695	12621	\N	Sierskowola
12696	12621	\N	Stara Dąbia
12697	12621	\N	Stary Bazanów
12698	12621	\N	Swaty
12699	12621	\N	Zalesie
12700	12621	\N	Zalesie-Kolonia
12701	12622	\N	Brzeziny
12702	12622	\N	Brzeźce
12703	12622	\N	Długowola
12704	12622	\N	Drachalica
12705	12622	\N	Kletnia
12706	12622	\N	Krukówka
12707	12622	\N	Nadwiślanka
12708	12622	\N	Nowa Rokitnia
12709	12622	\N	Paprotnia
12710	12622	\N	Pawłowice
12711	12622	\N	Piotrowice
12712	12622	\N	Prażmów
12713	12622	\N	Stara Rokitnia
12714	12622	\N	Stężyca
12715	12622	\N	Zielonka
12716	12623	\N	Białki Dolne
12717	12623	\N	Białki Górne
12718	12623	\N	Brzozowa
12719	12623	\N	Drążgów
12720	12623	\N	Drewnik
12721	12623	\N	Korzeniów
12722	12623	\N	Lendo Ruskie
12723	12623	\N	Miłosze
12724	12623	\N	Osmolice
12725	12623	\N	Podlodów
12726	12623	\N	Podlodówka
12727	12623	\N	Sarny
12728	12623	\N	Sobieszyn
12729	12623	\N	Stara Wólka
12730	12623	\N	Ułęż
12731	12623	\N	Wąwolnica
12732	12623	\N	Zosin
12733	12623	\N	Żabianka
12734	330	\N	Świdnik
12735	330	\N	Mełgiew
12736	330	\N	Piaski
12737	330	\N	Rybczewice
12738	330	\N	Trawniki
12739	12734	\N	Świdnik
12740	12735	\N	Dominów
12741	12735	\N	Franciszków
12742	12735	\N	Jacków
12743	12735	\N	Janowice
12744	12735	\N	Janówek
12745	12735	\N	Józefów
12746	12735	\N	Krępiec
12747	12735	\N	Krzesimów
12748	12735	\N	Lubieniec
12749	12735	\N	Mełgiew
12750	12735	\N	Minkowice
12751	12735	\N	Minkowice-Kolonia
12752	12735	\N	Nowy Krępiec
12753	12735	\N	Piotrówek Pierwszy
12754	12735	\N	Podzamcze
12755	12735	\N	Trzeciaków
12756	12735	\N	Trzeszkowice
12757	12735	\N	Żurawniki
12758	12736	\N	Piaski
12759	12736	\N	Borkowszczyzna
12760	12736	\N	Brzezice
12761	12736	\N	Brzeziczki
12762	12736	\N	Bystrzejowice Drugie
12763	12736	\N	Bystrzejowice Pierwsze
12764	12736	\N	Bystrzejowice Trzecie
12765	12736	\N	Emilianów
12766	12736	\N	Gardzienice Drugie
12767	12736	\N	Gardzienice Pierwsze
12768	12736	\N	Giełczew
12769	12736	\N	Jadwisin
12770	12736	\N	Janówek
12771	12736	\N	Józefów
12772	12736	\N	Kawęczyn
12773	12736	\N	Kębłów
12774	12736	\N	Klimusin
12775	12736	\N	Kolonia Siedliszczki
12776	12736	\N	Kolonia Wola Piasecka
12777	12736	\N	Kozice Dolne
12778	12736	\N	Kozice Dolne-Kolonia
12779	12736	\N	Kozice Górne
12780	12736	\N	Majdan Brzezicki
12781	12736	\N	Majdanek Kozicki
12782	12736	\N	Majdan Kawęczyński
12783	12736	\N	Majdan Kozic Dolnych
12784	12736	\N	Majdan Kozic Górnych
12785	12736	\N	Marysin
12786	12736	\N	Młodziejów
12787	12736	\N	Nowiny
12788	12736	\N	Piaski Górne
12789	12736	\N	Piaski Wielkie
12790	12736	\N	Siedliszczki
12791	12736	\N	Stefanówka
12792	12736	\N	Wierzchowiska
12793	12736	\N	Wola Gardzienicka
12794	12736	\N	Wola Piasecka
12795	12736	\N	Żegotów
12796	12737	\N	Bazar
12797	12737	\N	Chodyłówka
12798	12737	\N	Choiny
12799	12737	\N	Częstoborowice
12800	12737	\N	Izdebno
12801	12737	\N	Izdebno-Kolonia
12802	12737	\N	Karczew
12803	12737	\N	Łączki
12804	12737	\N	Pasów
12805	12737	\N	Pilaszkowice Drugie
12806	12737	\N	Pilaszkowice Pierwsze
12807	12737	\N	Podizdebno
12808	12737	\N	Rybczewice Drugie
12809	12737	\N	Rybczewice Pierwsze
12810	12737	\N	Stryjno Drugie
12811	12737	\N	Stryjno-Kolonia
12812	12737	\N	Stryjno Pierwsze
12813	12737	\N	Wygnanowice
12814	12737	\N	Zygmuntów
12815	12737	\N	Rybczewice
12816	12738	\N	Biskupice
12817	12738	\N	Bonów
12818	12738	\N	Dorohucza
12819	12738	\N	Ewopole
12820	12738	\N	Majdan Siostrzytowski
12821	12738	\N	Oleśniki
12822	12738	\N	Pełczyn
12823	12738	\N	Siostrzytów
12824	12738	\N	Struża
12825	12738	\N	Struża-Kolonia
12826	12738	\N	Trawniki
12827	12738	\N	Trawniki-Kolonia
12828	325	\N	Tomaszów Lubelski
12829	325	\N	Bełżec
12830	325	\N	Jarczów
12831	325	\N	Krynice
12832	325	\N	Lubycza Królewska
12833	325	\N	Łaszczów
12834	325	\N	Rachanie
12835	325	\N	Susiec
12836	325	\N	Tarnawatka
12837	325	\N	Telatyn
12838	325	\N	Tyszowce
12839	325	\N	Ulhówek
12840	12828	\N	Tomaszów Lubelski
12841	12829	\N	Bełżec
12842	12829	\N	Brzeziny
12843	12829	\N	Chyże
12844	12829	\N	Szalenik-Kolonia
12845	12829	\N	Żyłka
12846	12830	\N	Chodywańce
12847	12830	\N	Gródek
12848	12830	\N	Gródek-Kolonia
12849	12830	\N	Jarczów
12850	12830	\N	Jarczów-Kolonia Druga
12851	12830	\N	Jarczów-Kolonia Pierwsza
12852	12830	\N	Jurów
12853	12830	\N	Korhynie
12854	12830	\N	Leliszka
12855	12830	\N	Łubcze
12856	12830	\N	Nedeżów
12857	12830	\N	Nowy Przeorsk
12858	12830	\N	Plebanka
12859	12830	\N	Pomiary
12860	12830	\N	Przewłoka
12861	12830	\N	Sowiniec
12862	12830	\N	Szlatyn
12863	12830	\N	Wierszczyca
12864	12830	\N	Wola Gródecka
12865	12830	\N	Wola Gródecka-Kolonia
12866	12830	\N	Zawady
12867	12831	\N	Antoniówka
12868	12831	\N	Budy
12869	12831	\N	Dąbrowa
12870	12831	\N	Dzierążnia
12871	12831	\N	Huta Dzierążyńska
12872	12831	\N	Kolonia Partyzantów
12873	12831	\N	Krynice
12874	12831	\N	Majdan Krynicki
12875	12831	\N	Majdan-Sielec
12876	12831	\N	Polanówka
12877	12831	\N	Polany
12878	12831	\N	Romanówka
12879	12831	\N	Zaboreczno
12880	12831	\N	Zadnoga
12881	12831	\N	Zwiartów
12882	12831	\N	Zwiartów-Kolonia
12883	12832	\N	Dęby
12884	12832	\N	Dyniska Nowe
12885	12832	\N	Hrebenne
12886	12832	\N	Huta Lubycka
12887	12832	\N	Kniazie
12888	12832	\N	Kornie
12889	12832	\N	Lubycza Królewska
12890	12832	\N	Łazowa
12891	12832	\N	Machnów Nowy
12892	12832	\N	Machnów Stary
12893	12832	\N	Mosty Małe
12894	12832	\N	Myślatyn
12895	12832	\N	Nowosiółki Kardynalskie
12896	12832	\N	Potoki
12897	12832	\N	Ruda Lubycka
12898	12832	\N	Ruda Żurawiecka
12899	12832	\N	Ruda Żurawiecka-Osada
12900	12832	\N	Siedliska
12901	12832	\N	Szalenik
12902	12832	\N	Teniatyska
12903	12832	\N	Wierzbica
12904	12832	\N	Zatyle
12905	12832	\N	Żurawce
12906	12832	\N	Żurawce-Osada
12907	12833	\N	Czerkasy
12908	12833	\N	Dobużek
12909	12833	\N	Dobużek-Kolonia
12910	12833	\N	Domaniż
12911	12833	\N	Hopkie
12912	12833	\N	Hopkie-Kolonia
12913	12833	\N	Kmiczyn
12914	12833	\N	Kmiczyn-Kolonia
12915	12833	\N	Łaszczów
12916	12833	\N	Łaszczów-Kolonia
12917	12833	\N	Małoniż
12918	12833	\N	Muratyn
12919	12833	\N	Muratyn-Kolonia
12920	12833	\N	Nabróż
12921	12833	\N	Nabróż-Kolonia
12922	12833	\N	Nadolce
12923	12833	\N	Pieniany
12924	12833	\N	Pieniany-Kolonia
12925	12833	\N	Podhajce
12926	12833	\N	Podlodów
12927	12833	\N	Pukarzów
12928	12833	\N	Pukarzów-Kolonia
12929	12833	\N	Ratyczów
12930	12833	\N	Sośnina
12931	12833	\N	Steniatyn
12932	12833	\N	Steniatyn-Kolonia
12933	12833	\N	Wólka Pukarzowska
12934	12833	\N	Zimno
12935	12833	\N	Zimno-Kolonia
12936	12834	\N	Falków
12937	12834	\N	Grodysławice
12938	12834	\N	Grodysławice-Kolonia
12939	12834	\N	Józefówka
12940	12834	\N	Kalinów
12941	12834	\N	Kociuba
12942	12834	\N	Korea
12943	12834	\N	Kozia Wola
12944	12834	\N	Michalów
12945	12834	\N	Michalów-Kolonia
12946	12834	\N	Pawłówka
12947	12834	\N	Rachanie
12948	12834	\N	Rachanie-Kolonia
12949	12834	\N	Siemierz
12950	12834	\N	Siemnice
12951	12834	\N	Sojnica
12952	12834	\N	Werechanie
12953	12834	\N	Werechanie-Kolonia
12954	12834	\N	Wożuczyn
12955	12834	\N	Zwiartówek
12956	12834	\N	Zwiartówek-Kolonia
12957	12835	\N	Ciotusza Nowa
12958	12835	\N	Ciotusza Stara
12959	12835	\N	Grabowica
12960	12835	\N	Huta Szumy
12961	12835	\N	Kolonia Pasieki
12962	12835	\N	Kunki
12963	12835	\N	Łasochy
12964	12835	\N	Łosiniec
12965	12835	\N	Łozowica
12966	12835	\N	Łuszczacz
12967	12835	\N	Majdan Sopocki Drugi
12968	12835	\N	Majdan Sopocki Pierwszy
12969	12835	\N	Maziły
12970	12835	\N	Nowiny
12971	12835	\N	Oseredek
12972	12835	\N	Paary
12973	12835	\N	Róża
12974	12835	\N	Rybnica
12975	12835	\N	Susiec
12976	12835	\N	Wioska
12977	12835	\N	Wólka Łosiniecka
12978	12835	\N	Zawadki
12979	12836	\N	Dąbrowa Tarnawacka
12980	12836	\N	Huta Tarnawacka
12981	12836	\N	Klocówka
12982	12836	\N	Niemirówek
12983	12836	\N	Niemirówek-Kolonia
12984	12836	\N	Pańków
12985	12836	\N	Pauczne
12986	12836	\N	Podhucie
12987	12836	\N	Sumin
12988	12836	\N	Tarnawatka
12989	12836	\N	Tarnawatka-Tartak
12990	12836	\N	Tymin
12991	12836	\N	Wieprzów Ordynacki
12992	12836	\N	Wieprzów Tarnawacki
12993	12837	\N	Dutrów
12994	12837	\N	Franusin
12995	12837	\N	Kryszyn
12996	12837	\N	Łachowce
12997	12837	\N	Łykoszyn
12998	12837	\N	Marysin
12999	12837	\N	Nowosiółki
13000	12837	\N	Posadów
13001	12837	\N	Poturzyn
13002	12837	\N	Radków
13003	12837	\N	Radków-Kolonia
13004	12837	\N	Rudka
13005	12837	\N	Suszów
13006	12837	\N	Telatyn
13007	12837	\N	Wasylów
13008	12837	\N	Żulice
13009	12828	\N	Chorążanka
13010	12828	\N	Dąbrowa Tomaszowska
13011	12828	\N	Górno
13012	12828	\N	Jeziernia
13013	12828	\N	Justynówka
13014	12828	\N	Klekacz
13015	12828	\N	Łaszczówka
13016	12828	\N	Łaszczówka-Kolonia
13017	12828	\N	Majdanek
13018	12828	\N	Majdan Górny
13019	12828	\N	Nowa Wieś
13020	12828	\N	Pasieki
13021	12828	\N	Podhorce
13022	12828	\N	Przecinka
13023	12828	\N	Przeorsk
13024	12828	\N	Rabinówka
13025	12828	\N	Rogóźno
13026	12828	\N	Rogóźno-Kolonia
13027	12828	\N	Ruda Wołoska
13028	12828	\N	Ruda Żelazna
13029	12828	\N	Sabaudia
13030	12828	\N	Szarowola
13031	12828	\N	Typin
13032	12828	\N	Ulów
13033	12828	\N	Wieprzowe Jezioro
13034	12828	\N	Zamiany
13035	12838	\N	Tyszowce
13036	12838	\N	Czartowczyk
13037	12838	\N	Czartowiec
13038	12838	\N	Czartowiec-Kolonia
13039	12838	\N	Czermno
13040	12838	\N	Gołaicha
13041	12838	\N	Gwoździak
13042	12838	\N	Kaliwy
13043	12838	\N	Kazimierówka
13044	12838	\N	Klątwy
13045	12838	\N	Lipowiec
13046	12838	\N	Marysin
13047	12838	\N	Mikulin
13048	12838	\N	Niedźwiedzia Góra
13049	12838	\N	Nowinki
13050	12838	\N	Perespa
13051	12838	\N	Perespa-Kolonia
13052	12838	\N	Podbór
13053	12838	\N	Przewale
13054	12838	\N	Rudka
13055	12838	\N	Soból
13056	12838	\N	Wakijów
13057	12838	\N	Wojciechówka
13058	12838	\N	Zamłynie
13059	12839	\N	Budynin
13060	12839	\N	Dębina
13061	12839	\N	Dębina-Osada
13062	12839	\N	Dyniska
13063	12839	\N	Hubinek
13064	12839	\N	Korczmin
13065	12839	\N	Korczmin-Osada
13066	12839	\N	Krzewica
13067	12839	\N	Machnówek
13068	12839	\N	Magdalenka
13069	12839	\N	Oserdów
13070	12839	\N	Podlodów
13071	12839	\N	Rokitno
13072	12839	\N	Rzeczyca
13073	12839	\N	Rzeplin
13074	12839	\N	Rzeplin-Osada
13075	12839	\N	Szczepiatyn
13076	12839	\N	Szczepiatyn-Osada
13077	12839	\N	Tarnoszyn
13078	12839	\N	Ulhówek
13079	12839	\N	Wasylów
13080	12839	\N	Wasylów Wielki
13081	12839	\N	Żerniki
13082	326	\N	Włodawa
13083	326	\N	Hanna
13084	326	\N	Hańsk
13085	326	\N	Stary Brus
13086	326	\N	Urszulin
13087	326	\N	Wola Uhruska
13088	326	\N	Wyryki
13089	13082	\N	Włodawa
13090	13083	\N	Dańce
13091	13083	\N	Dołhobrody
13092	13083	\N	Hanna
13093	13083	\N	Holeszów
13094	13083	\N	Janówka
13095	13083	\N	Konstantyn
13096	13083	\N	Kuzawka
13097	13083	\N	Lack
13098	13083	\N	Nowy Holeszów
13099	13083	\N	Pawluki
13100	13083	\N	Porchuciny
13101	13083	\N	Zaświatycze
13102	13084	\N	Bukowski Las
13103	13084	\N	Dubeczno
13104	13084	\N	Gajówka
13105	13084	\N	Hańsk Drugi
13106	13084	\N	Hańsk-Kolonia
13107	13084	\N	Hańsk Pierwszy
13108	13084	\N	Konstantynówka
13109	13084	\N	Kracie
13110	13084	\N	Krychów
13111	13084	\N	Kulczyn
13112	13084	\N	Kulczyn-Kolonia
13113	13084	\N	Macoszyn Mały
13114	13084	\N	Osowa
13115	13084	\N	Rudka Łowiecka
13116	13084	\N	Stary Majdan
13117	13084	\N	Starzyzna
13118	13084	\N	Szcześniki
13119	13084	\N	Świców
13120	13084	\N	Toki
13121	13084	\N	Ujazdów
13122	13084	\N	Wojciechów
13123	13084	\N	Zawołcze
13124	13084	\N	Żdżarka
13125	13084	\N	Hańsk
13126	13085	\N	Dębina
13127	13085	\N	Dominiczyn
13128	13085	\N	Helenin
13129	13085	\N	Hola
13130	13085	\N	Kamień
13131	13085	\N	Kołacze
13132	13085	\N	Kułaków
13133	13085	\N	Laski Bruskie
13134	13085	\N	Lubowierz
13135	13085	\N	Marianka
13136	13085	\N	Nowiny
13137	13085	\N	Nowy Brus
13138	13085	\N	Podgórze
13139	13085	\N	Skorodnica
13140	13085	\N	Stary Brus
13141	13085	\N	Szelibudy
13142	13085	\N	Wielki Łan
13143	13085	\N	Wołoskowola
13144	13085	\N	Zamołodycze
13145	13086	\N	Andrzejów
13146	13086	\N	Babsk
13147	13086	\N	Borysik
13148	13086	\N	Dębowiec
13149	13086	\N	Grabniak
13150	13086	\N	Jamniki
13151	13086	\N	Kalinówka
13152	13086	\N	Kozubata
13153	13086	\N	Łomnica
13154	13086	\N	Łowiszów
13155	13086	\N	Łysocha
13156	13086	\N	Michałów
13157	13086	\N	Nowe Załucze
13158	13086	\N	Przymiarki
13159	13086	\N	Sęków
13160	13086	\N	Stare Załucze
13161	13086	\N	Sumin
13162	13086	\N	Urszulin
13163	13086	\N	Wereszczyn
13164	13086	\N	Wielkopole
13165	13086	\N	Więzowiec
13166	13086	\N	Wincencin
13167	13086	\N	Wola Wereszczyńska
13168	13086	\N	Wólka Wytycka
13169	13086	\N	Wytyczno
13170	13086	\N	Zabrodzie
13171	13086	\N	Zastawie
13172	13086	\N	Zawadówka
13173	13082	\N	Adamki
13174	13082	\N	Demianówka
13175	13082	\N	Dubnik
13176	13082	\N	Korolówka
13177	13082	\N	Korolówka-Kolonia
13178	13082	\N	Korolówka-Osada
13179	13082	\N	Krasówka
13180	13082	\N	Luta
13181	13082	\N	Okuninka
13182	13082	\N	Orchówek
13183	13082	\N	Połód
13184	13082	\N	Różanka
13185	13082	\N	Sobibór
13186	13082	\N	Stawki
13187	13082	\N	Suszno
13188	13082	\N	Szuminka
13189	13082	\N	Wołczyny
13190	13082	\N	Żłobek Duży
13191	13082	\N	Żłobek Mały
13192	13082	\N	Żuków
13193	13087	\N	Bytyń
13194	13087	\N	Józefów
13195	13087	\N	Kosyń
13196	13087	\N	Macoszyn Duży
13197	13087	\N	Majdan Stuleński
13198	13087	\N	Małoziemce
13199	13087	\N	Mszanka
13200	13087	\N	Mszanna
13201	13087	\N	Mszanna-Kolonia
13202	13087	\N	Nadbużanka
13203	13087	\N	Piaski
13204	13087	\N	Piaski Uhruskie
13205	13087	\N	Potoki
13206	13087	\N	Przymiarki
13207	13087	\N	Siedliszcze
13208	13087	\N	Stanisławów
13209	13087	\N	Stulno
13210	13087	\N	Uhrusk
13211	13087	\N	Wola Uhruska
13212	13087	\N	Zbereże
13213	13088	\N	Adampol
13214	13088	\N	Dobropol
13215	13088	\N	Horostyta
13216	13088	\N	Horostyta-Kolonia
13217	13088	\N	Ignaców
13218	13088	\N	Kaplonosy
13219	13088	\N	Kaplonosy-Kolonia
13220	13088	\N	Krukowo
13221	13088	\N	Krzywowierzba
13222	13088	\N	Lipówka
13223	13088	\N	Lubień
13224	13088	\N	Siedliska
13225	13088	\N	Suchawa
13226	13088	\N	Sytyta
13227	13088	\N	Wyryki
13228	13088	\N	Wyryki-Adampol
13229	13088	\N	Wyryki-Połód
13230	13088	\N	Wyryki-Wola
13231	13088	\N	Zahajki
13232	13088	\N	Zahajki-Kolonia
13233	338	\N	Adamów
13234	338	\N	Grabowiec
13235	338	\N	Komarów-Osada
13236	338	\N	Krasnobród
13237	338	\N	Łabunie
13238	338	\N	Miączyn
13239	338	\N	Nielisz
13240	338	\N	Radecznica
13241	338	\N	Sitno
13242	338	\N	Skierbieszów
13243	338	\N	Stary Zamość
13244	338	\N	Sułów
13245	338	\N	Szczebrzeszyn
13246	338	\N	Zamość
13247	338	\N	Zwierzyniec
13263	13233	\N	Adamów
13264	13233	\N	Bliżów
13265	13233	\N	Bondyrz
13266	13233	\N	Boża Wola
13267	13233	\N	Czarnowoda
13268	13233	\N	Feliksówka
13269	13233	\N	Grabnik
13270	13233	\N	Jacnia
13271	13233	\N	Malinówka
13272	13233	\N	Potoczek
13273	13233	\N	Rachodoszcze
13274	13233	\N	Suchowola
13275	13233	\N	Suchowola-Kolonia
13276	13233	\N	Szewnia Dolna
13277	13233	\N	Szewnia Górna
13278	13233	\N	Trzepieciny
13279	13234	\N	Bereść
13280	13234	\N	Bronisławka
13281	13234	\N	Cieszyn
13282	13234	\N	Czechówka
13283	13234	\N	Dańczypol
13284	13234	\N	Grabowczyk
13285	13234	\N	Grabowiec
13286	13234	\N	Grabowiec-Góra
13287	13234	\N	Henrykówka
13288	13234	\N	Hołużne
13289	13234	\N	Majdan Tuczępski
13290	13234	\N	Ornatowice
13291	13234	\N	Ornatowice-Kolonia
13292	13234	\N	Rogów
13293	13234	\N	Siedlisko
13294	13234	\N	Skibice
13295	13234	\N	Skomorochy Duże
13296	13234	\N	Skomorochy Małe
13297	13234	\N	Szczelatyn
13298	13234	\N	Szystowice
13299	13234	\N	Tuczępy
13300	13234	\N	Wolica Uchańska
13301	13234	\N	Wólka Tuczępska
13302	13234	\N	Żurawlów
13303	13235	\N	Antoniówka
13304	13235	\N	Berestki
13305	13235	\N	Dub
13306	13235	\N	Huta Komarowska
13307	13235	\N	Janówka Wschodnia
13308	13235	\N	Janówka Zachodnia
13309	13235	\N	Kadłubiska
13310	13235	\N	Komarów Dolny
13311	13235	\N	Komarów Górny
13312	13235	\N	Komarów-Osada
13313	13235	\N	Komarów-Wieś
13314	13235	\N	Kraczew
13315	13235	\N	Krzywystok
13316	13235	\N	Krzywystok-Kolonia
13317	13235	\N	Księżostany
13318	13235	\N	Księżostany-Kolonia
13319	13235	\N	Ruszczyzna
13320	13235	\N	Sosnowa-Dębowa
13321	13235	\N	Swaryczów
13322	13235	\N	Śniatycze
13323	13235	\N	Tomaszówka
13324	13235	\N	Tuczapy
13325	13235	\N	Wolica Brzozowa
13326	13235	\N	Wolica Brzozowa-Kolonia
13327	13235	\N	Wolica Śniatycka
13328	13235	\N	Zubowice
13329	13235	\N	Zubowice-Kolonia
13330	13236	\N	Krasnobród
13331	13236	\N	Dominikanówka
13332	13236	\N	Grabnik
13333	13236	\N	Hucisko
13334	13236	\N	Hutki
13335	13236	\N	Hutków
13336	13236	\N	Kaczórki
13337	13236	\N	Majdan Mały
13338	13236	\N	Majdan Wielki
13339	13236	\N	Malewszczyzna
13340	13236	\N	Nowa Wieś
13341	13236	\N	Podklasztor
13342	13236	\N	Potok Senderki
13343	13236	\N	Stara Huta
13344	13236	\N	Szur
13345	13236	\N	Wólka Husińska
13346	13236	\N	Zielone
13347	13237	\N	Barchaczów
13348	13237	\N	Bródek
13349	13237	\N	Dąbrowa
13350	13237	\N	Łabunie
13351	13237	\N	Łabunie-Reforma
13352	13237	\N	Łabuńki Drugie
13353	13237	\N	Łabuńki Pierwsze
13354	13237	\N	Majdan Ruszowski
13355	13237	\N	Mocówka
13356	13237	\N	Ruszów
13357	13237	\N	Ruszów-Kolonia
13358	13237	\N	Wierzbie
13359	13237	\N	Wólka Łabuńska
13360	13238	\N	Czartoria
13361	13238	\N	Frankamionka
13362	13238	\N	Gdeszyn
13363	13238	\N	Gdeszyn-Kolonia
13364	13238	\N	Horyszów
13365	13238	\N	Horyszów-Kolonia
13366	13238	\N	Koniuchy
13367	13238	\N	Koniuchy-Kolonia
13368	13238	\N	Kotlice
13369	13238	\N	Kotlice-Kolonia
13370	13238	\N	Lachmanówka
13371	13238	\N	Miączyn
13372	13238	\N	Miączyn-Kolonia
13373	13238	\N	Ministrówka
13374	13238	\N	Niewirków
13375	13238	\N	Niewirków-Kolonia
13376	13238	\N	Pniaki
13377	13238	\N	Poddąbrowa
13378	13238	\N	Podkotlice
13379	13238	\N	Świdniki
13380	13238	\N	Świdniki-Kolonia
13381	13238	\N	Zaokręgowa
13382	13238	\N	Zawalów
13383	13238	\N	Zawalów-Kolonia
13384	13238	\N	Żuków
13385	13239	\N	Deszkowice-Kolonia
13386	13239	\N	Gruszka Duża
13387	13239	\N	Gruszka Duża-Kolonia
13388	13239	\N	Gruszka Mała Druga
13389	13239	\N	Gruszka Mała Pierwsza
13390	13239	\N	Kolonia Emska
13391	13239	\N	Krzak
13392	13239	\N	Nawóz
13393	13239	\N	Nielisz
13394	13239	\N	Nowiny
13395	13239	\N	Ruskie Piaski
13396	13239	\N	Staw Noakowski
13397	13239	\N	Staw Noakowski-Kolonia
13398	13239	\N	Staw Ujazdowski
13399	13239	\N	Staw Ujazdowski-Kolonia
13400	13239	\N	Średnie Duże
13401	13239	\N	Średnie Małe
13402	13239	\N	Ujazdów
13403	13239	\N	Wólka Nieliska
13404	13239	\N	Wólka Złojecka
13405	13239	\N	Zamszany
13406	13239	\N	Zarudzie
13407	13239	\N	Złojec
13408	13240	\N	Czarnystok
13409	13240	\N	Dzielce
13410	13240	\N	Gaj Gruszczański
13411	13240	\N	Gorajec-Stara Wieś
13412	13240	\N	Gorajec-Zagroble
13413	13240	\N	Gorajec-Zagroble-Kolonia
13414	13240	\N	Gorajec-Zastawie
13415	13240	\N	Gruszka Zaporska
13416	13240	\N	Latyczyn
13417	13240	\N	Mokrelipie
13418	13240	\N	Podborcze
13419	13240	\N	Podlesie Duże
13420	13240	\N	Podlesie Małe
13421	13240	\N	Radecznica
13422	13240	\N	Trzęsiny
13423	13240	\N	Wólka Czarnostocka
13424	13240	\N	Zaburze
13425	13240	\N	Zakłodzie
13426	13240	\N	Zaporze
13427	13241	\N	Boży Dar
13428	13241	\N	Cześniki
13429	13241	\N	Cześniki-Kolonia
13430	13241	\N	Czołki
13431	13241	\N	Horyszów-Nowa Kolonia
13432	13241	\N	Horyszów Polski
13433	13241	\N	Horyszów-Stara Kolonia
13434	13241	\N	Janówka
13435	13241	\N	Jarosławiec
13436	13241	\N	Karp
13437	13241	\N	Kolonia Sitno
13438	13241	\N	Kornelówka
13439	13241	\N	Kornelówka-Kolonia
13440	13241	\N	Rozdoły
13441	13241	\N	Sitno
13442	13241	\N	Stabrów
13443	13241	\N	Stanisławka
13444	13241	\N	Wólka Horyszowska
13445	13242	\N	Dębowiec
13446	13242	\N	Dębowiec-Kolonia
13447	13242	\N	Drewniki
13448	13242	\N	Hajowniki
13449	13242	\N	Huszczka Duża
13450	13242	\N	Huszczka Mała
13451	13242	\N	Iłowiec
13452	13242	\N	Kalinówka
13453	13242	\N	Lipina Nowa
13454	13242	\N	Lipina Stara
13455	13242	\N	Łaziska
13456	13242	\N	Majdan Skierbieszowski
13457	13242	\N	Marcinówka
13458	13242	\N	Osiczyna
13459	13242	\N	Podhuszczka
13460	13242	\N	Podwysokie
13461	13242	\N	Sady
13462	13242	\N	Skierbieszów
13463	13242	\N	Skierbieszów-Kolonia
13464	13242	\N	Sławęcin
13465	13242	\N	Suchodębie
13466	13242	\N	Sulmice
13467	13242	\N	Szorcówka
13468	13242	\N	Wiszenki
13469	13242	\N	Wiszenki-Kolonia
13470	13242	\N	Wysokie Drugie
13471	13242	\N	Wysokie Pierwsze
13472	13242	\N	Zabytów
13473	13242	\N	Zawoda
13474	13242	\N	Zrąb
13475	13243	\N	Borowina
13476	13243	\N	Chomęciska Duże
13477	13243	\N	Chomęciska Małe
13478	13243	\N	Krasne
13479	13243	\N	Majdan Sitaniecki
13480	13243	\N	Nowa Wieś
13481	13243	\N	Pańska Dolina
13482	13243	\N	Podkrasne
13483	13243	\N	Podstary Zamość
13484	13243	\N	Stary Zamość
13485	13243	\N	Udrycze-Kolonia
13486	13243	\N	Udrycze-Koniec
13487	13243	\N	Udrycze-Wola
13488	13243	\N	Wierzba
13489	13243	\N	Wisłowiec
13490	13244	\N	Deszkowice Drugie
13491	13244	\N	Deszkowice Pierwsze
13492	13244	\N	Kawęczyn-Kolonia
13493	13244	\N	Kitów
13494	13244	\N	Kulików
13495	13244	\N	Michalów
13496	13244	\N	Rozłopy
13497	13244	\N	Rozłopy-Kolonia
13498	13244	\N	Sąsiadka
13499	13244	\N	Sułowiec
13500	13244	\N	Sułów
13501	13244	\N	Sułówek
13502	13244	\N	Sułów-Kolonia
13503	13244	\N	Tworyczów
13504	13244	\N	Źrebce
13505	13245	\N	Szczebrzeszyn
13506	13245	\N	Bodaczów
13507	13245	\N	Brody Duże
13508	13245	\N	Brody Małe
13509	13245	\N	Czarny Wygon
13510	13245	\N	Kawęczyn
13511	13245	\N	Kawęczynek
13512	13245	\N	Kąty Drugie
13513	13245	\N	Kąty Pierwsze
13514	13245	\N	Lipowiec-Kolonia
13515	13245	\N	Niedzieliska
13516	13245	\N	Niedzieliska-Kolonia
13517	13245	\N	Wielącza
13518	13245	\N	Wielącza-Kolonia
13519	13245	\N	Wielącza Poduchowna
13520	13245	\N	Wymysłówka
13521	13246	\N	Białobrzegi
13522	13246	\N	Białowola
13523	13246	\N	Borowina Sitaniecka
13524	13246	\N	Bortatycze
13525	13246	\N	Bortatycze-Kolonia
13526	13246	\N	Chyża
13527	13246	\N	Hubale
13528	13246	\N	Jatutów
13529	13246	\N	Kalinowice
13530	13246	\N	Lipsko
13531	13246	\N	Lipsko-Kosobudy
13532	13246	\N	Lipsko-Polesie
13533	13246	\N	Łapiguz
13534	13246	\N	Mokre
13535	13246	\N	Płoskie
13536	13246	\N	Pniówek
13537	13246	\N	Siedliska
13538	13246	\N	Siedliska Kolonia
13539	13246	\N	Sitaniec
13540	13246	\N	Sitaniec-Kolonia
13541	13246	\N	Sitaniec-Wolica
13542	13246	\N	Skokówka
13543	13246	\N	Szopinek
13544	13246	\N	Wieprzec
13545	13246	\N	Wierzchowiny
13546	13246	\N	Wólka Panieńska
13547	13246	\N	Wólka Wieprzecka
13548	13246	\N	Wychody
13549	13246	\N	Wysokie
13550	13246	\N	Zalesie
13551	13246	\N	Zarudzie
13552	13246	\N	Zarzecze
13553	13246	\N	Zawada
13554	13246	\N	Zwódne
13555	13246	\N	Żdanów
13556	13246	\N	Żdanówek
13557	13246	\N	Zamość
13558	13247	\N	Zwierzyniec
13559	13247	\N	Bagno
13560	13247	\N	Bór
13561	13247	\N	Guciów
13562	13247	\N	Horodzisko
13563	13247	\N	Jarugi
13564	13247	\N	Kosobudy
13565	13247	\N	Obrocz
13566	13247	\N	Sekretarzówka
13567	13247	\N	Sochy
13568	13247	\N	Topólcza
13569	13247	\N	Turzyniec
13570	13247	\N	Wywłoczka
13571	13247	\N	Żurawnica
13572	331	\N	M. Biała Podlaska
13573	333	\N	M. Chełm
13574	335	\N	M. Lublin
13575	337	\N	M. Zamość
13576	346	\N	Kostrzyn nad Odrą
13577	346	\N	Bogdaniec
13578	346	\N	Deszczno
13579	346	\N	Kłodawa
13580	346	\N	Lubiszyn
13581	346	\N	Santok
13582	346	\N	Witnica
13583	13576	\N	Kostrzyn nad Odrą
13584	13577	\N	Bogdaniec
13585	13577	\N	Chwałowice
13586	13577	\N	Gostkowice
13587	13577	\N	Jasiniec
13588	13577	\N	Jenin
13589	13577	\N	Jeninek
13590	13577	\N	Jeniniec
13591	13577	\N	Jeże
13592	13577	\N	Jeżyki
13593	13577	\N	Krzyszczyna
13594	13577	\N	Krzyszczynka
13595	13577	\N	Kwiatkowice
13596	13577	\N	Lubczyno
13597	13577	\N	Łupowo
13598	13577	\N	Motylewo
13599	13577	\N	Podjenin
13600	13577	\N	Racław
13601	13577	\N	Roszkowice
13602	13577	\N	Stanowice
13603	13577	\N	Wieprzyce
13604	13577	\N	Włostów
13605	13578	\N	Białobłocie
13606	13578	\N	Bolemin
13607	13578	\N	Borek
13608	13578	\N	Brzozowiec
13609	13578	\N	Ciecierzyce
13610	13578	\N	Deszczno
13611	13578	\N	Dziersławice
13612	13578	\N	Dzierżów
13613	13578	\N	Glinik
13614	13578	\N	Karnin
13615	13578	\N	Kiełpin
13616	13578	\N	Koszęcin
13617	13578	\N	Krasowiec
13618	13578	\N	Łagodzin
13619	13578	\N	Maszewo
13620	13578	\N	Niwica
13621	13578	\N	Orzelec
13622	13578	\N	Osiedle Poznańskie
13623	13578	\N	Płonica
13624	13578	\N	Prądocin
13625	13578	\N	Ulim
13626	13579	\N	Chwalęcice
13627	13579	\N	Kłodawa
13628	13579	\N	Lipy
13629	13579	\N	Łośno
13630	13579	\N	Mironice
13631	13579	\N	Rębowo
13632	13579	\N	Różanki
13633	13579	\N	Rybakowo
13634	13579	\N	Santocko
13635	13579	\N	Santoczno
13636	13579	\N	Smolarki
13637	13579	\N	Wojcieszyce
13638	13579	\N	Zamoksze
13639	13579	\N	Zdroisko
13640	13580	\N	Baczyna
13641	13580	\N	Baczyna-Kolonia
13642	13580	\N	Brzeźno
13643	13580	\N	Buszów
13644	13580	\N	Chłopiny
13645	13580	\N	Dzikowo
13646	13580	\N	Gajewo
13647	13580	\N	Jastrzębiec
13648	13580	\N	Kozin
13649	13580	\N	Kretkowo
13650	13580	\N	Lubiszyn
13651	13580	\N	Lubno
13652	13580	\N	Łąkomin
13653	13580	\N	Marwice
13654	13580	\N	Mystki
13655	13580	\N	Pczelino
13656	13580	\N	Podlesie
13657	13580	\N	Skrobacz
13658	13580	\N	Smoliny
13659	13580	\N	Smółczyn
13660	13580	\N	Staw
13661	13580	\N	Ściechów
13662	13580	\N	Ściechówek
13663	13580	\N	Tarnów
13664	13580	\N	Wysoka
13665	13580	\N	Wysoka-Kolonia
13666	13580	\N	Zacisze
13667	13580	\N	Zapadlisko
13668	13581	\N	Baranowice
13669	13581	\N	Czechów
13670	13581	\N	Górki
13671	13581	\N	Gralewo
13672	13581	\N	Janczewo
13673	13581	\N	Jastrzębnik
13674	13581	\N	Lipki Małe
13675	13581	\N	Lipki Wielkie
13676	13581	\N	Ludzisławice
13677	13581	\N	Mąkoszyce
13678	13581	\N	Nowe Polichno
13679	13581	\N	Płomykowo
13680	13581	\N	Santok
13681	13581	\N	Stare Polichno
13682	13581	\N	Wawrów
13683	13582	\N	Witnica
13684	13582	\N	Białcz
13685	13582	\N	Białczyk
13686	13582	\N	Boguszyniec
13687	13582	\N	Dąbroszyn
13688	13582	\N	Kamień Mały
13689	13582	\N	Kamień Wielki
13690	13582	\N	Kłopotowo
13691	13582	\N	Krześniczka
13692	13582	\N	Mosina
13693	13582	\N	Mościce
13694	13582	\N	Mościczki
13695	13582	\N	Nowe Dzieduszyce
13696	13582	\N	Nowiny Wielkie
13697	13582	\N	Oksza
13698	13582	\N	Pyrzany
13699	13582	\N	Sosny
13700	13582	\N	Stare Dzieduszyce
13701	13582	\N	Świerkocin
13702	13582	\N	Tarnówek
13703	339	\N	Gubin
13704	339	\N	Bobrowice
13705	339	\N	Bytnica
13706	339	\N	Dąbie
13707	339	\N	Krosno Odrzańskie
13708	339	\N	Maszewo
13709	13703	\N	Gubin
13710	13704	\N	Barłogi
13711	13704	\N	Bobrowice
13712	13704	\N	Bronków
13713	13704	\N	Bronkówek
13714	13704	\N	Chojnowo
13715	13704	\N	Chromów
13716	13704	\N	Czeklin
13717	13704	\N	Dachów
13718	13704	\N	Dęby
13719	13704	\N	Dychów
13720	13704	\N	Janiszowice
13721	13704	\N	Kukadło
13722	13704	\N	Lubnica
13723	13704	\N	Młyniec
13724	13704	\N	Przychów
13725	13704	\N	Strużka
13726	13704	\N	Tarnawa Krośnieńska
13727	13704	\N	Wełmice
13728	13704	\N	Żarków
13729	13705	\N	Budachów
13730	13705	\N	Budachów-Kolonia
13731	13705	\N	Bytnica
13732	13705	\N	Dobrosułów
13733	13705	\N	Drzewica
13734	13705	\N	Garbowo
13735	13705	\N	Głęboczek
13736	13705	\N	Głębokie
13737	13705	\N	Grabin
13738	13705	\N	Gryżyna
13739	13705	\N	Kępiny
13740	13705	\N	Łasiczyn
13741	13705	\N	Pliszka
13742	13705	\N	Smolary Bytnickie
13743	13705	\N	Struga
13744	13706	\N	Brzeźnica
13745	13706	\N	Budynia
13746	13706	\N	Ciemnice
13747	13706	\N	Dąbie
13748	13706	\N	Godziejów
13749	13706	\N	Gola
13750	13706	\N	Gronów
13751	13706	\N	Kosierz
13752	13706	\N	Lubiatów
13753	13706	\N	Łagów
13754	13706	\N	Mokry Młyn
13755	13706	\N	Nowy Zagór
13756	13706	\N	Olszewiec
13757	13706	\N	Pław
13758	13706	\N	Połupin
13759	13706	\N	Stary Zagór
13760	13706	\N	Suchy Młyn
13761	13706	\N	Szczawno
13762	13706	\N	Trzebule
13763	13703	\N	Bieżyce
13764	13703	\N	Brzozów
13765	13703	\N	Budoradz
13766	13703	\N	Chęciny
13767	13703	\N	Chlebowo
13768	13703	\N	Chociejów
13769	13703	\N	Czarnowice
13770	13703	\N	Dobre
13771	13703	\N	Dobrzyń
13772	13703	\N	Drzeńsk Mały
13773	13703	\N	Drzeńsk Wielki
13774	13703	\N	Dzikowo
13775	13703	\N	Gębice
13776	13703	\N	Grabczyna
13777	13703	\N	Grabice
13778	13703	\N	Grochów
13779	13703	\N	Gubinek
13780	13703	\N	Jaromirowice
13781	13703	\N	Jazów
13782	13703	\N	Kaniów
13783	13703	\N	Komorów
13784	13703	\N	Koperno
13785	13703	\N	Kosarzyn
13786	13703	\N	Kozów
13787	13703	\N	Kujawa
13788	13703	\N	Luboszyce
13789	13703	\N	Łazy
13790	13703	\N	Łomy
13791	13703	\N	Markosice
13792	13703	\N	Mielno
13793	13703	\N	Nowa Wioska
13794	13703	\N	Pleśno
13795	13703	\N	Polanowice
13796	13703	\N	Pole
13797	13703	\N	Ponik
13798	13703	\N	Późna
13799	13703	\N	Przyborowice
13800	13703	\N	Rybołowy
13801	13703	\N	Sadzarzewice
13802	13703	\N	Sękowice
13803	13703	\N	Sieńsk
13804	13703	\N	Stargard Gubiński
13805	13703	\N	Starosiedle
13806	13703	\N	Strzegów
13807	13703	\N	Wałowice
13808	13703	\N	Węgliny
13809	13703	\N	Wielotów
13810	13703	\N	Witaszkowo
13811	13703	\N	Zawada
13812	13703	\N	Żenichów
13813	13703	\N	Żytowań
13814	13707	\N	Krosno Odrzańskie
13815	13707	\N	Bielów
13816	13707	\N	Brzózka
13817	13707	\N	Chojna
13818	13707	\N	Chyże
13819	13707	\N	Czarnowo
13820	13707	\N	Czetowice
13821	13707	\N	Gostchorze
13822	13707	\N	Kamień
13823	13707	\N	Łochowice
13824	13707	\N	Marcinowice
13825	13707	\N	Nowy Raduszec
13826	13707	\N	Osiecznica
13827	13707	\N	Radnica
13828	13707	\N	Retno
13829	13707	\N	Sarbia
13830	13707	\N	Sarnie Łęgi
13831	13707	\N	Stary Raduszec
13832	13707	\N	Strumienno
13833	13707	\N	Szklarka Radnicka
13834	13707	\N	Wężyska
13835	13708	\N	Bytomiec
13836	13708	\N	Chlebów
13837	13708	\N	Dąbrówka
13838	13708	\N	Gęstowice
13839	13708	\N	Granice
13840	13708	\N	Korczyców
13841	13708	\N	Lubogoszcz
13842	13708	\N	Maszewko
13843	13708	\N	Maszewo
13844	13708	\N	Miłów
13845	13708	\N	Nowosiedle
13846	13708	\N	Połęcko
13847	13708	\N	Radomicko
13848	13708	\N	Rybaki
13849	13708	\N	Rzeczyca
13850	13708	\N	Siedlisko
13851	13708	\N	Skarbona
13852	13708	\N	Skórzyn
13853	13708	\N	Słomianka
13854	13708	\N	Słotwina
13855	13708	\N	Trzebiechów
13856	13708	\N	Wojkowo
13857	13708	\N	Wyczółkowo
13858	340	\N	Bledzew
13859	340	\N	Międzyrzecz
13860	340	\N	Przytoczna
13861	340	\N	Pszczew
13862	340	\N	Skwierzyna
13863	340	\N	Trzciel
13864	13858	\N	Bledzew
13865	13858	\N	Bledzewka
13866	13858	\N	Chycina
13867	13858	\N	Dębowiec
13868	13858	\N	Goruńsko
13869	13858	\N	Katarzynki
13870	13858	\N	Kleszczewo
13871	13858	\N	Krzywokleszcz
13872	13858	\N	Nowa Wieś
13873	13858	\N	Osiecko
13874	13858	\N	Pniewo
13875	13858	\N	Popowo
13876	13858	\N	Sokola Dąbrowa
13877	13858	\N	Stary Dworek
13878	13858	\N	Strużyny
13879	13858	\N	Templewo
13880	13858	\N	Zemsko
13881	13859	\N	Międzyrzecz
13882	13859	\N	Bobowicko
13883	13859	\N	Bukowiec
13884	13859	\N	Czarny Bocian
13885	13859	\N	Głębokie
13886	13859	\N	Gorzyca
13887	13859	\N	Jagielnik
13888	13859	\N	Jeleniegłowy
13889	13859	\N	Kalsko
13890	13859	\N	Kaława
13891	13859	\N	Kaławka
13892	13859	\N	Kęszyca
13893	13859	\N	Kęszyca Leśna
13894	13859	\N	Kuligowo
13895	13859	\N	Kursko
13896	13859	\N	Kuźnik
13897	13859	\N	Kwiecie
13898	13859	\N	Lubosinek
13899	13859	\N	Łęgowskie
13900	13859	\N	Młyn-Smolno
13901	13859	\N	Nietoperek
13902	13859	\N	Pieski
13903	13859	\N	Pniewo
13904	13859	\N	Porąbka
13905	13859	\N	Rojewo
13906	13859	\N	Szumiąca
13907	13859	\N	Święty Wojciech
13908	13859	\N	Wysoka
13909	13859	\N	Wyszanowo
13910	13859	\N	Żółwin
13911	13860	\N	Chełmsko
13912	13860	\N	Dębówko
13913	13860	\N	Dziubielewo
13914	13860	\N	Gaj
13915	13860	\N	Gliszczki
13916	13860	\N	Goraj
13917	13860	\N	Krasne Dłusko
13918	13860	\N	Krobielewo
13919	13860	\N	Lubikowo
13920	13860	\N	Murowiec
13921	13860	\N	Nowa Niedrzwica
13922	13860	\N	Nowiny
13923	13860	\N	Orłowce
13924	13860	\N	Poręba
13925	13860	\N	Przytoczna
13926	13860	\N	Rokitno
13927	13860	\N	Rokitno-Przystanek
13928	13860	\N	Strychy
13929	13860	\N	Stryszewo
13930	13860	\N	Twierdzielewo
13931	13860	\N	Wierzbno
13932	13860	\N	Żabno
13933	13861	\N	Biercza
13934	13861	\N	Borowy Młyn
13935	13861	\N	Brzeźno
13936	13861	\N	Janowo
13937	13861	\N	Nowe Gorzycko
13938	13861	\N	Policko
13939	13861	\N	Pszczew
13940	13861	\N	Rańsko
13941	13861	\N	Silna
13942	13861	\N	Stoki
13943	13861	\N	Stołuń
13944	13861	\N	Szarcz
13945	13861	\N	Świechocin
13946	13861	\N	Zielomyśl
13947	13862	\N	Skwierzyna
13948	13862	\N	Dobrojewo
13949	13862	\N	Gościnowo
13950	13862	\N	Jezierce
13951	13862	\N	Kijewice
13952	13862	\N	Krobielewko
13953	13862	\N	Murzynowo
13954	13862	\N	Murzynowo-Łomno
13955	13862	\N	Nadziejewki
13956	13862	\N	Nowy Dwór
13957	13862	\N	Rakowo
13958	13862	\N	Skrzynica
13959	13862	\N	Świniarki
13960	13862	\N	Świniary
13961	13862	\N	Trzebiszewo
13962	13862	\N	Warcin
13963	13862	\N	Wiejce
13964	13863	\N	Trzciel
13965	13863	\N	Bieleń
13966	13863	\N	Brójce
13967	13863	\N	Chociszewo
13968	13863	\N	Jabłonka
13969	13863	\N	Jasieniec
13970	13863	\N	Lutol Mokry
13971	13863	\N	Lutol Suchy
13972	13863	\N	Łagowiec
13973	13863	\N	Nowy Świat
13974	13863	\N	Panowice
13975	13863	\N	Rybojady
13976	13863	\N	Siercz
13977	13863	\N	Sierczynek
13978	13863	\N	Smolniki
13979	13863	\N	Stary Dwór
13980	13863	\N	Świdwowiec
13981	13863	\N	Żydowo
13982	341	\N	Nowa Sól
13983	341	\N	Bytom Odrzański
13984	341	\N	Kolsko
13985	341	\N	Kożuchów
13986	341	\N	Nowe Miasteczko
13987	341	\N	Otyń
13988	341	\N	Siedlisko
13989	13982	\N	Nowa Sól
13990	13983	\N	Bytom Odrzański
13991	13983	\N	Bodzów
13992	13983	\N	Bonów
13993	13983	\N	Bycz
13994	13983	\N	Drogomil
13995	13983	\N	Kropiwnik
13996	13983	\N	Królikowice
13997	13983	\N	Małaszowice
13998	13983	\N	Popowo
13999	13983	\N	Tarnów Bycki
14000	13983	\N	Wierzbnica
14001	13984	\N	Jesiona
14002	13984	\N	Kolsko
14003	13984	\N	Konotop
14004	13984	\N	Lipka
14005	13984	\N	Mesze
14006	13984	\N	Sławocin
14007	13984	\N	Tatarki
14008	13984	\N	Tyrszeliny
14009	13984	\N	Uście
14010	13985	\N	Kożuchów
14011	13985	\N	Bielice
14012	13985	\N	Broniszów
14013	13985	\N	Bulin
14014	13985	\N	Cisów
14015	13985	\N	Czciradz
14016	13985	\N	Drwalewice
14017	13985	\N	Dziadoszyce
14018	13985	\N	Książ Śląski
14019	13985	\N	Lasocin
14020	13985	\N	Mirocin Dolny
14021	13985	\N	Mirocin Górny
14022	13985	\N	Mirocin Średni
14023	13985	\N	Podbrzezie Dolne
14024	13985	\N	Podbrzezie Górne
14025	13985	\N	Radwanów
14026	13985	\N	Słocina
14027	13985	\N	Sokołów
14028	13985	\N	Solniki
14029	13985	\N	Studzieniec
14030	13985	\N	Stypułów
14031	13985	\N	Zawada
14032	13982	\N	Buczków
14033	13982	\N	Chełmek
14034	13982	\N	Ciepielów
14035	13982	\N	Dąbrowno
14036	13982	\N	Jeziorna
14037	13982	\N	Jodłów
14038	13982	\N	Kiełcz
14039	13982	\N	Lelechów
14040	13982	\N	Lipiny
14041	13982	\N	Lubieszów
14042	13982	\N	Lubięcin
14043	13982	\N	Nowe Żabno
14044	13982	\N	Odra
14045	13982	\N	Porębów
14046	13982	\N	Przyborów
14047	13982	\N	Rudno
14048	13982	\N	Stany
14049	13982	\N	Stara Wieś
14050	13982	\N	Stary Staw
14051	13982	\N	Wrociszów
14052	13986	\N	Nowe Miasteczko
14053	13986	\N	Borów Polski
14054	13986	\N	Borów Wielki
14055	13986	\N	Gołaszyn
14056	13986	\N	Konin
14057	13986	\N	Miłaków
14058	13986	\N	Nieciecz
14059	13986	\N	Popęszyce
14060	13986	\N	Rejów
14061	13986	\N	Szyba
14062	13986	\N	Żuków
14063	13987	\N	Bobrowniki
14064	13987	\N	Borki
14065	13987	\N	Czasław
14066	13987	\N	Konradowo
14067	13987	\N	Ługi
14068	13987	\N	Modrzyca
14069	13987	\N	Niedoradz
14070	13987	\N	Otyń
14071	13987	\N	Zakęcie
14072	13988	\N	Bielawy
14073	13988	\N	Borowiec
14074	13988	\N	Dębianka
14075	13988	\N	Kierzno
14076	13988	\N	Piękne Kąty
14077	13988	\N	Radocin
14078	13988	\N	Różanówka
14079	13988	\N	Siedlisko
14080	13988	\N	Tarnowskie Młyny
14081	13988	\N	Zwierzyniec
14082	344	\N	Cybinka
14083	344	\N	Górzyca
14084	344	\N	Ośno Lubuskie
14085	344	\N	Rzepin
14086	344	\N	Słubice
14087	14082	\N	Cybinka
14088	14082	\N	Białków
14089	14082	\N	Bieganów
14090	14082	\N	Drzeniów
14091	14082	\N	Grzmiąca
14092	14082	\N	Kłopot
14093	14082	\N	Koziczyn
14094	14082	\N	Krzesin
14095	14082	\N	Maczków
14096	14082	\N	Mielesznica
14097	14082	\N	Radzików
14098	14082	\N	Radzikówek
14099	14082	\N	Rąpice
14100	14082	\N	Rybojedzko
14101	14082	\N	Sądów
14102	14082	\N	Tawęcin
14103	14082	\N	Urad
14104	14083	\N	Chyrzyno
14105	14083	\N	Czarnów
14106	14083	\N	Górzyca
14107	14083	\N	Laski Lubuskie
14108	14083	\N	Ługi Górzyckie
14109	14083	\N	Owczary
14110	14083	\N	Pamięcin
14111	14083	\N	Radówek
14112	14083	\N	Spudłów
14113	14083	\N	Stańsk
14114	14083	\N	Żabczyn
14115	14083	\N	Żabice
14116	14084	\N	Ośno Lubuskie
14117	14084	\N	Grabno
14118	14084	\N	Gronów
14119	14084	\N	Jamno
14120	14084	\N	Kochań
14121	14084	\N	Lipienica
14122	14084	\N	Lubień
14123	14084	\N	Podośno
14124	14084	\N	Połęcko
14125	14084	\N	Radachów
14126	14084	\N	Rosławice
14127	14084	\N	Sienno
14128	14084	\N	Smogóry
14129	14084	\N	Świniary
14130	14084	\N	Trześniów
14131	14084	\N	Wysokie Dęby
14132	14085	\N	Rzepin
14133	14085	\N	Drzeńsko
14134	14085	\N	Gajec
14135	14085	\N	Ilanka
14136	14085	\N	Jerzmanice
14137	14085	\N	Kowalów
14138	14085	\N	Lubiechnia Mała
14139	14085	\N	Lubiechnia Wielka
14140	14085	\N	Maniszewo
14141	14085	\N	Nowy Młyn
14142	14085	\N	Radów
14143	14085	\N	Rzepinek
14144	14085	\N	Serbów
14145	14085	\N	Starków
14146	14085	\N	Starościn
14147	14085	\N	Sułów
14148	14085	\N	Zielony Bór
14149	14086	\N	Słubice
14150	14086	\N	Drzecin
14151	14086	\N	Golice
14152	14086	\N	Kunice
14153	14086	\N	Kunowice
14154	14086	\N	Kunowiczki
14155	14086	\N	Lisów
14156	14086	\N	Nowe Biskupice
14157	14086	\N	Nowy Lubusz
14158	14086	\N	Pławidło
14159	14086	\N	Rybocice
14160	14086	\N	Stare Biskupice
14161	14086	\N	Sułówek
14162	14086	\N	Świecko
14163	342	\N	Dobiegniew
14164	342	\N	Drezdenko
14165	342	\N	Stare Kurowo
14166	342	\N	Strzelce Krajeńskie
14167	342	\N	Zwierzyn
14168	14163	\N	Dobiegniew
14169	14163	\N	Chomętowo
14170	14163	\N	Chrapów
14171	14163	\N	Czarnolesie
14172	14163	\N	Derkacze
14173	14163	\N	Dębnik
14174	14163	\N	Dębogóra
14175	14163	\N	Głusko
14176	14163	\N	Grabionka
14177	14163	\N	Grąsy
14178	14163	\N	Grzmikoło
14179	14163	\N	Jarychowo
14180	14163	\N	Kamienna Knieja
14181	14163	\N	Kępa Zagajna
14182	14163	\N	Kowalec
14183	14163	\N	Kubczyce
14184	14163	\N	Lipinka
14185	14163	\N	Lubiewko
14186	14163	\N	Łęczyn
14187	14163	\N	Ługi
14188	14163	\N	Ługowo
14189	14163	\N	Mierzęcin
14190	14163	\N	Młodolino
14191	14163	\N	Moczele
14192	14163	\N	Mostniki
14193	14163	\N	Niemienica
14194	14163	\N	Niwy
14195	14163	\N	Nowy Młyn
14196	14163	\N	Osieczek
14197	14163	\N	Osiek
14198	14163	\N	Osowiec
14199	14163	\N	Ostrowiec
14200	14163	\N	Ostrowite
14201	14163	\N	Podlesiec
14202	14163	\N	Podszkle
14203	14163	\N	Pokręt
14204	14163	\N	Radachowo
14205	14163	\N	Radęcin
14206	14163	\N	Rolewice
14207	14163	\N	Rozkochowo
14208	14163	\N	Sarbinowo
14209	14163	\N	Sitnica
14210	14163	\N	Sławica
14211	14163	\N	Słonów
14212	14163	\N	Słonówek
14213	14163	\N	Słowin
14214	14163	\N	Starczewo
14215	14163	\N	Stare Osieczno
14216	14163	\N	Suchów
14217	14163	\N	Świnki
14218	14163	\N	Urszulanka
14219	14163	\N	Wilczy Dół
14220	14163	\N	Wołogoszcz
14221	14163	\N	Żeleźnica
14222	14164	\N	Drezdenko
14223	14164	\N	Bagniewo
14224	14164	\N	Baszki
14225	14164	\N	Białacz
14226	14164	\N	Chojna
14227	14164	\N	Chwalenice
14228	14164	\N	Czartowo
14229	14164	\N	Drawiny
14230	14164	\N	Duraczewo
14231	14164	\N	Dziuplina
14232	14164	\N	Gajewice
14233	14164	\N	Goszczanowiec
14234	14164	\N	Goszczanowo
14235	14164	\N	Goszczanówko
14236	14164	\N	Gościm
14237	14164	\N	Gościmski Młyn
14238	14164	\N	Górzyska
14239	14164	\N	Grotów
14240	14164	\N	Grudzieniec
14241	14164	\N	Jelenia Głowa
14242	14164	\N	Karwin
14243	14164	\N	Kijów
14244	14164	\N	Klesno
14245	14164	\N	Kosin
14246	14164	\N	Kosinek
14247	14164	\N	Krzęcinek
14248	14164	\N	Lipno
14249	14164	\N	Lubiatów
14250	14164	\N	Lubiatówka
14251	14164	\N	Lubiewo
14252	14164	\N	Marzenin
14253	14164	\N	Modropole
14254	14164	\N	Niegosław
14255	14164	\N	Nowe Krzywki
14256	14164	\N	Osów
14257	14164	\N	Pątczyce
14258	14164	\N	Przeborowo
14259	14164	\N	Rąpin
14260	14164	\N	Stare Bielice
14261	14164	\N	Stare Krzywki
14262	14164	\N	Trzebicz
14263	14164	\N	Trzebicz-Młyn
14264	14164	\N	Trzebicz Nowy
14265	14164	\N	Tuczępy
14266	14164	\N	Zadzianek
14267	14164	\N	Zagórze
14268	14164	\N	Zawada
14269	14164	\N	Zielątkowo
14270	14164	\N	Żarek
14271	14165	\N	Błotnica
14272	14165	\N	Głęboczek
14273	14165	\N	Gromadzin
14274	14165	\N	Kawki
14275	14165	\N	Łącznica
14276	14165	\N	Łęgowo
14277	14165	\N	Międzybłocie
14278	14165	\N	Nowe Kurowo
14279	14165	\N	Pławin
14280	14165	\N	Przynotecko
14281	14165	\N	Rokitno
14282	14165	\N	Smolarz
14283	14165	\N	Stare Kurowo
14284	14166	\N	Strzelce Krajeńskie
14285	14166	\N	Bobrówko
14286	14166	\N	Bronowice
14287	14166	\N	Brzoza
14288	14166	\N	Buszewko
14289	14166	\N	Buszów
14290	14166	\N	Czyżewo
14291	14166	\N	Danków
14292	14166	\N	Długie
14293	14166	\N	Gardzko
14294	14166	\N	Gilów
14295	14166	\N	Golczewice
14296	14166	\N	Licheń
14297	14166	\N	Lipie Góry
14298	14166	\N	Lubicz
14299	14166	\N	Machary
14300	14166	\N	Ogardy
14301	14166	\N	Ogardzki Młyn
14302	14166	\N	Piastowo
14303	14166	\N	Pielice
14304	14166	\N	Pieńkowice
14305	14166	\N	Przyłęg
14306	14166	\N	Puszczykowo
14307	14166	\N	Sidłów
14308	14166	\N	Sławno
14309	14166	\N	Sokólsko
14310	14166	\N	Strzelce Klasztorne
14311	14166	\N	Śródlesie
14312	14166	\N	Tuczenko
14313	14166	\N	Tuczno
14314	14166	\N	Wełmin
14315	14166	\N	Wielisławice
14316	14166	\N	Wilanów
14317	14166	\N	Żabicko
14318	14167	\N	Błotno
14319	14167	\N	Brzezinka
14320	14167	\N	Gościmiec
14321	14167	\N	Górczyna
14322	14167	\N	Górecko
14323	14167	\N	Górki Noteckie
14324	14167	\N	Owczarki
14325	14167	\N	Przysieka
14326	14167	\N	Rzekcin
14327	14167	\N	Sarbiewo
14328	14167	\N	Sierosławice
14329	14167	\N	Zagaje
14330	14167	\N	Zwierzyn
14331	14167	\N	Żółwin
14332	343	\N	Krzeszyce
14333	343	\N	Lubniewice
14334	343	\N	Słońsk
14335	343	\N	Sulęcin
14336	343	\N	Torzym
14337	14332	\N	Altona
14338	14332	\N	Brzozowa
14339	14332	\N	Czartów
14340	14332	\N	Dębokierz
14341	14332	\N	Dzierzążna
14342	14332	\N	Karkoszów
14343	14332	\N	Kołczyn
14344	14332	\N	Krasnołęg
14345	14332	\N	Krępiny
14346	14332	\N	Krzemów
14347	14332	\N	Krzeszyce
14348	14332	\N	Łąków
14349	14332	\N	Łukomin
14350	14332	\N	Malta
14351	14332	\N	Marianki
14352	14332	\N	Maszków
14353	14332	\N	Muszkowo
14354	14332	\N	Piskorzno
14355	14332	\N	Przemysław
14356	14332	\N	Rudna
14357	14332	\N	Rudnica
14358	14332	\N	Studzionka
14359	14332	\N	Świętojańsko
14360	14332	\N	Zaszczytowo
14361	14333	\N	Lubniewice
14362	14333	\N	Glisno
14363	14333	\N	Jarnatów
14364	14333	\N	Osieczyce
14365	14333	\N	Rogi
14366	14333	\N	Rybakówko
14367	14333	\N	Sobieraj
14368	14333	\N	Zofiówka
14369	14334	\N	Budzigniew
14370	14334	\N	Chartów
14371	14334	\N	Czaplin
14372	14334	\N	Głuchowo
14373	14334	\N	Głuchowo-Kolonia
14374	14334	\N	Grodzisk
14375	14334	\N	Jamno
14376	14334	\N	Lemierzyce
14377	14334	\N	Lubomierzycko
14378	14334	\N	Ownice
14379	14334	\N	Polne
14380	14334	\N	Przyborów
14381	14334	\N	Słońsk
14382	14335	\N	Sulęcin
14383	14335	\N	Brzeźno
14384	14335	\N	Długoszyn
14385	14335	\N	Długoszynek
14386	14335	\N	Długoszyn-Kolonia
14387	14335	\N	Drogomin
14388	14335	\N	Glisno
14389	14335	\N	Grochowo
14390	14335	\N	Grzeszów
14391	14335	\N	Małuszów
14392	14335	\N	Miechów
14393	14335	\N	Ostrów
14394	14335	\N	Pamiątkowice
14395	14335	\N	Podbiele
14396	14335	\N	Rychlik
14397	14335	\N	Trzebów
14398	14335	\N	Trzemeszno Lubuskie
14399	14335	\N	Tursk
14400	14335	\N	Wędrzyn
14401	14335	\N	Wielowieś
14402	14335	\N	Żarzyn
14403	14335	\N	Żubrów
14404	14336	\N	Torzym
14405	14336	\N	Bargów
14406	14336	\N	Bielice
14407	14336	\N	Bobrówko
14408	14336	\N	Boczów
14409	14336	\N	Debrznica
14410	14336	\N	Drzewce
14411	14336	\N	Garbicz
14412	14336	\N	Gądków Mały
14413	14336	\N	Gądków Wielki
14414	14336	\N	Góry
14415	14336	\N	Grabów
14416	14336	\N	Jelenie Pole
14417	14336	\N	Koryta
14418	14336	\N	Kownaty
14419	14336	\N	Lubin
14420	14336	\N	Lubów
14421	14336	\N	Mierczany
14422	14336	\N	Pniów
14423	14336	\N	Prześlice
14424	14336	\N	Rojek
14425	14336	\N	Rożnówka
14426	14336	\N	Tarnawa Rzepińska
14427	14336	\N	Walewice
14428	14336	\N	Wystok
14429	349	\N	Lubrza
14430	349	\N	Łagów
14431	349	\N	Skąpe
14432	349	\N	Szczaniec
14433	349	\N	Świebodzin
14434	349	\N	Zbąszynek
14435	14429	\N	Boryszyn
14436	14429	\N	Boryszynek
14437	14429	\N	Bucze
14438	14429	\N	Buczyna
14439	14429	\N	Dolisko
14440	14429	\N	Janisławiec
14441	14429	\N	Lubrza
14442	14429	\N	Łaski
14443	14429	\N	Mostki
14444	14429	\N	Mrówczyn
14445	14429	\N	Nowa Wioska
14446	14429	\N	Pobrzeże
14447	14429	\N	Przełazy
14448	14429	\N	Staropole
14449	14429	\N	Tyczyno
14450	14429	\N	Zagaje
14451	14429	\N	Zagórze
14452	14430	\N	Brzezinki
14453	14430	\N	Czartów
14454	14430	\N	Czyste
14455	14430	\N	Gronów
14456	14430	\N	Gronów-Winiarnia
14457	14430	\N	Jemiołów
14458	14430	\N	Kłodnica
14459	14430	\N	Kosobudz
14460	14430	\N	Łagów
14461	14430	\N	Łagówek
14462	14430	\N	Niedźwiedź
14463	14430	\N	Pasałka
14464	14430	\N	Poźrzadło
14465	14430	\N	Sieniawa
14466	14430	\N	Sieniawa-Kopalnia
14467	14430	\N	Stok
14468	14430	\N	Toporów
14469	14430	\N	Wielopole
14470	14430	\N	Zabiele
14471	14430	\N	Zamęt
14472	14430	\N	Żelechów
14473	14431	\N	Błonie
14474	14431	\N	Cibórz
14475	14431	\N	Cząbry
14476	14431	\N	Darnawa
14477	14431	\N	Kalinowo
14478	14431	\N	Kaliszkowice
14479	14431	\N	Łąkie
14480	14431	\N	Międzylesie
14481	14431	\N	Niekarzyn
14482	14431	\N	Niesulice
14483	14431	\N	Ołobok
14484	14431	\N	Pałck
14485	14431	\N	Podła Góra
14486	14431	\N	Przetocznica
14487	14431	\N	Przetocznicki Młyn
14488	14431	\N	Radoszyn
14489	14431	\N	Rokitnica
14490	14431	\N	Skąpe
14491	14431	\N	Węgrzynice
14492	14431	\N	Zawisze
14493	14432	\N	Brudzewo
14494	14432	\N	Dąbrówka Mała
14495	14432	\N	Kiełcze
14496	14432	\N	Koźminek
14497	14432	\N	Myszęcin
14498	14432	\N	Nowe Karcze
14499	14432	\N	Ojerzyce
14500	14432	\N	Opalewo
14501	14432	\N	Smardzewo
14502	14432	\N	Szczaniec
14503	14432	\N	Wilenko
14504	14432	\N	Wolimirzyce
14505	14433	\N	Świebodzin
14506	14433	\N	Borów
14507	14433	\N	Chociule
14508	14433	\N	Glińsk
14509	14433	\N	Gościkowo
14510	14433	\N	Grodziszcze
14511	14433	\N	Jeziory
14512	14433	\N	Jordanowo
14513	14433	\N	Kępsko
14514	14433	\N	Krzemionka
14515	14433	\N	Kupienino
14516	14433	\N	Leniwka
14517	14433	\N	Lubinicko
14518	14433	\N	Lubogóra
14519	14433	\N	Ługów
14520	14433	\N	Miłkowo
14521	14433	\N	Niedźwiady
14522	14433	\N	Nowy Dworek
14523	14433	\N	Podjezierze
14524	14433	\N	Raków
14525	14433	\N	Rosin
14526	14433	\N	Rozłogi
14527	14433	\N	Rudgerzowice
14528	14433	\N	Rusinów
14529	14433	\N	Rzeczyca
14530	14433	\N	Wilkowo
14531	14433	\N	Witosław
14532	14433	\N	Wityń
14533	14433	\N	Wygon
14534	14434	\N	Zbąszynek
14535	14434	\N	Bronikowo
14536	14434	\N	Chlastawa
14537	14434	\N	Dąbrówka Wielkopolska
14538	14434	\N	Kosieczyn
14539	14434	\N	Kręcko
14540	14434	\N	Rogoziniec
14541	348	\N	Babimost
14542	348	\N	Bojadła
14543	348	\N	Czerwieńsk
14544	348	\N	Kargowa
14545	348	\N	Nowogród Bobrzański
14546	348	\N	Sulechów
14547	348	\N	Świdnica
14548	348	\N	Trzebiechów
14549	348	\N	Zabór
14550	348	\N	Zielona Góra
14551	14541	\N	Babimost
14552	14541	\N	Janowiec
14553	14541	\N	Kolesin
14554	14541	\N	Laski
14555	14541	\N	Nowe Kramsko
14556	14541	\N	Podmokle Małe
14557	14541	\N	Podmokle Wielkie
14558	14541	\N	Stare Kramsko
14559	14542	\N	Bełcze
14560	14542	\N	Bojadła
14561	14542	\N	Kartno
14562	14542	\N	Klenica
14563	14542	\N	Kliniczki
14564	14542	\N	Młynkowo
14565	14542	\N	Pólko
14566	14542	\N	Przewóz
14567	14542	\N	Pyrnik
14568	14542	\N	Siadcza
14569	14542	\N	Sosnówka
14570	14542	\N	Susłów
14571	14542	\N	Wirówek
14572	14543	\N	Czerwieńsk
14573	14543	\N	Będów
14574	14543	\N	Boryń
14575	14543	\N	Bródki
14576	14543	\N	Dobrzęcin
14577	14543	\N	Laski
14578	14543	\N	Leśniów Mały
14579	14543	\N	Leśniów Wielki
14580	14543	\N	Nietkowice
14581	14543	\N	Nietków
14582	14543	\N	Piaśnica
14583	14543	\N	Płoty
14584	14543	\N	Sudoł
14585	14543	\N	Sycowice
14586	14543	\N	Wysokie
14587	14543	\N	Wyszyna
14588	14543	\N	Zagórze
14589	14544	\N	Kargowa
14590	14544	\N	Chwalim
14591	14544	\N	Dąbrówka
14592	14544	\N	Kaliska
14593	14544	\N	Karszyn
14594	14544	\N	Nowy Jaromierz
14595	14544	\N	Obra Dolna
14596	14544	\N	Przeszkoda
14597	14544	\N	Smolno Małe
14598	14544	\N	Smolno Wielkie
14599	14544	\N	Stary Jaromierz
14600	14544	\N	Szarki
14601	14544	\N	Wojnowo
14602	14545	\N	Nowogród Bobrzański
14603	14545	\N	Białowice
14604	14545	\N	Bogaczów
14605	14545	\N	Cieszów
14606	14545	\N	Dobroszów Mały
14607	14545	\N	Dobroszów Wielki
14608	14545	\N	Drągowina
14609	14545	\N	Kaczenice
14610	14545	\N	Kamionka
14611	14545	\N	Klępina
14612	14545	\N	Kotowice
14613	14545	\N	Krzywa
14614	14545	\N	Krzywaniec
14615	14545	\N	Łagoda
14616	14545	\N	Niwiska
14617	14545	\N	Pielice
14618	14545	\N	Pierzwin
14619	14545	\N	Podgórzyce
14620	14545	\N	Przybymierz
14621	14545	\N	Skibice
14622	14545	\N	Sobolice
14623	14545	\N	Sterków
14624	14545	\N	Urzuty
14625	14545	\N	Wysoka
14626	14546	\N	Sulechów
14627	14546	\N	Brody
14628	14546	\N	Brzezie k. Pomorska
14629	14546	\N	Brzezie k. Sulechowa
14630	14546	\N	Buków
14631	14546	\N	Cigacice
14632	14546	\N	Głogusz
14633	14546	\N	Górki Małe
14634	14546	\N	Górzykowo
14635	14546	\N	Kalsk
14636	14546	\N	Karczyn
14637	14546	\N	Kije
14638	14546	\N	Klępsk
14639	14546	\N	Krężoły
14640	14546	\N	Kruszyna
14641	14546	\N	Leśna Góra
14642	14546	\N	Łęgowo
14643	14546	\N	Mozów
14644	14546	\N	Nowy Świat
14645	14546	\N	Obłotne
14646	14546	\N	Okunin
14647	14546	\N	Pomorsko
14648	14547	\N	Buchałów
14649	14547	\N	Dobra
14650	14547	\N	Drzonów
14651	14547	\N	Grabowiec
14652	14547	\N	Koźla
14653	14547	\N	Letnica
14654	14547	\N	Lipno
14655	14547	\N	Piaski
14656	14547	\N	Radomia
14657	14547	\N	Rybno
14658	14547	\N	Słone
14659	14547	\N	Świdnica
14660	14547	\N	Wilkanowo
14661	14547	\N	Wirówek
14662	14548	\N	Borek
14663	14548	\N	Gębice
14664	14548	\N	Głęboka
14665	14548	\N	Głuchów
14666	14548	\N	Ledno
14667	14548	\N	Mieszkowo
14668	14548	\N	Ostrzyce
14669	14548	\N	Podlegórz
14670	14548	\N	Radowice
14671	14548	\N	Swarzynice
14672	14548	\N	Trzebiechów
14673	14549	\N	Czarna
14674	14549	\N	Dąbrowa
14675	14549	\N	Droszków
14676	14549	\N	Łaz
14677	14549	\N	Mielno
14678	14549	\N	Milsko
14679	14549	\N	Proczki
14680	14549	\N	Przytok
14681	14549	\N	Tarnawa
14682	14549	\N	Wielobłota
14683	14549	\N	Zabór
14684	14550	\N	Barcikowice
14685	14550	\N	Drzonków
14686	14550	\N	Jany
14687	14550	\N	Jarogniewice
14688	14550	\N	Jeleniów
14689	14550	\N	Kiełpin
14690	14550	\N	Krępa
14691	14550	\N	Krępa Mała
14692	14550	\N	Łężyca
14693	14550	\N	Ługowo
14694	14550	\N	Marzęcin
14695	14550	\N	Nowy Kisielin
14696	14550	\N	Ochla
14697	14550	\N	Przydroże
14698	14550	\N	Przylep
14699	14550	\N	Racula
14700	14550	\N	Stary Kisielin
14701	14550	\N	Sucha
14702	14550	\N	Zatonie
14703	14550	\N	Zawada
14704	14550	\N	Zielona Góra
14705	350	\N	Gozdnica
14706	350	\N	Żagań
14707	350	\N	Brzeźnica
14708	350	\N	Iłowa
14709	350	\N	Małomice
14710	350	\N	Niegosławice
14711	350	\N	Szprotawa
14712	350	\N	Wymiarki
14713	14705	\N	Gozdnica
14714	14706	\N	Żagań
14715	14707	\N	Brzeźnica
14716	14707	\N	Chotków
14717	14707	\N	Jabłonów
14718	14707	\N	Karczówka
14719	14707	\N	Marcinów
14720	14707	\N	Przylaski
14721	14707	\N	Stanów
14722	14707	\N	Wichów
14723	14707	\N	Wrzesiny
14724	14708	\N	Iłowa
14725	14708	\N	Borowe
14726	14708	\N	Czerna
14727	14708	\N	Czyżówek
14728	14708	\N	Jankowa Żagańska
14729	14708	\N	Klików
14730	14708	\N	Konin Żagański
14731	14708	\N	Kowalice
14732	14708	\N	Szczepanów
14733	14708	\N	Wilkowisko
14734	14708	\N	Żaganiec
14735	14709	\N	Małomice
14736	14709	\N	Bobrzany
14737	14709	\N	Chichy
14738	14709	\N	Janowiec
14739	14709	\N	Lubiechów
14740	14709	\N	Śliwnik
14741	14709	\N	Żelisław
14742	14710	\N	Bukowica
14743	14710	\N	Gościeszowice
14744	14710	\N	Krzywczyce
14745	14710	\N	Mycielin
14746	14710	\N	Niegosławice
14747	14710	\N	Nowa Jabłona
14748	14710	\N	Przecław
14749	14710	\N	Rudziny
14750	14710	\N	Stara Jabłona
14751	14710	\N	Sucha Dolna
14752	14710	\N	Zimna Brzeźnica
14753	14711	\N	Szprotawa
14754	14711	\N	Biernatów
14755	14711	\N	Bobrowice
14756	14711	\N	Borowina
14757	14711	\N	Buczek
14758	14711	\N	Cieciszów
14759	14711	\N	Długie
14760	14711	\N	Dziećmiarowice
14761	14711	\N	Dzikowice
14762	14711	\N	Henryków
14763	14711	\N	Kartowice
14764	14711	\N	Leszno Dolne
14765	14711	\N	Leszno Górne
14766	14711	\N	Nowa Kopernia
14767	14711	\N	Pasterzowice
14768	14711	\N	Siecieborzyce
14769	14711	\N	Sieraków
14770	14711	\N	Wiechlice
14771	14711	\N	Witków
14772	14712	\N	Lubartów
14773	14712	\N	Lubieszów
14774	14712	\N	Lutynka
14775	14712	\N	Silno Małe
14776	14712	\N	Witoszyn
14777	14712	\N	Wymiarki
14778	14706	\N	Bożnów
14779	14706	\N	Bukowina Bobrzańska
14780	14706	\N	Chrobrów
14781	14706	\N	Dobre nad Kwisą
14782	14706	\N	Dzietrzychowice
14783	14706	\N	Gorzupia
14784	14706	\N	Gorzupia Dolna
14785	14706	\N	Gryżyce
14786	14706	\N	Jelenin
14787	14706	\N	Kocin
14788	14706	\N	Łozy
14789	14706	\N	Marysin
14790	14706	\N	Miodnica
14791	14706	\N	Pożarów
14792	14706	\N	Pruszków
14793	14706	\N	Rudawica
14794	14706	\N	Stara Kopernia
14795	14706	\N	Stary Żagań
14796	14706	\N	Tomaszowo
14797	14706	\N	Trzebów
14798	351	\N	Łęknica
14799	351	\N	Żary
14800	351	\N	Brody
14801	351	\N	Jasień
14802	351	\N	Lipinki Łużyckie
14803	351	\N	Lubsko
14804	351	\N	Przewóz
14805	351	\N	Trzebiel
14806	351	\N	Tuplice
14807	14798	\N	Łęknica
14808	14799	\N	Żary
14809	14800	\N	Biecz
14810	14800	\N	Brody
14811	14800	\N	Brożek
14812	14800	\N	Datyń
14813	14800	\N	Grodziszcze
14814	14800	\N	Jałowice
14815	14800	\N	Janiszowice
14816	14800	\N	Jasienica
14817	14800	\N	Jeziory Dolne
14818	14800	\N	Jeziory Wysokie
14819	14800	\N	Koło
14820	14800	\N	Kumiałtowice
14821	14800	\N	Marianka
14822	14800	\N	Nabłoto
14823	14800	\N	Proszów
14824	14800	\N	Suchodół
14825	14800	\N	Wierzchno
14826	14800	\N	Zasieki
14827	14800	\N	Żytni Młyn
14828	14801	\N	Jasień
14829	14801	\N	Bieszków
14830	14801	\N	Bronice
14831	14801	\N	Budziechów
14832	14801	\N	Golin
14833	14801	\N	Guzów
14834	14801	\N	Jabłoniec
14835	14801	\N	Jaryszów
14836	14801	\N	Jasionna
14837	14801	\N	Jurzyn
14838	14801	\N	Lipsk Żarski
14839	14801	\N	Lisia Góra
14840	14801	\N	Mirkowice
14841	14801	\N	Roztoki
14842	14801	\N	Świbna
14843	14801	\N	Wicina
14844	14801	\N	Zabłocie
14845	14801	\N	Zieleniec
14846	14802	\N	Boruszyn
14847	14802	\N	Brzostowa
14848	14802	\N	Cisowa
14849	14802	\N	Górka
14850	14802	\N	Grotów
14851	14802	\N	Lipinki Łużyckie
14852	14802	\N	Pietrzyków
14853	14802	\N	Piotrowice
14854	14802	\N	Sieciejów
14855	14802	\N	Suchleb
14856	14802	\N	Tyliczki
14857	14802	\N	Zajączek
14858	14803	\N	Lubsko
14859	14803	\N	Białków
14860	14803	\N	Chełm Żarski
14861	14803	\N	Chocicz
14862	14803	\N	Chocimek
14863	14803	\N	Dąbrowa
14864	14803	\N	Dłużek
14865	14803	\N	Gareja
14866	14803	\N	Górzyn
14867	14803	\N	Grabków
14868	14803	\N	Kałek
14869	14803	\N	Lutol
14870	14803	\N	Mierków
14871	14803	\N	Mokra
14872	14803	\N	Osiek
14873	14803	\N	Raszyn
14874	14803	\N	Stara Woda
14875	14803	\N	Tarnów
14876	14803	\N	Tuchola Żarska
14877	14803	\N	Tymienice
14878	14803	\N	Ziębikowo
14879	14804	\N	Bucze
14880	14804	\N	Dąbrowa Łużycka
14881	14804	\N	Dobrochów
14882	14804	\N	Dobrzyń
14883	14804	\N	Jamno
14884	14804	\N	Lipna
14885	14804	\N	Mała Lipna
14886	14804	\N	Mielno
14887	14804	\N	Piotrów
14888	14804	\N	Potok
14889	14804	\N	Przewóz
14890	14804	\N	Sanice
14891	14804	\N	Sobolice
14892	14804	\N	Straszów
14893	14804	\N	Włochów
14894	14805	\N	Bogaczów
14895	14805	\N	Bronowice
14896	14805	\N	Buczyny
14897	14805	\N	Chudzowice
14898	14805	\N	Chwaliszowice
14899	14805	\N	Czaple
14900	14805	\N	Dębinka
14901	14805	\N	Gniewoszyce
14902	14805	\N	Jasionów
14903	14805	\N	Jędrzychowice
14904	14805	\N	Jędrzychowiczki
14905	14805	\N	Kałki
14906	14805	\N	Kamienica nad Nysą Łużycką
14907	14805	\N	Karsówka
14908	14805	\N	Królów
14909	14805	\N	Łuków
14910	14805	\N	Marcinów
14911	14805	\N	Mieszków
14912	14805	\N	Niwica
14913	14805	\N	Nowe Czaple
14914	14805	\N	Olszyna
14915	14805	\N	Przewoźniki
14916	14805	\N	Pustków
14917	14805	\N	Rytwiny
14918	14805	\N	Siedlec
14919	14805	\N	Siemiradz
14920	14805	\N	Stare Czaple
14921	14805	\N	Strzeszowice
14922	14805	\N	Trzebiel
14923	14805	\N	Wierzbięcin
14924	14805	\N	Włostowice
14925	14805	\N	Żarki Małe
14926	14805	\N	Żarki Wielkie
14927	14806	\N	Chełmica
14928	14806	\N	Chlebice
14929	14806	\N	Cielmów
14930	14806	\N	Czerna
14931	14806	\N	Drzeniów
14932	14806	\N	Grabów
14933	14806	\N	Grabówek
14934	14806	\N	Gręzawa
14935	14806	\N	Jagłowice
14936	14806	\N	Łazy
14937	14806	\N	Matuszowice
14938	14806	\N	Nowa Rola
14939	14806	\N	Świbinki
14940	14806	\N	Tuplice
14941	14799	\N	Biedrzychowice Dolne
14942	14799	\N	Bieniów
14943	14799	\N	Bogumiłów
14944	14799	\N	Dąbrowiec
14945	14799	\N	Drozdów
14946	14799	\N	Drożków
14947	14799	\N	Grabik
14948	14799	\N	Kadłubia
14949	14799	\N	Lubanice
14950	14799	\N	Lubomyśl
14951	14799	\N	Łaz
14952	14799	\N	Łukawy
14953	14799	\N	Marszów
14954	14799	\N	Miłowice
14955	14799	\N	Mirostowice Dolne
14956	14799	\N	Mirostowice Górne
14957	14799	\N	Olbrachtów
14958	14799	\N	Olszyniec
14959	14799	\N	Rościce
14960	14799	\N	Rusocice
14961	14799	\N	Sieniawa Żarska
14962	14799	\N	Siodło
14963	14799	\N	Stawnik
14964	14799	\N	Surowa
14965	14799	\N	Włostów
14966	14799	\N	Złotnik
14967	279	\N	Sława
14968	279	\N	Szlichtyngowa
14969	279	\N	Wschowa
14970	14967	\N	Sława
14971	14967	\N	Bagno
14972	14967	\N	Ciosaniec
14973	14967	\N	Droniki
14974	14967	\N	Gola
14975	14967	\N	Jutrzenka
14976	14967	\N	Krążkowo
14977	14967	\N	Krzepielów
14978	14967	\N	Kuźnica Głogowska
14979	14967	\N	Lipinki
14980	14967	\N	Lubiatów
14981	14967	\N	Lubogoszcz
14982	14967	\N	Łupice
14983	14967	\N	Nowe Strącze
14984	14967	\N	Polanica
14985	14967	\N	Przybyszów
14986	14967	\N	Przylesie
14987	14967	\N	Radzyń
14988	14967	\N	Spokojna
14989	14967	\N	Stare Strącze
14990	14967	\N	Szreniawa
14991	14967	\N	Śmieszkowo
14992	14967	\N	Tarnów Jezierny
14993	14967	\N	Wróblów
14994	14968	\N	Szlichtyngowa
14995	14968	\N	Dryżyna
14996	14968	\N	Gola
14997	14968	\N	Górczyna
14998	14968	\N	Jędrzychowice
14999	14968	\N	Kowalewo
15000	14968	\N	Małe Drzewce
15001	14968	\N	Nowe Drzewce
15002	14968	\N	Puszcza
15003	14968	\N	Stare Drzewce
15004	14968	\N	Wyszanów
15005	14968	\N	Zamysłów
15006	14969	\N	Wschowa
15007	14969	\N	Czerlejewo
15008	14969	\N	Dębowa Łęka
15009	14969	\N	Hetmanice
15010	14969	\N	Kandlewo
15011	14969	\N	Konradowo
15012	14969	\N	Lgiń
15013	14969	\N	Łęgoń
15014	14969	\N	Łysiny
15015	14969	\N	Mały Bór
15016	14969	\N	Nowa Wieś
15017	14969	\N	Olbrachcice
15018	14969	\N	Osowa Sień
15019	14969	\N	Przyczyna Dolna
15020	14969	\N	Przyczyna Górna
15021	14969	\N	Siedlnica
15022	14969	\N	Sieplnica
15023	14969	\N	Tylewice
15024	14969	\N	Wygnańczyce
15025	345	\N	M. Gorzów Wielkopolski
15026	347	\N	M. Zielona Góra
15027	352	\N	Bełchatów
15028	352	\N	Drużbice
15029	352	\N	Kleszczów
15030	352	\N	Kluki
15031	352	\N	Rusiec
15032	352	\N	Szczerców
15033	352	\N	Zelów
15034	15027	\N	Bełchatów
15035	15027	\N	Adamów
15036	15027	\N	Anastazów
15037	15027	\N	Apolinów
15038	15027	\N	Augustynów
15039	15027	\N	Bernardów
15040	15027	\N	Borki
15041	15027	\N	Borowa
15042	15027	\N	Bugaj
15043	15027	\N	Bukowa
15044	15027	\N	Chrojszcza
15045	15027	\N	Dobiecin
15046	15027	\N	Dobiecin-Kolonia
15047	15027	\N	Dobrzelów
15048	15027	\N	Domiechowice
15049	15027	\N	Emilin
15050	15027	\N	Góry Borowskie
15051	15027	\N	Helenów
15052	15027	\N	Huta
15053	15027	\N	Janina
15054	15027	\N	Janów
15055	15027	\N	Józefów
15056	15027	\N	Kalisko
15057	15027	\N	Kałduny
15058	15027	\N	Kanada
15059	15027	\N	Karolew
15060	15027	\N	Kąsie
15061	15027	\N	Kielchinów
15062	15027	\N	Korczew
15063	15027	\N	Księży Młyn
15064	15027	\N	Kurnos Drugi
15065	15027	\N	Kurnos Pierwszy
15066	15027	\N	Leonów
15067	15027	\N	Ludwików
15068	15027	\N	Ławy
15069	15027	\N	Łęg
15070	15027	\N	Łękawa
15071	15027	\N	Marianka
15072	15027	\N	Mazury
15073	15027	\N	Michałów
15074	15027	\N	Mikorzyce
15075	15027	\N	Mokracz
15076	15027	\N	Morgi Rząsawskie
15077	15027	\N	Morgi Zawadowskie
15078	15027	\N	Myszaki
15079	15027	\N	Niedyszyna
15080	15027	\N	Niwy Postękalickie
15081	15027	\N	Nowy Świat
15082	15027	\N	Oleśnik
15083	15027	\N	Parasolka
15084	15027	\N	Podwody
15085	15027	\N	Podwody-Kolonia
15086	15027	\N	Poręby
15087	15027	\N	Postękalice
15088	15027	\N	Rząsawa
15089	15027	\N	Słok
15090	15027	\N	Spólne
15091	15027	\N	Studzianki
15092	15027	\N	Wawrzykowizna
15093	15027	\N	Wielopole
15094	15027	\N	Wiktorów
15095	15027	\N	Wizytka
15096	15027	\N	Wola Kruszyńska
15097	15027	\N	Wola Mikorska
15098	15027	\N	Wólka Łękawska
15099	15027	\N	Wygoda
15100	15027	\N	Wygwizdów
15101	15027	\N	Zalesna
15102	15027	\N	Zawadów
15103	15027	\N	Zawady
15104	15027	\N	Zawały
15105	15027	\N	Zdzieszulice Dolne
15106	15027	\N	Zdzieszulice Górne
15107	15027	\N	Zwierzchów
15108	15028	\N	Brzezie
15109	15028	\N	Bukowie Dolne
15110	15028	\N	Bukowie Górne
15111	15028	\N	Chynów
15112	15028	\N	Czarny Las
15113	15028	\N	Drużbice
15114	15028	\N	Drużbice-Kolonia
15115	15028	\N	Gadki
15116	15028	\N	Głupice
15117	15028	\N	Gręboszów
15118	15028	\N	Helenów
15119	15028	\N	Hucisko
15120	15028	\N	Janówek
15121	15028	\N	Józefów
15122	15028	\N	Katarzynka
15123	15028	\N	Kazimierzów
15124	15028	\N	Kącik
15125	15028	\N	Kępa
15126	15028	\N	Kobyłki
15127	15028	\N	Łazy
15128	15028	\N	Łęczyca
15129	15028	\N	Marki
15130	15028	\N	Nowa Wieś
15131	15028	\N	Patok
15132	15028	\N	Pieńki Głupickie
15133	15028	\N	Podstoła
15134	15028	\N	Rasy
15135	15028	\N	Rawicz
15136	15028	\N	Rożniatowice
15137	15028	\N	Skrajne
15138	15028	\N	Stefanów
15139	15028	\N	Stoki
15140	15028	\N	Suchcice
15141	15028	\N	Teofilów
15142	15028	\N	Teresin
15143	15028	\N	Wadlew
15144	15028	\N	Wdowin
15145	15028	\N	Wdowin-Kolonia
15146	15028	\N	Wola Głupicka
15147	15028	\N	Wola Rożniatowska
15148	15028	\N	Wrzosy
15149	15028	\N	Zabiełłów
15150	15028	\N	Zalesie
15151	15028	\N	Zbijowa
15152	15028	\N	Zofiówka
15153	15028	\N	Zwierzyniec
15154	15029	\N	Adamów
15155	15029	\N	Aleksandrów
15156	15029	\N	Antoniówka
15157	15029	\N	Będków
15158	15029	\N	Biłgoraj
15159	15029	\N	Bogumiłów
15160	15029	\N	Cieślowizna
15161	15029	\N	Czyżów
15162	15029	\N	Dąbrowa
15163	15029	\N	Dębina
15164	15029	\N	Faustynów
15165	15029	\N	Kamień
15166	15029	\N	Karolów
15167	15029	\N	Kleszczów
15168	15029	\N	Kocielizna
15169	15029	\N	Kuców
15170	15029	\N	Łękińsko
15171	15029	\N	Łuszczanowice
15172	15029	\N	Łuszczanowice-Kolonia
15173	15029	\N	Piaski
15174	15029	\N	Rogowiec
15175	15029	\N	Słok-Młyn
15176	15029	\N	Stawek
15177	15029	\N	Stefanowizna
15178	15029	\N	Wola Grzymalina-Kolonia
15179	15029	\N	Wolica
15180	15029	\N	Żłobnica
15181	15030	\N	Borowiny
15182	15030	\N	Bożydar
15183	15030	\N	Chmielowiec
15184	15030	\N	Cisza
15185	15030	\N	Huta Strzyżewska
15186	15030	\N	Imielnia
15187	15030	\N	Kaszewice
15188	15030	\N	Kaszewice-Kolonia
15189	15030	\N	Kawalce
15190	15030	\N	Kluki
15191	15030	\N	Kuźnica Kaszewska
15192	15030	\N	Lesisko
15193	15030	\N	Nowy Janów
15194	15030	\N	Osina
15195	15030	\N	Parzno
15196	15030	\N	Podścichawa
15197	15030	\N	Podwierzchowiec
15198	15030	\N	Podwódka
15199	15030	\N	Pólko
15200	15030	\N	Roździn
15201	15030	\N	Sadulaki
15202	15030	\N	Słupia
15203	15030	\N	Smugi
15204	15030	\N	Strzyżewice
15205	15030	\N	Ścichawa
15206	15030	\N	Teofilów
15207	15030	\N	Trząs
15208	15030	\N	Wierzchowiec
15209	15030	\N	Wierzchy Kluckie
15210	15030	\N	Wierzchy Parzeńskie
15211	15030	\N	Wierzchy Strzyżewskie
15212	15030	\N	Zagony
15213	15030	\N	Zarzecze
15214	15030	\N	Żar
15215	15030	\N	Żelichów
15216	15031	\N	Aleksandrów
15217	15031	\N	Andrzejów
15218	15031	\N	Annolesie
15219	15031	\N	Antonina
15220	15031	\N	Bolesławów
15221	15031	\N	Dąbrowa
15222	15031	\N	Dąbrowa Rusiecka
15223	15031	\N	Dąbrówki Kobylańskie
15224	15031	\N	Dębina
15225	15031	\N	Dęby Wolskie
15226	15031	\N	Fajnów
15227	15031	\N	Jastrzębice
15228	15031	\N	Koch
15229	15031	\N	Korablew
15230	15031	\N	Kurówek Prądzewski
15231	15031	\N	Kuźnica
15232	15031	\N	Leśniaki
15233	15031	\N	Mierzynów
15234	15031	\N	Nowa Wola
15235	15031	\N	Pawłów
15236	15031	\N	Prądzew
15237	15031	\N	Rusiec
15238	15031	\N	Wincentów
15239	15031	\N	Wola Wiązowa
15240	15031	\N	Zagrodniki
15241	15031	\N	Zakurowie
15242	15031	\N	Zalasy
15243	15032	\N	Bednarze
15244	15032	\N	Borowa
15245	15032	\N	Brzezie
15246	15032	\N	Chabielice
15247	15032	\N	Chabielice-Kolonia
15248	15032	\N	Dubie
15249	15032	\N	Dzbanki
15250	15032	\N	Firlej
15251	15032	\N	Grabek
15252	15032	\N	Grudna
15253	15032	\N	Janówka
15254	15032	\N	Józefina
15255	15032	\N	Kieruzele
15256	15032	\N	Kolonia Szczercowska
15257	15032	\N	Kościuszki
15258	15032	\N	Kozłówki
15259	15032	\N	Krzyżówki
15260	15032	\N	Kuźnica Lubiecka
15261	15032	\N	Leśniaki Chabielskie
15262	15032	\N	Lubiec
15263	15032	\N	Lubośnia
15264	15032	\N	Magdalenów
15265	15032	\N	Marcelów
15266	15032	\N	Młynki
15267	15032	\N	Niwy
15268	15032	\N	Nowy Świat
15269	15032	\N	Osiny
15270	15032	\N	Osiny-Kolonia
15271	15032	\N	Parchliny
15272	15032	\N	Piecówka
15273	15032	\N	Podklucze
15274	15032	\N	Podżar
15275	15032	\N	Polowa
15276	15032	\N	Rudzisko
15277	15032	\N	Stanisławów Drugi
15278	15032	\N	Stanisławów Pierwszy
15279	15032	\N	Szczercowska Wieś
15280	15032	\N	Szczerców
15281	15032	\N	Szubienice
15282	15032	\N	Tatar
15283	15032	\N	Trakt Puszczański
15284	15032	\N	Zagadki
15285	15032	\N	Załuże
15286	15032	\N	Zbyszek
15287	15032	\N	Żabczanka
15288	15033	\N	Zelów
15289	15033	\N	Bocianicha
15290	15033	\N	Bominy
15291	15033	\N	Bujny Księże
15292	15033	\N	Bujny Szlacheckie
15293	15033	\N	Chajczyny
15294	15033	\N	Dąbrowa
15295	15033	\N	Dębowalec
15296	15033	\N	Faustynów
15297	15033	\N	Grabostów
15298	15033	\N	Grębociny
15299	15033	\N	Ignaców
15300	15033	\N	Jamborek
15301	15033	\N	Janów
15302	15033	\N	Jawor
15303	15033	\N	Józefka
15304	15033	\N	Karczmy
15305	15033	\N	Kociszew
15306	15033	\N	Kolonia Grabostów
15307	15033	\N	Kolonia Karczmy
15308	15033	\N	Kolonia Kociszew
15309	15033	\N	Kolonia Łobudzice
15310	15033	\N	Kolonia Ostoja
15311	15033	\N	Kolonia Pożdżenice
15312	15033	\N	Konie
15313	15033	\N	Krześlów
15314	15033	\N	Kurów
15315	15033	\N	Kurówek
15316	15033	\N	Kuźnica
15317	15033	\N	Łęki
15318	15033	\N	Łobudzice
15319	15033	\N	Marszywiec
15320	15033	\N	Mauryców
15321	15033	\N	Nowa Wola
15322	15033	\N	Ostoja
15323	15033	\N	Pawłowa
15324	15033	\N	Pieńki-Augustów
15325	15033	\N	Podlesie
15326	15033	\N	Pożdżenice
15327	15033	\N	Prusinowice
15328	15033	\N	Przecznia
15329	15033	\N	Pszczółki
15330	15033	\N	Pukawica
15331	15033	\N	Sikawica
15332	15033	\N	Sobki
15333	15033	\N	Sromutka
15334	15033	\N	Tosin
15335	15033	\N	Walewice
15336	15033	\N	Wola Pszczółecka
15337	15033	\N	Wygiełzów
15338	15033	\N	Wypychów
15339	15033	\N	Zabłoty
15340	15033	\N	Zagłówki
15341	15033	\N	Zalesie
15342	15033	\N	Zalesie-Kolonia
15343	15033	\N	Zelówek
15344	353	\N	Kutno
15345	353	\N	Bedlno
15346	353	\N	Dąbrowice
15347	353	\N	Krośniewice
15348	353	\N	Krzyżanów
15349	353	\N	Łanięta
15350	353	\N	Nowe Ostrowy
15351	353	\N	Oporów
15352	353	\N	Strzelce
15353	353	\N	Żychlin
15354	15344	\N	Kutno
15355	15345	\N	Annetów
15356	15345	\N	Antoniew
15357	15345	\N	Baranowizna
15358	15345	\N	Bedlno
15359	15345	\N	Czarnów
15360	15345	\N	Dąbrówka
15361	15345	\N	Dębowa Góra
15362	15345	\N	Emilianów
15363	15345	\N	Ernestynów
15364	15345	\N	Florianów
15365	15345	\N	Franciszków Nowy
15366	15345	\N	Garbów
15367	15345	\N	Głuchów
15368	15345	\N	Gosławice
15369	15345	\N	Górki Stanisławskie
15370	15345	\N	Groszki
15371	15345	\N	Gruszkowizna
15372	15345	\N	Janów
15373	15345	\N	Jaroszówka
15374	15345	\N	Józefów
15375	15345	\N	Julianów
15376	15345	\N	Kamilew
15377	15345	\N	Karolew
15378	15345	\N	Kazimierek
15379	15345	\N	Kazimierówka
15380	15345	\N	Klotyldów
15381	15345	\N	Konstantynów
15382	15345	\N	Kosów
15383	15345	\N	Kręcieszki
15384	15345	\N	Kujawki
15385	15345	\N	Lasota
15386	15345	\N	Marynin
15387	15345	\N	Mateuszew
15388	15345	\N	Mirosławice
15389	15345	\N	Nowe Bedlno
15390	15345	\N	Odolin
15391	15345	\N	Orłów-Kolonia
15392	15345	\N	Orłów-Parcel
15393	15345	\N	Plecka Dąbrowa
15394	15345	\N	Pniewo
15395	15345	\N	Pniewo-Kolonia
15396	15345	\N	Potok
15397	15345	\N	Ruszki
15398	15345	\N	Stanisławice
15399	15345	\N	Stradzew
15400	15345	\N	Stradzew-Górki
15401	15345	\N	Szewce Nadolne
15402	15345	\N	Szewce Nagórne
15403	15345	\N	Szewce Owsiane
15404	15345	\N	Szewce-Walentyna
15405	15345	\N	Teodorów
15406	15345	\N	Tomaszew
15407	15345	\N	Tomczyce
15408	15345	\N	Trawin
15409	15345	\N	Trzciniec
15410	15345	\N	Waliszew
15411	15345	\N	Wewiórz
15412	15345	\N	Wilkęsy
15413	15345	\N	Wojszyce
15414	15345	\N	Wola Kałkowa
15415	15345	\N	Wolska Kolonia
15416	15345	\N	Wydmuch
15417	15345	\N	Wyrów
15418	15345	\N	Załusin
15419	15345	\N	Załusinek
15420	15345	\N	Zleszyn
15421	15345	\N	Zosinów
15422	15345	\N	Żeronice
15423	15346	\N	Augustopol
15424	15346	\N	Baby
15425	15346	\N	Dąbrowice
15426	15346	\N	Liliopol
15427	15346	\N	Mariopol
15428	15346	\N	Ostrówki
15429	15346	\N	Rozopol
15430	15346	\N	Witawa
15431	15346	\N	Zgórze
15432	15346	\N	Żakowiec
15433	15347	\N	Krośniewice
15434	15347	\N	Bardzinek
15435	15347	\N	Bielice
15436	15347	\N	Błonie
15437	15347	\N	Cudniki
15438	15347	\N	Cygany
15439	15347	\N	Franki
15440	15347	\N	Głaznów
15441	15347	\N	Głogowa
15442	15347	\N	Godzięby
15443	15347	\N	Iwiczna
15444	15347	\N	Jankowice
15445	15347	\N	Kajew
15446	15347	\N	Kopy
15447	15347	\N	Kopyta
15448	15347	\N	Krzewie
15449	15347	\N	Luboradz
15450	15347	\N	Marynin
15451	15347	\N	Miłonice
15452	15347	\N	Miłosna
15453	15347	\N	Morawce
15454	15347	\N	Nowe
15455	15347	\N	Nowe Jankowice
15456	15347	\N	Ostałów
15457	15347	\N	Pawlikowice
15458	15347	\N	Pomarzany
15459	15347	\N	Skłóty
15460	15347	\N	Stara Wieś
15461	15347	\N	Suchodoły
15462	15347	\N	Szubina
15463	15347	\N	Szubsk Duży
15464	15347	\N	Szubsk-Towarzystwo
15465	15347	\N	Teresin
15466	15347	\N	Tumidaj
15467	15347	\N	Witów
15468	15347	\N	Wola Nowska
15469	15347	\N	Wychny
15470	15347	\N	Wymysłów
15471	15347	\N	Zalesie
15472	15347	\N	Zieleniew
15473	15348	\N	Brony
15474	15348	\N	Daninów
15475	15348	\N	Goliszew
15476	15348	\N	Jagniątki
15477	15348	\N	Julianów
15478	15348	\N	Kaszewy Dworne
15479	15348	\N	Kaszewy-Kolonia
15480	15348	\N	Kaszewy Kościelne
15481	15348	\N	Kaszewy-Spójnia
15482	15348	\N	Kaszewy Tarnowskie
15483	15348	\N	Konary
15484	15348	\N	Krzyżanów
15485	15348	\N	Krzyżanówek
15486	15348	\N	Ktery
15487	15348	\N	Kuchary
15488	15348	\N	Łęki Górne
15489	15348	\N	Łęki Kościelne
15490	15348	\N	Malewo
15491	15348	\N	Marcinów
15492	15348	\N	Micin
15493	15348	\N	Mieczysławów
15494	15348	\N	Młogoszyn
15495	15348	\N	Nowe Ktery
15496	15348	\N	Pawłowice
15497	15348	\N	Psurze
15498	15348	\N	Różanowice
15499	15348	\N	Rustów
15500	15348	\N	Rybie
15501	15348	\N	Siemienice
15502	15348	\N	Siemieniczki
15503	15348	\N	Sokół
15504	15348	\N	Stefanów
15505	15348	\N	Uroczysko Leśne
15506	15348	\N	Wały A
15507	15348	\N	Wały B
15508	15348	\N	Wierzyki
15509	15348	\N	Władysławów
15510	15348	\N	Wojciechowice Duże
15511	15348	\N	Wojciechowice Małe
15512	15348	\N	Wyręby Siemienickie
15513	15348	\N	Zawady
15514	15348	\N	Złotniki
15515	15348	\N	Żakowice
15516	15344	\N	Adamowice
15517	15344	\N	Adamów
15518	15344	\N	Bielawki
15519	15344	\N	Boża Wola
15520	15344	\N	Byszew
15521	15344	\N	Byszew-Kaczyn
15522	15344	\N	Dudki
15523	15344	\N	Florek
15524	15344	\N	Głogowiec
15525	15344	\N	Gnojno
15526	15344	\N	Gołębiewek Nowy
15527	15344	\N	Gołębiewek Stary
15528	15344	\N	Gołębiew Nowy
15529	15344	\N	Gołębiew Stary
15530	15344	\N	Grabków
15531	15344	\N	Julinki
15532	15344	\N	Kalinowa
15533	15344	\N	Kolonia Sójki
15534	15344	\N	Kolonia Strzegocin
15535	15344	\N	Komadzyn
15536	15344	\N	Kotliska
15537	15344	\N	Krzesin
15538	15344	\N	Krzesinówek
15539	15344	\N	Krzesin-Parcela
15540	15344	\N	Kuczków
15541	15344	\N	Leszczynek
15542	15344	\N	Leszno
15543	15344	\N	Malina
15544	15344	\N	Marianki
15545	15344	\N	Michałów
15546	15344	\N	Nagodów
15547	15344	\N	Nowa Wieś
15548	15344	\N	Nowe Sójki
15549	15344	\N	Obidówek
15550	15344	\N	Piwki
15551	15344	\N	Podczachy
15552	15344	\N	Raciborów
15553	15344	\N	Ryków
15554	15344	\N	Sieciechów
15555	15344	\N	Sieraków
15556	15344	\N	Stanisławów
15557	15344	\N	Stara Wieś
15558	15344	\N	Strzegocin
15559	15344	\N	Wierzbie
15560	15344	\N	Włosków
15561	15344	\N	Woźniaków
15562	15344	\N	Wroczyny
15563	15344	\N	Wysoka Duża
15564	15344	\N	Wysoka Wielka
15565	15344	\N	Żurawieniec
15566	15349	\N	Anielin
15567	15349	\N	Bronisławów
15568	15349	\N	Budy Nowe
15569	15349	\N	Budy Stare
15570	15349	\N	Chrosno
15571	15349	\N	Chruścinek
15572	15349	\N	Franciszków
15573	15349	\N	Juków
15574	15349	\N	Kąty
15575	15349	\N	Kliny
15576	15349	\N	Klonowiec Wielki
15577	15349	\N	Lipie
15578	15349	\N	Łanięta
15579	15349	\N	Pomarzany
15580	15349	\N	Rajmundów
15581	15349	\N	Ryszardów
15582	15349	\N	Suchodębie
15583	15349	\N	Świecinki
15584	15349	\N	Świeciny
15585	15349	\N	Wilkowia
15586	15349	\N	Witoldów
15587	15349	\N	Wola Chruścińska
15588	15349	\N	Zgoda
15589	15350	\N	Błota
15590	15350	\N	Bzówki
15591	15350	\N	Cukrownia-Ostrowy
15592	15350	\N	Grochów
15593	15350	\N	Grochówek
15594	15350	\N	Grodno
15595	15350	\N	Imielinek
15596	15350	\N	Imielno
15597	15350	\N	Kały-Towarzystwo
15598	15350	\N	Kołomia
15599	15350	\N	Lipiny
15600	15350	\N	Miksztal
15601	15350	\N	Niechcianów
15602	15350	\N	Nowa Wieś
15603	15350	\N	Nowe Grodno
15604	15350	\N	Nowe Ostrowy
15605	15350	\N	Ostrowy
15606	15350	\N	Perna
15607	15350	\N	Rdutów
15608	15350	\N	Wola Pierowa
15609	15350	\N	Wołodrza
15610	15350	\N	Zieleniec
15611	15351	\N	Dobrzewy
15612	15351	\N	Golędzkie
15613	15351	\N	Grotowice
15614	15351	\N	Janów
15615	15351	\N	Jastrzębia
15616	15351	\N	Jaworzyna
15617	15351	\N	Jurków Drugi
15618	15351	\N	Jurków Pierwszy
15619	15351	\N	Kamienna
15620	15351	\N	Kurów-Parcel
15621	15351	\N	Kurów-Wieś
15622	15351	\N	Łowiczówka
15623	15351	\N	Mnich-Ośrodek
15624	15351	\N	Mnich-Południe
15625	15351	\N	Mnich-Probostwo
15626	15351	\N	Oporów
15627	15351	\N	Oporów-Kolonia
15628	15351	\N	Pobórz
15629	15351	\N	Podgajew
15630	15351	\N	Raj
15631	15351	\N	Samogoszcz
15632	15351	\N	Skarżyn
15633	15351	\N	Skarżynek
15634	15351	\N	Skórzewa
15635	15351	\N	Stanisławów
15636	15351	\N	Szczyt
15637	15351	\N	Szymanówka
15638	15351	\N	Świechów
15639	15351	\N	Wola Owsiana
15640	15351	\N	Wola Prosperowa
15641	15351	\N	Wólka-Lizigódź
15642	15352	\N	Aleksandrów
15643	15352	\N	Bielawy
15644	15352	\N	Bociany
15645	15352	\N	Dąbkowice
15646	15352	\N	Dębina
15647	15352	\N	Długołęka
15648	15352	\N	Holendry Strzeleckie
15649	15352	\N	Janiszew
15650	15352	\N	Karolew
15651	15352	\N	Klonowiec Stary
15652	15352	\N	Kozia Góra
15653	15352	\N	Marianka
15654	15352	\N	Marianów
15655	15352	\N	Muchnice
15656	15352	\N	Muchnice Nowe
15657	15352	\N	Muchnów
15658	15352	\N	Niedrzaków
15659	15352	\N	Niedrzew Drugi
15660	15352	\N	Niedrzew Pierwszy
15661	15352	\N	Przyzórz
15662	15352	\N	Rejmontów
15663	15352	\N	Siemianów
15664	15352	\N	Sójki
15665	15352	\N	Sójki-Parcel
15666	15352	\N	Strzelce
15667	15352	\N	Strzelce Kujawskie
15668	15352	\N	Wieszczyce
15669	15352	\N	Wola Raciborowska
15670	15352	\N	Zaranna
15671	15352	\N	Zgórze
15672	15353	\N	Żychlin
15673	15353	\N	Aleksandrów
15674	15353	\N	Aleksandrówka
15675	15353	\N	Balików
15676	15353	\N	Biała
15677	15353	\N	Brzeziny
15678	15353	\N	Budzyń
15679	15353	\N	Buszków Dolny
15680	15353	\N	Buszkówek
15681	15353	\N	Chochołów
15682	15353	\N	Czesławów
15683	15353	\N	Dobrzelin
15684	15353	\N	Drzewoszki Małe
15685	15353	\N	Drzewoszki Wielkie
15686	15353	\N	Gajew
15687	15353	\N	Grabie
15688	15353	\N	Grabów
15689	15353	\N	Grzybów Dolny
15690	15353	\N	Grzybów Hornowski
15691	15353	\N	Kaczkowizna
15692	15353	\N	Kruki
15693	15353	\N	Marianka
15694	15353	\N	Orątki Dolne
15695	15353	\N	Orątki Górne
15696	15353	\N	Pasieka
15697	15353	\N	Sędki
15698	15353	\N	Sokołówek
15699	15353	\N	Szczytów
15700	15353	\N	Śleszyn
15701	15353	\N	Śleszynek
15702	15353	\N	Tretki
15703	15353	\N	Wola Popowa
15704	15353	\N	Zagroby
15705	15353	\N	Zarębów
15706	15353	\N	Zgoda
15707	15353	\N	Żabików
15708	367	\N	Buczek
15709	367	\N	Łask
15710	367	\N	Sędziejowice
15711	367	\N	Widawa
15712	367	\N	Wodzierady
15713	15708	\N	Bachorzyn
15714	15708	\N	Brodnia Dolna
15715	15708	\N	Brodnia Górna
15716	15708	\N	Buczek
15717	15708	\N	Czarny Las
15718	15708	\N	Czestków A
15719	15708	\N	Czestków B
15720	15708	\N	Czestków F
15721	15708	\N	Czestków-Osiedle
15722	15708	\N	Dąbrowa
15723	15708	\N	Dąbrówka
15724	15708	\N	Grzeszyn
15725	15708	\N	Gucin
15726	15708	\N	Józefatów
15727	15708	\N	Kowalew
15728	15708	\N	Luciejów
15729	15708	\N	Malenia
15730	15708	\N	Petronelów
15731	15708	\N	Sowińce
15732	15708	\N	Strupiny
15733	15708	\N	Sycanów
15734	15708	\N	Wilkowyja
15735	15708	\N	Wola Bachorska
15736	15708	\N	Wola Buczkowska
15737	15709	\N	Łask
15738	15709	\N	Aleksandrówek
15739	15709	\N	Anielin
15740	15709	\N	Bałucz
15741	15709	\N	Borszewice Cmentarne
15742	15709	\N	Borszewice Kolejowe
15743	15709	\N	Borszewice Kościelne
15744	15709	\N	Budy Stryjewskie
15745	15709	\N	Gorczyn
15746	15709	\N	Grabina
15747	15709	\N	Jabłonki
15748	15709	\N	Karszew
15749	15709	\N	Kolonia Bałucz
15750	15709	\N	Kolonia Bilew
15751	15709	\N	Kopyść
15752	15709	\N	Krzucz
15753	15709	\N	Łętków
15754	15709	\N	Łopatki
15755	15709	\N	Łopatki-Cegielnia
15756	15709	\N	Mauryca
15757	15709	\N	Mikołajówek
15758	15709	\N	Młynisko
15759	15709	\N	Okup Mały
15760	15709	\N	Okup Wielki
15761	15709	\N	Orchów
15762	15709	\N	Orchów-Wesółka
15763	15709	\N	Ostrów
15764	15709	\N	Ostrów-Osiedle
15765	15709	\N	Podłaszcze
15766	15709	\N	Rembów
15767	15709	\N	Remiszew
15768	15709	\N	Rokitnica
15769	15709	\N	Sięganów
15770	15709	\N	Stryje Księże
15771	15709	\N	Stryje Paskowe
15772	15709	\N	Szadek
15773	15709	\N	Teodory
15774	15709	\N	Teodory-Osiedle
15775	15709	\N	Ulejów
15776	15709	\N	Wiewiórczyn
15777	15709	\N	Wincentów
15778	15709	\N	Wola Bałucka
15779	15709	\N	Wola Łaska
15780	15709	\N	Wola Stryjewska
15781	15709	\N	Wronowice
15782	15709	\N	Wrzeszczewice
15783	15709	\N	Wrzeszczewice Nowe
15784	15709	\N	Wrzeszczewice-Skrejnia
15785	15709	\N	Wrzeszczewice-Tomaszew
15786	15709	\N	Wydrzyn
15787	15709	\N	Zielęcice
15788	15710	\N	Bilew
15789	15710	\N	Brody
15790	15710	\N	Brzeski
15791	15710	\N	Dobra
15792	15710	\N	Grabia
15793	15710	\N	Grabia Trzecia
15794	15710	\N	Grabica
15795	15710	\N	Grabno
15796	15710	\N	Kamostek
15797	15710	\N	Korczyska
15798	15710	\N	Kustrzyce
15799	15710	\N	Lichawa
15800	15710	\N	Marzenin
15801	15710	\N	Niecenia
15802	15710	\N	Nowe Kozuby
15803	15710	\N	Osiny
15804	15710	\N	Podule
15805	15710	\N	Pruszków
15806	15710	\N	Przymiłów
15807	15710	\N	Rososza
15808	15710	\N	Sędziejowice
15809	15710	\N	Sędziejowice-Kolonia
15810	15710	\N	Siedlce
15811	15710	\N	Sobiepany
15812	15710	\N	Stare Kozuby
15813	15710	\N	Wola Marzeńska
15814	15710	\N	Wola Wężykowa
15815	15710	\N	Wrzesiny
15816	15710	\N	Zamość
15817	15710	\N	Żagliny
15818	15711	\N	Babina
15819	15711	\N	Brzyków
15820	15711	\N	Chociw
15821	15711	\N	Chrusty
15822	15711	\N	Chrząstawa
15823	15711	\N	Dąbrowa Widawska
15824	15711	\N	Dębina
15825	15711	\N	Goryń
15826	15711	\N	Górki Grabińskie
15827	15711	\N	Grabówie
15828	15711	\N	Izydorów
15829	15711	\N	Józefów
15830	15711	\N	Józefów Widawski
15831	15711	\N	Kąty
15832	15711	\N	Klęcz
15833	15711	\N	Kocina
15834	15711	\N	Kolonia Zawady
15835	15711	\N	Korzeń
15836	15711	\N	Las Zawadzki
15837	15711	\N	Ligota
15838	15711	\N	Lisiska
15839	15711	\N	Lucjanów
15840	15711	\N	Łazów
15841	15711	\N	Ochle
15842	15711	\N	Ochle-Kolonia
15843	15711	\N	Osieczno
15844	15711	\N	Patoki
15845	15711	\N	Podgórze
15846	15711	\N	Przyborów
15847	15711	\N	Raczynów
15848	15711	\N	Restarzew Cmentarny
15849	15711	\N	Restarzew Środkowy
15850	15711	\N	Rogóźno
15851	15711	\N	Ruda
15852	15711	\N	Sarnów
15853	15711	\N	Sewerynów
15854	15711	\N	Siemiechów
15855	15711	\N	Świerczów
15856	15711	\N	Widawa
15857	15711	\N	Wielka Wieś A
15858	15711	\N	Wielka Wieś B
15859	15711	\N	Wincentów
15860	15711	\N	Witoldów
15861	15711	\N	Wola Kleszczowa
15862	15711	\N	Wrzosy
15863	15711	\N	Zabłocie
15864	15711	\N	Zawady
15865	15711	\N	Zborów
15866	15712	\N	Alfonsów
15867	15712	\N	Apolonia
15868	15712	\N	Chorzeszów
15869	15712	\N	Czarnysz
15870	15712	\N	Dobków
15871	15712	\N	Dobruchów
15872	15712	\N	Elodia
15873	15712	\N	Hipolitów
15874	15712	\N	Jesionna
15875	15712	\N	Józefów
15876	15712	\N	Julianów
15877	15712	\N	Kiki
15878	15712	\N	Kwiatkowice
15879	15712	\N	Kwiatkowice-Kolonia
15880	15712	\N	Kwiatkowice-Las
15881	15712	\N	Leśnica
15882	15712	\N	Ludowinka
15883	15712	\N	Magdalenów
15884	15712	\N	Magnusy
15885	15712	\N	Marianów
15886	15712	\N	Mauryców
15887	15712	\N	Nowy Świat
15888	15712	\N	Pelagia
15889	15712	\N	Piorunów
15890	15712	\N	Piorunówek
15891	15712	\N	Przyrownica
15892	15712	\N	Stanisławów
15893	15712	\N	Teodorów
15894	15712	\N	Wandzin
15895	15712	\N	Włodzimierz
15896	15712	\N	Wodzierady
15897	15712	\N	Wola Czarnyska
15898	15712	\N	Wrząsawa
15899	370	\N	Łęczyca
15900	370	\N	Daszyna
15901	370	\N	Góra Świętej Małgorzaty
15902	370	\N	Grabów
15903	370	\N	Piątek
15904	370	\N	Świnice Warckie
15905	370	\N	Witonia
15906	15899	\N	Łęczyca
15907	15900	\N	Daszyna
15908	15900	\N	Drzykozy
15909	15900	\N	Gąsiorów
15910	15900	\N	Goszczynno
15911	15900	\N	Jabłonna
15912	15900	\N	Jacków
15913	15900	\N	Janice
15914	15900	\N	Jarochów
15915	15900	\N	Jarochówek
15916	15900	\N	Karkoszki
15917	15900	\N	Koryta
15918	15900	\N	Krężelewice
15919	15900	\N	Lipówka
15920	15900	\N	Łubno
15921	15900	\N	Mazew
15922	15900	\N	Mazew-Kolonia
15923	15900	\N	Miroszewice
15924	15900	\N	Nowa Żelazna
15925	15900	\N	Nowy Sławoszew
15926	15900	\N	Ogrodzona
15927	15900	\N	Opiesin
15928	15900	\N	Osędowice
15929	15900	\N	Rzędków
15930	15900	\N	Siedlew
15931	15900	\N	Skrzynki
15932	15900	\N	Stara Żelazna
15933	15900	\N	Stary Sławoszew
15934	15900	\N	Upale
15935	15900	\N	Walew
15936	15900	\N	Walew-Parcele
15937	15900	\N	Zagróbki
15938	15900	\N	Żabokrzeki
15939	15901	\N	Ambrożew
15940	15901	\N	Bogdańczew
15941	15901	\N	Bryski
15942	15901	\N	Bryski-Kolonia
15943	15901	\N	Czarnopole
15944	15901	\N	Gaj
15945	15901	\N	Głupiejew
15946	15901	\N	Góra Świętej Małgorzaty
15947	15901	\N	Janów
15948	15901	\N	Karsznice
15949	15901	\N	Konstancin
15950	15901	\N	Kosin
15951	15901	\N	Kosiorów
15952	15901	\N	Kwiatkówek
15953	15901	\N	Łętków
15954	15901	\N	Marynki
15955	15901	\N	Mętlew
15956	15901	\N	Mierczyn
15957	15901	\N	Moraków
15958	15901	\N	Nowy Gaj
15959	15901	\N	Orszewice
15960	15901	\N	Podgórzyce
15961	15901	\N	Rogulice
15962	15901	\N	Sługi
15963	15901	\N	Stary Gaj
15964	15901	\N	Stawy
15965	15901	\N	Tum
15966	15901	\N	Witaszewice
15967	15901	\N	Zagaj
15968	15902	\N	Aleksandrówek
15969	15902	\N	Besiekiery
15970	15902	\N	Biała Góra
15971	15902	\N	Borów
15972	15902	\N	Borucice
15973	15902	\N	Bowętów
15974	15902	\N	Brudzeń
15975	15902	\N	Budki
15976	15902	\N	Bugaj
15977	15902	\N	Byszew
15978	15902	\N	Celinów
15979	15902	\N	Chorki
15980	15902	\N	Filipów
15981	15902	\N	Gać
15982	15902	\N	Golbice
15983	15902	\N	Goszczędza
15984	15902	\N	Grabów
15985	15902	\N	Jamy
15986	15902	\N	Janów
15987	15902	\N	Jastrzębia
15988	15902	\N	Jaworów
15989	15902	\N	Kadzidłowa
15990	15902	\N	Kępina
15991	15902	\N	Kobyle
15992	15902	\N	Kotków
15993	15902	\N	Ksawerów
15994	15902	\N	Ksawerówek
15995	15902	\N	Kurzjama
15996	15902	\N	Leszno
15997	15902	\N	Łyżki
15998	15902	\N	Nagórki
15999	15902	\N	Nowa Sobótka
16000	15902	\N	Nowa Wieś
16001	15902	\N	Nowy Besk
16002	15902	\N	Odechów
16003	15902	\N	Odechówek
16004	15902	\N	Olszewa
16005	15902	\N	Osiny
16006	15902	\N	Ostrówek
16007	15902	\N	Piaski
16008	15902	\N	Pieczew
16009	15902	\N	Piotrkówek
16010	15902	\N	Pociecha
16011	15902	\N	Pokrzywnia
16012	15902	\N	Polamy
16013	15902	\N	Potrzasków
16014	15902	\N	Pusta Wieś
16015	15902	\N	Radzyń
16016	15902	\N	Rochów
16017	15902	\N	Rochówek
16018	15902	\N	Rybnik
16019	15902	\N	Sławęcin
16020	15902	\N	Smardzew
16021	15902	\N	Smolice
16022	15902	\N	Sobótka-Kolonia
16023	15902	\N	Srebrna
16024	15902	\N	Srebrna Wieś
16025	15902	\N	Stanisławki
16026	15902	\N	Stara Sobótka
16027	15902	\N	Stary Besk
16028	15902	\N	Szłapy
16029	15902	\N	Teofilki
16030	15902	\N	Wygorzele
16031	15902	\N	Źrebięta
16032	15902	\N	Żaczki
16033	15899	\N	Błonie
16034	15899	\N	Borek
16035	15899	\N	Borki
16036	15899	\N	Borów
16037	15899	\N	Bronno
16038	15899	\N	Chrząstówek
16039	15899	\N	Dąbie
16040	15899	\N	Dobrogosty
16041	15899	\N	Dzierzbiętów Duży
16042	15899	\N	Dzierzbiętów Mały
16043	15899	\N	Garbalin
16044	15899	\N	Gawrony
16045	15899	\N	Janków
16046	15899	\N	Karkosy
16047	15899	\N	Kozuby
16048	15899	\N	Krzepocin Drugi
16049	15899	\N	Krzepocin Pierwszy
16050	15899	\N	Leszcze
16051	15899	\N	Leźnica Mała
16052	15899	\N	Liszki
16053	15899	\N	Lubień
16054	15899	\N	Łęka
16055	15899	\N	Łęka-Kolonia
16056	15899	\N	Mikołajew
16057	15899	\N	Mniszki
16058	15899	\N	Piekacie
16059	15899	\N	Pilichy
16060	15899	\N	Prądzew
16061	15899	\N	Prusinowice
16062	15899	\N	Pruszki
16063	15899	\N	Siedlec
16064	15899	\N	Siemszyce
16065	15899	\N	Szarowizna
16066	15899	\N	Topola Katowa
16067	15899	\N	Topola Królewska
16068	15899	\N	Topola Szlachecka
16069	15899	\N	Wąkczew
16070	15899	\N	Wichrów
16071	15899	\N	Wilczkowice Dolne
16072	15899	\N	Wilczkowice Górne
16073	15899	\N	Wilczkowice nad Szosą
16074	15899	\N	Wilczkowice Średnie
16075	15899	\N	Zawada
16076	15899	\N	Zduny
16077	15903	\N	Balków
16078	15903	\N	Bielice
16079	15903	\N	Boguszyce
16080	15903	\N	Borowiec
16081	15903	\N	Broników
16082	15903	\N	Czerników
16083	15903	\N	Goślub
16084	15903	\N	Goślub-Osada
16085	15903	\N	Górki Łubnickie
16086	15903	\N	Górki Pęcławskie
16087	15903	\N	Janków
16088	15903	\N	Janowice
16089	15903	\N	Janówek
16090	15903	\N	Jasionna
16091	15903	\N	Konarzew
16092	15903	\N	Krzyszkowice
16093	15903	\N	Leżajna
16094	15903	\N	Łęka
16095	15903	\N	Łubnica
16096	15903	\N	Mchowice
16097	15903	\N	Michałówka
16098	15903	\N	Młynów
16099	15903	\N	Mysłówka
16100	15903	\N	Orądki
16101	15903	\N	Orenice
16102	15903	\N	Pęcławice
16103	15903	\N	Piątek
16104	15903	\N	Piekary
16105	15903	\N	Pokrzywnica
16106	15903	\N	Rogaszyn
16107	15903	\N	Stare Piaski
16108	15903	\N	Sułkowice Drugie
16109	15903	\N	Sułkowice Pierwsze
16110	15903	\N	Sypin
16111	15903	\N	Śladków Podleśny
16112	15903	\N	Śladków Rozlazły
16113	15903	\N	Witów
16114	15903	\N	Włostowice
16115	15903	\N	Włostowice-Parcele
16116	15903	\N	Żabokrzeki
16117	15904	\N	Bielawy
16118	15904	\N	Chorzepin
16119	15904	\N	Chwalborzyce
16120	15904	\N	Drozdów
16121	15904	\N	Głogowiec
16122	15904	\N	Grodzisko
16123	15904	\N	Gusin
16124	15904	\N	Kaznów
16125	15904	\N	Kosew
16126	15904	\N	Kozanki Podleśne
16127	15904	\N	Kraski
16128	15904	\N	Ładawy
16129	15904	\N	Łyków
16130	15904	\N	Miecanki
16131	15904	\N	Parski
16132	15904	\N	Piaski
16133	15904	\N	Podgórze
16134	15904	\N	Podłęże
16135	15904	\N	Polusin
16136	15904	\N	Rogów
16137	15904	\N	Rydzyna
16138	15904	\N	Stemplew
16139	15904	\N	Strachów
16140	15904	\N	Świnice Warckie
16141	15904	\N	Tolów
16142	15904	\N	Władysławów
16143	15904	\N	Wola-Olesin
16144	15904	\N	Wola Świniecka
16145	15904	\N	Wyganów
16146	15904	\N	Zbylczyce
16147	15904	\N	Zimne
16148	15905	\N	Anusin
16149	15905	\N	Budki
16150	15905	\N	Gajew
16151	15905	\N	Gledzianów
16152	15905	\N	Gledzianówek
16153	15905	\N	Gołocice
16154	15905	\N	Gozdków
16155	15905	\N	Józefów
16156	15905	\N	Kostusin
16157	15905	\N	Kuchary
16158	15905	\N	Michały
16159	15905	\N	Nędzerzew
16160	15905	\N	Olesice
16161	15905	\N	Oraczew
16162	15905	\N	Romartów
16163	15905	\N	Rudniki
16164	15905	\N	Rybitwy
16165	15905	\N	Szamów
16166	15905	\N	Wargawa
16167	15905	\N	Wargawka Młoda
16168	15905	\N	Wargawka Stara
16169	15905	\N	Węglewice
16170	15905	\N	Węglewice-Kolonia
16171	15905	\N	Witonia
16172	369	\N	Łowicz
16173	369	\N	Bielawy
16174	369	\N	Chąśno
16175	369	\N	Domaniewice
16176	369	\N	Kiernozia
16177	369	\N	Kocierzew Południowy
16178	369	\N	Łyszkowice
16179	369	\N	Nieborów
16180	369	\N	Zduny
16181	16172	\N	Łowicz
16182	16173	\N	Bielawska Wieś
16183	16173	\N	Bielawy
16184	16173	\N	Bogumin
16185	16173	\N	Borów
16186	16173	\N	Borówek
16187	16173	\N	Brzozów
16188	16173	\N	Chruślin
16189	16173	\N	Drogusza
16190	16173	\N	Emilianów
16191	16173	\N	Gaj
16192	16173	\N	Gosławice
16193	16173	\N	Helin
16194	16173	\N	Janinów
16195	16173	\N	Leśniczówka
16196	16173	\N	Łazin
16197	16173	\N	Marianów
16198	16173	\N	Marywil
16199	16173	\N	Oszkowice
16200	16173	\N	Piaski Bankowe
16201	16173	\N	Piotrowice
16202	16173	\N	Przezwiska
16203	16173	\N	Psary
16204	16173	\N	Rulice
16205	16173	\N	Seligi
16206	16173	\N	Skubiki
16207	16173	\N	Sobocka Wieś
16208	16173	\N	Sobota
16209	16173	\N	Stare Orenice
16210	16173	\N	Stare Piaski
16211	16173	\N	Stary Waliszew
16212	16173	\N	Traby
16213	16173	\N	Trzaskowice
16214	16173	\N	Walewice
16215	16173	\N	Waliszew Dworski
16216	16173	\N	Wojewodza
16217	16173	\N	Wola Gosławska
16218	16173	\N	Zakrzew
16219	16173	\N	Zgoda
16220	16173	\N	Żdżary
16221	16174	\N	Błędów
16222	16174	\N	Chąśno
16223	16174	\N	Chąśno Drugie
16224	16174	\N	Goleńsko
16225	16174	\N	Karnków
16226	16174	\N	Karsznice Duże
16227	16174	\N	Karsznice Małe
16228	16174	\N	Marianka
16229	16174	\N	Mastki
16230	16174	\N	Niespusza-Wieś
16231	16174	\N	Nowa Niespusza
16232	16174	\N	Przemysłów
16233	16174	\N	Sierżniki
16234	16174	\N	Skowroda Południowa
16235	16174	\N	Skowroda Północna
16236	16174	\N	Wyborów
16237	16175	\N	Domaniewice
16238	16175	\N	Krępa
16239	16175	\N	Lisiewice Duże
16240	16175	\N	Lisiewice Małe
16241	16175	\N	Reczyce
16242	16175	\N	Rogóźno
16243	16175	\N	Sapy
16244	16175	\N	Skaratki
16245	16175	\N	Skaratki pod Las
16246	16175	\N	Skaratki pod Rogóźno
16247	16175	\N	Stroniewice
16248	16175	\N	Strzebieszew
16249	16176	\N	Brodne-Józefów
16250	16176	\N	Brodne-Towarzystwo
16251	16176	\N	Chruśle
16252	16176	\N	Czerniew
16253	16176	\N	Długie
16254	16176	\N	Jadzień
16255	16176	\N	Jerzewo
16256	16176	\N	Kiernozia
16257	16176	\N	Lasocin
16258	16176	\N	Natolin Kiernoski
16259	16176	\N	Niedzieliska
16260	16176	\N	Osiny
16261	16176	\N	Różanów
16262	16176	\N	Sokołów-Kolonia
16263	16176	\N	Sokołów-Towarzystwo
16264	16176	\N	Stępów
16265	16176	\N	Teresew
16266	16176	\N	Tydówka
16267	16176	\N	Wiśniewo
16268	16176	\N	Witusza
16269	16176	\N	Wola Stępowska
16270	16176	\N	Zamiary
16271	16177	\N	Boczki
16272	16177	\N	Gągolin Południowy
16273	16177	\N	Gągolin Północny
16274	16177	\N	Gągolin Zachodni
16275	16177	\N	Jeziorko
16276	16177	\N	Kocierzew Kościelny
16277	16177	\N	Kocierzew Południowy
16278	16177	\N	Kocierzew Północny
16279	16177	\N	Konstantynów
16280	16177	\N	Lenartów
16281	16177	\N	Lipnice
16282	16177	\N	Łaguszew
16283	16177	\N	Osiek
16284	16177	\N	Ostrowiec
16285	16177	\N	Płaskocin
16286	16177	\N	Różyce
16287	16177	\N	Różyce-Żurawieniec
16288	16177	\N	Sromów
16289	16177	\N	Wejsce
16290	16177	\N	Wicie
16291	16172	\N	Bocheń
16292	16172	\N	Dąbkowice Dolne
16293	16172	\N	Dąbkowice Górne
16294	16172	\N	Guźnia
16295	16172	\N	Jamno
16296	16172	\N	Jastrzębia
16297	16172	\N	Klewków
16298	16172	\N	Małszyce
16299	16172	\N	Mystkowice
16300	16172	\N	Niedźwiada
16301	16172	\N	Ostrów
16302	16172	\N	Otolice
16303	16172	\N	Parma
16304	16172	\N	Pilaszków
16305	16172	\N	Placencja
16306	16172	\N	Popów
16307	16172	\N	Strzelcew
16308	16172	\N	Szczudłów
16309	16172	\N	Świące
16310	16172	\N	Świeryż Drugi
16311	16172	\N	Świeryż Pierwszy
16312	16172	\N	Urbańszczyzna
16313	16172	\N	Wygoda
16314	16172	\N	Zabostów Duży
16315	16172	\N	Zabostów Mały
16316	16172	\N	Zawady
16317	16172	\N	Zielkowice
16318	16178	\N	Bobiecko
16319	16178	\N	Bobrowa
16320	16178	\N	Czatolin
16321	16178	\N	Gzinka
16322	16178	\N	Kalenice
16323	16178	\N	Kolonia Łyszkowice
16324	16178	\N	Kuczków
16325	16178	\N	Łagów
16326	16178	\N	Łyszkowice
16327	16178	\N	Nowe Grudze
16328	16178	\N	Polesie
16329	16178	\N	Seligów
16330	16178	\N	Seroki
16331	16178	\N	Stachlew
16332	16178	\N	Stare Grudze
16333	16178	\N	Trzcianka
16334	16178	\N	Uchan Dolny
16335	16178	\N	Uchan Górny
16336	16178	\N	Wrzeczko
16337	16178	\N	Zakulin
16338	16179	\N	Arkadia
16339	16179	\N	Bednary-Kolonia
16340	16179	\N	Bednary-Wieś
16341	16179	\N	Bełchów
16342	16179	\N	Bobrowniki
16343	16179	\N	Chyleniec
16344	16179	\N	Dzierzgów
16345	16179	\N	Dzierzgówek
16346	16179	\N	Janowice
16347	16179	\N	Julianów
16348	16179	\N	Karolew
16349	16179	\N	Kompina
16350	16179	\N	Michałówek
16351	16179	\N	Mysłaków
16352	16179	\N	Nieborów
16353	16179	\N	Patoki
16354	16179	\N	Piaski
16355	16179	\N	Sypień
16356	16180	\N	Bąków Dolny
16357	16180	\N	Bąków Górny
16358	16180	\N	Bogoria Dolna
16359	16180	\N	Bogoria Górna
16360	16180	\N	Bogoria Pofolwarczna
16361	16180	\N	Dąbrowa
16362	16180	\N	Jackowice
16363	16180	\N	Łaźniki
16364	16180	\N	Maurzyce
16365	16180	\N	Nowe Zduny
16366	16180	\N	Nowy Złaków
16367	16180	\N	Pólka
16368	16180	\N	Retki
16369	16180	\N	Rząśno
16370	16180	\N	Strugienice
16371	16180	\N	Szymanowice
16372	16180	\N	Urzecze
16373	16180	\N	Wierznowice
16374	16180	\N	Wiskienica Dolna
16375	16180	\N	Wiskienica Górna
16376	16180	\N	Zalesie
16377	16180	\N	Zduny
16378	16180	\N	Złaków Borowy
16379	16180	\N	Złaków Kościelny
16380	368	\N	Andrespol
16381	368	\N	Brójce
16382	368	\N	Koluszki
16383	368	\N	Nowosolna
16384	368	\N	Rzgów
16385	368	\N	Tuszyn
16386	16380	\N	Andrespol
16387	16380	\N	Bedoń Przykościelny
16388	16380	\N	Bedoń-Wieś
16389	16380	\N	Janówka
16390	16380	\N	Justynów
16391	16380	\N	Kraszew
16392	16380	\N	Ludwików
16393	16380	\N	Nowy Bedoń
16394	16380	\N	Stróża
16395	16380	\N	Wiśniowa Góra
16396	16381	\N	Brójce
16397	16381	\N	Budy Wandalińskie
16398	16381	\N	Bukowiec
16399	16381	\N	Giemzów
16400	16381	\N	Giemzówek
16401	16381	\N	Karpin
16402	16381	\N	Kotliny
16403	16381	\N	Kurowice
16404	16381	\N	Kurowice Kościelne
16405	16381	\N	Leśne Odpadki
16406	16381	\N	Pałczew
16407	16381	\N	Posada
16408	16381	\N	Przypusta
16409	16381	\N	Stefanów
16410	16381	\N	Wandalin
16411	16381	\N	Wardzyn
16412	16381	\N	Wola Rakowa
16413	16381	\N	Wygoda
16414	16382	\N	Koluszki
16415	16382	\N	Będzelin
16416	16382	\N	Borowa
16417	16382	\N	Długie
16418	16382	\N	Erazmów
16419	16382	\N	Felicjanów
16420	16382	\N	Gałków Duży
16421	16382	\N	Gałkówek-Parcela
16422	16382	\N	Gałków Mały
16423	16382	\N	Jeziorko
16424	16382	\N	Kaletnik
16425	16382	\N	Katarzynów
16426	16382	\N	Kazimierzów
16427	16382	\N	Leopoldów
16428	16382	\N	Leosin
16429	16382	\N	Lisowice
16430	16382	\N	Michałów
16431	16382	\N	Nowy Redzeń
16432	16382	\N	Przanowice
16433	16382	\N	Przanowska Parcela
16434	16382	\N	Regny
16435	16382	\N	Różyca
16436	16382	\N	Słotwiny
16437	16382	\N	Stamirowice
16438	16382	\N	Stary Redzeń
16439	16382	\N	Stefanów
16440	16382	\N	Świny
16441	16382	\N	Turobowice
16442	16382	\N	Wierzchy
16443	16382	\N	Zielona Góra
16444	16382	\N	Zygmuntów
16445	16382	\N	Żakowice
16446	16383	\N	Boginia
16447	16383	\N	Borchówka
16448	16383	\N	Borki
16449	16383	\N	Bukowiec
16450	16383	\N	Byszewy
16451	16383	\N	Dąbrowa
16452	16383	\N	Dąbrówka
16453	16383	\N	Dobieszków
16454	16383	\N	Głogowiec
16455	16383	\N	Grabina
16456	16383	\N	Janów
16457	16383	\N	Kalonka
16458	16383	\N	Kopanka
16459	16383	\N	Ksawerów
16460	16383	\N	Lipiny
16461	16383	\N	Moskwa
16462	16383	\N	Natolin
16463	16383	\N	Niecki
16464	16383	\N	Nowe Skoszewy
16465	16383	\N	Plichtów
16466	16383	\N	Stare Skoszewy
16467	16383	\N	Teolin
16468	16383	\N	Wiączyń Dolny
16469	16383	\N	Wódka
16470	16383	\N	Nowosolna
16471	16384	\N	Rzgów
16472	16384	\N	Babichy
16473	16384	\N	Bronisin Dworski
16474	16384	\N	Czyżeminek
16475	16384	\N	Gospodarz
16476	16384	\N	Grodzisko
16477	16384	\N	Guzew
16478	16384	\N	Huta Wiskicka
16479	16384	\N	Kalinko
16480	16384	\N	Kalino
16481	16384	\N	Konstantyna
16482	16384	\N	Prawda
16483	16384	\N	Romanów
16484	16384	\N	Stara Gadka
16485	16384	\N	Starowa Góra
16486	16384	\N	Tadzin
16487	16385	\N	Tuszyn
16488	16385	\N	Aleksandrów Drugi
16489	16385	\N	Aleksandrów Pierwszy
16490	16385	\N	Bądzyń
16491	16385	\N	Dylew
16492	16385	\N	Garbów
16493	16385	\N	Garbówek
16494	16385	\N	Głuchów
16495	16385	\N	Gołygów
16496	16385	\N	Gołygów Drugi
16497	16385	\N	Gołygów Pierwszy
16498	16385	\N	Górki Duże
16499	16385	\N	Górki Małe
16500	16385	\N	Józefów
16501	16385	\N	Jutroszew
16502	16385	\N	Królewska Wola
16503	16385	\N	Kruszów
16504	16385	\N	Mąkoszyn
16505	16385	\N	Modlica
16506	16385	\N	Polska Wola
16507	16385	\N	Potok
16508	16385	\N	Rydzynki
16509	16385	\N	Stanisławów
16510	16385	\N	Syski
16511	16385	\N	Szczukwin
16512	16385	\N	Tuszynek
16513	16385	\N	Tuszynek Majoracki
16514	16385	\N	Tuszynek Starościński
16515	16385	\N	Wacławów
16516	16385	\N	Wodzinek
16517	16385	\N	Wodzin Majoracki
16518	16385	\N	Wodzin-Okupniki
16519	16385	\N	Wodzin Prywatny
16520	16385	\N	Wola Kazubowa
16521	16385	\N	Zagrody
16522	16385	\N	Zofiówka
16523	16385	\N	Żeromin
16524	354	\N	Białaczów
16525	354	\N	Drzewica
16526	354	\N	Mniszków
16527	354	\N	Opoczno
16528	354	\N	Paradyż
16529	354	\N	Poświętne
16530	354	\N	Sławno
16531	354	\N	Żarnów
16532	16524	\N	Białaczów
16533	16524	\N	Kuraszków
16534	16524	\N	Miedzna Drewniana
16535	16524	\N	Ossa
16536	16524	\N	Parczów
16537	16524	\N	Parczówek
16538	16524	\N	Petrykozy
16539	16524	\N	Radwan
16540	16524	\N	Sędów
16541	16524	\N	Skronina
16542	16524	\N	Sobień
16543	16524	\N	Wąglany
16544	16524	\N	Zakrzów
16545	16524	\N	Żelazowice
16546	16525	\N	Drzewica
16547	16525	\N	Augustów
16548	16525	\N	Brzustowiec
16549	16525	\N	Brzuza
16550	16525	\N	Dąbrówka
16551	16525	\N	Domaszno
16552	16525	\N	Giełzów
16553	16525	\N	Idzikowice
16554	16525	\N	Jelnia
16555	16525	\N	Krzczonów
16556	16525	\N	Radzice Duże
16557	16525	\N	Radzice Małe
16558	16525	\N	Strzyżów
16559	16525	\N	Świerczyna
16560	16525	\N	Trzebina
16561	16525	\N	Werówka
16562	16525	\N	Zakościele
16563	16525	\N	Żardki
16564	16525	\N	Żdżary
16565	16526	\N	Błogie Rządowe
16566	16526	\N	Błogie Szlacheckie
16567	16526	\N	Bukowiec nad Pilicą
16568	16526	\N	Duży Potok
16569	16526	\N	Góry Trzebiatowskie
16570	16526	\N	Grabowa
16571	16526	\N	Holendry Grabowskie
16572	16526	\N	Jawor
16573	16526	\N	Jawor-Kolonia
16574	16526	\N	Julianów
16575	16526	\N	Konstantynów
16576	16526	\N	Małe Końskie
16577	16526	\N	Mały Potok
16578	16526	\N	Marianka
16579	16526	\N	Mikułowice
16580	16526	\N	Mniszków
16581	16526	\N	Nowe Błogie
16582	16526	\N	Obarzanków-Strugi
16583	16526	\N	Olimpiów
16584	16526	\N	Owczary
16585	16526	\N	Prucheńsko Duże
16586	16526	\N	Prucheńsko Małe
16587	16526	\N	Radonia
16588	16526	\N	Stoczki
16589	16526	\N	Stok
16590	16526	\N	Strzelce
16591	16526	\N	Syski
16592	16526	\N	Świeciechów
16593	16526	\N	Wydraków
16594	16526	\N	Zajączków
16595	16526	\N	Zarzęcin
16596	16527	\N	Opoczno
16597	16527	\N	Adamów
16598	16527	\N	Antoniów
16599	16527	\N	Bielowice
16600	16527	\N	Brzustówek
16601	16527	\N	Brzuśnia
16602	16527	\N	Bukowiec Opoczyński
16603	16527	\N	Dzielna
16604	16527	\N	Janów Karwicki
16605	16527	\N	Januszewice
16606	16527	\N	Karwice
16607	16527	\N	Kliny
16608	16527	\N	Kraszków
16609	16527	\N	Kraśnica
16610	16527	\N	Kruszewiec
16611	16527	\N	Kruszewiec-Kolonia
16612	16527	\N	Libiszów
16613	16527	\N	Libiszów-Kolonia
16614	16527	\N	Międzybórz
16615	16527	\N	Modrzew
16616	16527	\N	Modrzewek
16617	16527	\N	Mroczków Duży
16618	16527	\N	Mroczków Gościnny
16619	16527	\N	Ogonowice
16620	16527	\N	Ostrów
16621	16527	\N	Różanna
16622	16527	\N	Sielec
16623	16527	\N	Sitowa
16624	16527	\N	Sobawiny
16625	16527	\N	Sołek
16626	16527	\N	Stużno
16627	16527	\N	Stużno-Kolonia
16628	16527	\N	Świerczyna
16629	16527	\N	Wola Załężna
16630	16527	\N	Wólka Dobromirowa
16631	16527	\N	Wólka Karwicka
16632	16527	\N	Wólka Karwicka-Kolonia
16633	16527	\N	Wygnanów
16634	16527	\N	Zameczek
16635	16527	\N	Ziębów
16636	16528	\N	Adamów
16637	16528	\N	Alfonsów
16638	16528	\N	Bogusławy
16639	16528	\N	Daleszewice
16640	16528	\N	Dorobna Wola
16641	16528	\N	Feliksów
16642	16528	\N	Grzymałów
16643	16528	\N	Honoratów
16644	16528	\N	Irenów
16645	16528	\N	Joaniów
16646	16528	\N	Kazimierzów
16647	16528	\N	Kłopotów
16648	16528	\N	Krasik
16649	16528	\N	Mariampol
16650	16528	\N	Paradyż
16651	16528	\N	Podgaj
16652	16528	\N	Popławy-Kolonia
16653	16528	\N	Przyłęk
16654	16528	\N	Sokołów
16655	16528	\N	Solec
16656	16528	\N	Stanisławów
16657	16528	\N	Stasin
16658	16528	\N	Stawowice
16659	16528	\N	Stawowiczki
16660	16528	\N	Sylwerynów
16661	16528	\N	Wielka Wola
16662	16528	\N	Wójcin
16663	16528	\N	Wójcin A
16664	16528	\N	Wójcin B
16665	16529	\N	Anielin
16666	16529	\N	Brudzewice
16667	16529	\N	Brudzewice-Kolonia
16668	16529	\N	Buczek
16669	16529	\N	Dęba
16670	16529	\N	Dęborzeczka
16671	16529	\N	Gapinin
16672	16529	\N	Gapinin-Kolonia
16673	16529	\N	Kępa Mysiakowska
16674	16529	\N	Kozłowiec
16675	16529	\N	Małoszyce
16676	16529	\N	Mysiakowiec
16677	16529	\N	Ponikła
16678	16529	\N	Poręby
16679	16529	\N	Poświętne
16680	16529	\N	Stefanów
16681	16529	\N	Studzianna
16682	16529	\N	Wólka Kuligowska
16683	16530	\N	Antoninów
16684	16530	\N	Antoniówka
16685	16530	\N	Bratków
16686	16530	\N	Celestynów
16687	16530	\N	Dąbrowa
16688	16530	\N	Dąbrówka
16689	16530	\N	Gawrony
16690	16530	\N	Grążowice
16691	16530	\N	Grudzeń-Kolonia
16692	16530	\N	Grudzeń-Las
16693	16530	\N	Józefów
16694	16530	\N	Kamień
16695	16530	\N	Kamilówka
16696	16530	\N	Kozenin
16697	16530	\N	Kunice
16698	16530	\N	Ludwinów
16699	16530	\N	Olszewice
16700	16530	\N	Olszowiec
16701	16530	\N	Olszowiec-Kolonia
16702	16530	\N	Ostrożna
16703	16530	\N	Owadów
16704	16530	\N	Popławy
16705	16530	\N	Prymusowa Wola
16706	16530	\N	Psary
16707	16530	\N	Sepno-Radonia
16708	16530	\N	Sławno
16709	16530	\N	Sławno-Kolonia
16710	16530	\N	Szadkowice
16711	16530	\N	Tomaszówek
16712	16530	\N	Trojanów
16713	16530	\N	Unewel
16714	16530	\N	Wincentynów
16715	16530	\N	Wygnanów
16716	16530	\N	Zachorzów
16717	16530	\N	Zachorzów-Kolonia
16718	16531	\N	Adamów
16719	16531	\N	Afryka
16720	16531	\N	Antoniów
16721	16531	\N	Bronów
16722	16531	\N	Budków
16723	16531	\N	Chełsty
16724	16531	\N	Dąbie
16725	16531	\N	Dłużniewice
16726	16531	\N	Grębenice
16727	16531	\N	Jasion
16728	16531	\N	Kamieniec
16729	16531	\N	Klew
16730	16531	\N	Klew-Kolonia
16731	16531	\N	Ławki
16732	16531	\N	Malenie
16733	16531	\N	Malków
16734	16531	\N	Marcinków
16735	16531	\N	Miedzna Murowana
16736	16531	\N	Młynek
16737	16531	\N	Myślibórz
16738	16531	\N	Nadole
16739	16531	\N	Niemojowice
16740	16531	\N	Nowa Góra
16741	16531	\N	Paszkowice
16742	16531	\N	Pilichowice
16743	16531	\N	Poręba
16744	16531	\N	Ruszenice
16745	16531	\N	Ruszenice-Kolonia
16746	16531	\N	Siedlów
16747	16531	\N	Sielec
16748	16531	\N	Skórkowice
16749	16531	\N	Skumros
16750	16531	\N	Soczówki
16751	16531	\N	Straszowa Wola
16752	16531	\N	Tomaszów
16753	16531	\N	Topolice
16754	16531	\N	Trojanowice
16755	16531	\N	Widuch
16756	16531	\N	Wierzchowisko
16757	16531	\N	Zdyszewice
16758	16531	\N	Żarnów
16759	355	\N	Konstantynów Łódzki
16760	355	\N	Pabianice
16761	355	\N	Dłutów
16762	355	\N	Dobroń
16763	355	\N	Ksawerów
16764	355	\N	Lutomiersk
16765	16759	\N	Konstantynów Łódzki
16766	16760	\N	Pabianice
16767	16761	\N	Borkowice
16768	16761	\N	Budy Dłutowskie
16769	16761	\N	Czyżemin
16770	16761	\N	Dąbrowa
16771	16761	\N	Dłutów
16772	16761	\N	Dłutówek
16773	16761	\N	Drzewociny
16774	16761	\N	Huta Dłutowska
16775	16761	\N	Jastrzębieniec
16776	16761	\N	Kociołki-Las
16777	16761	\N	Lesieniec
16778	16761	\N	Leszczyny Duże
16779	16761	\N	Leszczyny Małe
16780	16761	\N	Łaziska
16781	16761	\N	Mierzączka Duża
16782	16761	\N	Orzk
16783	16761	\N	Pawłówek
16784	16761	\N	Piętków
16785	16761	\N	Redociny
16786	16761	\N	Stoczki-Porąbki
16787	16761	\N	Ślądkowice
16788	16761	\N	Świerczyna
16789	16761	\N	Tążewy
16790	16762	\N	Barycz
16791	16762	\N	Brogi
16792	16762	\N	Chechło Drugie
16793	16762	\N	Chechło Pierwsze
16794	16762	\N	Dobroń
16795	16762	\N	Dobroń Duży
16796	16762	\N	Dobroń Mały
16797	16762	\N	Kolonia Ldzań
16798	16762	\N	Ldzań
16799	16762	\N	Markówka
16800	16762	\N	Mogilno Duże
16801	16762	\N	Mogilno Małe
16802	16762	\N	Morgi
16803	16762	\N	Orpelów
16804	16762	\N	Orpelów-Numerki
16805	16762	\N	Poleszyn
16806	16762	\N	Przygoń
16807	16762	\N	Róża
16808	16762	\N	Szczerki
16809	16762	\N	Wincentów
16810	16762	\N	Wymysłów-Enklawa
16811	16762	\N	Wymysłów Francuski
16812	16762	\N	Wymysłów-Piaski
16813	16762	\N	Zimne Wody
16814	16763	\N	Ksawerów
16815	16763	\N	Nowa Gadka
16816	16763	\N	Wola Zaradzyńska
16817	16764	\N	Albertów
16818	16764	\N	Antoniew
16819	16764	\N	Babice
16820	16764	\N	Babiczki
16821	16764	\N	Bechcice-Kolonia
16822	16764	\N	Bechcice-Parcela
16823	16764	\N	Bechcice-Wieś
16824	16764	\N	Charbice Dolne
16825	16764	\N	Charbice Górne
16826	16764	\N	Czołczyn
16827	16764	\N	Dziektarzew
16828	16764	\N	Florentynów
16829	16764	\N	Franciszków
16830	16764	\N	Jerwonice
16831	16764	\N	Jeziorko
16832	16764	\N	Kazimierz
16833	16764	\N	Legendzin
16834	16764	\N	Lutomiersk
16835	16764	\N	Madaje Nowe
16836	16764	\N	Malanów
16837	16764	\N	Mianów
16838	16764	\N	Mikołajewice
16839	16764	\N	Mirosławice
16840	16764	\N	Orzechów
16841	16764	\N	Prusinowice
16842	16764	\N	Prusinowiczki
16843	16764	\N	Puczniew
16844	16764	\N	Stanisławów Nowy
16845	16764	\N	Stanisławów Stary
16846	16764	\N	Szydłów
16847	16764	\N	Szydłówek
16848	16764	\N	Wola Puczniewska
16849	16764	\N	Wrząca
16850	16764	\N	Wygoda Mikołajewska
16851	16764	\N	Zalew
16852	16764	\N	Zdziechów
16853	16764	\N	Zdziechów Nowy
16854	16764	\N	Zofiówka
16855	16764	\N	Zygmuntów
16856	16764	\N	Żurawieniec
16857	16760	\N	Bychlew
16858	16760	\N	Gorzew
16859	16760	\N	Górka Pabianicka
16860	16760	\N	Hermanów
16861	16760	\N	Huta Janowska
16862	16760	\N	Jadwinin
16863	16760	\N	Janowice
16864	16760	\N	Konin
16865	16760	\N	Kudrowice
16866	16760	\N	Majówka
16867	16760	\N	Okołowice
16868	16760	\N	Pawlikowice
16869	16760	\N	Petrykozy
16870	16760	\N	Piątkowisko
16871	16760	\N	Porszewice
16872	16760	\N	Rydzyny
16873	16760	\N	Szynkielew
16874	16760	\N	Świątniki
16875	16760	\N	Terenin
16876	16760	\N	Władysławów
16877	16760	\N	Wola Żytowska
16878	16760	\N	Wysieradz
16879	16760	\N	Żytowice
16880	356	\N	Działoszyn
16881	356	\N	Kiełczygłów
16882	356	\N	Nowa Brzeźnica
16883	356	\N	Pajęczno
16884	356	\N	Rząśnia
16885	356	\N	Siemkowice
16886	356	\N	Strzelce Wielkie
16887	356	\N	Sulmierzyce
16888	16880	\N	Działoszyn
16889	16880	\N	Bobrowniki
16890	16880	\N	Draby
16891	16880	\N	Grądy-Łazy
16892	16880	\N	Kabały
16893	16880	\N	Kapituła
16894	16880	\N	Kiedosy
16895	16880	\N	Lisowice
16896	16880	\N	Lisowice-Kolonia
16897	16880	\N	Młynki
16898	16880	\N	Niżankowice
16899	16880	\N	Posmykowizna
16900	16880	\N	Raciszyn
16901	16880	\N	Sadowiec
16902	16880	\N	Sadowiec-Niwy
16903	16880	\N	Sadowiec-Pieńki
16904	16880	\N	Sadowiec-Wrzosy
16905	16880	\N	Sęsów
16906	16880	\N	Szczepany
16907	16880	\N	Szczyty
16908	16880	\N	Trębaczew
16909	16880	\N	Węże
16910	16880	\N	Wójtostwo
16911	16880	\N	Zalesiaki
16912	16880	\N	Zalesiaki-Pieńki
16913	16881	\N	Beresie Duże
16914	16881	\N	Beresie Małe
16915	16881	\N	Brutus
16916	16881	\N	Chorzew
16917	16881	\N	Chorzew-Kolonia
16918	16881	\N	Chruścińskie
16919	16881	\N	Dąbrowa
16920	16881	\N	Dryganek Duży
16921	16881	\N	Dryganek Mały
16922	16881	\N	Glina Duża
16923	16881	\N	Glina Mała
16924	16881	\N	Gumnisko
16925	16881	\N	Huta
16926	16881	\N	Kiełczygłów
16927	16881	\N	Kiełczygłówek
16928	16881	\N	Kiełczygłów-Kolonia
16929	16881	\N	Kule
16930	16881	\N	Kuszyna
16931	16881	\N	Lipie
16932	16881	\N	Ławiana
16933	16881	\N	Obrów
16934	16881	\N	Osina Duża
16935	16881	\N	Osina Mała
16936	16881	\N	Otok
16937	16881	\N	Pierzyny Duże
16938	16881	\N	Pierzyny Małe
16939	16881	\N	Podrwinów
16940	16881	\N	Skoczylasy
16941	16881	\N	Studzienica
16942	16881	\N	Tuchań
16943	16881	\N	Wyręba
16944	16882	\N	Dubidze
16945	16882	\N	Dubidze-Kolonia
16946	16882	\N	Dworszowice Kościelne
16947	16882	\N	Dworszowice Kościelne-Kolonia
16948	16882	\N	Gajówka Prusicko
16949	16882	\N	Gojsc
16950	16882	\N	Grzybowiec
16951	16882	\N	Janów
16952	16882	\N	Jedle
16953	16882	\N	Kaflarnia
16954	16882	\N	Kolonia Gidelska
16955	16882	\N	Konstantynów
16956	16882	\N	Kruplin Poduchowny
16957	16882	\N	Kruplin Radomszczański
16958	16882	\N	Kuźnica
16959	16882	\N	Łążek
16960	16882	\N	Nowa Brzeźnica
16961	16882	\N	Orczuchy
16962	16882	\N	Pieńki Dworszowskie
16963	16882	\N	Płaczki
16964	16882	\N	Płaszczyzna
16965	16882	\N	Prusicko
16966	16882	\N	Rzędowie
16967	16882	\N	Stacja Kolejowa
16968	16882	\N	Stara Brzeźnica
16969	16882	\N	Stoczki
16970	16882	\N	Trzebca
16971	16882	\N	Ważne Młyny
16972	16882	\N	Wierzba
16973	16882	\N	Wólka Prusicka
16974	16882	\N	Zapole
16975	16883	\N	Pajęczno
16976	16883	\N	Barany
16977	16883	\N	Czerkiesy
16978	16883	\N	Dylów A
16979	16883	\N	Dylów Rządowy
16980	16883	\N	Dylów Szlachecki
16981	16883	\N	Gajęcice-Gajówka
16982	16883	\N	Głuszyna
16983	16883	\N	Grabiec
16984	16883	\N	Janki
16985	16883	\N	Kurze Miasto
16986	16883	\N	Kurzna
16987	16883	\N	Lipina
16988	16883	\N	Ładzin
16989	16883	\N	Łężce
16990	16883	\N	Majorat
16991	16883	\N	Makowiska
16992	16883	\N	Niwiska Dolne
16993	16883	\N	Niwiska Górne
16994	16883	\N	Nowe Gajęcice
16995	16883	\N	Patrzyków
16996	16883	\N	Podładzin
16997	16883	\N	Podmurowaniec
16998	16883	\N	Siedlec
16999	16883	\N	Sierociniec
17000	16883	\N	Stare Gajęcice
17001	16883	\N	Tuszyn
17002	16883	\N	Wistka
17003	16883	\N	Wręczyca
17004	16883	\N	Wydrzynów
17005	16884	\N	Augustów
17006	16884	\N	Będków
17007	16884	\N	Biała
17008	16884	\N	Broszęcin
17009	16884	\N	Broszęcin-Kolonia
17010	16884	\N	Gawłów
17011	16884	\N	Grabowiec
17012	16884	\N	Kodrań
17013	16884	\N	Kopy
17014	16884	\N	Krysiaki
17015	16884	\N	Marcelin
17016	16884	\N	Rekle
17017	16884	\N	Rychłowiec
17018	16884	\N	Rząśnia
17019	16884	\N	Stara Wieś
17020	16884	\N	Stróża
17021	16884	\N	Suchowola
17022	16884	\N	Ścięgna
17023	16884	\N	Wyrwas
17024	16884	\N	Zabrzezie
17025	16884	\N	Zielęcin
17026	16884	\N	Żary
17027	16885	\N	Borki
17028	16885	\N	Bugaj Lipnicki
17029	16885	\N	Bugaj Radoszewicki
17030	16885	\N	Delfina
17031	16885	\N	Ignaców
17032	16885	\N	Katarzynopole
17033	16885	\N	Kije
17034	16885	\N	Kolonia Lipnik
17035	16885	\N	Laski
17036	16885	\N	Lipnik
17037	16885	\N	Łukomierz
17038	16885	\N	Marchewki
17039	16885	\N	Mazaniec
17040	16885	\N	Miedźno
17041	16885	\N	Miętno
17042	16885	\N	Młynki
17043	16885	\N	Mokre
17044	16885	\N	Ożegów
17045	16885	\N	Papierek
17046	16885	\N	Pieńki
17047	16885	\N	Pieńki Laskowskie
17048	16885	\N	Radoszewice
17049	16885	\N	Siemkowice
17050	16885	\N	Smolarnia
17051	16885	\N	Tądle
17052	16885	\N	Zmyślona
17053	16886	\N	Antonina
17054	16886	\N	Dębowiec Mały
17055	16886	\N	Dębowiec Wielki
17056	16886	\N	Górki
17057	16886	\N	Marzęcice
17058	16886	\N	Piekary
17059	16886	\N	Pomiary
17060	16886	\N	Praca
17061	16886	\N	Skąpa
17062	16886	\N	Strzelce Wielkie
17063	16886	\N	Wiewiec
17064	16886	\N	Wistka
17065	16886	\N	Wistka-Kolonia
17066	16886	\N	Wola Jankowska
17067	16886	\N	Wola Wiewiecka
17068	16886	\N	Zamoście
17069	16886	\N	Zamoście-Kolonia
17070	16887	\N	Anielów
17071	16887	\N	Bieliki
17072	16887	\N	Bogumiłowice
17073	16887	\N	Chorzenice
17074	16887	\N	Dąbrowa
17075	16887	\N	Dąbrówka
17076	16887	\N	Dworszowice Pakoszowe
17077	16887	\N	Eligiów
17078	16887	\N	Filipowizna
17079	16887	\N	Kąty
17080	16887	\N	Kodrań
17081	16887	\N	Ksawerów
17082	16887	\N	Kuźnica
17083	16887	\N	Łęczyska
17084	16887	\N	Marcinów
17085	16887	\N	Nowa Wieś
17086	16887	\N	Ostrołęka
17087	16887	\N	Piekary
17088	16887	\N	Stanisławów
17089	16887	\N	Sulmierzyce
17090	16887	\N	Sulmierzyce-Kolonia
17091	16887	\N	Trzciniec
17092	16887	\N	Wola Wydrzyna
17093	372	\N	Aleksandrów
17094	372	\N	Czarnocin
17095	372	\N	Gorzkowice
17096	372	\N	Grabica
17097	372	\N	Łęki Szlacheckie
17098	372	\N	Moszczenica
17099	372	\N	Ręczno
17100	372	\N	Rozprza
17101	372	\N	Sulejów
17102	372	\N	Wola Krzysztoporska
17103	372	\N	Wolbórz
17104	17093	\N	Aleksandrów
17105	17093	\N	Borowiec
17106	17093	\N	Brzezie
17107	17093	\N	Ciechomin
17108	17093	\N	Dąbrowa nad Czarną
17109	17093	\N	Dąbrówka
17110	17093	\N	Dębowa Góra
17111	17093	\N	Dębowa Góra-Kolonia
17112	17093	\N	Jaksonek
17113	17093	\N	Janikowice
17114	17093	\N	Justynów
17115	17093	\N	Kalinków
17116	17093	\N	Kamocka Wola
17117	17093	\N	Kawęczyn
17118	17093	\N	Kotuszów
17119	17093	\N	Marianów
17120	17093	\N	Niewierszyn
17121	17093	\N	Ostrów
17122	17093	\N	Reczków Nowy
17123	17093	\N	Rożenek
17124	17093	\N	Sieczka
17125	17093	\N	Siucice
17126	17093	\N	Siucice-Kolonia
17127	17093	\N	Skotniki
17128	17093	\N	Stara
17129	17093	\N	Stara Kolonia
17130	17093	\N	Szarbsko
17131	17093	\N	Taraska
17132	17093	\N	Wacławów
17133	17093	\N	Włodzimierzów
17134	17093	\N	Wolica
17135	17093	\N	Wólka Skotnicka
17136	17094	\N	Bieżywody
17137	17094	\N	Biskupia Wola
17138	17094	\N	Budy Szynczyckie
17139	17094	\N	Czarnocin
17140	17094	\N	Dalków
17141	17094	\N	Grabina Wola
17142	17094	\N	Kalska Wola
17143	17094	\N	Rzepki
17144	17094	\N	Szynczyce
17145	17094	\N	Tychów
17146	17094	\N	Wola Kutowa
17147	17094	\N	Zamość
17148	17094	\N	Zawodzie
17149	17095	\N	Borzęcin
17150	17095	\N	Bujnice
17151	17095	\N	Bujnice-Kolonia
17152	17095	\N	Bujniczki
17153	17095	\N	Bujniczki-Kolonia
17154	17095	\N	Cieszanowice
17155	17095	\N	Daniszewice
17156	17095	\N	Gorzędów-Kolonia
17157	17095	\N	Gorzkowice
17158	17095	\N	Gorzkowiczki
17159	17095	\N	Gościnna
17160	17095	\N	Grabostów
17161	17095	\N	Kolonia Krzemieniewice
17162	17095	\N	Kotków
17163	17095	\N	Krosno
17164	17095	\N	Krzemieniewice
17165	17095	\N	Marianek
17166	17095	\N	Plucice
17167	17095	\N	Sobaków
17168	17095	\N	Sobakówek
17169	17095	\N	Szczepanowice
17170	17095	\N	Szczukocice
17171	17095	\N	Wilkoszewice
17172	17095	\N	Wola Kotkowska
17173	17095	\N	Żuchowice
17174	17095	\N	Żuchowice-Kolonia
17175	17096	\N	Bąkowiec
17176	17096	\N	Bleszyn
17177	17096	\N	Boryszów
17178	17096	\N	Brzoza
17179	17096	\N	Cisowa
17180	17096	\N	Doły Brzeskie
17181	17096	\N	Dziewuliny
17182	17096	\N	Dziwle
17183	17096	\N	Grabica
17184	17096	\N	Grabica-Kolonia
17185	17096	\N	Gutów Duży
17186	17096	\N	Gutów Mały
17187	17096	\N	Kafar
17188	17096	\N	Kamocin
17189	17096	\N	Kamocinek
17190	17096	\N	Kobyłki
17191	17096	\N	Kociołki
17192	17096	\N	Krzepczów
17193	17096	\N	Lubanów
17194	17096	\N	Lubonia
17195	17096	\N	Lutosławice Rządowe
17196	17096	\N	Lutosławice Szlacheckie
17197	17096	\N	Majdany
17198	17096	\N	Majków-Folwark
17199	17096	\N	Majków Mały
17200	17096	\N	Majków Średni
17201	17096	\N	Maleniec
17202	17096	\N	Niwy Jutroszewskie
17203	17096	\N	Olendry
17204	17096	\N	Ostrów
17205	17096	\N	Papieże
17206	17096	\N	Papieże-Kolonia
17207	17096	\N	Polesie
17208	17096	\N	Rusociny
17209	17096	\N	Szydłów
17210	17096	\N	Szydłówka
17211	17096	\N	Szydłów-Kolonia
17212	17096	\N	Twardosławice
17213	17096	\N	Władysławów
17214	17096	\N	Wola Bykowska
17215	17096	\N	Wola Kamocka
17216	17096	\N	Zaborów
17217	17096	\N	Żądło
17218	17096	\N	Żeronie
17219	17096	\N	Żychlin
17220	17097	\N	Adamów
17221	17097	\N	Antonielów
17222	17097	\N	Bęczkowice
17223	17097	\N	Bęczkowice Poduchowne
17224	17097	\N	Cieśle
17225	17097	\N	Dąbie Dobreńskie
17226	17097	\N	Dąbie Podstolskie
17227	17097	\N	Dąbrowa
17228	17097	\N	Dobrenice
17229	17097	\N	Dobreniczki
17230	17097	\N	Dorszyn
17231	17097	\N	Felicja
17232	17097	\N	Gortatowiec
17233	17097	\N	Górale
17234	17097	\N	Huta
17235	17097	\N	Ignaców Szlachecki
17236	17097	\N	Janów
17237	17097	\N	Jawora
17238	17097	\N	Jedlica
17239	17097	\N	Jeżówka Piwakowska
17240	17097	\N	Kuźnica Żerechowska
17241	17097	\N	Lesiopole
17242	17097	\N	Łęki Szlacheckie
17243	17097	\N	Majdany
17244	17097	\N	Nakielnik
17245	17097	\N	Niwy
17246	17097	\N	Nowa Huta
17247	17097	\N	Ogrodzona
17248	17097	\N	Olszyny
17249	17097	\N	Piwaki
17250	17097	\N	Piwatki
17251	17097	\N	Podstole
17252	17097	\N	Reducz
17253	17097	\N	Stanisławów
17254	17097	\N	Teklin
17255	17097	\N	Tomawa
17256	17097	\N	Trzciniec
17257	17097	\N	Trzepnica
17258	17097	\N	Wydryniwa
17259	17097	\N	Wygoda
17260	17097	\N	Wykno
17261	17097	\N	Żerechowa
17262	17098	\N	Baby
17263	17098	\N	Białkowice
17264	17098	\N	Cegielnia Moszczenicka
17265	17098	\N	Dąbrówka
17266	17098	\N	Gajkowice
17267	17098	\N	Gazomia Nowa
17268	17098	\N	Gazomia Stara
17269	17098	\N	Gazomka
17270	17098	\N	Gościmowice Drugie
17271	17098	\N	Gościmowice Pierwsze
17272	17098	\N	Imielnia
17273	17098	\N	Jarosty
17274	17098	\N	Karlin
17275	17098	\N	Kiełczówka
17276	17098	\N	Kosów
17277	17098	\N	Kosów-Batorówka
17278	17098	\N	Lewkówka
17279	17098	\N	Michałów
17280	17098	\N	Moszczenica
17281	17098	\N	Podolin
17282	17098	\N	Pomyków
17283	17098	\N	Powęziny
17284	17098	\N	Raciborowice
17285	17098	\N	Raków
17286	17098	\N	Raków Duży
17287	17098	\N	Rękoraj
17288	17098	\N	Sierosław
17289	17098	\N	Srock
17290	17098	\N	Wola Moszczenicka
17291	17099	\N	Bąkowa Góra
17292	17099	\N	Będzyn
17293	17099	\N	Brzezie
17294	17099	\N	Brzezie-Piła
17295	17099	\N	Dęba
17296	17099	\N	Dęba-Majstry
17297	17099	\N	Kalinki
17298	17099	\N	Kolonia Ręczno
17299	17099	\N	Łęg Ręczyński
17300	17099	\N	Łęki Królewskie
17301	17099	\N	Majkowice
17302	17099	\N	Nowinki
17303	17099	\N	Paskrzyn
17304	17099	\N	Placówka
17305	17099	\N	Przewóz
17306	17099	\N	Ręczno
17307	17099	\N	Stobnica
17308	17099	\N	Stobnica-Piła
17309	17099	\N	Wielkopole
17310	17099	\N	Wilkowice
17311	17099	\N	Zbyłowice
17312	17100	\N	Adolfinów
17313	17100	\N	Bagno
17314	17100	\N	Bazar
17315	17100	\N	Biała Róża
17316	17100	\N	Białocin
17317	17100	\N	Bogumiłów
17318	17100	\N	Bryszki
17319	17100	\N	Budy
17320	17100	\N	Budy Porajskie
17321	17100	\N	Cekanów
17322	17100	\N	Cieślin
17323	17100	\N	Dzięciary
17324	17100	\N	Fałek
17325	17100	\N	Gieski
17326	17100	\N	Ignaców
17327	17100	\N	Janówka
17328	17100	\N	Kęszyn
17329	17100	\N	Kisiele
17330	17100	\N	Longinówka
17331	17100	\N	Lubień
17332	17100	\N	Łazy Duże
17333	17100	\N	Łochyńsko
17334	17100	\N	Magdalenka
17335	17100	\N	Mierzyn
17336	17100	\N	Mierzyn-Kolonia
17337	17100	\N	Milejowiec
17338	17100	\N	Milejów
17339	17100	\N	Milejów-Kolonia
17340	17100	\N	Niechcice
17341	17100	\N	Nowa Wieś
17342	17100	\N	Pieńki
17343	17100	\N	Rajsko Duże
17344	17100	\N	Rajsko Małe
17345	17100	\N	Romanówka
17346	17100	\N	Rozprza
17347	17100	\N	Stara Wieś
17348	17100	\N	Stefanówka
17349	17100	\N	Straszów
17350	17100	\N	Szymanów
17351	17100	\N	Świerczyńsko
17352	17100	\N	Truszczanek
17353	17100	\N	Turlej
17354	17100	\N	Wola Niechcicka Stara
17355	17100	\N	Wroników
17356	17100	\N	Zmożna Wola
17357	17101	\N	Sulejów
17358	17101	\N	Adelinów
17359	17101	\N	Barkowice
17360	17101	\N	Barkowice Mokre
17361	17101	\N	Biała
17362	17101	\N	Bilska Wola
17363	17101	\N	Bilska Wola-Kolonia
17364	17101	\N	Dorotów
17365	17101	\N	Kałek
17366	17101	\N	Klementynów
17367	17101	\N	Kłudzice
17368	17101	\N	Koło
17369	17101	\N	Korytnica
17370	17101	\N	Krzewiny
17371	17101	\N	Kurnędz
17372	17101	\N	Łazy-Dąbrowa
17373	17101	\N	Łęczno
17374	17101	\N	Mikołajów
17375	17101	\N	Nowa Wieś
17376	17101	\N	Podkałek
17377	17101	\N	Podlubień
17378	17101	\N	Poniatów
17379	17101	\N	Przygłów
17380	17101	\N	Salkowszczyzna
17381	17101	\N	Uszczyn
17382	17101	\N	Witów
17383	17101	\N	Witów-Kolonia
17384	17101	\N	Włodzimierzów
17385	17101	\N	Wójtostwo
17386	17101	\N	Zalesice
17387	17101	\N	Zalesice-Kolonia
17388	17102	\N	Blizin
17389	17102	\N	Bogdanów
17390	17102	\N	Bogdanów-Kolonia
17391	17102	\N	Borowa
17392	17102	\N	Budków
17393	17102	\N	Bujny
17394	17102	\N	Czartek
17395	17102	\N	Dąbrówka
17396	17102	\N	Gąski
17397	17102	\N	Glina
17398	17102	\N	Gomulin
17399	17102	\N	Gomulin-Kolonia
17400	17102	\N	Jeżów
17401	17102	\N	Juliopol
17402	17102	\N	Kacprów
17403	17102	\N	Kamienna
17404	17102	\N	Kargał-Las
17405	17102	\N	Kazimierzów
17406	17102	\N	Kozierogi
17407	17102	\N	Krężna
17408	17102	\N	Krzyżanów
17409	17102	\N	Laski
17410	17102	\N	Ludwików
17411	17102	\N	Majków Duży
17412	17102	\N	Mąkolice
17413	17102	\N	Mąkolice-Kolonia
17414	17102	\N	Miłaków
17415	17102	\N	Moników
17416	17102	\N	Mzurki
17417	17102	\N	Oprzężów
17418	17102	\N	Parzniewice
17419	17102	\N	Parzniewiczki
17420	17102	\N	Pawłów Dolny
17421	17102	\N	Pawłów Górny
17422	17102	\N	Pawłów Szkolny
17423	17102	\N	Piaski
17424	17102	\N	Piekarki
17425	17102	\N	Piekary
17426	17102	\N	Poraj
17427	17102	\N	Praca
17428	17102	\N	Przydatki
17429	17102	\N	Radziątków
17430	17102	\N	Rokszyce
17431	17102	\N	Rokszyce Szkolne
17432	17102	\N	Siomki
17433	17102	\N	Stradzew
17434	17102	\N	Wola Bogdanowska
17435	17102	\N	Wola Krzysztoporska
17436	17102	\N	Wola Rokszycka
17437	17102	\N	Woźniki
17438	17102	\N	Woźniki-Kolonia
17439	17102	\N	Wygoda
17440	17102	\N	Zamłynie
17441	17102	\N	Żachta
17442	17103	\N	Adamów
17443	17103	\N	Apolonka
17444	17103	\N	Bogusławice
17445	17103	\N	Bronisławów
17446	17103	\N	Brudaki
17447	17103	\N	Dąbrowa
17448	17103	\N	Dębina
17449	17103	\N	Dębsko
17450	17103	\N	Golesze Duże
17451	17103	\N	Golesze Małe
17452	17103	\N	Golesze-Parcela
17453	17103	\N	Janów
17454	17103	\N	Kaleń
17455	17103	\N	Komorniki
17456	17103	\N	Krzykowice
17457	17103	\N	Kuznocin
17458	17103	\N	Leonów
17459	17103	\N	Lubiaszów
17460	17103	\N	Lubiatów
17461	17103	\N	Lubiatów-Zakrzew
17462	17103	\N	Marianów
17463	17103	\N	Młoszów
17464	17103	\N	Młynary
17465	17103	\N	Modrzewek
17466	17103	\N	Noworybie
17467	17103	\N	Polichno
17468	17103	\N	Polichno-Budy
17469	17103	\N	Proszenie
17470	17103	\N	Psary-Lechawa
17471	17103	\N	Psary Stare
17472	17103	\N	Psary Witowskie
17473	17103	\N	Stanisławów
17474	17103	\N	Studzianki
17475	17103	\N	Studzianki-Kolonia
17476	17103	\N	Swolszewice Duże
17477	17103	\N	Świątniki
17478	17103	\N	Węgrzynów
17479	17103	\N	Wolbórz
17480	17103	\N	Żarnowica Duża
17481	17103	\N	Żarnowica Mała
17482	17103	\N	Żywocin
17483	357	\N	Dalików
17484	357	\N	Pęczniew
17485	357	\N	Poddębice
17486	357	\N	Uniejów
17487	357	\N	Wartkowice
17488	357	\N	Zadzim
17489	17483	\N	Aleksandrówka
17490	17483	\N	Antoniew
17491	17483	\N	Bardzynin
17492	17483	\N	Brudnów
17493	17483	\N	Brudnów Stary
17494	17483	\N	Budzynek
17495	17483	\N	Dalików
17496	17483	\N	Dąbrówka Folwarczna
17497	17483	\N	Dąbrówka Górna
17498	17483	\N	Dąbrówka Nadolna
17499	17483	\N	Dąbrówka Woźnicka
17500	17483	\N	Dobrzań
17501	17483	\N	Domaniew
17502	17483	\N	Domaniewek
17503	17483	\N	Dzierżanów
17504	17483	\N	Emilianów
17505	17483	\N	Eufemia
17506	17483	\N	Fułki
17507	17483	\N	Gajówka-Kolonia
17508	17483	\N	Gajówka-Parcel
17509	17483	\N	Gajówka-Wieś
17510	17483	\N	Huta Bardzyńska
17511	17483	\N	Idzikowice
17512	17483	\N	Janów
17513	17483	\N	Julianów
17514	17483	\N	Karolinów
17515	17483	\N	Kazimierzów
17516	17483	\N	Kołoszyn
17517	17483	\N	Kontrewers
17518	17483	\N	Krasnołany
17519	17483	\N	Krzemieniew
17520	17483	\N	Kuciny
17521	17483	\N	Lubocha
17522	17483	\N	Madeje Stare
17523	17483	\N	Marcinów
17524	17483	\N	Oleśnica
17525	17483	\N	Ostrów
17526	17483	\N	Piotrów
17527	17483	\N	Przekora
17528	17483	\N	Psary
17529	17483	\N	Rozynów
17530	17483	\N	Sarnów
17531	17483	\N	Sarnówek
17532	17483	\N	Stefanów
17533	17483	\N	Symonia
17534	17483	\N	Tobolice
17535	17483	\N	Wilczyca
17536	17483	\N	Wilków
17537	17483	\N	Witów
17538	17483	\N	Władysławów
17539	17483	\N	Włodzimierzów
17540	17483	\N	Woźniki
17541	17483	\N	Wyrobki
17542	17483	\N	Zdrzychów
17543	17483	\N	Złotniki
17544	17484	\N	Borki Drużbińskie
17545	17484	\N	Brodnia
17546	17484	\N	Brodnia-Kolonia
17547	17484	\N	Brzeg
17548	17484	\N	Dąbrowa Lubolska
17549	17484	\N	Drużbin
17550	17484	\N	Dybów
17551	17484	\N	Ferdynandów
17552	17484	\N	Jadwichna
17553	17484	\N	Kraczynki
17554	17484	\N	Księża Wólka
17555	17484	\N	Księże Młyny
17556	17484	\N	Lubola
17557	17484	\N	Łębno
17558	17484	\N	Łyszkowice
17559	17484	\N	Nerki
17560	17484	\N	Osowiec
17561	17484	\N	Pęczniew
17562	17484	\N	Popów
17563	17484	\N	Popów-Kolonia
17564	17484	\N	Przywidz
17565	17484	\N	Rudniki
17566	17484	\N	Siedlątków
17567	17484	\N	Stara Dąbrowa
17568	17484	\N	Suchorzyn
17569	17484	\N	Wola Pomianowa
17570	17484	\N	Wylazłów
17571	17484	\N	Zagórki
17572	17485	\N	Poddębice
17573	17485	\N	Adamów
17574	17485	\N	Aleksandrówek
17575	17485	\N	Antonina
17576	17485	\N	Balin
17577	17485	\N	Bałdrzychów
17578	17485	\N	Boczki
17579	17485	\N	Borki Lipkowskie
17580	17485	\N	Borysew
17581	17485	\N	Borzewisko
17582	17485	\N	Budki
17583	17485	\N	Busina
17584	17485	\N	Busina-Kolonia
17585	17485	\N	Byczyna
17586	17485	\N	Chropy
17587	17485	\N	Chropy-Kolonia
17588	17485	\N	Ciężków
17589	17485	\N	Dominikowice
17590	17485	\N	Dzierzązna
17591	17485	\N	Ewelinów
17592	17485	\N	Feliksów
17593	17485	\N	Gibaszew
17594	17485	\N	Golice
17595	17485	\N	Góra Bałdrzychowska
17596	17485	\N	Góra Bałdrzychowska-Kolonia
17597	17485	\N	Grocholice
17598	17485	\N	Izabela
17599	17485	\N	Jabłonka
17600	17485	\N	Jankowice
17601	17485	\N	Józefka
17602	17485	\N	Józefów
17603	17485	\N	Józefów-Kolonia
17604	17485	\N	Kałów
17605	17485	\N	Karnice
17606	17485	\N	Klementów
17607	17485	\N	Kobylniki
17608	17485	\N	Kolonia Byczyna
17609	17485	\N	Krępa
17610	17485	\N	Ksawercin
17611	17485	\N	Księże Kowale
17612	17485	\N	Leokadiew
17613	17485	\N	Leśnik
17614	17485	\N	Lipki
17615	17485	\N	Lipnica
17616	17485	\N	Lubiszewice
17617	17485	\N	Łężki
17618	17485	\N	Łężki-Kolonia
17619	17485	\N	Łężki-Parcel
17620	17485	\N	Madajka
17621	17485	\N	Malenie
17622	17485	\N	Małe
17623	17485	\N	Marynki
17624	17485	\N	Mrowiczna
17625	17485	\N	Napoleonów
17626	17485	\N	Niemysłów
17627	17485	\N	Niewiesz
17628	17485	\N	Niewiesz-Kolonia
17629	17485	\N	Nowa Wieś
17630	17485	\N	Nowy Pudłów
17631	17485	\N	Panaszew
17632	17485	\N	Paulina
17633	17485	\N	Piotrów
17634	17485	\N	Podgórcze
17635	17485	\N	Porczyny
17636	17485	\N	Praga
17637	17485	\N	Pudłówek
17638	17485	\N	Pustkowie
17639	17485	\N	Rąkczyn
17640	17485	\N	Rodrysin
17641	17485	\N	Sempółki
17642	17485	\N	Stacja Poddębice
17643	17485	\N	Stary Pudłów
17644	17485	\N	Sworawa
17645	17485	\N	Szarów
17646	17485	\N	Szczyty
17647	17485	\N	Tarnowa
17648	17485	\N	Truskawiec
17649	17485	\N	Tumusin
17650	17485	\N	Ułany
17651	17485	\N	Wilczków
17652	17485	\N	Wólka
17653	17485	\N	Wylazłów
17654	17485	\N	Zagórzyce
17655	17485	\N	Zakrzew
17656	17486	\N	Uniejów
17657	17486	\N	Brzeziny
17658	17486	\N	Brzozówka
17659	17486	\N	Czekaj
17660	17486	\N	Czepów
17661	17486	\N	Człopki
17662	17486	\N	Człopy
17663	17486	\N	Dąbrowa
17664	17486	\N	Felicjanów
17665	17486	\N	Góry
17666	17486	\N	Grodzisko
17667	17486	\N	Hipolitów
17668	17486	\N	Kościelnica
17669	17486	\N	Kozanki Wielkie
17670	17486	\N	Kuczki
17671	17486	\N	Lekaszyn
17672	17486	\N	Łęg Baliński
17673	17486	\N	Orzeszków
17674	17486	\N	Orzeszków-Kolonia
17675	17486	\N	Ostrowsko
17676	17486	\N	Pęgów
17677	17486	\N	Rożniatów
17678	17486	\N	Rożniatów-Kolonia
17679	17486	\N	Skotniki
17680	17486	\N	Spycimierz
17681	17486	\N	Spycimierz-Kolonia
17682	17486	\N	Stanisławów
17683	17486	\N	Wielenin
17684	17486	\N	Wielenin-Kolonia
17685	17486	\N	Wieścice
17686	17486	\N	Wilamów
17687	17486	\N	Wola Przedmiejska
17688	17486	\N	Zaborów
17689	17486	\N	Zieleń
17690	17487	\N	Biała Góra
17691	17487	\N	Biernacice
17692	17487	\N	Borek
17693	17487	\N	Bronów
17694	17487	\N	Bronówek
17695	17487	\N	Brudnówek
17696	17487	\N	Chodów
17697	17487	\N	Drwalew
17698	17487	\N	Dzierżawy
17699	17487	\N	Grabiszew
17700	17487	\N	Kiki
17701	17487	\N	Kłódno
17702	17487	\N	Konopnica
17703	17487	\N	Krzepocinek
17704	17487	\N	Lewiny
17705	17487	\N	Łążki
17706	17487	\N	Mrówna
17707	17487	\N	Nasale
17708	17487	\N	Ner
17709	17487	\N	Nowa Wieś
17710	17487	\N	Nowy Gostków
17711	17487	\N	Orzeszków
17712	17487	\N	Parądzice
17713	17487	\N	Pauzew
17714	17487	\N	Pełczyska
17715	17487	\N	Plewnik
17716	17487	\N	Polesie
17717	17487	\N	Powodów Drugi
17718	17487	\N	Powodów Pierwszy
17719	17487	\N	Powodów Trzeci
17720	17487	\N	Saków
17721	17487	\N	Sędów
17722	17487	\N	Spędoszyn
17723	17487	\N	Spędoszyn-Kolonia
17724	17487	\N	Stary Gostków
17725	17487	\N	Starzyny
17726	17487	\N	Sucha
17727	17487	\N	Światonia
17728	17487	\N	Truskawiec
17729	17487	\N	Tur
17730	17487	\N	Ujazd
17731	17487	\N	Wartkowice
17732	17487	\N	Wierzbowa
17733	17487	\N	Wierzbówka
17734	17487	\N	Wilkowice
17735	17487	\N	Wojciechów
17736	17487	\N	Wola-Dąbrowa
17737	17487	\N	Wola Niedźwiedzia
17738	17487	\N	Wólka
17739	17487	\N	Wólki
17740	17487	\N	Zacisze
17741	17487	\N	Zalesie
17742	17487	\N	Zawada
17743	17487	\N	Zelgoszcz
17744	17488	\N	Adamka
17745	17488	\N	Alfonsów
17746	17488	\N	Annów
17747	17488	\N	Anusin
17748	17488	\N	Babieniec
17749	17488	\N	Bąki
17750	17488	\N	Bogucice
17751	17488	\N	Bratków Dolny
17752	17488	\N	Bratków Górny
17753	17488	\N	Budy Jeżewskie
17754	17488	\N	Charchów Księży
17755	17488	\N	Charchów Pański
17756	17488	\N	Chodaki
17757	17488	\N	Dąbrówka
17758	17488	\N	Dąbrówka Szadkowska
17759	17488	\N	Dzierzązna Szlachecka
17760	17488	\N	Głogowiec
17761	17488	\N	Górki Zadzimskie
17762	17488	\N	Grabina
17763	17488	\N	Grabinka
17764	17488	\N	Hilarów
17765	17488	\N	Iwonie
17766	17488	\N	Jeżew
17767	17488	\N	Józefów
17768	17488	\N	Kazimierzew
17769	17488	\N	Kłoniszew
17770	17488	\N	Kraszyn
17771	17488	\N	Leszkomin
17772	17488	\N	Maksymilianów
17773	17488	\N	Małyń
17774	17488	\N	Marcinów
17775	17488	\N	Nowy Świat
17776	17488	\N	Otok
17777	17488	\N	Pałki
17778	17488	\N	Pietrachy
17779	17488	\N	Piła
17780	17488	\N	Piotrów
17781	17488	\N	Ralewice
17782	17488	\N	Ruda Jeżewska
17783	17488	\N	Rudunki
17784	17488	\N	Rzechta Drużbińska
17785	17488	\N	Rzeczyca
17786	17488	\N	Sikory
17787	17488	\N	Skęczno
17788	17488	\N	Stefanów
17789	17488	\N	Szczawno Rzeczyckie
17790	17488	\N	Urszulin
17791	17488	\N	Walentynów
17792	17488	\N	Wierzchy
17793	17488	\N	Wiórzysko
17794	17488	\N	Wola Dąbska
17795	17488	\N	Wola Flaszczyna
17796	17488	\N	Wola Sypińska
17797	17488	\N	Wola Zaleska
17798	17488	\N	Wyrębów
17799	17488	\N	Zaborów
17800	17488	\N	Zadzim
17801	17488	\N	Zalesie
17802	17488	\N	Zawady
17803	17488	\N	Zygry
17804	17488	\N	Żerniki
17805	358	\N	Radomsko
17806	358	\N	Dobryszyce
17807	358	\N	Gidle
17808	358	\N	Gomunice
17809	358	\N	Kamieńsk
17810	358	\N	Kobiele Wielkie
17811	358	\N	Kodrąb
17812	358	\N	Lgota Wielka
17813	358	\N	Ładzice
17814	358	\N	Masłowice
17815	358	\N	Przedbórz
17816	358	\N	Wielgomłyny
17817	358	\N	Żytno
17818	17805	\N	Radomsko
17819	17806	\N	Biała Góra
17820	17806	\N	Blok Dobryszyce
17821	17806	\N	Borowa
17822	17806	\N	Borowiecko
17823	17806	\N	Dobryszyce
17824	17806	\N	Galonki
17825	17806	\N	Huta Brudzka
17826	17806	\N	Kolonia Dobryszyce
17827	17806	\N	Lefranów
17828	17806	\N	Malutkie
17829	17806	\N	Rożny
17830	17806	\N	Ruda
17831	17806	\N	Wiewiórów
17832	17806	\N	Zalesiczki
17833	17806	\N	Zdania
17834	17806	\N	Żaby
17835	17807	\N	Borki
17836	17807	\N	Borowa
17837	17807	\N	Chrostowa
17838	17807	\N	Ciężkowice
17839	17807	\N	Gidle
17840	17807	\N	Gowarzów
17841	17807	\N	Górka
17842	17807	\N	Górki
17843	17807	\N	Graby
17844	17807	\N	Huby Kotfińskie
17845	17807	\N	Kajetanowice
17846	17807	\N	Kotfin
17847	17807	\N	Ludwików
17848	17807	\N	Michałopol
17849	17807	\N	Młynek
17850	17807	\N	Niesulów
17851	17807	\N	Ojrzeń
17852	17807	\N	Piaski
17853	17807	\N	Pławno
17854	17807	\N	Ruda
17855	17807	\N	Skrzypiec
17856	17807	\N	Stanisławice
17857	17807	\N	Stęszów
17858	17807	\N	Strzała
17859	17807	\N	Włynice
17860	17807	\N	Wojnowice
17861	17807	\N	Wygoda
17862	17807	\N	Zabrodzie
17863	17807	\N	Zagórze
17864	17807	\N	Zielonka
17865	17808	\N	Borowiecko-Kolonia
17866	17808	\N	Chruścin
17867	17808	\N	Chrzanowice
17868	17808	\N	Fryszerka
17869	17808	\N	Gertrudów
17870	17808	\N	Gomunice
17871	17808	\N	Hucisko
17872	17808	\N	Karkoszki
17873	17808	\N	Kletnia
17874	17808	\N	Kocierzowy
17875	17808	\N	Kosówka
17876	17808	\N	Paciorkowizna
17877	17808	\N	Piaszczyce
17878	17808	\N	Pudzików
17879	17808	\N	Słostowice
17880	17808	\N	Wąglin
17881	17808	\N	Wojciechów
17882	17808	\N	Wójcik
17883	17809	\N	Kamieńsk
17884	17809	\N	Aleksandrów
17885	17809	\N	Barczkowice
17886	17809	\N	Danielów
17887	17809	\N	Dąbrowa
17888	17809	\N	Gałkowice Nowe
17889	17809	\N	Gałkowice Stare
17890	17809	\N	Gorzędów
17891	17809	\N	Huby Ruszczyńskie
17892	17809	\N	Huta Porajska
17893	17809	\N	Kmiecizna
17894	17809	\N	Koźniewice
17895	17809	\N	Mościska
17896	17809	\N	Napoleonów
17897	17809	\N	Ochocice
17898	17809	\N	Olszowiec
17899	17809	\N	Ozga
17900	17809	\N	Podjezioro
17901	17809	\N	Politki
17902	17809	\N	Pytowice
17903	17809	\N	Siódemka
17904	17809	\N	Szpinalów
17905	17809	\N	Włodzimierz
17906	17810	\N	Babczów
17907	17810	\N	Biestrzyków Mały
17908	17810	\N	Biestrzyków Wielki
17909	17810	\N	Brzezinki
17910	17810	\N	Cadów
17911	17810	\N	Cadówek
17912	17810	\N	Celina
17913	17810	\N	Cieszątki
17914	17810	\N	Gruszczywie
17915	17810	\N	Huta Drewniana
17916	17810	\N	Jasień
17917	17810	\N	Kajetanówka
17918	17810	\N	Karsy
17919	17810	\N	Katarzynów
17920	17810	\N	Kobiele Małe
17921	17810	\N	Kobiele Wielkie
17922	17810	\N	Łazy
17923	17810	\N	Łowicz
17924	17810	\N	Nadrożna
17925	17810	\N	Orzechów
17926	17810	\N	Orzechówek
17927	17810	\N	Posadówka
17928	17810	\N	Przyborów
17929	17810	\N	Przybyszów
17930	17810	\N	Przydatki Przybyszowskie
17931	17810	\N	Stary Widok
17932	17810	\N	Świerczyny
17933	17810	\N	Tomaszów
17934	17810	\N	Ujazdówek
17935	17810	\N	Wola Rożkowa
17936	17810	\N	Wrony
17937	17810	\N	Zrąbiec
17938	17811	\N	Antoniów
17939	17811	\N	Antopol
17940	17811	\N	Barwinek
17941	17811	\N	Dmenin
17942	17811	\N	Feliksów
17943	17811	\N	Florentynów
17944	17811	\N	Gembartówka
17945	17811	\N	Gosławice
17946	17811	\N	Hamborowa
17947	17811	\N	Józefów
17948	17811	\N	Klizin
17949	17811	\N	Kodrąb
17950	17811	\N	Konradów
17951	17811	\N	Kuźnica
17952	17811	\N	Lipowczyce
17953	17811	\N	Łagiewniki
17954	17811	\N	Rogaszyn
17955	17811	\N	Rzejowice
17956	17811	\N	Smotryszów
17957	17811	\N	Teodorów Mały
17958	17811	\N	Teodorów Wielki
17959	17811	\N	Widawka
17960	17811	\N	Wola Malowana
17961	17811	\N	Wólka Pytowska
17962	17811	\N	Zakrzew
17963	17811	\N	Zalesie
17964	17811	\N	Zapolice
17965	17811	\N	Żencin
17966	17812	\N	Brudzice
17967	17812	\N	Długie
17968	17812	\N	Kolonia Krępa
17969	17812	\N	Kolonia Lgota
17970	17812	\N	Krępa
17971	17812	\N	Krzywanice
17972	17812	\N	Lgota Wielka
17973	17812	\N	Wiewiórów
17974	17812	\N	Wola Blakowa
17975	17812	\N	Woźniki
17976	17813	\N	Adamów
17977	17813	\N	Borki
17978	17813	\N	Brodowe
17979	17813	\N	Jankowice
17980	17813	\N	Jedlno Drugie
17981	17813	\N	Jedlno Pierwsze
17982	17813	\N	Józefów
17983	17813	\N	Kozia Woda
17984	17813	\N	Ludwinów
17985	17813	\N	Ładzice
17986	17813	\N	Radziechowice Drugie
17987	17813	\N	Radziechowice Pierwsze
17988	17813	\N	Stobiecko Szlacheckie
17989	17813	\N	Tomaszów
17990	17813	\N	Wierzbica
17991	17813	\N	Wola Jedlińska
17992	17813	\N	Zakrzówek Szlachecki
17993	17814	\N	Bartodzieje
17994	17814	\N	Borki
17995	17814	\N	Chełmo
17996	17814	\N	Granice
17997	17814	\N	Huta Przerębska
17998	17814	\N	Jaskółki
17999	17814	\N	Kalinki
18000	17814	\N	Kawęczyn
18001	17814	\N	Koconia
18002	17814	\N	Kolonia Przerąb
18003	17814	\N	Korytno
18004	17814	\N	Kraszewice
18005	17814	\N	Krery
18006	17814	\N	Leonów
18007	17814	\N	Łączkowice
18008	17814	\N	Marianka
18009	17814	\N	Masłowice
18010	17814	\N	Ochotnik
18011	17814	\N	Przerąb
18012	17814	\N	Strzelce Małe
18013	17814	\N	Tworowice
18014	17814	\N	Wola Przerębska
18015	17815	\N	Przedbórz
18016	17815	\N	Błoto
18017	17815	\N	Borowa
18018	17815	\N	Brzostek
18019	17815	\N	Budy Nosalewickie
18020	17815	\N	Bysiów
18021	17815	\N	Chałupy
18022	17815	\N	Dawidów
18023	17815	\N	Dziady
18024	17815	\N	Faliszew
18025	17815	\N	Gaj
18026	17815	\N	Gaj Zuzowski
18027	17815	\N	Gepnerów
18028	17815	\N	Góry Mokre
18029	17815	\N	Góry Suche
18030	17815	\N	Grąbla
18031	17815	\N	Grobla
18032	17815	\N	Gustawów
18033	17815	\N	Jabłonna
18034	17815	\N	Józefów
18035	17815	\N	Józefów Stary
18036	17815	\N	Kajetanów
18037	17815	\N	Kaleń
18038	17815	\N	Kolonia Policzko
18039	17815	\N	Koszary
18040	17815	\N	Ludwików
18041	17815	\N	Majdan
18042	17815	\N	Miejskie Pola
18043	17815	\N	Młyny Nosalewickie
18044	17815	\N	Mojżeszów
18045	17815	\N	Nosalewice
18046	17815	\N	Papiernia
18047	17815	\N	Piskorzeniec
18048	17815	\N	Policzko
18049	17815	\N	Posada
18050	17815	\N	Przyłanki
18051	17815	\N	Reczków Stary
18052	17815	\N	Sewerynów
18053	17815	\N	Stara Wieś
18054	17815	\N	Taras
18055	17815	\N	Wierzchlas
18056	17815	\N	Wojciechów
18057	17815	\N	Wola Przedborska
18058	17815	\N	Wygwizdów
18059	17815	\N	Wymysłów
18060	17815	\N	Wyrębiska
18061	17815	\N	Zagacie
18062	17815	\N	Zawodzie
18063	17815	\N	Zuzowy
18064	17815	\N	Żeleźnica
18065	17805	\N	Amelin
18066	17805	\N	Bajkowizna
18067	17805	\N	Bobry
18068	17805	\N	Brylisko
18069	17805	\N	Cerkawizna
18070	17805	\N	Dąbrówka
18071	17805	\N	Dziepółć
18072	17805	\N	Gaj
18073	17805	\N	Grzebień
18074	17805	\N	Kietlin
18075	17805	\N	Klekotowe
18076	17805	\N	Lipie
18077	17805	\N	Okrajszów
18078	17805	\N	Płoszów
18079	17805	\N	Strzałków
18080	17805	\N	Strzałków-Kolonia
18081	17805	\N	Szczepocice Prywatne
18082	17805	\N	Szczepocice Rządowe
18083	17816	\N	Anielin
18084	17816	\N	Błonie
18085	17816	\N	Bogusławów
18086	17816	\N	Borecznica
18087	17816	\N	Goszczowa
18088	17816	\N	Karczów
18089	17816	\N	Kruszyna
18090	17816	\N	Krzętów
18091	17816	\N	Kubiki
18092	17816	\N	Maksymów
18093	17816	\N	Myśliwczów
18094	17816	\N	Niedośpielin
18095	17816	\N	Odrowąż
18096	17816	\N	Popielarnia
18097	17816	\N	Pratkowice
18098	17816	\N	Rogi
18099	17816	\N	Rudka
18100	17816	\N	Sokola Góra
18101	17816	\N	Trzebce
18102	17816	\N	Trzebce-Perzyny
18103	17816	\N	Wielgomłyny
18104	17816	\N	Wola Kuźniewska
18105	17816	\N	Wola Życińska
18106	17816	\N	Wólka Bankowa
18107	17816	\N	Wólka Włościańska
18108	17816	\N	Zagórze
18109	17816	\N	Zalesie
18110	17817	\N	Barycz
18111	17817	\N	Borzykowa
18112	17817	\N	Borzykówka
18113	17817	\N	Brzeziny
18114	17817	\N	Budzów
18115	17817	\N	Bugaj
18116	17817	\N	Ciężkowiczki
18117	17817	\N	Czarny Las
18118	17817	\N	Czech
18119	17817	\N	Czechowiec
18120	17817	\N	Ewina
18121	17817	\N	Ferdynandów
18122	17817	\N	Folwark
18123	17817	\N	Fryszerka
18124	17817	\N	Grodzisko
18125	17817	\N	Ignaców
18126	17817	\N	Jacków
18127	17817	\N	Jatno
18128	17817	\N	Kąty
18129	17817	\N	Kępa
18130	17817	\N	Kolonia Czechowiec
18131	17817	\N	Kozie Pole
18132	17817	\N	Łazów
18133	17817	\N	Magdalenki
18134	17817	\N	Maluszyn
18135	17817	\N	Mała Wieś
18136	17817	\N	Mosty
18137	17817	\N	Nurek
18138	17817	\N	Pągów
18139	17817	\N	Pierzaki
18140	17817	\N	Pławidła
18141	17817	\N	Polichno
18142	17817	\N	Pukarzów
18143	17817	\N	Rędziny
18144	17817	\N	Rogaczówek
18145	17817	\N	Sady
18146	17817	\N	Sekursko
18147	17817	\N	Silnica
18148	17817	\N	Silniczka
18149	17817	\N	Sowin
18150	17817	\N	Sudzin
18151	17817	\N	Sudzinek
18152	17817	\N	Turznia
18153	17817	\N	Wymysłów
18154	17817	\N	Załawie
18155	17817	\N	Żytno
18164	359	\N	Rawa Mazowiecka
18165	359	\N	Biała Rawska
18166	359	\N	Cielądz
18167	359	\N	Regnów
18168	359	\N	Sadkowice
18169	18164	\N	Rawa Mazowiecka
18170	18165	\N	Biała Rawska
18171	18165	\N	Aleksandrów
18172	18165	\N	Antoninów
18173	18165	\N	Babsk
18174	18165	\N	Biała Wieś
18175	18165	\N	Białogórne
18176	18165	\N	Błażejewice
18177	18165	\N	Bronisławów
18178	18165	\N	Byki
18179	18165	\N	Chodnów
18180	18165	\N	Chrząszczew
18181	18165	\N	Chrząszczewek
18182	18165	\N	Dańków
18183	18165	\N	Franklin
18184	18165	\N	Franopol
18185	18165	\N	Galinki
18186	18165	\N	Gołyń
18187	18165	\N	Gośliny
18188	18165	\N	Grzymkowice
18189	18165	\N	Janów
18190	18165	\N	Jelitów
18191	18165	\N	Józefów
18192	18165	\N	Konstantynów
18193	18165	\N	Koprzywna
18194	18165	\N	Krukówka
18195	18165	\N	Lesiew
18196	18165	\N	Marchaty
18197	18165	\N	Marianów
18198	18165	\N	Narty
18199	18165	\N	Niemirowice
18200	18165	\N	Orla Góra
18201	18165	\N	Ossa
18202	18165	\N	Pachy
18203	18165	\N	Pągów
18204	18165	\N	Podlesie
18205	18165	\N	Podsędkowice
18206	18165	\N	Porady Górne
18207	18165	\N	Przyłuski
18208	18165	\N	Rokszyce
18209	18165	\N	Rosławowice
18210	18165	\N	Rzeczków
18211	18165	\N	Słupce
18212	18165	\N	Stanisławów
18213	18165	\N	Stara Wieś
18214	18165	\N	Studzianek
18215	18165	\N	Szczuki
18216	18165	\N	Szwejki Małe
18217	18165	\N	Teodozjów
18218	18165	\N	Tuniki
18219	18165	\N	Wilcze Piętki
18220	18165	\N	Wola-Chojnata
18221	18165	\N	Wólka Babska
18222	18165	\N	Wólka Lesiewska
18223	18165	\N	Zakrzew
18224	18165	\N	Zofianów
18225	18165	\N	Zofiów
18226	18165	\N	Żurawia
18227	18165	\N	Żurawka
18228	18166	\N	Brzozówka
18229	18166	\N	Cielądz
18230	18166	\N	Gortatowice
18231	18166	\N	Grabice
18232	18166	\N	Gułki
18233	18166	\N	Komorów
18234	18166	\N	Kuczyzna
18235	18166	\N	Łaszczyn
18236	18166	\N	Mała Wieś
18237	18166	\N	Mroczkowice
18238	18166	\N	Niemgłowy
18239	18166	\N	Ossowice
18240	18166	\N	Parolice
18241	18166	\N	Sanogoszcz
18242	18166	\N	Sierzchowy
18243	18166	\N	Stolniki
18244	18166	\N	Wisówka
18245	18166	\N	Wylezinek
18246	18166	\N	Zuski
18247	18164	\N	Bogusławki Duże
18248	18164	\N	Bogusławki Małe
18249	18164	\N	Boguszyce
18250	18164	\N	Boguszyce Małe
18251	18164	\N	Byszewice
18252	18164	\N	Chrusty
18253	18164	\N	Dziurdzioły
18254	18164	\N	Gaj
18255	18164	\N	Garłów
18256	18164	\N	Głuchówek
18257	18164	\N	Helenów
18258	18164	\N	Huta Wałowska
18259	18164	\N	Jakubów
18260	18164	\N	Janolin
18261	18164	\N	Julianów
18262	18164	\N	Julianów Raducki
18263	18164	\N	Kaleń
18264	18164	\N	Kaliszki
18265	18164	\N	Konopnica
18266	18164	\N	Księża Wola
18267	18164	\N	Kurzeszyn
18268	18164	\N	Kurzeszynek
18269	18164	\N	Leopoldów
18270	18164	\N	Linków
18271	18164	\N	Lutkówka
18272	18164	\N	Małgorzatów
18273	18164	\N	Matyldów
18274	18164	\N	Niwna
18275	18164	\N	Nowa Rossocha
18276	18164	\N	Nowa Wojska
18277	18164	\N	Nowy Głuchówek
18278	18164	\N	Nowy Kurzeszyn
18279	18164	\N	Pasieka Wałowska
18280	18164	\N	Podlas
18281	18164	\N	Pokrzywna
18282	18164	\N	Przewodowice
18283	18164	\N	Pukinin
18284	18164	\N	Rogówiec
18285	18164	\N	Rossocha
18286	18164	\N	Soszyce
18287	18164	\N	Stara Rossocha
18288	18164	\N	Stara Wojska
18289	18164	\N	Stare Byliny
18290	18164	\N	Stary Dwór
18291	18164	\N	Ścieki
18292	18164	\N	Świnice
18293	18164	\N	Wałowice
18294	18164	\N	Wilkowice
18295	18164	\N	Wołucza
18296	18164	\N	Zagórze
18297	18164	\N	Zarzecze
18298	18164	\N	Zawady
18299	18164	\N	Zielone
18300	18164	\N	Żydomice
18301	18167	\N	Annosław
18302	18167	\N	Kazimierzów
18303	18167	\N	Nowy Regnów
18304	18167	\N	Podskarbice Królewskie
18305	18167	\N	Podskarbice Szlacheckie
18306	18167	\N	Regnów
18307	18167	\N	Rylsk
18308	18167	\N	Rylsk Duży
18309	18167	\N	Rylsk Mały
18310	18167	\N	Sławków
18311	18167	\N	Sowidół
18312	18167	\N	Wólka Strońska
18313	18168	\N	Broniew
18314	18168	\N	Bujały
18315	18168	\N	Celinów
18316	18168	\N	Gacpary
18317	18168	\N	Gogolin
18318	18168	\N	Jajkowice
18319	18168	\N	Kaleń
18320	18168	\N	Kłopoczyn
18321	18168	\N	Lewin
18322	18168	\N	Lipna
18323	18168	\N	Lubania
18324	18168	\N	Lutobory
18325	18168	\N	Nowe Lutobory
18326	18168	\N	Nowe Sadkowice
18327	18168	\N	Nowe Szwejki
18328	18168	\N	Nowy Kaleń
18329	18168	\N	Nowy Kłopoczyn
18330	18168	\N	Olszowa Wola
18331	18168	\N	Paprotnia
18332	18168	\N	Pilawy
18333	18168	\N	Przyłuski
18334	18168	\N	Rokitnica-Kąty
18335	18168	\N	Rudka
18336	18168	\N	Rzymiec
18337	18168	\N	Sadkowice
18338	18168	\N	Skarbkowa
18339	18168	\N	Studzianki
18340	18168	\N	Szwejki Wielkie
18341	18168	\N	Trębaczew
18342	18168	\N	Turobowice
18343	18168	\N	Władysławów
18344	18168	\N	Zabłocie
18345	18168	\N	Zaborze
18346	18168	\N	Żelazna
18347	360	\N	Sieradz
18348	360	\N	Błaszki
18349	360	\N	Brąszewice
18350	360	\N	Brzeźnio
18351	360	\N	Burzenin
18352	360	\N	Goszczanów
18353	360	\N	Klonowa
18354	360	\N	Warta
18355	360	\N	Wróblew
18356	360	\N	Złoczew
18357	18347	\N	Sieradz
18358	18348	\N	Błaszki
18359	18348	\N	Adamki
18360	18348	\N	Borysławice
18361	18348	\N	Brończyn
18362	18348	\N	Brudzew
18363	18348	\N	Brzozowiec
18364	18348	\N	Bukowina
18365	18348	\N	Chabierów
18366	18348	\N	Chociszew
18367	18348	\N	Chrzanowice
18368	18348	\N	Cienia
18369	18348	\N	Domaniew
18370	18348	\N	Garbów
18371	18348	\N	Golków
18372	18348	\N	Gorzałów
18373	18348	\N	Gruszczyce
18374	18348	\N	Grzymaczew
18375	18348	\N	Gzików
18376	18348	\N	Jasionna
18377	18348	\N	Kalinowa
18378	18348	\N	Kamienna-Kolonia
18379	18348	\N	Kamienna-Wieś
18380	18348	\N	Kąśnie
18381	18348	\N	Kije
18382	18348	\N	Kobylniki
18383	18348	\N	Kociołki
18384	18348	\N	Kokoszki
18385	18348	\N	Kołdów
18386	18348	\N	Kopacz
18387	18348	\N	Korzenica
18388	18348	\N	Kostrzewice
18389	18348	\N	Kwasków
18390	18348	\N	Lubanów
18391	18348	\N	Łubna-Jakusy
18392	18348	\N	Łubna-Jarosłaj
18393	18348	\N	Maciszewice
18394	18348	\N	Marianów
18395	18348	\N	Morawki
18396	18348	\N	Mroczki Małe
18397	18348	\N	Nacesławice
18398	18348	\N	Niedoń
18399	18348	\N	Orzeżyn
18400	18348	\N	Pęczek
18401	18348	\N	Romanów
18402	18348	\N	Równa
18403	18348	\N	Sarny
18404	18348	\N	Sędzimirowice
18405	18348	\N	Skalmierz
18406	18348	\N	Smaszków
18407	18348	\N	Stok Nowy
18408	18348	\N	Stok Polski
18409	18348	\N	Sudoły
18410	18348	\N	Suliszewice
18411	18348	\N	Tuwalczew
18412	18348	\N	Wilczkowice
18413	18348	\N	Włocin-Kolonia
18414	18348	\N	Włocin-Wieś
18415	18348	\N	Wojków
18416	18348	\N	Woleń
18417	18348	\N	Wójcice
18418	18348	\N	Wrząca
18419	18348	\N	Zaborów
18420	18348	\N	Zawady
18421	18348	\N	Żelisław
18422	18348	\N	Żelisław-Kolonia
18423	18349	\N	Błota
18424	18349	\N	Brąszewice
18425	18349	\N	Budy
18426	18349	\N	Bukowiec
18427	18349	\N	Chajew
18428	18349	\N	Chajew-Kolonia
18429	18349	\N	Ciołki
18430	18349	\N	Ciupki
18431	18349	\N	Czartoryja
18432	18349	\N	Gałki
18433	18349	\N	Godynice
18434	18349	\N	Grabostaw
18435	18349	\N	Kamieniki
18436	18349	\N	Kosatka
18437	18349	\N	Kurpie
18438	18349	\N	Lisy
18439	18349	\N	Narty
18440	18349	\N	Orły
18441	18349	\N	Pasie
18442	18349	\N	Pędziwiatry
18443	18349	\N	Pipie
18444	18349	\N	Pokrzywniaki
18445	18349	\N	Przedłęcze
18446	18349	\N	Salamony
18447	18349	\N	Sokolenie
18448	18349	\N	Sowizdrzały
18449	18349	\N	Starce
18450	18349	\N	Szczesie
18451	18349	\N	Szymaszki
18452	18349	\N	Tomczyki
18453	18349	\N	Trzcinka
18454	18349	\N	Wiertelaki
18455	18349	\N	Wiry
18456	18349	\N	Wojtyszki
18457	18349	\N	Wólka Klonowska
18458	18349	\N	Zadębieniec
18459	18349	\N	Zagóra
18460	18349	\N	Zagórcze
18461	18349	\N	Złote
18462	18349	\N	Zwierzyniec
18463	18349	\N	Żarnów
18464	18349	\N	Żuraw
18465	18350	\N	Barczew
18466	18350	\N	Bronisławów
18467	18350	\N	Brzeźnio
18468	18350	\N	Dębołęka
18469	18350	\N	Gęsina
18470	18350	\N	Gozdy
18471	18350	\N	Kliczków-Kolonia
18472	18350	\N	Kliczków Mały
18473	18350	\N	Kliczków Wielki
18474	18350	\N	Krzaki
18475	18350	\N	Lipno
18476	18350	\N	Nowa Wieś
18477	18350	\N	Ostrów
18478	18350	\N	Podcabaje
18479	18350	\N	Próba
18480	18350	\N	Pustelnik
18481	18350	\N	Pyszków
18482	18350	\N	Rembów
18483	18350	\N	Ruszków
18484	18350	\N	Rybnik
18485	18350	\N	Rydzew
18486	18350	\N	Stefanów Barczewski Drugi
18487	18350	\N	Stefanów Barczewski Pierwszy
18488	18350	\N	Stefanów Ruszkowski
18489	18350	\N	Tumidaj
18490	18350	\N	Wierzbowa
18491	18350	\N	Wola Brzeźniowska
18492	18350	\N	Zapole
18493	18350	\N	Złotowizna
18494	18351	\N	Antonin
18495	18351	\N	Będków
18496	18351	\N	Biadaczew
18497	18351	\N	Brzeźnica
18498	18351	\N	Burzenin
18499	18351	\N	Działy
18500	18351	\N	Grabówka
18501	18351	\N	Gronów
18502	18351	\N	Jarocice
18503	18351	\N	Kamilew
18504	18351	\N	Kamionka
18505	18351	\N	Kolonia Niechmirów
18506	18351	\N	Kopanina
18507	18351	\N	Krępica
18508	18351	\N	Ligota
18509	18351	\N	Majaczewice
18510	18351	\N	Marianów
18511	18351	\N	Niechmirów
18512	18351	\N	Nieczuj
18513	18351	\N	Prażmów
18514	18351	\N	Redzeń Drugi
18515	18351	\N	Redzeń Pierwszy
18516	18351	\N	Ręszew
18517	18351	\N	Rokitowiec
18518	18351	\N	Sambórz
18519	18351	\N	Strumiany
18520	18351	\N	Strzałki
18521	18351	\N	Szczawno
18522	18351	\N	Świerki
18523	18351	\N	Tyczyn
18524	18351	\N	Waszkowskie
18525	18351	\N	Witów
18526	18351	\N	Wola Będkowska
18527	18351	\N	Wola Majacka
18528	18351	\N	Wolnica Grabowska
18529	18351	\N	Wolnica Niechmirowska
18530	18352	\N	Chlewo
18531	18352	\N	Chwalęcice
18532	18352	\N	Czerniaków
18533	18352	\N	Gawłowice
18534	18352	\N	Goszczanów
18535	18352	\N	Karolina
18536	18352	\N	Kaszew
18537	18352	\N	Klonów
18538	18352	\N	Lipicze Górne
18539	18352	\N	Lipicze Olendry
18540	18352	\N	Lipicze W
18541	18352	\N	Poniatów
18542	18352	\N	Poniatówek
18543	18352	\N	Poprężniki
18544	18352	\N	Poradzew
18545	18352	\N	Rzężawy
18546	18352	\N	Sokołów
18547	18352	\N	Stojanów
18548	18352	\N	Strachanów
18549	18352	\N	Sulmów
18550	18352	\N	Sulmówek
18551	18352	\N	Świnice Kaliskie
18552	18352	\N	Wacławów
18553	18352	\N	Waliszewice
18554	18352	\N	Wilczków
18555	18352	\N	Wilkszyce
18556	18352	\N	Wola Tłomakowa
18557	18352	\N	Wójcinek
18558	18352	\N	Wroniawy
18559	18352	\N	Ziemięcin
18560	18353	\N	Górka Klonowska
18561	18353	\N	Górka Klonowska-Kolonia
18562	18353	\N	Grzyb
18563	18353	\N	Kiełbasy
18564	18353	\N	Klonowa
18565	18353	\N	Klonówka
18566	18353	\N	Kuźnica Błońska
18567	18353	\N	Kuźnica Zagrzebska
18568	18353	\N	Kuźnica Zagrzebska-Kolonia
18569	18353	\N	Kuźniczka
18570	18353	\N	Leliwa
18571	18353	\N	Lesiaki
18572	18353	\N	Lipicze
18573	18353	\N	Liski
18574	18353	\N	Morasy
18575	18353	\N	Owieczki
18576	18353	\N	Pawelce
18577	18353	\N	Sowizdrzały
18578	18353	\N	Świątki
18579	18353	\N	Uników Kapitulny
18580	18347	\N	Biskupice
18581	18347	\N	Bobrowniki
18582	18347	\N	Bogumiłów
18583	18347	\N	Borzewisko
18584	18347	\N	Budziczna
18585	18347	\N	Chałupki
18586	18347	\N	Charłupia Mała
18587	18347	\N	Chojne
18588	18347	\N	Czartki
18589	18347	\N	Dąbrowa Wielka
18590	18347	\N	Dąbrówka
18591	18347	\N	Dębina
18592	18347	\N	Dzierlin
18593	18347	\N	Dzigorzew
18594	18347	\N	Grabowiec
18595	18347	\N	Grądy
18596	18347	\N	Jeziory
18597	18347	\N	Kamionaczyk
18598	18347	\N	Kłocko
18599	18347	\N	Kolasa
18600	18347	\N	Kowale
18601	18347	\N	Kuśnie
18602	18347	\N	Łosieniec
18603	18347	\N	Męcka Wola
18604	18347	\N	Mnichów
18605	18347	\N	Mokre Zborowskie
18606	18347	\N	Monice
18607	18347	\N	Okręglica
18608	18347	\N	Podłężyce
18609	18347	\N	Ruda
18610	18347	\N	Rzechta
18611	18347	\N	Sokołów
18612	18347	\N	Stawiszcze
18613	18347	\N	Stoczki
18614	18347	\N	Sucha
18615	18347	\N	Wiechucice
18616	18347	\N	Wojciechów
18617	18347	\N	Woźniki
18618	18354	\N	Warta
18619	18354	\N	Augustynów
18620	18354	\N	Bartochów
18621	18354	\N	Baszków
18622	18354	\N	Borek Lipiński
18623	18354	\N	Cielce
18624	18354	\N	Czartki
18625	18354	\N	Duszniki
18626	18354	\N	Dzierzązna
18627	18354	\N	Gać Warcka
18628	18354	\N	Glinno
18629	18354	\N	Głaniszew
18630	18354	\N	Gołuchy
18631	18354	\N	Góra
18632	18354	\N	Grabinka
18633	18354	\N	Grzybki
18634	18354	\N	Jakubice
18635	18354	\N	Jeziorsko
18636	18354	\N	Józefka
18637	18354	\N	Józefów-Wiktorów
18638	18354	\N	Kamionacz
18639	18354	\N	Kamionacz Poduchowny
18640	18354	\N	Kawęczynek
18641	18354	\N	Klonówek
18642	18354	\N	Krąków
18643	18354	\N	Lasek
18644	18354	\N	Lipiny
18645	18354	\N	Łabędzie
18646	18354	\N	Małków
18647	18354	\N	Maszew
18648	18354	\N	Miedze
18649	18354	\N	Miedźno
18650	18354	\N	Mikołajewice
18651	18354	\N	Mogilno
18652	18354	\N	Nobela
18653	18354	\N	Ostrów Warcki
18654	18354	\N	Pierzchnia Góra
18655	18354	\N	Piotrowice
18656	18354	\N	Proboszczowice
18657	18354	\N	Raczków
18658	18354	\N	Raszelki
18659	18354	\N	Rossoszyca
18660	18354	\N	Rożdżały
18661	18354	\N	Socha
18662	18354	\N	Socha-Kolonia
18663	18354	\N	Tądów Dolny
18664	18354	\N	Tądów Górny
18665	18354	\N	Tomisławice
18666	18354	\N	Upuszczew
18667	18354	\N	Ustków
18668	18354	\N	Witów
18669	18354	\N	Włyń
18670	18354	\N	Wola Miłkowska
18671	18354	\N	Wola Zadąbrowska
18672	18354	\N	Zadąbrowie-Rudunek
18673	18354	\N	Zadąbrowie-Wiatraczyska
18674	18354	\N	Zagajew
18675	18354	\N	Zakrzew
18676	18354	\N	Zaspy
18677	18354	\N	Zielęcin
18678	18355	\N	Bliźniew
18679	18355	\N	Charłupia Wielka
18680	18355	\N	Dąbrówka
18681	18355	\N	Drzązna
18682	18355	\N	Dziebędów
18683	18355	\N	Gaj
18684	18355	\N	Gęsówka
18685	18355	\N	Inczew
18686	18355	\N	Józefów
18687	18355	\N	Kobierzycko
18688	18355	\N	Kościerzyn
18689	18355	\N	Krzakowizna
18690	18355	\N	Ocin
18691	18355	\N	Oraczew
18692	18355	\N	Oraczew Mały
18693	18355	\N	Orzeł Biały
18694	18355	\N	Próchna
18695	18355	\N	Rakowice
18696	18355	\N	Rowy
18697	18355	\N	Sadokrzyce
18698	18355	\N	Sędzice
18699	18355	\N	Słomków Mokry
18700	18355	\N	Słomków Suchy
18701	18355	\N	Smardzew
18702	18355	\N	Tubądzin
18703	18355	\N	Tworkowizna
18704	18355	\N	Tworkowizna Oraczewska
18705	18355	\N	Wągłczew
18706	18355	\N	Wągłczew-Kolonia
18707	18355	\N	Wróblew
18708	18356	\N	Złoczew
18709	18356	\N	Biesiec
18710	18356	\N	Borzęckie
18711	18356	\N	Broszki
18712	18356	\N	Bujnów
18713	18356	\N	Czarna
18714	18356	\N	Dąbrowa Miętka
18715	18356	\N	Emilianów
18716	18356	\N	Gronówek
18717	18356	\N	Grójec Mały
18718	18356	\N	Grójec Wielki
18719	18356	\N	Kamasze
18720	18356	\N	Łagiewniki
18721	18356	\N	Łeszczyn
18722	18356	\N	Miklesz
18723	18356	\N	Pieczyska
18724	18356	\N	Potok
18725	18356	\N	Przylepka
18726	18356	\N	Robaszew
18727	18356	\N	Stanisławów
18728	18356	\N	Stolec
18729	18356	\N	Szklana Huta
18730	18356	\N	Uników
18731	18356	\N	Uników Poduchowny
18732	18356	\N	Wandalin
18733	18356	\N	Wilkołek Grójecki
18734	18356	\N	Wilkołek Unikowski
18735	18356	\N	Zapowiednik
18736	374	\N	Bolimów
18737	374	\N	Głuchów
18738	374	\N	Godzianów
18739	374	\N	Kowiesy
18740	374	\N	Lipce Reymontowskie
18741	374	\N	Maków
18742	374	\N	Nowy Kawęczyn
18743	374	\N	Skierniewice
18744	374	\N	Słupia
18745	18736	\N	Bolimowska Wieś
18746	18736	\N	Bolimów
18747	18736	\N	Humin
18748	18736	\N	Humin-Dobra Ziemskie
18749	18736	\N	Jasionna
18750	18736	\N	Joachimów-Mogiły
18751	18736	\N	Józefów
18752	18736	\N	Kęszyce-Wieś
18753	18736	\N	Kolonia Bolimowska-Wieś
18754	18736	\N	Kolonia Wola Szydłowiecka
18755	18736	\N	Kurabka
18756	18736	\N	Łasieczniki
18757	18736	\N	Nowe Kęszyce
18758	18736	\N	Podsokołów
18759	18736	\N	Sierzchów
18760	18736	\N	Sokołów
18761	18736	\N	Wola Szydłowiecka
18762	18736	\N	Wólka Łasiecka
18763	18736	\N	Ziąbki
18764	18736	\N	Ziemiary
18765	18737	\N	Białynin
18766	18737	\N	Białynin-Latków
18767	18737	\N	Białynin-Podbór
18768	18737	\N	Białynin-Południe
18769	18737	\N	Borysław
18770	18737	\N	Celigów
18771	18737	\N	Głuchów
18772	18737	\N	Janisławice
18773	18737	\N	Jasień
18774	18737	\N	Kochanów
18775	18737	\N	Michowice
18776	18737	\N	Miłochniewice
18777	18737	\N	Prusy
18778	18737	\N	Reczul
18779	18737	\N	Skoczykłody
18780	18737	\N	Wysokienice
18781	18737	\N	Złota
18782	18738	\N	Byczki
18783	18738	\N	Godzianów
18784	18738	\N	Kawęczyn
18785	18738	\N	Lnisno
18786	18738	\N	Płyćwia
18787	18738	\N	Zapady
18788	18739	\N	Borszyce
18789	18739	\N	Budy Chojnackie
18790	18739	\N	Chełmce
18791	18739	\N	Chojnata
18792	18739	\N	Chojnatka
18793	18739	\N	Chrzczonowice
18794	18739	\N	Franciszków
18795	18739	\N	Huta Zawadzka
18796	18739	\N	Jakubów
18797	18739	\N	Janów
18798	18739	\N	Jeruzal
18799	18739	\N	Kowiesy
18800	18739	\N	Lisna
18801	18739	\N	Michałowice
18802	18739	\N	Nowy Lindów
18803	18739	\N	Nowy Wylezin
18804	18739	\N	Paplin
18805	18739	\N	Paplinek
18806	18739	\N	Pękoszew
18807	18739	\N	Stary Wylezin
18808	18739	\N	Turowa Wola
18809	18739	\N	Ulaski
18810	18739	\N	Wędrogów
18811	18739	\N	Wola Pękoszewska
18812	18739	\N	Wólka Jeruzalska
18813	18739	\N	Wycinka Wolska
18814	18739	\N	Wymysłów
18815	18739	\N	Zawady
18816	18740	\N	Chlebów
18817	18740	\N	Drzewce
18818	18740	\N	Lipce Reymontowskie
18819	18740	\N	Mszadla
18820	18740	\N	Retniowiec
18821	18740	\N	Siciska
18822	18740	\N	Wola Drzewiecka
18823	18740	\N	Wólka Krosnowska
18824	18740	\N	Wólka Podlesie
18825	18741	\N	Dąbrowice
18826	18741	\N	Jacochów
18827	18741	\N	Krężce
18828	18741	\N	Maków
18829	18741	\N	Maków-Kolonia
18830	18741	\N	Pszczonów
18831	18741	\N	Sielce Lewe
18832	18741	\N	Sielce Prawe
18833	18741	\N	Słomków
18834	18741	\N	Święte Laski
18835	18741	\N	Święte Nowaki
18836	18741	\N	Wola Makowska
18837	18742	\N	Adamów
18838	18742	\N	Budy Trzcińskie
18839	18742	\N	Doleck
18840	18742	\N	Dukaczew
18841	18742	\N	Dzwonkowice
18842	18742	\N	Esterka
18843	18742	\N	Franciszkany
18844	18742	\N	Helenków
18845	18742	\N	Kaczorów
18846	18742	\N	Kawęczyn B
18847	18742	\N	Kazimierzów
18848	18742	\N	Kolonia Starorawska
18849	18742	\N	Kwasowiec
18850	18742	\N	Marianka
18851	18742	\N	Marianów
18852	18742	\N	Nowa Trzcianna
18853	18742	\N	Nowy Dwór
18854	18742	\N	Nowy Dwór-Parcela
18855	18742	\N	Nowy Kawęczyn
18856	18742	\N	Nowy Rzędków
18857	18742	\N	Podfranciszkany
18858	18742	\N	Podstrobów
18859	18742	\N	Podtrzcianna
18860	18742	\N	Prandotów
18861	18742	\N	Psary
18862	18742	\N	Raducz
18863	18742	\N	Rawiczów
18864	18742	\N	Rzędków
18865	18742	\N	Sewerynów
18866	18742	\N	Stara Rawa
18867	18742	\N	Stary Rzędków
18868	18742	\N	Strzyboga
18869	18742	\N	Suliszew
18870	18742	\N	Trzcianna
18871	18742	\N	Zglinna Duża
18872	18742	\N	Zglinna Mała
18873	18743	\N	Balcerów
18874	18743	\N	Borowiny
18875	18743	\N	Brzozów
18876	18743	\N	Budy Grabskie
18877	18743	\N	Dąbrowice
18878	18743	\N	Dębowa Góra
18879	18743	\N	Józefatów
18880	18743	\N	Julków
18881	18743	\N	Ludwików
18882	18743	\N	Miedniewice
18883	18743	\N	Mokra
18884	18743	\N	Mokra Lewa
18885	18743	\N	Mokra Prawa
18886	18743	\N	Nowe Rowiska
18887	18743	\N	Nowy Ludwików
18888	18743	\N	Pamiętna
18889	18743	\N	Pruszków
18890	18743	\N	Ruda
18891	18743	\N	Rzeczków
18892	18743	\N	Rzymiec
18893	18743	\N	Samice
18894	18743	\N	Sierakowice Lewe
18895	18743	\N	Sierakowice Prawe
18896	18743	\N	Stare Rowiska
18897	18743	\N	Strobów
18898	18743	\N	Topola
18899	18743	\N	Wola Wysoka
18900	18743	\N	Wólka Strobowska
18901	18743	\N	Zalesie
18902	18743	\N	Żelazna
18903	18743	\N	Żelazna-Majątek
18904	18743	\N	Skierniewice
18905	18744	\N	Bonarów
18906	18744	\N	Gzów
18907	18744	\N	Krosnowa
18908	18744	\N	Marianów
18909	18744	\N	Modła
18910	18744	\N	Nowa Krosnowa
18911	18744	\N	Podłęcze
18912	18744	\N	Słupia
18913	18744	\N	Winna Góra
18914	18744	\N	Wólka-Nazdroje
18915	18744	\N	Zagórze
18916	361	\N	Tomaszów Mazowiecki
18917	361	\N	Będków
18918	361	\N	Budziszewice
18919	361	\N	Czerniewice
18920	361	\N	Inowłódz
18921	361	\N	Lubochnia
18922	361	\N	Rokiciny
18923	361	\N	Rzeczyca
18924	361	\N	Ujazd
18925	361	\N	Żelechlinek
18926	18916	\N	Tomaszów Mazowiecki
18927	18917	\N	Będków
18928	18917	\N	Będków-Kolonia
18929	18917	\N	Brzustów
18930	18917	\N	Ceniawy
18931	18917	\N	Drzazgowa Wola
18932	18917	\N	Ewcin
18933	18917	\N	Gutków
18934	18917	\N	Kalinów
18935	18917	\N	Łaknarz
18936	18917	\N	Magdalenka
18937	18917	\N	Nowiny
18938	18917	\N	Prażki
18939	18917	\N	Remiszewice
18940	18917	\N	Rosocha
18941	18917	\N	Rudnik
18942	18917	\N	Rzeczków
18943	18917	\N	Sługocice
18944	18917	\N	Teodorów
18945	18917	\N	Wykno
18946	18917	\N	Zacharz
18947	18918	\N	Adamów
18948	18918	\N	Agnopol
18949	18918	\N	Antolin
18950	18918	\N	Budziszewice
18951	18918	\N	Helenów
18952	18918	\N	Józefów Stary
18953	18918	\N	Mierzno
18954	18918	\N	Nepomucenów
18955	18918	\N	Nowe Mierzno
18956	18918	\N	Nowy Józefów
18957	18918	\N	Nowy Rękawiec
18958	18918	\N	Rękawiec
18959	18918	\N	Teodorów
18960	18918	\N	Walentynów
18961	18918	\N	Węgrzynowice
18962	18918	\N	Węgrzynowice-Modrzewie
18963	18918	\N	Zalesie
18964	18919	\N	Annopol Duży
18965	18919	\N	Annopol Mały
18966	18919	\N	Annów
18967	18919	\N	Chociw
18968	18919	\N	Chociwek
18969	18919	\N	Czerniewice
18970	18919	\N	Dąbrówka
18971	18919	\N	Dzielnica
18972	18919	\N	Gaj
18973	18919	\N	Helenów
18974	18919	\N	Józefów
18975	18919	\N	Krzemienica
18976	18919	\N	Lechów
18977	18919	\N	Lipie
18978	18919	\N	Mała Wola
18979	18919	\N	Nowa Strzemeszna
18980	18919	\N	Nowe Studzianki
18981	18919	\N	Paulinów
18982	18919	\N	Podkonice Duże
18983	18919	\N	Podkonice Małe
18984	18919	\N	Podkonice Miejskie
18985	18919	\N	Podkońska Wola
18986	18919	\N	Stanisławów Lipski
18987	18919	\N	Stanisławów Studziński
18988	18919	\N	Strzemeszna
18989	18919	\N	Strzemeszna Pierwsza
18990	18919	\N	Studzianki
18991	18919	\N	Teodozjów
18992	18919	\N	Turobów
18993	18919	\N	Wale
18994	18919	\N	Wielka Wola
18995	18919	\N	Wólka Jagielczyńska
18996	18919	\N	Zagóry
18997	18919	\N	Zubki Duże
18998	18919	\N	Zubki Małe
18999	18920	\N	Brzustów
19000	18920	\N	Dąbrowa
19001	18920	\N	Inowłódz
19002	18920	\N	Konewka
19003	18920	\N	Królowa Wola
19004	18920	\N	Liciążna
19005	18920	\N	Poświętne
19006	18920	\N	Spała
19007	18920	\N	Teofilów
19008	18920	\N	Zakościele
19009	18920	\N	Żądłowice
19010	18921	\N	Albertów
19011	18921	\N	Brenica
19012	18921	\N	Chrzemce
19013	18921	\N	Cygan
19014	18921	\N	Czółna
19015	18921	\N	Dąbrowa
19016	18921	\N	Dębniak
19017	18921	\N	Emilianów
19018	18921	\N	Glinnik
19019	18921	\N	Henryków
19020	18921	\N	Jakubów
19021	18921	\N	Jasień
19022	18921	\N	Kierz
19023	18921	\N	Kochanów
19024	18921	\N	Kruszewiec
19025	18921	\N	Lubochenek
19026	18921	\N	Lubochnia
19027	18921	\N	Lubochnia-Górki
19028	18921	\N	Luboszewy
19029	18921	\N	Małecz
19030	18921	\N	Marianka
19031	18921	\N	Nowy Glinnik
19032	18921	\N	Nowy Jasień
19033	18921	\N	Olszowiec
19034	18921	\N	Rzekietka
19035	18921	\N	Szczurek
19036	18921	\N	Tarnowska Wola
19037	18922	\N	Albertów
19038	18922	\N	Cisów
19039	18922	\N	Eminów
19040	18922	\N	Janinów
19041	18922	\N	Janków
19042	18922	\N	Jankówek
19043	18922	\N	Janków Trzeci
19044	18922	\N	Kolonia Łaznów
19045	18922	\N	Łaznowska Wola
19046	18922	\N	Łaznów
19047	18922	\N	Łaznówek
19048	18922	\N	Maksymilianów
19049	18922	\N	Michałów
19050	18922	\N	Mikołajów
19051	18922	\N	Nowe Chrusty
19052	18922	\N	Pogorzałe Ługi
19053	18922	\N	Popielawy
19054	18922	\N	Reginów
19055	18922	\N	Rokiciny
19056	18922	\N	Rokiciny-Kolonia
19057	18922	\N	Stare Chrusty
19058	18922	\N	Stefanów
19059	18922	\N	Wilkucice Duże
19060	18922	\N	Wilkucice Małe
19061	18923	\N	Bartoszówka
19062	18923	\N	Bobrowiec
19063	18923	\N	Brzeg
19064	18923	\N	Brzeziny
19065	18923	\N	Brzozów
19066	18923	\N	Glina
19067	18923	\N	Grotowice
19068	18923	\N	Gustawów
19069	18923	\N	Jeziorzec
19070	18923	\N	Kanice
19071	18923	\N	Kawęczyn
19072	18923	\N	Lubocz
19073	18923	\N	Łęg
19074	18923	\N	Poniatówka
19075	18923	\N	Roszkowa Wola
19076	18923	\N	Rzeczyca
19077	18923	\N	Sadykierz
19078	18923	\N	Stanisławów
19079	18923	\N	Tłumy
19080	18923	\N	Wiechnowice
19081	18923	\N	Zawady
19082	18916	\N	Cekanów
19083	18916	\N	Chorzęcin
19084	18916	\N	Ciebłowice Duże
19085	18916	\N	Ciebłowice Małe
19086	18916	\N	Dąbrowa
19087	18916	\N	Godaszewice
19088	18916	\N	Jadwigów
19089	18916	\N	Karolinów
19090	18916	\N	Kolonia Zawada
19091	18916	\N	Komorów
19092	18916	\N	Kwiatkówka
19093	18916	\N	Łagiewniki
19094	18916	\N	Łazisko
19095	18916	\N	Niebrów
19096	18916	\N	Sługocice
19097	18916	\N	Smardzewice
19098	18916	\N	Swolszewice Małe
19099	18916	\N	Świńsko
19100	18916	\N	Tresta
19101	18916	\N	Twarda
19102	18916	\N	Wąwał
19103	18916	\N	Wiaderno
19104	18916	\N	Zaborów Drugi
19105	18916	\N	Zaborów Pierwszy
19106	18916	\N	Zawada
19107	18924	\N	Aleksandrów
19108	18924	\N	Bielina
19109	18924	\N	Bronisławów
19110	18924	\N	Buków
19111	18924	\N	Buków-Parcel
19112	18924	\N	Ciosny
19113	18924	\N	Dębniak
19114	18924	\N	Helenów
19115	18924	\N	Józefin
19116	18924	\N	Józefów
19117	18924	\N	Kolonia Dębniak
19118	18924	\N	Kolonia Olszowa
19119	18924	\N	Kolonia Ujazd
19120	18924	\N	Konstancin
19121	18924	\N	Leszczyny
19122	18924	\N	Lipianki
19123	18924	\N	Łączkowice
19124	18924	\N	Łominy
19125	18924	\N	Maksymów
19126	18924	\N	Marszew
19127	18924	\N	Młynek
19128	18924	\N	Niewiadów
19129	18924	\N	Ojrzanów
19130	18924	\N	Olszowa
19131	18924	\N	Olszowa-Piaski
19132	18924	\N	Osiedle Niewiadów
19133	18924	\N	Przesiadłów
19134	18924	\N	Sangrodz
19135	18924	\N	Skrzynki
19136	18924	\N	Stasiolas
19137	18924	\N	Szymanów
19138	18924	\N	Teklów
19139	18924	\N	Tobiasze
19140	18924	\N	Ujazd
19141	18924	\N	Władysławów
19142	18924	\N	Wólka Krzykowska
19143	18924	\N	Wygoda
19144	18924	\N	Wykno
19145	18924	\N	Zaosie
19146	18924	\N	Zaosie-Bronisławów
19147	18924	\N	Zaosie-Mącznik
19148	18925	\N	Brenik
19149	18925	\N	Budki Łochowskie
19150	18925	\N	Bukowiec
19151	18925	\N	Chociszew
19152	18925	\N	Czechowice
19153	18925	\N	Czerwonka
19154	18925	\N	Dzielnica
19155	18925	\N	Feliksów
19156	18925	\N	Gawerków
19157	18925	\N	Gutkowice
19158	18925	\N	Gutkowice-Nowiny
19159	18925	\N	Ignatów
19160	18925	\N	Janów
19161	18925	\N	Józefin
19162	18925	\N	Julianów
19163	18925	\N	Karolinów
19164	18925	\N	Kopiec
19165	18925	\N	Lesisko
19166	18925	\N	Lucjanów
19167	18925	\N	Łochów
19168	18925	\N	Łochów Nowy
19169	18925	\N	Modrzewek
19170	18925	\N	Naropna
19171	18925	\N	Nowe Byliny
19172	18925	\N	Nowiny
19173	18925	\N	Petrynów
19174	18925	\N	Radwanka
19175	18925	\N	Sabinów
19176	18925	\N	Sokołówka
19177	18925	\N	Stanisławów
19178	18925	\N	Staropole
19179	18925	\N	Świniokierz Dworski
19180	18925	\N	Świniokierz Włościański
19181	18925	\N	Teklin
19182	18925	\N	Władysławów
19183	18925	\N	Wola Naropińska
19184	18925	\N	Wolica
19185	18925	\N	Żelechlin
19186	18925	\N	Żelechlinek
19187	362	\N	Biała
19188	362	\N	Czarnożyły
19189	362	\N	Konopnica
19190	362	\N	Mokrsko
19191	362	\N	Osjaków
19192	362	\N	Ostrówek
19193	362	\N	Pątnów
19194	362	\N	Skomlin
19195	362	\N	Wieluń
19196	362	\N	Wierzchlas
19197	19187	\N	Biała Druga
19198	19187	\N	Biała-Kopiec
19199	19187	\N	Biała-Parcela
19200	19187	\N	Biała Pierwsza
19201	19187	\N	Biała Rządowa
19202	19187	\N	Bronisławów
19203	19187	\N	Brzoza
19204	19187	\N	Dębina
19205	19187	\N	Góry Świątkowskie
19206	19187	\N	Huby
19207	19187	\N	Janowiec
19208	19187	\N	Klapka
19209	19187	\N	Kopydłów
19210	19187	\N	Kopydłówek
19211	19187	\N	Koryta
19212	19187	\N	Łyskornia
19213	19187	\N	Młynisko
19214	19187	\N	Naramice
19215	19187	\N	Pieńki
19216	19187	\N	Poręby
19217	19187	\N	Przychody
19218	19187	\N	Radomina
19219	19187	\N	Rososz
19220	19187	\N	Śmiecheń
19221	19187	\N	Wiktorów
19222	19187	\N	Zabłocie
19223	19187	\N	Biała
19224	19188	\N	Czarnożyły
19225	19188	\N	Działy
19226	19188	\N	Emanuelina
19227	19188	\N	Gromadzice
19228	19188	\N	Kąty
19229	19188	\N	Leniszki
19230	19188	\N	Łagiewniki
19231	19188	\N	Opojowice
19232	19188	\N	Platoń
19233	19188	\N	Raczyn
19234	19188	\N	Staw
19235	19188	\N	Stawek
19236	19188	\N	Teklina
19237	19188	\N	Wydrzyn
19238	19189	\N	Anielin
19239	19189	\N	Bębnów
19240	19189	\N	Głuchów
19241	19189	\N	Kamyk
19242	19189	\N	Konopnica
19243	19189	\N	Mała Wieś
19244	19189	\N	Piaski
19245	19189	\N	Rychłocice
19246	19189	\N	Sabinów
19247	19189	\N	Strobin
19248	19189	\N	Szynkielów
19249	19189	\N	Wrońsko
19250	19190	\N	Brzeziny
19251	19190	\N	Chotów
19252	19190	\N	Dobijacz
19253	19190	\N	Jasna Góra
19254	19190	\N	Jeziorko
19255	19190	\N	Kocilew
19256	19190	\N	Komorniki
19257	19190	\N	Krzyworzeka
19258	19190	\N	Lasek
19259	19190	\N	Lipie
19260	19190	\N	Mątewki
19261	19190	\N	Mokrsko
19262	19190	\N	Mokrsko-Osiedle
19263	19190	\N	Mokrsko Rządowe
19264	19190	\N	Morzykobyła
19265	19190	\N	Motyl
19266	19190	\N	Orzechowiec
19267	19190	\N	Ożarów
19268	19190	\N	Ożarów-Towarzystwo
19269	19190	\N	Plewina
19270	19190	\N	Poręby
19271	19190	\N	Sakrajda
19272	19190	\N	Sikornik
19273	19190	\N	Słoniny
19274	19190	\N	Słupsko
19275	19190	\N	Stanisławów
19276	19190	\N	Zmyślona
19277	19191	\N	Borki Walkowskie
19278	19191	\N	Chorzyna
19279	19191	\N	Czernice
19280	19191	\N	Dębina
19281	19191	\N	Dolina Czernicka
19282	19191	\N	Drobnice
19283	19191	\N	Felinów
19284	19191	\N	Gabrielów
19285	19191	\N	Huta Czernicka
19286	19191	\N	Jasień
19287	19191	\N	Józefina
19288	19191	\N	Kajdas
19289	19191	\N	Kolonia Raducka
19290	19191	\N	Krzętle
19291	19191	\N	Kuźnica Ługowska
19292	19191	\N	Kuźnica Strobińska
19293	19191	\N	Nowa Wieś
19294	19191	\N	Osjaków
19295	19191	\N	Piskornik Czernicki
19296	19191	\N	Raducki Folwark
19297	19191	\N	Raduczyce
19298	19191	\N	Stanisławów
19299	19191	\N	Walków
19300	19191	\N	Zofia
19301	19192	\N	Bolków
19302	19192	\N	Dębiec
19303	19192	\N	Dębiec-Kolonia
19304	19192	\N	Dymek
19305	19192	\N	Górne
19306	19192	\N	Gwizdałki
19307	19192	\N	Jackowskie
19308	19192	\N	Janów
19309	19192	\N	Kopiec
19310	19192	\N	Koźlin
19311	19192	\N	Kuźnica
19312	19192	\N	Marynka
19313	19192	\N	Milejów
19314	19192	\N	Niemierzyn
19315	19192	\N	Nietuszyna
19316	19192	\N	Okalew
19317	19192	\N	Oleśnica
19318	19192	\N	Ostrówek
19319	19192	\N	Piskornik
19320	19192	\N	Raczyńskie
19321	19192	\N	Rudlice
19322	19192	\N	Skrzynno
19323	19192	\N	Staropole
19324	19192	\N	Ugoda-Niemierzyn
19325	19192	\N	Wielgie
19326	19192	\N	Wola Rudlicka
19327	19193	\N	Bieniec
19328	19193	\N	Budziaki
19329	19193	\N	Bukowce
19330	19193	\N	Cieśle
19331	19193	\N	Cisowa
19332	19193	\N	Dzietrzniki
19333	19193	\N	Gligi
19334	19193	\N	Grabowa
19335	19193	\N	Grębień
19336	19193	\N	Józefów
19337	19193	\N	Kałuże
19338	19193	\N	Kamionka
19339	19193	\N	Kępowizna
19340	19193	\N	Kluski
19341	19193	\N	Kubery
19342	19193	\N	Madeły
19343	19193	\N	Pątnów
19344	19193	\N	Popowice
19345	19193	\N	Stara Wieś
19346	19193	\N	Troniny
19347	19193	\N	Załęcze Małe
19348	19193	\N	Załęcze Wielkie
19349	19193	\N	Zamłynie
19350	19193	\N	Źródła
19351	19194	\N	Bojanów
19352	19194	\N	Brzeziny
19353	19194	\N	Kazimierz
19354	19194	\N	Klasak Duży
19355	19194	\N	Klasak Mały
19356	19194	\N	Królewska Grobla
19357	19194	\N	Malinówka
19358	19194	\N	Maręże
19359	19194	\N	Skomlin
19360	19194	\N	Smugi
19361	19194	\N	Toplin
19362	19194	\N	Walenczyzna
19363	19194	\N	Wichernik
19364	19194	\N	Wróblew
19365	19194	\N	Zadole
19366	19194	\N	Zbęk
19367	19194	\N	Złota Góra
19368	19195	\N	Wieluń
19369	19195	\N	Bieniądzice
19370	19195	\N	Borowiec
19371	19195	\N	Chodaki
19372	19195	\N	Dąbrowa
19373	19195	\N	Gaszyn
19374	19195	\N	Grodzisko
19375	19195	\N	Jodłowiec
19376	19195	\N	Kadłub
19377	19195	\N	Klusiny
19378	19195	\N	Kurów
19379	19195	\N	Małyszyn
19380	19195	\N	Małyszynek
19381	19195	\N	Masłowice
19382	19195	\N	Mokrosze
19383	19195	\N	Nowy Świat
19384	19195	\N	Olewin
19385	19195	\N	Piaski
19386	19195	\N	Ruda
19387	19195	\N	Rychłowice
19388	19195	\N	Sieniec
19389	19195	\N	Srebrnica
19390	19195	\N	Starzenice
19391	19195	\N	Turów
19392	19195	\N	Urbanice
19393	19195	\N	Widoradz Dolny
19394	19195	\N	Widoradz Górny
19395	19196	\N	Broników
19396	19196	\N	Jajczaki
19397	19196	\N	Kamion
19398	19196	\N	Kochlew
19399	19196	\N	Kraszkowice
19400	19196	\N	Krzeczów
19401	19196	\N	Łaszew
19402	19196	\N	Łaszew Rządowy
19403	19196	\N	Mierzyce
19404	19196	\N	Ogroble
19405	19196	\N	Przycłapy
19406	19196	\N	Przywóz
19407	19196	\N	Strugi
19408	19196	\N	Toporów
19409	19196	\N	Wierzchlas
19410	19196	\N	Wieszagi
19411	363	\N	Bolesławiec
19412	363	\N	Czastary
19413	363	\N	Galewice
19414	363	\N	Lututów
19415	363	\N	Łubnice
19416	363	\N	Sokolniki
19417	363	\N	Wieruszów
19418	19411	\N	Bolesławiec
19419	19411	\N	Bolesławiec-Chróścin
19420	19411	\N	Chobot
19421	19411	\N	Chotynin
19422	19411	\N	Chróścin
19423	19411	\N	Chróścin-Młyn
19424	19411	\N	Chróścin-Zamek
19425	19411	\N	Gola
19426	19411	\N	Kamionka
19427	19411	\N	Koziołek
19428	19411	\N	Krupka
19429	19411	\N	Mieleszyn
19430	19411	\N	Piaski
19431	19411	\N	Podbolesławiec
19432	19411	\N	Podjaworek
19433	19411	\N	Stanisławówka
19434	19411	\N	Wiewiórka
19435	19411	\N	Żdżary
19436	19412	\N	Chorobel
19437	19412	\N	Czastary
19438	19412	\N	Dolina
19439	19412	\N	Jaśki
19440	19412	\N	Jaworek
19441	19412	\N	Józefów
19442	19412	\N	Kąty Walichnowskie
19443	19412	\N	Kniatowy
19444	19412	\N	Krajanka
19445	19412	\N	Krzyż
19446	19412	\N	Nalepa
19447	19412	\N	Parcice
19448	19412	\N	Przywory
19449	19412	\N	Radostów Drugi
19450	19412	\N	Radostów Pierwszy
19451	19412	\N	Stępna
19452	19413	\N	Biadaszki
19453	19413	\N	Bocian
19454	19413	\N	Brzeziny
19455	19413	\N	Brzózki
19456	19413	\N	Ciupki
19457	19413	\N	Dąbie
19458	19413	\N	Dąbrówka
19459	19413	\N	Foluszczyki
19460	19413	\N	Galewice
19461	19413	\N	Gąszcze
19462	19413	\N	Głaz
19463	19413	\N	Głowinkowskie
19464	19413	\N	Grądy
19465	19413	\N	Jeziorna
19466	19413	\N	Kalety
19467	19413	\N	Kaski
19468	19413	\N	Kaźmirów
19469	19413	\N	Kolonia Osiek
19470	19413	\N	Kostrzewy
19471	19413	\N	Kużaj
19472	19413	\N	Mąki
19473	19413	\N	Niwiska
19474	19413	\N	Okoń
19475	19413	\N	Osiek
19476	19413	\N	Osowa
19477	19413	\N	Ostrówek
19478	19413	\N	Pędziwiatry
19479	19413	\N	Plęsy
19480	19413	\N	Przybyłów
19481	19413	\N	Pustki
19482	19413	\N	Rybka
19483	19413	\N	Spóle
19484	19413	\N	Tokarzew
19485	19413	\N	Węglewice
19486	19413	\N	Załozie
19487	19413	\N	Zataje
19488	19413	\N	Żelazo
19489	19413	\N	Żydowiec
19490	19414	\N	Augustynów
19491	19414	\N	Bielawy
19492	19414	\N	Brzozowiec
19493	19414	\N	Chojny
19494	19414	\N	Dobrosław
19495	19414	\N	Dymki
19496	19414	\N	Hipolity
19497	19414	\N	Huta
19498	19414	\N	Józefina
19499	19414	\N	Kluski
19500	19414	\N	Kłoniczki
19501	19414	\N	Knapy
19502	19414	\N	Kolonia Dobrosław
19503	19414	\N	Kopaniny
19504	19414	\N	Kozub
19505	19414	\N	Lututów
19506	19414	\N	Łęki Duże
19507	19414	\N	Łęki Małe
19508	19414	\N	Niemojew
19509	19414	\N	Ostrycharze
19510	19414	\N	Popielina
19511	19414	\N	Swoboda
19512	19414	\N	Świątkowice
19513	19415	\N	Andrzejów
19514	19415	\N	Bezula
19515	19415	\N	Brzozówka
19516	19415	\N	Dzietrzkowice
19517	19415	\N	Gielniówka
19518	19415	\N	Kolonia Dzietrzkowice
19519	19415	\N	Krupka
19520	19415	\N	Ludwinów
19521	19415	\N	Łubnice
19522	19415	\N	Makowszczyzna
19523	19415	\N	Rzepisko
19524	19415	\N	Węgielnica
19525	19415	\N	Wójcin
19526	19416	\N	Bagatelka
19527	19416	\N	Borki Pichelskie
19528	19416	\N	Borki Sokolskie
19529	19416	\N	Góry
19530	19416	\N	Gumnisko
19531	19416	\N	Kopaniny
19532	19416	\N	Nowy Ochędzyn
19533	19416	\N	Pichlice
19534	19416	\N	Prusak
19535	19416	\N	Ryś
19536	19416	\N	Siedliska
19537	19416	\N	Sokolniki
19538	19416	\N	Sokolniki-Leśniczówka
19539	19416	\N	Stary Ochędzyn
19540	19416	\N	Szustry
19541	19416	\N	Tyble
19542	19416	\N	Walichnowy
19543	19416	\N	Wiktorówek
19544	19416	\N	Wyglądacze
19545	19416	\N	Zagórze
19546	19416	\N	Zdzierczyzna
19547	19417	\N	Wieruszów
19548	19417	\N	Chobanin
19549	19417	\N	Cieszęcin
19550	19417	\N	Dobrydział
19551	19417	\N	Górka Wieruszowska
19552	19417	\N	Grześka
19553	19417	\N	Jutrków
19554	19417	\N	Klatka
19555	19417	\N	Kowalówka
19556	19417	\N	Kuźnica Skakawska
19557	19417	\N	Lubczyna
19558	19417	\N	Mesznary
19559	19417	\N	Mieczków
19560	19417	\N	Mieleszyn
19561	19417	\N	Mieleszynek
19562	19417	\N	Mirków
19563	19417	\N	Nawrotów
19564	19417	\N	Ochędzyn
19565	19417	\N	Pieczyska
19566	19417	\N	Podzamcze
19567	19417	\N	Polesie
19568	19417	\N	Skakawa
19569	19417	\N	Sopel
19570	19417	\N	Święty Roch
19571	19417	\N	Teklinów
19572	19417	\N	Wesoła
19573	19417	\N	Wyszanów
19574	364	\N	Zduńska Wola
19575	364	\N	Szadek
19576	364	\N	Zapolice
19577	19574	\N	Zduńska Wola
19578	19575	\N	Szadek
19579	19575	\N	Antonin
19580	19575	\N	Babiniec
19581	19575	\N	Boczki
19582	19575	\N	Boczki Kobylskie
19583	19575	\N	Borki Prusinowskie
19584	19575	\N	Choszczewo
19585	19575	\N	Dziadkowice
19586	19575	\N	Górna Wola
19587	19575	\N	Góry Prusinowskie
19588	19575	\N	Grzybów
19589	19575	\N	Jamno
19590	19575	\N	Janów
19591	19575	\N	Karczówek
19592	19575	\N	Kobyla Miejska
19593	19575	\N	Kotlinki
19594	19575	\N	Kotliny
19595	19575	\N	Krokocice
19596	19575	\N	Lichawa
19597	19575	\N	Łobudzice
19598	19575	\N	Marcelin
19599	19575	\N	Ogrodzim
19600	19575	\N	Piaski
19601	19575	\N	Prusinowice
19602	19575	\N	Przatów Dolny
19603	19575	\N	Przatów Górny
19604	19575	\N	Przybyłów
19605	19575	\N	Reduchów
19606	19575	\N	Rzepiszew
19607	19575	\N	Rzepiszew-Kolonia A i B
19608	19575	\N	Sikucin
19609	19575	\N	Stary Kromolin
19610	19575	\N	Szadkowice
19611	19575	\N	Szadkowice-Ogrodzim
19612	19575	\N	Tarnówka
19613	19575	\N	Wielka Wieś
19614	19575	\N	Wilamów
19615	19575	\N	Wola Krokocka
19616	19575	\N	Wola Łobudzka
19617	19576	\N	Beleń
19618	19576	\N	Beleń-Kolonia
19619	19576	\N	Branica
19620	19576	\N	Branica-Kolonia
19621	19576	\N	Holendry
19622	19576	\N	Jelno
19623	19576	\N	Jeziorko
19624	19576	\N	Kalinowa
19625	19576	\N	Marcelów
19626	19576	\N	Marżynek
19627	19576	\N	Młodawin Dolny
19628	19576	\N	Młodawin Górny
19629	19576	\N	Paprotnia
19630	19576	\N	Pstrokonie
19631	19576	\N	Ptaszkowice
19632	19576	\N	Rembieszów
19633	19576	\N	Rojków
19634	19576	\N	Strońsko
19635	19576	\N	Swędzieniejewice
19636	19576	\N	Świerzyny
19637	19576	\N	Woźniki
19638	19576	\N	Wygiełzów
19639	19576	\N	Zapolice
19640	19574	\N	Andrzejów
19641	19574	\N	Annopole Nowe
19642	19574	\N	Annopole Stare
19643	19574	\N	Beniaminów
19644	19574	\N	Biały Ług
19645	19574	\N	Czechy
19646	19574	\N	Dionizów
19647	19574	\N	Gajewniki
19648	19574	\N	Gajewniki-Kolonia
19649	19574	\N	Henryków
19650	19574	\N	Izabelów
19651	19574	\N	Izabelów Mały
19652	19574	\N	Janiszewice
19653	19574	\N	Karolew
19654	19574	\N	Karsznice
19655	19574	\N	Kłady
19656	19574	\N	Korczew
19657	19574	\N	Krobanów
19658	19574	\N	Krobanówek
19659	19574	\N	Laskowiec
19660	19574	\N	Maciejów
19661	19574	\N	Michałów
19662	19574	\N	Mostki
19663	19574	\N	Ochraniew
19664	19574	\N	Ogrodzisko
19665	19574	\N	Opiesin
19666	19574	\N	Ostrówek
19667	19574	\N	Piaski
19668	19574	\N	Polków
19669	19574	\N	Poręby
19670	19574	\N	Pratków
19671	19574	\N	Rębieskie
19672	19574	\N	Rębieskie-Kolonia
19673	19574	\N	Suchoczasy
19674	19574	\N	Tymienice
19675	19574	\N	Wiktorów
19676	19574	\N	Wojsławice
19677	19574	\N	Wólka Wojsławska
19678	19574	\N	Wymysłów
19679	19574	\N	Zamłynie
19680	19574	\N	Zborowskie
19681	365	\N	Głowno
19682	365	\N	Ozorków
19683	365	\N	Zgierz
19684	365	\N	Aleksandrów Łódzki
19685	365	\N	Parzęczew
19686	365	\N	Stryków
19687	19681	\N	Głowno
19688	19682	\N	Ozorków
19689	19683	\N	Zgierz
19690	19684	\N	Aleksandrów Łódzki
19691	19684	\N	Antoniew
19692	19684	\N	Bełdów
19693	19684	\N	Bełdów-Krzywa Wieś
19694	19684	\N	Brużyczka Mała
19695	19684	\N	Budy Wolskie
19696	19684	\N	Chrośno
19697	19684	\N	Ciężków
19698	19684	\N	Grunwald
19699	19684	\N	Izabelin
19700	19684	\N	Jastrzębie Górne
19701	19684	\N	Karolew
19702	19684	\N	Kolonia Brużyca
19703	19684	\N	Krzywiec
19704	19684	\N	Księstwo
19705	19684	\N	Łobódź
19706	19684	\N	Nakielnica
19707	19684	\N	Nowe Krasnodęby
19708	19684	\N	Nowy Adamów
19709	19684	\N	Placydów
19710	19684	\N	Prawęcice
19711	19684	\N	Rąbień
19712	19684	\N	Rąbień AB
19713	19684	\N	Ruda-Bugaj
19714	19684	\N	Sanie
19715	19684	\N	Słowak
19716	19684	\N	Sobień
19717	19684	\N	Stare Krasnodęby
19718	19684	\N	Stary Adamów
19719	19684	\N	Wola Grzymkowa
19720	19684	\N	Zgniłe Błoto
19721	19681	\N	Albinów
19722	19681	\N	Antoniew
19723	19681	\N	Boczki Domaradzkie
19724	19681	\N	Boczki Zarzeczne
19725	19681	\N	Bronisławów
19726	19681	\N	Chlebowice
19727	19681	\N	Dąbrowa
19728	19681	\N	Domaradzyn
19729	19681	\N	Feliksów
19730	19681	\N	Gawronki
19731	19681	\N	Glinnik
19732	19681	\N	Helenów
19733	19681	\N	Jasionna
19734	19681	\N	Kadzielin
19735	19681	\N	Kamień
19736	19681	\N	Karasica
19737	19681	\N	Karnków
19738	19681	\N	Lubianków
19739	19681	\N	Mąkolice
19740	19681	\N	Mięsośnia
19741	19681	\N	Ostrołęka
19742	19681	\N	Piaski Rudnickie
19743	19681	\N	Popówek Włościański
19744	19681	\N	Popów Głowieński
19745	19681	\N	Różany
19746	19681	\N	Rudniczek
19747	19681	\N	Władysławów Bielawski
19748	19681	\N	Władysławów Popowski
19749	19681	\N	Wola Lubiankowska
19750	19681	\N	Wola Mąkolska
19751	19681	\N	Wola Zbrożkowa
19752	19681	\N	Ziewanice
19753	19682	\N	Aleksandria
19754	19682	\N	Boczki
19755	19682	\N	Borszyn
19756	19682	\N	Cedrowice
19757	19682	\N	Cedrowice-Parcela
19758	19682	\N	Celestynów
19759	19682	\N	Czerchów
19760	19682	\N	Dybówka
19761	19682	\N	Helenów
19762	19682	\N	Katarzynów
19763	19682	\N	Konary
19764	19682	\N	Leśmierz
19765	19682	\N	Małachowice
19766	19682	\N	Małachowice-Kolonia
19767	19682	\N	Maszkowice
19768	19682	\N	Modlna
19769	19682	\N	Muchówka
19770	19682	\N	Opalanki
19771	19682	\N	Ostrów
19772	19682	\N	Parzyce
19773	19682	\N	Pełczyska
19774	19682	\N	Sierpów
19775	19682	\N	Skotniki
19776	19682	\N	Skromnica
19777	19682	\N	Sokolniki
19778	19682	\N	Sokolniki-Las
19779	19682	\N	Sokolniki-Parcela
19780	19682	\N	Solca Mała
19781	19682	\N	Solca Wielka
19782	19682	\N	Śliwniki
19783	19682	\N	Tkaczew
19784	19682	\N	Tymienica
19785	19682	\N	Wróblew
19786	19685	\N	Anastazew
19787	19685	\N	Bibianów
19788	19685	\N	Chociszew
19789	19685	\N	Chrząstówek
19790	19685	\N	Chrząstów Wielki
19791	19685	\N	Duraj
19792	19685	\N	Florentynów
19793	19685	\N	Florianki
19794	19685	\N	Gołaszyny
19795	19685	\N	Ignacew Folwarczny
19796	19685	\N	Ignacew Parzęczewski
19797	19685	\N	Ignacew Podleśny
19798	19685	\N	Ignacew Rozlazły
19799	19685	\N	Janów
19800	19685	\N	Julianki
19801	19685	\N	Konstantki
19802	19685	\N	Kowalewice
19803	19685	\N	Kozikówka
19804	19685	\N	Leźnica Wielka
19805	19685	\N	Leźnica Wielka-Osiedle
19806	19685	\N	Mamień
19807	19685	\N	Mariampol
19808	19685	\N	Mikołajew
19809	19685	\N	Mrożewice
19810	19685	\N	Nowa Jerozolima
19811	19685	\N	Nowomłyny
19812	19685	\N	Opole
19813	19685	\N	Orła
19814	19685	\N	Parzęczew
19815	19685	\N	Piaskowice
19816	19685	\N	Pustkowa Góra
19817	19685	\N	Radzibórz
19818	19685	\N	Różyce
19819	19685	\N	Różyce Żmijowe
19820	19685	\N	Skórka
19821	19685	\N	Sokola Góra
19822	19685	\N	Stary Chrząstów
19823	19685	\N	Sulimy
19824	19685	\N	Śliwniki
19825	19685	\N	Śniatowa
19826	19685	\N	Tkaczewska Góra
19827	19685	\N	Trojany
19828	19685	\N	Wielka Wieś
19829	19685	\N	Wytrzyszczki
19830	19685	\N	Żelgoszcz
19831	19686	\N	Stryków
19832	19686	\N	Anielin
19833	19686	\N	Anielin Swędowski
19834	19686	\N	Bartolin
19835	19686	\N	Bratoszewice
19836	19686	\N	Bronin
19837	19686	\N	Brzedza
19838	19686	\N	Cesarka
19839	19686	\N	Ciołek
19840	19686	\N	Dobieszków
19841	19686	\N	Dobra
19842	19686	\N	Dobra-Nowiny
19843	19686	\N	Gozdów
19844	19686	\N	Kalinów
19845	19686	\N	Kiełmina
19846	19686	\N	Klęk
19847	19686	\N	Koźle
19848	19686	\N	Krucice
19849	19686	\N	Lipa
19850	19686	\N	Lipka
19851	19686	\N	Ługi
19852	19686	\N	Michałówek
19853	19686	\N	Niesułków
19854	19686	\N	Niesułków-Kolonia
19855	19686	\N	Nowostawy Górne
19856	19686	\N	Orzechówek
19857	19686	\N	Osse
19858	19686	\N	Pludwiny
19859	19686	\N	Rokitnica
19860	19686	\N	Sadówka
19861	19686	\N	Sierżnia
19862	19686	\N	Smolice
19863	19686	\N	Sosnowiec
19864	19686	\N	Sosnowiec-Pieńki
19865	19686	\N	Stary Imielnik
19866	19686	\N	Swędów
19867	19686	\N	Tymianka
19868	19686	\N	Warszewice
19869	19686	\N	Witanówek
19870	19686	\N	Wola Błędowa
19871	19686	\N	Wrzask
19872	19686	\N	Wyskoki
19873	19686	\N	Zagłoba
19874	19686	\N	Zelgoszcz
19875	19683	\N	Adolfów
19876	19683	\N	Astachowice
19877	19683	\N	Bądków
19878	19683	\N	Besiekierz Nawojowy
19879	19683	\N	Besiekierz Rudny
19880	19683	\N	Biała
19881	19683	\N	Ciosny
19882	19683	\N	Cyprianów
19883	19683	\N	Czaplinek
19884	19683	\N	Dąbrówka-Malice
19885	19683	\N	Dąbrówka-Marianka
19886	19683	\N	Dąbrówka-Sowice
19887	19683	\N	Dąbrówka-Strumiany
19888	19683	\N	Dąbrówka Wielka
19889	19683	\N	Dębniak
19890	19683	\N	Dzierżązna
19891	19683	\N	Emilia
19892	19683	\N	Florianów
19893	19683	\N	Gieczno
19894	19683	\N	Glinnik
19895	19683	\N	Głowa
19896	19683	\N	Grabiszew
19897	19683	\N	Grotniki
19898	19683	\N	Janów
19899	19683	\N	Jasionka
19900	19683	\N	Jedlicze A
19901	19683	\N	Jedlicze B
19902	19683	\N	Jeżewo
19903	19683	\N	Józefów
19904	19683	\N	Kania Góra
19905	19683	\N	Kębliny
19906	19683	\N	Kotowice
19907	19683	\N	Krzemień
19908	19683	\N	Kwilno
19909	19683	\N	Leonardów
19910	19683	\N	Leonów
19911	19683	\N	Lorenki
19912	19683	\N	Lućmierz-Las
19913	19683	\N	Lućmierz-Ośrodek
19914	19683	\N	Maciejów
19915	19683	\N	Marcjanka
19916	19683	\N	Michałów
19917	19683	\N	Moszczenica
19918	19683	\N	Nowe Łagiewniki
19919	19683	\N	Osmolin
19920	19683	\N	Ostrów
19921	19683	\N	Palestyna
19922	19683	\N	Podole
19923	19683	\N	Rogóźno
19924	19683	\N	Rosanów
19925	19683	\N	Rozalinów
19926	19683	\N	Samotnik
19927	19683	\N	Siedlisko
19928	19683	\N	Skotniki
19929	19683	\N	Słowik
19930	19683	\N	Smardzew
19931	19683	\N	Stare Brachowice
19932	19683	\N	Stare Łagiewniki
19933	19683	\N	Stefanów
19934	19683	\N	Swoboda
19935	19683	\N	Szczawin
19936	19683	\N	Szczawin-Kolonia
19937	19683	\N	Śladków Górny
19938	19683	\N	Ukraina
19939	19683	\N	Ustronie
19940	19683	\N	Warszyce
19941	19683	\N	Wiktorów
19942	19683	\N	Władysławów
19943	19683	\N	Wola Branicka
19944	19683	\N	Wola Branicka-Kolonia
19945	19683	\N	Wola Rogozińska
19946	19683	\N	Wołyń
19947	19683	\N	Wypychów
19948	19683	\N	Zimna Woda
19949	327	\N	Brzeziny
19950	327	\N	Dmosin
19951	327	\N	Jeżów
19952	327	\N	Rogów
19953	19949	\N	Brzeziny
19954	19949	\N	Adamów
19955	19949	\N	Bielanki
19956	19949	\N	Bogdanka
19957	19949	\N	Bronowice
19958	19949	\N	Buczek
19959	19949	\N	Dąbrówka Duża
19960	19949	\N	Dąbrówka Mała
19961	19949	\N	Eufeminów
19962	19949	\N	Gaj
19963	19949	\N	Gałkówek-Kolonia
19964	19949	\N	Grzmiąca
19965	19949	\N	Helenów
19966	19949	\N	Helenówka
19967	19949	\N	Henryków
19968	19949	\N	Ignaców
19969	19949	\N	Jabłonów
19970	19949	\N	Janinów
19971	19949	\N	Jaroszki
19972	19949	\N	Jordanów
19973	19949	\N	Kędziorki
19974	19949	\N	Małczew
19975	19949	\N	Marianów Kołacki
19976	19949	\N	Michałów
19977	19949	\N	Paprotnia
19978	19949	\N	Pieńki Henrykowskie
19979	19949	\N	Poćwiardówka
19980	19949	\N	Polik
19981	19949	\N	Przanówka
19982	19949	\N	Przecław
19983	19949	\N	Rochna
19984	19949	\N	Rozworzyn
19985	19949	\N	Sadowa
19986	19949	\N	Stare Koluszki
19987	19949	\N	Strzemboszewice
19988	19949	\N	Syberia
19989	19949	\N	Szymaniszki
19990	19949	\N	Ścibiorów
19991	19949	\N	Tadzin
19992	19949	\N	Teodorów
19993	19949	\N	Tworzyjanki
19994	19949	\N	Witkowice
19995	19949	\N	Zalesie
19996	19949	\N	Żabieniec
19997	19950	\N	Borki
19998	19950	\N	Dąbrowa Mszadelska
19999	19950	\N	Dmosin
20000	19950	\N	Dmosin Drugi
20001	19950	\N	Dmosin Pierwszy
20002	19950	\N	Grodzisk
20003	19950	\N	Janów
20004	19950	\N	Kałęczew
20005	19950	\N	Kamień
20006	19950	\N	Kołacin
20007	19950	\N	Kołacinek
20008	19950	\N	Koziołki
20009	19950	\N	Kraszew
20010	19950	\N	Kraszew Wielki
20011	19950	\N	Kuźmy
20012	19950	\N	Lubowidza
20013	19950	\N	Michałów
20014	19950	\N	Nadolna
20015	19950	\N	Nadolna-Kolonia
20016	19950	\N	Nagawki
20017	19950	\N	Nowostawy Dolne
20018	19950	\N	Osiny
20019	19950	\N	Rozdzielna
20020	19950	\N	Szczecin
20021	19950	\N	Teresin
20022	19950	\N	Wiesiołów
20023	19950	\N	Wola Cyrusowa
20024	19950	\N	Wola Cyrusowa-Kolonia
20025	19950	\N	Zawady
20026	19950	\N	Ząbki
20027	19951	\N	Brynica
20028	19951	\N	Dąbrowa
20029	19951	\N	Frydrychów
20030	19951	\N	Góra
20031	19951	\N	Jankowice
20032	19951	\N	Jankowice-Kolonia
20033	19951	\N	Jasienin Duży
20034	19951	\N	Jasienin Mały
20035	19951	\N	Jeżów
20036	19951	\N	Kosiska
20037	19951	\N	Leszczyny-Kolonia
20038	19951	\N	Lubiska
20039	19951	\N	Lubiska-Kolonia
20040	19951	\N	Marianówek
20041	19951	\N	Mikulin
20042	19951	\N	Mościska
20043	19951	\N	Olszewo
20044	19951	\N	Popień
20045	19951	\N	Popień-Parcela
20046	19951	\N	Przybyszyce
20047	19951	\N	Rewica
20048	19951	\N	Rewica-Kolonia
20049	19951	\N	Rewica Królewska
20050	19951	\N	Rewica Szlachecka
20051	19951	\N	Stare Leszczyny
20052	19951	\N	Strzelna
20053	19951	\N	Taurów
20054	19951	\N	Władysławowo
20055	19951	\N	Wola Łokotowa
20056	19951	\N	Zamłynie
20057	19952	\N	Jasień
20058	19952	\N	Józefów
20059	19952	\N	Kobylin
20060	19952	\N	Kotulin
20061	19952	\N	Marianów Rogowski
20062	19952	\N	Mroga Dolna
20063	19952	\N	Mroga Górna
20064	19952	\N	Nowe Wągry
20065	19952	\N	Olsza
20066	19952	\N	Popień
20067	19952	\N	Przyłęk Duży
20068	19952	\N	Przyłęk Mały
20069	19952	\N	Rogów
20070	19952	\N	Rogów-Parcela
20071	19952	\N	Rogów Wieś
20072	19952	\N	Romanówek
20073	19952	\N	Stefanów
20074	19952	\N	Wągry
20075	19952	\N	Zacywilki
20076	366	\N	M. Łódź
20077	366	\N	Łódź-Bałuty
20078	366	\N	Łódź-Górna
20079	366	\N	Łódź-Polesie
20080	366	\N	Łódź-Śródmieście
20081	366	\N	Łódź-Widzew
20082	20076	\N	Łódź
20083	20077	\N	Łódź-Bałuty
20084	20078	\N	Łódź-Górna
20085	20079	\N	Łódź-Polesie
20086	20080	\N	Łódź-Śródmieście
20087	20081	\N	Łódź-Widzew
20088	371	\N	M. Piotrków Trybunalski
20089	20088	\N	Piotrków Trybunalski
20090	373	\N	M. Skierniewice
20091	20090	\N	Skierniewice
20092	375	\N	Bochnia
20093	375	\N	Drwinia
20094	375	\N	Lipnica Murowana
20095	375	\N	Łapanów
20096	375	\N	Nowy Wiśnicz
20097	375	\N	Rzezawa
20098	375	\N	Trzciana
20099	375	\N	Żegocina
20100	20092	\N	Bochnia
20101	20092	\N	Baczków
20102	20092	\N	Bessów
20103	20092	\N	Bogucice
20104	20092	\N	Brzeźnica
20105	20092	\N	Buczyna
20106	20092	\N	Cerekiew
20107	20092	\N	Chełm
20108	20092	\N	Cikowice
20109	20092	\N	Damienice
20110	20092	\N	Dąbrowica
20111	20092	\N	Gawłów
20112	20092	\N	Gierczyce
20113	20092	\N	Gorzków
20114	20092	\N	Grabina
20115	20092	\N	Krzyżanowice
20116	20092	\N	Łapczyca
20117	20092	\N	Majkowice
20118	20092	\N	Moszczenica
20119	20092	\N	Nieprześnia
20120	20092	\N	Nieszkowice Małe
20121	20092	\N	Nieszkowice Wielkie
20122	20092	\N	Ostrów Szlachecki
20123	20092	\N	Pogwizdów
20124	20092	\N	Proszówki
20125	20092	\N	Siedlec
20126	20092	\N	Słomka
20127	20092	\N	Stanisławice
20128	20092	\N	Stradomka
20129	20092	\N	Wola Nieszkowska
20130	20092	\N	Zatoka
20131	20093	\N	Bieńkowice
20132	20093	\N	Drwinia
20133	20093	\N	Dziewin
20134	20093	\N	Gawłówek
20135	20093	\N	Grobla
20136	20093	\N	Ispina
20137	20093	\N	Mikluszowice
20138	20093	\N	Niedary
20139	20093	\N	Olszyny
20140	20093	\N	Świniary
20141	20093	\N	Trawniki
20142	20093	\N	Wola Drwińska
20143	20093	\N	Wyżyce
20144	20093	\N	Zielona
20145	20094	\N	Borówna
20146	20094	\N	Lipnica Dolna
20147	20094	\N	Lipnica Górna
20148	20094	\N	Lipnica Murowana
20149	20094	\N	Rajbrot
20150	20095	\N	Boczów
20151	20095	\N	Brzezowa
20152	20095	\N	Chrostowa
20153	20095	\N	Cichawka
20154	20095	\N	Grabie
20155	20095	\N	Grobla
20156	20095	\N	Kamyk
20157	20095	\N	Kępanów
20158	20095	\N	Kobylec
20159	20095	\N	Lubomierz
20160	20095	\N	Łapanów
20161	20095	\N	Sobolów
20162	20095	\N	Tarnawa
20163	20095	\N	Ubrzeż
20164	20095	\N	Wieruszyce
20165	20095	\N	Wola Wieruszycka
20166	20095	\N	Wolica
20167	20095	\N	Zbydniów
20168	20096	\N	Nowy Wiśnicz
20169	20096	\N	Chronów
20170	20096	\N	Kobyle
20171	20096	\N	Kopaliny
20172	20096	\N	Królówka
20173	20096	\N	Leksandrowa
20174	20096	\N	Łomna
20175	20096	\N	Muchówka
20176	20096	\N	Olchawa
20177	20096	\N	Połom Duży
20178	20096	\N	Stary Wiśnicz
20179	20096	\N	Wiśnicz Mały
20180	20097	\N	Borek
20181	20097	\N	Bratucice
20182	20097	\N	Buczków
20183	20097	\N	Dąbrówka
20184	20097	\N	Dębina
20185	20097	\N	Jodłówka
20186	20097	\N	Krzeczów
20187	20097	\N	Łazy
20188	20097	\N	Okulice
20189	20097	\N	Ostrów Królewski
20190	20097	\N	Rzezawa
20191	20098	\N	Kamionna
20192	20098	\N	Kierlikówka
20193	20098	\N	Leszczyna
20194	20098	\N	Łąkta Dolna
20195	20098	\N	Rdzawa
20196	20098	\N	Trzciana
20197	20098	\N	Ujazd
20198	20099	\N	Bełdno
20199	20099	\N	Bytomsko
20200	20099	\N	Łąkta Górna
20201	20099	\N	Rozdziele
20202	20099	\N	Żegocina
20203	376	\N	Borzęcin
20204	376	\N	Brzesko
20205	376	\N	Czchów
20206	376	\N	Dębno
20207	376	\N	Gnojnik
20208	376	\N	Iwkowa
20209	376	\N	Szczurowa
20210	20203	\N	Bielcza
20211	20203	\N	Borzęcin
20212	20203	\N	Łęki
20213	20203	\N	Przyborów
20214	20203	\N	Waryś
20215	20204	\N	Brzesko
20216	20204	\N	Bucze
20217	20204	\N	Jadowniki
20218	20204	\N	Jasień
20219	20204	\N	Mokrzyska
20220	20204	\N	Okocim
20221	20204	\N	Poręba Spytkowska
20222	20204	\N	Sterkowiec
20223	20204	\N	Szczepanów
20224	20204	\N	Wokowice
20225	20205	\N	Czchów
20226	20205	\N	Będzieszyna
20227	20205	\N	Biskupice Melsztyńskie
20228	20205	\N	Domosławice
20229	20205	\N	Jurków
20230	20205	\N	Piaski-Drużków
20231	20205	\N	Tworkowa
20232	20205	\N	Tymowa
20233	20205	\N	Wytrzyszczka
20234	20205	\N	Złota
20235	20206	\N	Biadoliny Szlacheckie
20236	20206	\N	Dębno
20237	20206	\N	Doły
20238	20206	\N	Jastew
20239	20206	\N	Jaworsko
20240	20206	\N	Łoniowa
20241	20206	\N	Łysa Góra
20242	20206	\N	Maszkienice
20243	20206	\N	Niedźwiedza
20244	20206	\N	Perła
20245	20206	\N	Porąbka Uszewska
20246	20206	\N	Sufczyn
20247	20206	\N	Wola Dębińska
20248	20207	\N	Biesiadki
20249	20207	\N	Gnojnik
20250	20207	\N	Gosprzydowa
20251	20207	\N	Lewniowa
20252	20207	\N	Uszew
20253	20207	\N	Zawada Uszewska
20254	20207	\N	Żerków
20255	20208	\N	Dobrociesz
20256	20208	\N	Drużków Pusty
20257	20208	\N	Iwkowa
20258	20208	\N	Kąty
20259	20208	\N	Połom Mały
20260	20208	\N	Porąbka Iwkowska
20261	20208	\N	Wojakowa
20262	20209	\N	Barczków
20263	20209	\N	Dąbrówka Morska
20264	20209	\N	Dołęga
20265	20209	\N	Górka
20266	20209	\N	Kopacze Wielkie
20267	20209	\N	Księże Kopacze
20268	20209	\N	Kwików
20269	20209	\N	Niedzieliska
20270	20209	\N	Pojawie
20271	20209	\N	Popędzyna
20272	20209	\N	Rajsko
20273	20209	\N	Rudy-Rysie
20274	20209	\N	Rylowa
20275	20209	\N	Rząchowa
20276	20209	\N	Strzelce Małe
20277	20209	\N	Strzelce Wielkie
20278	20209	\N	Szczurowa
20279	20209	\N	Uście Solne
20280	20209	\N	Wola Przemykowska
20281	20209	\N	Wrzępia
20282	20209	\N	Zaborów
20283	377	\N	Alwernia
20284	377	\N	Babice
20285	377	\N	Chrzanów
20286	377	\N	Libiąż
20287	377	\N	Trzebinia
20288	20283	\N	Alwernia
20289	20283	\N	Brodła
20290	20283	\N	Grojec
20291	20283	\N	Kwaczała
20292	20283	\N	Mirów
20293	20283	\N	Nieporaz
20294	20283	\N	Okleśna
20295	20283	\N	Podłęże
20296	20283	\N	Poręba Żegoty
20297	20283	\N	Regulice
20298	20283	\N	Źródła
20299	20284	\N	Babice
20300	20284	\N	Jankowice
20301	20284	\N	Mętków
20302	20284	\N	Olszyny
20303	20284	\N	Rozkochów
20304	20284	\N	Wygiełzów
20305	20284	\N	Zagórze
20306	20285	\N	Chrzanów
20307	20285	\N	Balin
20308	20285	\N	Luszowice
20309	20285	\N	Płaza
20310	20285	\N	Pogorzyce
20311	20286	\N	Libiąż
20312	20286	\N	Gromiec
20313	20286	\N	Żarki
20314	20287	\N	Trzebinia
20315	20287	\N	Bolęcin
20316	20287	\N	Czyżówka
20317	20287	\N	Dulowa
20318	20287	\N	Karniowice
20319	20287	\N	Lgota
20320	20287	\N	Młoszowa
20321	20287	\N	Myślachowice
20322	20287	\N	Piła Kościelecka
20323	20287	\N	Płoki
20324	20287	\N	Psary
20325	378	\N	Bolesław
20326	378	\N	Dąbrowa Tarnowska
20327	378	\N	Gręboszów
20328	378	\N	Mędrzechów
20329	378	\N	Olesno
20330	378	\N	Radgoszcz
20331	378	\N	Szczucin
20332	20325	\N	Bolesław
20333	20325	\N	Kanna
20334	20325	\N	Kuzie
20335	20325	\N	Pawłów
20336	20325	\N	Podlipie
20337	20325	\N	Samocice
20338	20325	\N	Strojców
20339	20325	\N	Świebodzin
20340	20325	\N	Tonia
20341	20326	\N	Dąbrowa Tarnowska
20342	20326	\N	Brnik
20343	20326	\N	Gruszów Mały
20344	20326	\N	Gruszów Wielki
20345	20326	\N	Laskówka Chorąska
20346	20326	\N	Lipiny
20347	20326	\N	Morzychna
20348	20326	\N	Nieczajna Dolna
20349	20326	\N	Nieczajna Górna
20350	20326	\N	Smęgorzów
20351	20326	\N	Sutków
20352	20326	\N	Szarwark
20353	20326	\N	Żelazówka
20354	20327	\N	Bieniaszowice
20355	20327	\N	Biskupice
20356	20327	\N	Borusowa
20357	20327	\N	Gręboszów
20358	20327	\N	Hubenice
20359	20327	\N	Karsy
20360	20327	\N	Kozłów
20361	20327	\N	Lubiczko
20362	20327	\N	Okręg
20363	20327	\N	Ujście Jezuickie
20364	20327	\N	Wola Gręboszowska
20365	20327	\N	Wola Żelichowska
20366	20327	\N	Zapasternicze
20367	20327	\N	Zawierzbie
20368	20327	\N	Żelichów
20369	20328	\N	Grądy
20370	20328	\N	Kupienin
20371	20328	\N	Mędrzechów
20372	20328	\N	Odmęt
20373	20328	\N	Wola Mędrzechowska
20374	20328	\N	Wójcina
20375	20328	\N	Wólka Grądzka
20376	20329	\N	Adamierz
20377	20329	\N	Breń
20378	20329	\N	Ćwików
20379	20329	\N	Dąbrówka Gorzycka
20380	20329	\N	Dąbrówki Breńskie
20381	20329	\N	Niwki
20382	20329	\N	Olesno
20383	20329	\N	Oleśnica
20384	20329	\N	Pilcza Żelichowska
20385	20329	\N	Podborze
20386	20329	\N	Swarzów
20387	20329	\N	Wielopole
20388	20329	\N	Zalipie
20389	20330	\N	Luszowice
20390	20330	\N	Małec
20391	20330	\N	Radgoszcz
20392	20330	\N	Smyków
20393	20330	\N	Żdżary
20394	20331	\N	Borki
20395	20331	\N	Brzezówka
20396	20331	\N	Dalestowice
20397	20331	\N	Dąbrowica
20398	20331	\N	Laskówka Delastowska
20399	20331	\N	Lubasz
20400	20331	\N	Łęka Szczucińska
20401	20331	\N	Łęka Żabiecka
20402	20331	\N	Maniów
20403	20331	\N	Radwan
20404	20331	\N	Skrzynka
20405	20331	\N	Słupiec
20406	20331	\N	Suchy Grunt
20407	20331	\N	Szczucin
20408	20331	\N	Świdrówka
20409	20331	\N	Wola Szczucińska
20410	20331	\N	Zabrnie
20411	20331	\N	Załuże
20412	379	\N	Gorlice
20413	379	\N	Biecz
20414	379	\N	Bobowa
20415	379	\N	Lipinki
20416	379	\N	Łużna
20417	379	\N	Moszczenica
20418	379	\N	Ropa
20419	379	\N	Sękowa
20420	379	\N	Uście Gorlickie
20421	20412	\N	Gorlice
20422	20413	\N	Biecz
20423	20413	\N	Binarowa
20424	20413	\N	Bugaj
20425	20413	\N	Głęboka
20426	20413	\N	Grudna Kępska
20427	20413	\N	Korczyna
20428	20413	\N	Libusza
20429	20413	\N	Racławice
20430	20413	\N	Rożnowice
20431	20413	\N	Sitnica
20432	20413	\N	Strzeszyn
20433	20414	\N	Bobowa
20434	20414	\N	Brzana
20435	20414	\N	Jankowa
20436	20414	\N	Sędziszowa
20437	20414	\N	Siedliska
20438	20414	\N	Stróżna
20439	20414	\N	Wilczyska
20440	20412	\N	Bielanka
20441	20412	\N	Bystra
20442	20412	\N	Dominikowice
20443	20412	\N	Klęczany
20444	20412	\N	Kobylanka
20445	20412	\N	Kwiatonowice
20446	20412	\N	Ropica Polska
20447	20412	\N	Stróżówka
20448	20412	\N	Szymbark
20449	20412	\N	Zagórzany
20450	20415	\N	Bednarka
20451	20415	\N	Kryg
20452	20415	\N	Lipinki
20453	20415	\N	Pagorzyna
20454	20415	\N	Rozdziele
20455	20415	\N	Wójtowa
20456	20416	\N	Biesna
20457	20416	\N	Bieśnik
20458	20416	\N	Łużna
20459	20416	\N	Mszanka
20460	20416	\N	Szalowa
20461	20416	\N	Wola Łużańska
20462	20417	\N	Moszczenica
20463	20417	\N	Staszkówka
20464	20418	\N	Klimkówka
20465	20418	\N	Łosie
20466	20418	\N	Ropa
20467	20419	\N	Bartne
20468	20419	\N	Bodaki
20469	20419	\N	Czarne
20470	20419	\N	Krzywa
20471	20419	\N	Małastów
20472	20419	\N	Męcina Mała
20473	20419	\N	Męcina Wielka
20474	20419	\N	Owczary
20475	20419	\N	Radocyna
20476	20419	\N	Ropica Górna
20477	20419	\N	Sękowa
20478	20419	\N	Siary
20479	20419	\N	Wapienne
20480	20419	\N	Wołowiec
20481	20420	\N	Banica
20482	20420	\N	Blechnarka
20483	20420	\N	Brunary
20484	20420	\N	Czarna
20485	20420	\N	Gładyszów
20486	20420	\N	Hańczowa
20487	20420	\N	Izby
20488	20420	\N	Konieczna
20489	20420	\N	Kunkowa
20490	20420	\N	Kwiatoń
20491	20420	\N	Nowica
20492	20420	\N	Regietów
20493	20420	\N	Ropki
20494	20420	\N	Skwirtne
20495	20420	\N	Smerekowiec
20496	20420	\N	Stawisza
20497	20420	\N	Śnietnica
20498	20420	\N	Uście Gorlickie
20499	20420	\N	Wysowa-Zdrój
20500	20420	\N	Zdynia
20501	146	\N	Czernichów
20502	146	\N	Igołomia-Wawrzeńczyce
20503	146	\N	Iwanowice
20504	146	\N	Jerzmanowice-Przeginia
20505	146	\N	Kocmyrzów-Luborzyca
20506	146	\N	Krzeszowice
20507	146	\N	Liszki
20508	146	\N	Michałowice
20509	146	\N	Mogilany
20510	146	\N	Skała
20511	146	\N	Skawina
20512	146	\N	Słomniki
20513	146	\N	Sułoszowa
20514	146	\N	Świątniki Górne
20515	146	\N	Wielka Wieś
20516	146	\N	Zabierzów
20517	146	\N	Zielonki
20518	20501	\N	Czernichów
20519	20501	\N	Czułówek
20520	20501	\N	Dąbrowa Szlachecka
20521	20501	\N	Kamień
20522	20501	\N	Kłokoczyn
20523	20501	\N	Nowa Wieś Szlachecka
20524	20501	\N	Przeginia Duchowna
20525	20501	\N	Przeginia Narodowa
20526	20501	\N	Rusocice
20527	20501	\N	Rybna
20528	20501	\N	Wołowice
20529	20501	\N	Zagacie
20530	20502	\N	Dobranowice
20531	20502	\N	Igołomia
20532	20502	\N	Koźlica
20533	20502	\N	Odwiśle
20534	20502	\N	Pobiednik Mały
20535	20502	\N	Pobiednik Wielki
20536	20502	\N	Rudno Górne
20537	20502	\N	Stręgoborzyce
20538	20502	\N	Tropiszów
20539	20502	\N	Wawrzeńczyce
20540	20502	\N	Złotniki
20541	20502	\N	Zofipole
20542	20502	\N	Żydów
20543	20503	\N	Biskupice
20544	20503	\N	Celiny
20545	20503	\N	Damice
20546	20503	\N	Domiarki
20547	20503	\N	Grzegorzowice Małe
20548	20503	\N	Grzegorzowice Wielkie
20549	20503	\N	Iwanowice Dworskie
20550	20503	\N	Iwanowice Włościańskie
20551	20503	\N	Krasieniec Zakupny
20552	20503	\N	Lesieniec
20553	20503	\N	Maszków
20554	20503	\N	Narama
20555	20503	\N	Poskwitów
20556	20503	\N	Przestańsko
20557	20503	\N	Sieciechowice
20558	20503	\N	Stary Krasieniec
20559	20503	\N	Sułkowice
20560	20503	\N	Widoma
20561	20503	\N	Władysław
20562	20503	\N	Zagaje
20563	20503	\N	Zalesie
20564	20503	\N	Żerkowice
20565	20503	\N	Iwanowice
20566	20504	\N	Czubrowice
20567	20504	\N	Gotkowice
20568	20504	\N	Jerzmanowice
20569	20504	\N	Łazy
20570	20504	\N	Na Księżym Polu
20571	20504	\N	Pod Skałą
20572	20504	\N	Przeginia
20573	20504	\N	Racławice
20574	20504	\N	Sąspów
20575	20504	\N	Szklary
20576	20505	\N	Baranówka
20577	20505	\N	Czulice
20578	20505	\N	Dojazdów
20579	20505	\N	Głęboka
20580	20505	\N	Goszcza
20581	20505	\N	Goszyce
20582	20505	\N	Karniów
20583	20505	\N	Kocmyrzów
20584	20505	\N	Krzysztoforzyce
20585	20505	\N	Legionówka Goszycka
20586	20505	\N	Luborzyca
20587	20505	\N	Łososkowice
20588	20505	\N	Łuczyce
20589	20505	\N	Maciejowice
20590	20505	\N	Marszowice
20591	20505	\N	Pietrzejowice
20592	20505	\N	Prusy
20593	20505	\N	Rawałowice
20594	20505	\N	Sadowie
20595	20505	\N	Skrzeszowice
20596	20505	\N	Sulechów
20597	20505	\N	Wiktorowice
20598	20505	\N	Wilków
20599	20505	\N	Wola Luborzycka
20600	20505	\N	Wysiołek Luborzycki
20601	20505	\N	Zastów
20602	20506	\N	Krzeszowice
20603	20506	\N	Czerna
20604	20506	\N	Dębnik
20605	20506	\N	Dubie
20606	20506	\N	Filipowice
20607	20506	\N	Frywałd
20608	20506	\N	Miękinia
20609	20506	\N	Nawojowa Góra
20610	20506	\N	Nowa Góra
20611	20506	\N	Ostrężnica
20612	20506	\N	Paczółtowice
20613	20506	\N	Rudno
20614	20506	\N	Sanka
20615	20506	\N	Siedlec
20616	20506	\N	Tenczynek
20617	20506	\N	Wola Filipowska
20618	20506	\N	Wrzosy
20619	20506	\N	Za Białką
20620	20506	\N	Zalas
20621	20506	\N	Żary
20622	20507	\N	Budzyń
20623	20507	\N	Cholerzyn
20624	20507	\N	Chrosna
20625	20507	\N	Czułów
20626	20507	\N	Jeziorzany
20627	20507	\N	Kaszów
20628	20507	\N	Kryspinów
20629	20507	\N	Liszki
20630	20507	\N	Mników
20631	20507	\N	Morawica
20632	20507	\N	Piekary
20633	20507	\N	Rączna
20634	20507	\N	Ściejowice
20635	20508	\N	Górna Wieś
20636	20508	\N	Kończyce
20637	20508	\N	Kozierów
20638	20508	\N	Książniczki
20639	20508	\N	Masłomiąca
20640	20508	\N	Michałowice
20641	20508	\N	Młodziejowice
20642	20508	\N	Pielgrzymowice
20643	20508	\N	Raciborowice
20644	20508	\N	Sieborowice
20645	20508	\N	Więcławice Dworskie
20646	20508	\N	Więcławice Stare
20647	20508	\N	Wilczkowice
20648	20508	\N	Wola Więcławska
20649	20508	\N	Zagórzyce Dworskie
20650	20508	\N	Zagórzyce Stare
20651	20508	\N	Zdziesławice
20652	20508	\N	Zerwana
20653	20509	\N	Brzyczyna
20654	20509	\N	Buków
20655	20509	\N	Chorowice
20656	20509	\N	Gaj
20657	20509	\N	Konary
20658	20509	\N	Kulerzów
20659	20509	\N	Libertów
20660	20509	\N	Lusina
20661	20509	\N	Mogilany
20662	20509	\N	Włosań
20663	20510	\N	Skała
20664	20510	\N	Barbarka
20665	20510	\N	Chmielarze
20666	20510	\N	Cianowice Duże
20667	20510	\N	Gołyszyn
20668	20510	\N	Grodzisko
20669	20510	\N	Maszyce
20670	20510	\N	Minoga
20671	20510	\N	Niebyła
20672	20510	\N	Nowa Wieś
20673	20510	\N	Ojców
20674	20510	\N	Popowiec-Leśniczówka
20675	20510	\N	Poręba Laskowska
20676	20510	\N	Przybysławice
20677	20510	\N	Rzeplin
20678	20510	\N	Smardzowice
20679	20510	\N	Sobiesęki
20680	20510	\N	Stoki
20681	20510	\N	Szczodrkowice
20682	20510	\N	Zamłynie
20683	20511	\N	Skawina
20684	20511	\N	Borek Szlachecki
20685	20511	\N	Facimiech
20686	20511	\N	Gołuchowice
20687	20511	\N	Grabie
20688	20511	\N	Jaśkowice
20689	20511	\N	Jurczyce
20690	20511	\N	Kopanka
20691	20511	\N	Krzęcin
20692	20511	\N	Ochodza
20693	20511	\N	Polanka Hallera
20694	20511	\N	Pozowice
20695	20511	\N	Radziszów
20696	20511	\N	Rzozów
20697	20511	\N	Wielkie Drogi
20698	20511	\N	Wola Radziszowska
20699	20511	\N	Zelczyna
20700	20512	\N	Słomniki
20701	20512	\N	Brończyce
20702	20512	\N	Czechy
20703	20512	\N	Janikowice
20704	20512	\N	Januszowice
20705	20512	\N	Kacice
20706	20512	\N	Kępa
20707	20512	\N	Lipna Wola
20708	20512	\N	Miłocice
20709	20512	\N	Muniakowice
20710	20512	\N	Niedźwiedź
20711	20512	\N	Nowa Wieś
20712	20512	\N	Orłów
20713	20512	\N	Polanowice
20714	20512	\N	Prandocin
20715	20512	\N	Prandocin-Iły
20716	20512	\N	Prandocin-Wysiołek
20717	20512	\N	Ratajów
20718	20512	\N	Smroków
20719	20512	\N	Szczepanowice
20720	20512	\N	Trątnowice
20721	20512	\N	Waganowice
20722	20512	\N	Wesoła
20723	20512	\N	Wężerów
20724	20512	\N	Zaborze
20725	20512	\N	Zagaje Smrokowskie
20726	20513	\N	Sułoszowa
20727	20513	\N	Wielmoża
20728	20513	\N	Wola Kalinowska
20729	20514	\N	Świątniki Górne
20730	20514	\N	Ochojno
20731	20514	\N	Olszowice
20732	20514	\N	Rzeszotary
20733	20514	\N	Wrząsowice
20734	20515	\N	Bębło
20735	20515	\N	Będkowice
20736	20515	\N	Biały Kościół
20737	20515	\N	Czajowice
20738	20515	\N	Giebułtów
20739	20515	\N	Kawiory
20740	20515	\N	Modlnica
20741	20515	\N	Modlniczka
20742	20515	\N	Prądnik Korzkiewski
20743	20515	\N	Szyce
20744	20515	\N	Tomaszowice
20745	20515	\N	Wielka Wieś
20746	20515	\N	Wierzchowie
20747	20516	\N	Aleksandrowice
20748	20516	\N	Balice
20749	20516	\N	Bolechowice
20750	20516	\N	Brzezie
20751	20516	\N	Brzezinka
20752	20516	\N	Brzoskwinia
20753	20516	\N	Burów
20754	20516	\N	Karniowice
20755	20516	\N	Kleszczów
20756	20516	\N	Kobylany
20757	20516	\N	Kochanów
20758	20516	\N	Młynka
20759	20516	\N	Niegoszowice
20760	20516	\N	Nielepice
20761	20516	\N	Pisary
20762	20516	\N	Radwanowice
20763	20516	\N	Rudawa
20764	20516	\N	Rząska
20765	20516	\N	Szczyglice
20766	20516	\N	Ujazd
20767	20516	\N	Więckowice
20768	20516	\N	Zabierzów
20769	20516	\N	Zelków
20770	20517	\N	Batowice
20771	20517	\N	Bibice
20772	20517	\N	Boleń
20773	20517	\N	Bosutów
20774	20517	\N	Brzozówka
20775	20517	\N	Dziekanowice
20776	20517	\N	Garlica Duchowna
20777	20517	\N	Garlica Murowana
20778	20517	\N	Garliczka
20779	20517	\N	Grębynice
20780	20517	\N	Januszowice
20781	20517	\N	Korzkiew
20782	20517	\N	Owczary
20783	20517	\N	Pękowice
20784	20517	\N	Przybysławice
20785	20517	\N	Trojanowice
20786	20517	\N	Węgrzce
20787	20517	\N	Wola Zachariaszowska
20788	20517	\N	Zielonki
20789	380	\N	Limanowa
20790	380	\N	Mszana Dolna
20791	380	\N	Dobra
20792	380	\N	Jodłownik
20793	380	\N	Kamienica
20794	380	\N	Laskowa
20795	380	\N	Łukowica
20796	380	\N	Niedźwiedź
20797	380	\N	Słopnice
20798	380	\N	Tymbark
20799	20789	\N	Limanowa
20800	20790	\N	Mszana Dolna
20801	20791	\N	Chyszówki
20802	20791	\N	Dobra
20803	20791	\N	Gruszowiec
20804	20791	\N	Jurków
20805	20791	\N	Porąbka
20806	20791	\N	Półrzeczki
20807	20791	\N	Przenosza
20808	20791	\N	Skrzydlna
20809	20791	\N	Stróża
20810	20791	\N	Wilczyce
20811	20791	\N	Wola Skrzydlańska
20812	20792	\N	Góra Świętego Jana
20813	20792	\N	Janowice
20814	20792	\N	Jodłownik
20815	20792	\N	Kostrza
20816	20792	\N	Krasne-Lasocice
20817	20792	\N	Mstów
20818	20792	\N	Pogorzany
20819	20792	\N	Sadek
20820	20792	\N	Słupia
20821	20792	\N	Szczyrzyc
20822	20792	\N	Szyk
20823	20792	\N	Wilkowisko
20824	20793	\N	Kamienica
20825	20793	\N	Szczawa
20826	20793	\N	Zalesie
20827	20793	\N	Zasadne
20828	20793	\N	Zbludza
20829	20794	\N	Jaworzna
20830	20794	\N	Kamionka Mała
20831	20794	\N	Kobyłczyna
20832	20794	\N	Krosna
20833	20794	\N	Laskowa
20834	20794	\N	Sechna
20835	20794	\N	Strzeszyce
20836	20794	\N	Ujanowice
20837	20794	\N	Żmiąca
20838	20789	\N	Bałażówka
20839	20789	\N	Kanina
20840	20789	\N	Kisielówka
20841	20789	\N	Kłodne
20842	20789	\N	Koszary
20843	20789	\N	Lipowe
20844	20789	\N	Łososina Górna
20845	20789	\N	Makowica
20846	20789	\N	Męcina
20847	20789	\N	Młynne
20848	20789	\N	Mordarka
20849	20789	\N	Nowe Rybie
20850	20789	\N	Pasierbiec
20851	20789	\N	Pisarzowa
20852	20789	\N	Rupniów
20853	20789	\N	Siekierczyna
20854	20789	\N	Sowliny
20855	20789	\N	Stara Wieś
20856	20789	\N	Stare Rybie
20857	20789	\N	Walowa Góra
20858	20789	\N	Wysokie
20859	20795	\N	Jadamwola
20860	20795	\N	Jastrzębie
20861	20795	\N	Łukowica
20862	20795	\N	Młyńczyska
20863	20795	\N	Owieczka
20864	20795	\N	Przyszowa
20865	20795	\N	Roztoka
20866	20795	\N	Stronie
20867	20795	\N	Świdnik
20868	20790	\N	Glisne
20869	20790	\N	Kasina Wielka
20870	20790	\N	Kasinka Mała
20871	20790	\N	Lubomierz
20872	20790	\N	Łętowe
20873	20790	\N	Łostówka
20874	20790	\N	Mszana Górna
20875	20790	\N	Olszówka
20876	20790	\N	Raba Niżna
20877	20796	\N	Konina
20878	20796	\N	Niedźwiedź
20879	20796	\N	Podobin
20880	20796	\N	Poręba Wielka
20881	20797	\N	Słopnice
20882	20797	\N	Zaświercze
20883	20798	\N	Piekiełko
20884	20798	\N	Podłopień
20885	20798	\N	Tymbark
20886	20798	\N	Zamieście
20887	20798	\N	Zawadka
20888	391	\N	Charsznica
20889	391	\N	Gołcza
20890	391	\N	Kozłów
20891	391	\N	Książ Wielki
20892	391	\N	Miechów
20893	391	\N	Racławice
20894	391	\N	Słaboszów
20895	20888	\N	Charsznica
20896	20888	\N	Chodowiec
20897	20888	\N	Chodów
20898	20888	\N	Ciszowice
20899	20888	\N	Dąbrowiec
20900	20888	\N	Jelcza
20901	20888	\N	Marcinkowice
20902	20888	\N	Miechów-Charsznica
20903	20888	\N	Podlesice
20904	20888	\N	Pogwizdów
20905	20888	\N	Swojczany
20906	20888	\N	Szarkówka
20907	20888	\N	Tczyca
20908	20888	\N	Uniejów-Kolonia
20909	20888	\N	Uniejów-Parcela
20910	20888	\N	Uniejów-Rędziny
20911	20888	\N	Wierzbie
20912	20888	\N	Witowice
20913	20889	\N	Adamowice
20914	20889	\N	Buk
20915	20889	\N	Chobędza
20916	20889	\N	Cieplice
20917	20889	\N	Czaple Małe
20918	20889	\N	Czaple Wielkie
20919	20889	\N	Gołcza
20920	20889	\N	Kamienica
20921	20889	\N	Krępa
20922	20889	\N	Laski Dworskie
20923	20889	\N	Maków
20924	20889	\N	Mostek
20925	20889	\N	Przybysławice
20926	20889	\N	Rzeżuśnia
20927	20889	\N	Szreniawa
20928	20889	\N	Trzebienice
20929	20889	\N	Ulina Mała
20930	20889	\N	Ulina Wielka
20931	20889	\N	Wielkanoc
20932	20889	\N	Wysocice
20933	20889	\N	Zawadka
20934	20889	\N	Żarnowica
20935	20890	\N	Bogdanów
20936	20890	\N	Bryzdzyn
20937	20890	\N	Kamionka
20938	20890	\N	Karczowice
20939	20890	\N	Kępie
20940	20890	\N	Kozłów
20941	20890	\N	Marcinowice
20942	20890	\N	Przybysławice
20943	20890	\N	Przysieka
20944	20890	\N	Rogów
20945	20890	\N	Wierzbica
20946	20890	\N	Wolica
20947	20891	\N	Antolka
20948	20891	\N	Boczkowice
20949	20891	\N	Cisia Wola
20950	20891	\N	Cisie
20951	20891	\N	Częstoszowice
20952	20891	\N	Giebułtów
20953	20891	\N	Głogowiany-Stara Wieś
20954	20891	\N	Głogowiany-Wrzosy
20955	20891	\N	Konaszówka
20956	20891	\N	Krzeszówka
20957	20891	\N	Książ Mały
20958	20891	\N	Książ Mały-Kolonia
20959	20891	\N	Książ Wielki
20960	20891	\N	Łazy
20961	20891	\N	Małoszów
20962	20891	\N	Mianocice
20963	20891	\N	Moczydło
20964	20891	\N	Rzędowice
20965	20891	\N	Tochołów
20966	20891	\N	Trzonów
20967	20891	\N	Wielka Wieś
20968	20891	\N	Zaryszyn
20969	20892	\N	Miechów
20970	20892	\N	Biskupice
20971	20892	\N	Brzuchania
20972	20892	\N	Bukowska Wola
20973	20892	\N	Celiny Przesławickie
20974	20892	\N	Dziewięcioły
20975	20892	\N	Falniów
20976	20892	\N	Falniów-Wysiołek
20977	20892	\N	Glinica
20978	20892	\N	Jaksice
20979	20892	\N	Kalina-Lisiniec
20980	20892	\N	Kalina Mała
20981	20892	\N	Kalina-Rędziny
20982	20892	\N	Kamieńczyce
20983	20892	\N	Komorów
20984	20892	\N	Nasiechowice
20985	20892	\N	Parkoszowice
20986	20892	\N	Podleśna Wola
20987	20892	\N	Podmiejska Wola
20988	20892	\N	Pojałowice
20989	20892	\N	Poradów
20990	20892	\N	Przesławice
20991	20892	\N	Pstroszyce Drugie
20992	20892	\N	Pstroszyce Pierwsze
20993	20892	\N	Siedliska
20994	20892	\N	Sławice Szlacheckie
20995	20892	\N	Strzeżów Drugi
20996	20892	\N	Strzeżów Pierwszy
20997	20892	\N	Szczepanowice
20998	20892	\N	Widnica
20999	20892	\N	Wielki Dół
21000	20892	\N	Wymysłów
21001	20892	\N	Zagorzyce
21002	20892	\N	Zapustka
21003	20892	\N	Zarogów
21004	20893	\N	Dosłońce
21005	20893	\N	Dziemierzyce
21006	20893	\N	Głupczów
21007	20893	\N	Górka Kościejowska
21008	20893	\N	Góry Miechowskie
21009	20893	\N	Janowiczki
21010	20893	\N	Klonów
21011	20893	\N	Kościejów
21012	20893	\N	Marchocice
21013	20893	\N	Miroszów
21014	20893	\N	Racławice
21015	20894	\N	Buszków
21016	20894	\N	Dziaduszyce
21017	20894	\N	Grzymałów
21018	20894	\N	Ilkowice
21019	20894	\N	Janowice
21020	20894	\N	Jazdowice
21021	20894	\N	Kalina Wielka
21022	20894	\N	Kropidło
21023	20894	\N	Maciejów
21024	20894	\N	Nieszków
21025	20894	\N	Raszówek
21026	20894	\N	Rędziny-Borek
21027	20894	\N	Rędziny Zbigalskie
21028	20894	\N	Rzemiędzice
21029	20894	\N	Słaboszów
21030	20894	\N	Słupów
21031	20894	\N	Śladów
21032	20894	\N	Święcice
21033	20894	\N	Wymysłów
21034	20894	\N	Zagorzany
21035	392	\N	Dobczyce
21036	392	\N	Lubień
21037	392	\N	Myślenice
21038	392	\N	Pcim
21039	392	\N	Raciechowice
21040	392	\N	Siepraw
21041	392	\N	Sułkowice
21042	392	\N	Tokarnia
21043	392	\N	Wiśniowa
21044	21035	\N	Dobczyce
21045	21035	\N	Bieńkowice
21046	21035	\N	Brzączowice
21047	21035	\N	Brzezowa
21048	21035	\N	Dziekanowice
21049	21035	\N	Kędzierzynka
21050	21035	\N	Kornatka
21051	21035	\N	Niezdów
21052	21035	\N	Nowa Wieś
21053	21035	\N	Rudnik
21054	21035	\N	Sieraków
21055	21035	\N	Skrzynka
21056	21035	\N	Stadniki
21057	21035	\N	Stojowice
21058	21036	\N	Krzeczów
21059	21036	\N	Lubień
21060	21036	\N	Skomielna Biała
21061	21036	\N	Tenczyn
21062	21037	\N	Myślenice
21063	21037	\N	Bęczarka
21064	21037	\N	Borzęta
21065	21037	\N	Bysina
21066	21037	\N	Droginia
21067	21037	\N	Głogoczów
21068	21037	\N	Jasienica
21069	21037	\N	Jawornik
21070	21037	\N	Krzyszkowice
21071	21037	\N	Łęki
21072	21037	\N	Osieczany
21073	21037	\N	Polanka
21074	21037	\N	Poręba
21075	21037	\N	Trzemeśnia
21076	21037	\N	Zasań
21077	21037	\N	Zawada
21078	21038	\N	Pcim
21079	21038	\N	Stróża
21080	21038	\N	Trzebunia
21081	21039	\N	Bojańczyce
21082	21039	\N	Czasław
21083	21039	\N	Dąbie
21084	21039	\N	Gruszów
21085	21039	\N	Kawec
21086	21039	\N	Komorniki
21087	21039	\N	Krzesławice
21088	21039	\N	Krzyworzeka
21089	21039	\N	Kwapinka
21090	21039	\N	Mierzeń
21091	21039	\N	Poznachowice Górne
21092	21039	\N	Raciechowice
21093	21039	\N	Sawa
21094	21039	\N	Zegartowice
21095	21039	\N	Żerosławice
21096	21040	\N	Czechówka
21097	21040	\N	Łyczanka
21098	21040	\N	Siepraw
21099	21040	\N	Zakliczyn
21100	21041	\N	Sułkowice
21101	21041	\N	Biertowice
21102	21041	\N	Harbutowice
21103	21041	\N	Krzywaczka
21104	21041	\N	Rudnik
21105	21042	\N	Bogdanówka
21106	21042	\N	Krzczonów
21107	21042	\N	Skomielna Czarna
21108	21042	\N	Tokarnia
21109	21042	\N	Więciórka
21110	21042	\N	Zawadka
21111	21043	\N	Glichów
21112	21043	\N	Kobielnik
21113	21043	\N	Lipnik
21114	21043	\N	Poznachowice Dolne
21115	21043	\N	Węglówka
21116	21043	\N	Wierzbanowa
21117	21043	\N	Wiśniowa
21118	148	\N	Grybów
21119	148	\N	Chełmiec
21120	148	\N	Gródek nad Dunajcem
21121	148	\N	Kamionka Wielka
21122	148	\N	Korzenna
21123	148	\N	Krynica-Zdrój
21124	148	\N	Łabowa
21125	148	\N	Łącko
21126	148	\N	Łososina Dolna
21127	148	\N	Muszyna
21128	148	\N	Nawojowa
21129	148	\N	Piwniczna-Zdrój
21130	148	\N	Podegrodzie
21131	148	\N	Rytro
21132	148	\N	Stary Sącz
21133	21118	\N	Grybów
21134	21119	\N	Biczyce Dolne
21135	21119	\N	Biczyce Górne
21136	21119	\N	Boguszowa
21137	21119	\N	Chełmiec
21138	21119	\N	Chomranice
21139	21119	\N	Dąbrowa
21140	21119	\N	Januszowa
21141	21119	\N	Klęczany
21142	21119	\N	Klimkówka
21143	21119	\N	Krasne Potockie
21144	21119	\N	Kunów
21145	21119	\N	Kurów
21146	21119	\N	Librantowa
21147	21119	\N	Mała Wieś
21148	21119	\N	Marcinkowice
21149	21119	\N	Naściszowa
21150	21119	\N	Niskowa
21151	21119	\N	Paszyn
21152	21119	\N	Piątkowa
21153	21119	\N	Rdziostów
21154	21119	\N	Świniarsko
21155	21119	\N	Trzetrzewina
21156	21119	\N	Ubiad
21157	21119	\N	Wielogłowy
21158	21119	\N	Wielopole
21159	21119	\N	Wola Kurowska
21160	21119	\N	Wola Marcinkowska
21161	21120	\N	Bartkowa
21162	21120	\N	Bujne
21163	21120	\N	Górowa
21164	21120	\N	Gródek nad Dunajcem
21165	21120	\N	Jelna
21166	21120	\N	Lipie
21167	21120	\N	Podole
21168	21120	\N	Posadowa
21169	21120	\N	Przydonica
21170	21120	\N	Roztoka
21171	21120	\N	Rożnów
21172	21120	\N	Sienna
21173	21120	\N	Tropie
21174	21120	\N	Zbyszyce
21175	21118	\N	Biała Niżna
21176	21118	\N	Binczarowa
21177	21118	\N	Chodorowa
21178	21118	\N	Cieniawa
21179	21118	\N	Florynka
21180	21118	\N	Gródek
21181	21118	\N	Kąclowa
21182	21118	\N	Krużlowa Niżna
21183	21118	\N	Krużlowa Wyżna
21184	21118	\N	Polna
21185	21118	\N	Ptaszkowa
21186	21118	\N	Siołkowa
21187	21118	\N	Stara Wieś
21188	21118	\N	Stróże
21189	21118	\N	Wawrzka
21190	21118	\N	Wyskitna
21191	21121	\N	Bogusza
21192	21121	\N	Jamnica
21193	21121	\N	Kamionka Mała
21194	21121	\N	Kamionka Wielka
21195	21121	\N	Królowa Górna
21196	21121	\N	Królowa Polska
21197	21121	\N	Mszalnica
21198	21121	\N	Mystków
21199	21122	\N	Bukowiec
21200	21122	\N	Janczowa
21201	21122	\N	Jasienna
21202	21122	\N	Koniuszowa
21203	21122	\N	Korzenna
21204	21122	\N	Lipnica Wielka
21205	21122	\N	Łęka
21206	21122	\N	Łyczana
21207	21122	\N	Miłkowa
21208	21122	\N	Mogilno
21209	21122	\N	Niecew
21210	21122	\N	Posadowa Mogilska
21211	21122	\N	Siedlce
21212	21122	\N	Słowikowa
21213	21122	\N	Trzycierz
21214	21122	\N	Wojnarowa
21215	21123	\N	Krynica-Zdrój
21216	21123	\N	Berest
21217	21123	\N	Czyrna
21218	21123	\N	Mochnaczka Niżna
21219	21123	\N	Mochnaczka Wyżna
21220	21123	\N	Muszynka
21221	21123	\N	Piorunka
21222	21123	\N	Polany
21223	21123	\N	Tylicz
21224	21124	\N	Barnowiec
21225	21124	\N	Czaczów
21226	21124	\N	Kamianna
21227	21124	\N	Kotów
21228	21124	\N	Krzyżówka
21229	21124	\N	Łabowa
21230	21124	\N	Łabowiec
21231	21124	\N	Łosie
21232	21124	\N	Maciejowa
21233	21124	\N	Nowa Wieś
21234	21124	\N	Roztoka Wielka
21235	21124	\N	Składziste
21236	21124	\N	Uhryń
21250	21125	\N	Brzyna
21251	21125	\N	Czarny Potok
21252	21125	\N	Czerniec
21253	21125	\N	Jazowsko
21254	21125	\N	Kadcza
21255	21125	\N	Kicznia
21256	21125	\N	Łazy Brzyńskie
21257	21125	\N	Łącko
21258	21125	\N	Maszkowice
21259	21125	\N	Obidza
21260	21125	\N	Szczereż
21261	21125	\N	Wola Kosnowa
21262	21125	\N	Wola Piskulina
21263	21125	\N	Zabrzeż
21264	21125	\N	Zagorzyn
21265	21125	\N	Zarzecze
21266	21126	\N	Białawoda
21267	21126	\N	Bilsko
21268	21126	\N	Łęki
21269	21126	\N	Łososina Dolna
21270	21126	\N	Łyczanka
21271	21126	\N	Michalczowa
21272	21126	\N	Rąbkowa
21273	21126	\N	Skrzętla-Rojówka
21274	21126	\N	Stańkowa
21275	21126	\N	Świdnik
21276	21126	\N	Tabaszowa
21277	21126	\N	Tęgoborze
21278	21126	\N	Witowice Dolne
21279	21126	\N	Witowice Górne
21280	21126	\N	Wronowice
21281	21126	\N	Zawadka
21282	21126	\N	Znamirowice
21283	21126	\N	Żbikowice
21284	21127	\N	Muszyna
21285	21127	\N	Andrzejówka
21286	21127	\N	Dubne
21287	21127	\N	Jastrzębik
21288	21127	\N	Leluchów
21289	21127	\N	Milik
21290	21127	\N	Powroźnik
21291	21127	\N	Szczawnik
21292	21127	\N	Wojkowa
21293	21127	\N	Złockie
21294	21127	\N	Żegiestów
21295	21127	\N	Żegiestów-Zdrój
21296	21128	\N	Bącza-Kunina
21297	21128	\N	Frycowa
21298	21128	\N	Homrzyska
21299	21128	\N	Nawojowa
21300	21128	\N	Popardowa
21301	21128	\N	Złotne
21302	21128	\N	Żeleźnikowa Mała
21303	21128	\N	Żeleźnikowa Wielka
21304	21129	\N	Piwniczna-Zdrój
21305	21129	\N	Głębokie
21306	21129	\N	Kokuszka
21307	21129	\N	Łomnica-Zdrój
21308	21129	\N	Młodów
21309	21129	\N	Niemcowa
21310	21129	\N	Wierchomla Mała
21311	21129	\N	Wierchomla Wielka
21312	21129	\N	Zubrzyk
21313	21130	\N	Brzezna
21314	21130	\N	Chochorowice
21315	21130	\N	Długołęka-Świerkla
21316	21130	\N	Gostwica
21317	21130	\N	Juraszowa
21318	21130	\N	Mokra Wieś
21319	21130	\N	Naszacowice
21320	21130	\N	Olszana
21321	21130	\N	Olszanka
21322	21130	\N	Podegrodzie
21323	21130	\N	Podrzecze
21324	21130	\N	Rogi
21325	21130	\N	Stadła
21326	21131	\N	Obłazy Ryterskie
21327	21131	\N	Roztoka Ryterska
21328	21131	\N	Rytro
21329	21131	\N	Sucha Struga
21330	21132	\N	Stary Sącz
21331	21132	\N	Barcice Dolne
21332	21132	\N	Barcice Górne
21333	21132	\N	Gaboń
21334	21132	\N	Gołkowice Dolne
21335	21132	\N	Gołkowice Górne
21336	21132	\N	Łazy Biegonickie
21337	21132	\N	Mostki
21338	21132	\N	Moszczenica Niżna
21339	21132	\N	Moszczenica Wyżna
21340	21132	\N	Myślec
21341	21132	\N	Popowice
21342	21132	\N	Przysietnica
21343	21132	\N	Skrudzina
21344	21132	\N	Wola Krogulecka
21345	393	\N	Nowy Targ
21346	393	\N	Czarny Dunajec
21347	393	\N	Czorsztyn
21348	393	\N	Jabłonka
21349	393	\N	Krościenko nad Dunajcem
21350	393	\N	Lipnica Wielka
21351	393	\N	Łapsze Niżne
21352	393	\N	Ochotnica Dolna
21353	393	\N	Raba Wyżna
21354	393	\N	Rabka-Zdrój
21355	393	\N	Spytkowice
21356	393	\N	Szaflary
21357	393	\N	Szczawnica
21358	21345	\N	Nowy Targ
21359	21346	\N	Brzuchacze
21360	21346	\N	Chochołów
21361	21346	\N	Chraca
21362	21346	\N	Ciche
21363	21346	\N	Czarny Dunajec
21364	21346	\N	Czerwienne
21365	21346	\N	Dział
21366	21346	\N	Koniówka
21367	21346	\N	Odrowąż
21368	21346	\N	Piekielnik
21369	21346	\N	Pieniążkowice
21370	21346	\N	Podczerwone
21371	21346	\N	Podszkle
21372	21346	\N	Ratułów
21373	21346	\N	Stare Bystre
21374	21346	\N	Szeligówka
21375	21346	\N	Wróblówka
21376	21346	\N	Załuczne
21377	21347	\N	Czorsztyn
21378	21347	\N	Huba
21379	21347	\N	Kąty
21380	21347	\N	Kluszkowce
21381	21347	\N	Maniowy
21382	21347	\N	Mizerna
21383	21347	\N	Sromowce Niżne
21384	21347	\N	Sromowce Wyżne
21385	21348	\N	Chyżne
21386	21348	\N	Danielki
21387	21348	\N	Jabłonka
21388	21348	\N	Lipnica Mała
21389	21348	\N	Orawka
21390	21348	\N	Podwilk
21391	21348	\N	Zawodzie
21392	21348	\N	Zubrzyca Dolna
21393	21348	\N	Zubrzyca Górna
21394	21349	\N	Grywałd
21395	21349	\N	Hałuszowa
21396	21349	\N	Krościenko nad Dunajcem
21397	21349	\N	Krośnica
21398	21349	\N	Tylka
21399	21350	\N	Kiczory
21400	21350	\N	Lipnica Wielka
21401	21350	\N	Śmietanowa
21402	21351	\N	Falsztyn
21403	21351	\N	Frydman
21404	21351	\N	Kacwin
21405	21351	\N	Łapszanka
21406	21351	\N	Łapsze Niżne
21407	21351	\N	Łapsze Wyżne
21408	21351	\N	Niedzica
21409	21351	\N	Trybsz
21410	21351	\N	Zamek
21411	21345	\N	Dębno
21412	21345	\N	Długopole
21413	21345	\N	Dursztyn
21414	21345	\N	Grapa
21415	21345	\N	Gronków
21416	21345	\N	Harklowa
21417	21345	\N	Klikuszowa
21418	21345	\N	Knurów
21419	21345	\N	Krauszów
21420	21345	\N	Krempachy
21421	21345	\N	Lasek
21422	21345	\N	Ludźmierz
21423	21345	\N	Łopuszna
21424	21345	\N	Morawczyna
21425	21345	\N	Nowa Biała
21426	21345	\N	Obidowa
21427	21345	\N	Obroczna
21428	21345	\N	Ostrowsko
21429	21345	\N	Pyzówka
21430	21345	\N	Rogoźnik
21431	21345	\N	Szlembark
21432	21345	\N	Turbacz
21433	21345	\N	Waksmund
21434	21352	\N	Ochotnica Dolna
21435	21352	\N	Ochotnica Górna
21436	21352	\N	Tylmanowa
21437	21353	\N	Bielanka
21438	21353	\N	Bukowina-Osiedle
21439	21353	\N	Harkabuz
21440	21353	\N	Podsarnie
21441	21353	\N	Raba Wyżna
21442	21353	\N	Rokiciny Podhalańskie
21443	21353	\N	Sieniawa
21444	21353	\N	Skawa
21445	21354	\N	Rabka-Zdrój
21446	21354	\N	Chabówka
21447	21354	\N	Ponice
21448	21354	\N	Rdzawka
21449	21355	\N	Spytkowice
21450	21356	\N	Bańska Niżna
21451	21356	\N	Bańska Wyżna
21452	21356	\N	Bór
21453	21356	\N	Maruszyna
21454	21356	\N	Skrzypne
21455	21356	\N	Szaflary
21456	21356	\N	Zaskale
21457	21357	\N	Szczawnica
21458	21357	\N	Jaworki
21459	21357	\N	Szlachtowa
21460	394	\N	Bukowno
21461	394	\N	Bolesław
21462	394	\N	Klucze
21463	394	\N	Olkusz
21464	394	\N	Trzyciąż
21465	394	\N	Wolbrom
21466	21460	\N	Bukowno
21467	21461	\N	Bolesław
21468	21461	\N	Hutki
21469	21461	\N	Kolonia
21470	21461	\N	Krążek
21471	21461	\N	Krze
21472	21461	\N	Krzykawa
21473	21461	\N	Krzykawka
21474	21461	\N	Laski
21475	21461	\N	Małobądz
21476	21461	\N	Międzygórze
21477	21461	\N	Podlipie
21478	21461	\N	Posada
21479	21461	\N	Ujków Nowy
21480	21461	\N	Ujków Stary
21481	21462	\N	Bogucin Duży
21482	21462	\N	Borek
21483	21462	\N	Bydlin
21484	21462	\N	Chechło
21485	21462	\N	Cieślin
21486	21462	\N	Godawica
21487	21462	\N	Golczowice
21488	21462	\N	Góry Bydlińskie
21489	21462	\N	Hucisko Kwaśniowskie
21490	21462	\N	Jaroszowiec
21491	21462	\N	Klucze
21492	21462	\N	Kobylica
21493	21462	\N	Kolbark
21494	21462	\N	Krzywopłoty
21495	21462	\N	Kwaśniów Dolny
21496	21462	\N	Kwaśniów Górny
21497	21462	\N	Młyny
21498	21462	\N	Rodaki
21499	21462	\N	Ryczówek
21500	21462	\N	Zalesie Golczowskie
21501	21462	\N	Zarole
21502	21463	\N	Olkusz
21503	21463	\N	Bogucin Mały
21504	21463	\N	Braciejówka
21505	21463	\N	Czarny Las
21506	21463	\N	Dworskie
21507	21463	\N	Gorenice
21508	21463	\N	Kogutek
21509	21463	\N	Kolonia Zimkówka
21510	21463	\N	Kosmolów
21511	21463	\N	Niesułowice
21512	21463	\N	Olewin
21513	21463	\N	Osiek
21514	21463	\N	Pazurek
21515	21463	\N	Podlesie
21516	21463	\N	Rabsztyn
21517	21463	\N	Sieniczno
21518	21463	\N	Troks
21519	21463	\N	U Granic
21520	21463	\N	Wiśliczka
21521	21463	\N	Witeradów
21522	21463	\N	Zadole Kosmolowskie
21523	21463	\N	Zawada
21524	21463	\N	Zederman
21525	21463	\N	Zimnodół
21526	21463	\N	Żurada
21527	21464	\N	Glanów
21528	21464	\N	Imbramowice
21529	21464	\N	Jangrot
21530	21464	\N	Małyszyce
21531	21464	\N	Michałówka
21532	21464	\N	Milonki
21533	21464	\N	Podchybie
21534	21464	\N	Porąbka
21535	21464	\N	Sucha
21536	21464	\N	Ściborzyce
21537	21464	\N	Tarnawa
21538	21464	\N	Trzyciąż
21539	21464	\N	Zadroże
21540	21464	\N	Zagórowa
21541	21465	\N	Wolbrom
21542	21465	\N	Boża Wola
21543	21465	\N	Brzozówka
21544	21465	\N	Buczyna
21545	21465	\N	Budzyń
21546	21465	\N	Chełm
21547	21465	\N	Chrząstowice
21548	21465	\N	Dłużec
21549	21465	\N	Domaniewice
21550	21465	\N	Gołaczewy
21551	21465	\N	Jeżówka
21552	21465	\N	Kaliś
21553	21465	\N	Kąpiele Wielkie
21554	21465	\N	Kąpiołki
21555	21465	\N	Kolonia Chełmska
21556	21465	\N	Kolonia Suska
21557	21465	\N	Lgota Wielka
21558	21465	\N	Lgota Wolbromska
21559	21465	\N	Łobzów
21560	21465	\N	Majorat
21561	21465	\N	Miechówka
21562	21465	\N	Nadmłynie
21563	21465	\N	Okupniki
21564	21465	\N	Piaski
21565	21465	\N	Podlesice Drugie
21566	21465	\N	Poręba Dzierżna
21567	21465	\N	Poręba Górna
21568	21465	\N	Rędziny
21569	21465	\N	Strzegowa
21570	21465	\N	Sulisławice
21571	21465	\N	Wierzchowisko
21572	21465	\N	Wymysłów
21573	21465	\N	Zabagnie
21574	21465	\N	Załęże
21575	21465	\N	Zarzecze
21576	21465	\N	Zasępiec
21577	395	\N	Oświęcim
21578	395	\N	Brzeszcze
21579	395	\N	Chełmek
21580	395	\N	Kęty
21581	395	\N	Osiek
21582	395	\N	Polanka Wielka
21583	395	\N	Przeciszów
21584	395	\N	Zator
21585	21577	\N	Oświęcim
21586	21578	\N	Brzeszcze
21587	21578	\N	Jawiszowice
21588	21578	\N	Przecieszyn
21589	21578	\N	Skidzin
21590	21578	\N	Wilczkowice
21591	21578	\N	Zasole
21592	21579	\N	Chełmek
21593	21579	\N	Bobrek
21594	21579	\N	Gorzów
21595	21579	\N	Nowopole
21596	21580	\N	Kęty
21597	21580	\N	Babuda
21598	21580	\N	Bielany
21599	21580	\N	Buk
21600	21580	\N	Bulowice
21601	21580	\N	Granica
21602	21580	\N	Kuskowizna
21603	21580	\N	Latonka
21604	21580	\N	Łęki
21605	21580	\N	Malec
21606	21580	\N	Nowa Wieś
21607	21580	\N	Sybir
21608	21580	\N	Witkowice
21609	21581	\N	Głębowice
21610	21581	\N	Karolina
21611	21581	\N	Osiek
21612	21581	\N	Rzepowskie
21613	21577	\N	Babice
21614	21577	\N	Broszkowice
21615	21577	\N	Brzezinka
21616	21577	\N	Dwory Drugie
21617	21577	\N	Grojec
21618	21577	\N	Harmęże
21619	21577	\N	Łazy
21620	21577	\N	Pławy
21621	21577	\N	Poręba Wielka
21622	21577	\N	Puściny
21623	21577	\N	Rajsko
21624	21577	\N	Stawy Monowskie
21625	21577	\N	Włosienica
21626	21577	\N	Zaborze
21627	21582	\N	Pasternik
21628	21582	\N	Polanka Wielka
21629	21583	\N	Las
21630	21583	\N	Piotrowice
21631	21583	\N	Przeciszów
21632	21584	\N	Zator
21633	21584	\N	Graboszyce
21634	21584	\N	Grodzisko
21635	21584	\N	Laskowa
21636	21584	\N	Łowiczki
21637	21584	\N	Palczowice
21638	21584	\N	Podolsze
21639	21584	\N	Rudze
21640	21584	\N	Smolice
21641	21584	\N	Trzebieńczyce
21642	396	\N	Koniusza
21643	396	\N	Koszyce
21644	396	\N	Nowe Brzesko
21645	396	\N	Pałecznica
21646	396	\N	Proszowice
21647	396	\N	Radziemice
21648	21642	\N	Biórków Mały
21649	21642	\N	Biórków Wielki
21650	21642	\N	Budziejowice
21651	21642	\N	Chorążyce
21652	21642	\N	Czernichów
21653	21642	\N	Dalewice
21654	21642	\N	Glew
21655	21642	\N	Glewiec
21656	21642	\N	Gnatowice
21657	21642	\N	Górka Jaklińska
21658	21642	\N	Karwin
21659	21642	\N	Koniusza
21660	21642	\N	Łyszkowice
21661	21642	\N	Muniaczkowice
21662	21642	\N	Niegardów
21663	21642	\N	Niegardów-Kolonia
21664	21642	\N	Piotrkowice Małe
21665	21642	\N	Piotrkowice Wielkie
21666	21642	\N	Polekarcice
21667	21642	\N	Posądza
21668	21642	\N	Przesławice
21669	21642	\N	Rzędowice
21670	21642	\N	Siedliska
21671	21642	\N	Szarbia
21672	21642	\N	Wąsów
21673	21642	\N	Wierzbno
21674	21642	\N	Wroniec
21675	21642	\N	Wronin
21676	21642	\N	Zielona
21677	21643	\N	Biskupice
21678	21643	\N	Dolany
21679	21643	\N	Filipowice
21680	21643	\N	Jaksice
21681	21643	\N	Jankowice
21682	21643	\N	Koszyce
21683	21643	\N	Książnice Małe
21684	21643	\N	Książnice Wielkie
21685	21643	\N	Łapszów
21686	21643	\N	Malkowice
21687	21643	\N	Modrzany
21688	21643	\N	Morsko
21689	21643	\N	Piotrowice
21690	21643	\N	Przemyków
21691	21643	\N	Rachwałowice
21692	21643	\N	Siedliska
21693	21643	\N	Sokołowice
21694	21643	\N	Witów
21695	21643	\N	Włostowice
21696	21643	\N	Zagaje Książnickie
21697	21644	\N	Grębocin
21698	21644	\N	Gruszów
21699	21644	\N	Hebdów
21700	21644	\N	Kuchary
21701	21644	\N	Majkowice
21702	21644	\N	Mniszów
21703	21644	\N	Mniszów-Kolonia
21704	21644	\N	Nowe Brzesko
21705	21644	\N	Pławowice
21706	21644	\N	Przybysławice
21707	21644	\N	Rudno Dolne
21708	21644	\N	Sierosławice
21709	21644	\N	Szpitary
21710	21644	\N	Śmiłowice
21711	21645	\N	Bolów
21712	21645	\N	Czuszów
21713	21645	\N	Gruszów
21714	21645	\N	Ibramowice
21715	21645	\N	Lelowice-Kolonia
21716	21645	\N	Łaszów
21717	21645	\N	Nadzów
21718	21645	\N	Niezwojowice
21719	21645	\N	Pałecznica
21720	21645	\N	Pamięcice
21721	21645	\N	Pieczonogi
21722	21645	\N	Solcza
21723	21645	\N	Sudołek
21724	21645	\N	Winiary
21725	21646	\N	Proszowice
21726	21646	\N	Bobin
21727	21646	\N	Ciborowice
21728	21646	\N	Czajęcice
21729	21646	\N	Gniazdowice
21730	21646	\N	Górka Stogniowska
21731	21646	\N	Jakubowice
21732	21646	\N	Jazdowiczki
21733	21646	\N	Kadzice
21734	21646	\N	Klimontów
21735	21646	\N	Koczanów
21736	21646	\N	Kościelec
21737	21646	\N	Kowala
21738	21646	\N	Łaganów
21739	21646	\N	Makocice
21740	21646	\N	Mysławczyce
21741	21646	\N	Opatkowice
21742	21646	\N	Ostrów
21743	21646	\N	Piekary
21744	21646	\N	Posiłów
21745	21646	\N	Przezwody
21746	21646	\N	Stogniowice
21747	21646	\N	Szczytniki
21748	21646	\N	Szczytniki-Kolonia
21749	21646	\N	Szklana
21750	21646	\N	Szreniawa
21751	21646	\N	Teresin
21752	21646	\N	Więckowice
21753	21646	\N	Wolwanowice
21754	21646	\N	Żębocin
21755	21647	\N	Błogocice
21756	21647	\N	Dodów
21757	21647	\N	Kaczowice
21758	21647	\N	Kąty
21759	21647	\N	Kowary
21760	21647	\N	Lelowice
21761	21647	\N	Łętkowice
21762	21647	\N	Łętkowice-Kolonia
21763	21647	\N	Obrażejowice
21764	21647	\N	Przemęczanki
21765	21647	\N	Przemęczany
21766	21647	\N	Radziemice
21767	21647	\N	Smoniowice
21768	21647	\N	Wierzbica
21769	21647	\N	Wola Gruszowska
21770	21647	\N	Wrocimowice
21771	21647	\N	Zielenice
21772	397	\N	Jordanów
21773	397	\N	Sucha Beskidzka
21774	397	\N	Budzów
21775	397	\N	Bystra-Sidzina
21776	397	\N	Maków Podhalański
21777	397	\N	Stryszawa
21778	397	\N	Zawoja
21779	397	\N	Zembrzyce
21780	21772	\N	Jordanów
21781	21773	\N	Sucha Beskidzka
21782	21774	\N	Baczyn
21783	21774	\N	Bieńkówka
21784	21774	\N	Budzów
21785	21774	\N	Jachówka
21786	21774	\N	Palcza
21787	21774	\N	Polany
21788	21774	\N	Zachełmna
21789	21775	\N	Bystra
21790	21775	\N	Do Kamieńskiego
21791	21775	\N	Jarominy
21792	21775	\N	Krupowa Hala
21793	21775	\N	Malinowo
21794	21775	\N	Sidzina
21795	21775	\N	Stasinka
21796	21775	\N	Staszkowie
21797	21775	\N	Wielka Polana
21798	21775	\N	Zagrody
21799	21772	\N	Folwark
21800	21772	\N	Łętownia
21801	21772	\N	Naprawa
21802	21772	\N	Osielec
21803	21772	\N	Toporzysko
21804	21772	\N	Wysoka
21805	21776	\N	Maków Podhalański
21806	21776	\N	Białka
21807	21776	\N	Grzechynia
21808	21776	\N	Juszczyn
21809	21776	\N	Kojszówka
21810	21776	\N	Wieprzec
21811	21776	\N	Żarnówka
21812	21777	\N	Chmiele
21813	21777	\N	Czubakówka
21814	21777	\N	Górki
21815	21777	\N	Granica
21816	21777	\N	Hucisko
21817	21777	\N	Kadelówka
21818	21777	\N	Krale
21819	21777	\N	Krzeszów
21820	21777	\N	Kuków
21821	21777	\N	Kurów
21822	21777	\N	Lachowice
21823	21777	\N	Laliki
21824	21777	\N	Lechówka
21825	21777	\N	Mączne
21826	21777	\N	Pewelka
21827	21777	\N	Podkoźle
21828	21777	\N	Podoły
21829	21777	\N	Stachówka Dolna
21830	21777	\N	Stachówka Górna
21831	21777	\N	Stryszawa
21832	21777	\N	Targoszów
21833	21777	\N	U Kachla
21834	21777	\N	Zagrody
21835	21778	\N	Markowe Szczawiny
21836	21778	\N	Norczak
21837	21778	\N	Skawica
21838	21778	\N	Zawoja
21839	21779	\N	Cyrchel
21840	21779	\N	Jaworki
21841	21779	\N	Marcówka
21842	21779	\N	Paracowie
21843	21779	\N	Śleszowice
21844	21779	\N	Tarnawa Dolna
21845	21779	\N	Tarnawa Górna
21846	21779	\N	Tarnawska Góra
21847	21779	\N	U Kachla
21848	21779	\N	Zarębki
21849	21779	\N	Zembrzyce
21850	21779	\N	Żmijówka
21851	149	\N	Ciężkowice
21852	149	\N	Gromnik
21853	149	\N	Lisia Góra
21854	149	\N	Pleśna
21855	149	\N	Radłów
21856	149	\N	Ryglice
21857	149	\N	Rzepiennik Strzyżewski
21858	149	\N	Skrzyszów
21859	149	\N	Szerzyny
21860	149	\N	Tarnów
21861	149	\N	Tuchów
21862	149	\N	Wierzchosławice
21863	149	\N	Wietrzychowice
21864	149	\N	Wojnicz
21865	149	\N	Zakliczyn
21866	149	\N	Żabno
21867	21851	\N	Ciężkowice
21868	21851	\N	Bogoniowice
21869	21851	\N	Bruśnik
21870	21851	\N	Falkowa
21871	21851	\N	Jastrzębia
21872	21851	\N	Kąśna Dolna
21873	21851	\N	Kąśna Górna
21874	21851	\N	Kipszna
21875	21851	\N	Ostrusza
21876	21851	\N	Pławna
21877	21851	\N	Siekierczyna
21878	21851	\N	Tursko
21879	21851	\N	Zborowice
21880	21852	\N	Brzozowa
21881	21852	\N	Chojnik
21882	21852	\N	Golanka
21883	21852	\N	Gromnik
21884	21852	\N	Polichty
21885	21852	\N	Rzepiennik Marciszewski
21886	21852	\N	Siemiechów
21887	21853	\N	Breń
21888	21853	\N	Brzozówka
21889	21853	\N	Kobierzyn
21890	21853	\N	Lisia Góra
21891	21853	\N	Łukowa
21892	21853	\N	Nowa Jastrząbka
21893	21853	\N	Nowe Żukowice
21894	21853	\N	Pawęzów
21895	21853	\N	Stare Żukowice
21896	21853	\N	Śmigno
21897	21853	\N	Zaczarnie
21898	21853	\N	Zagórze
21899	21854	\N	Dąbrówka Szczepanowska
21900	21854	\N	Janowice
21901	21854	\N	Lichwin
21902	21854	\N	Lubinka
21903	21854	\N	Łowczówek
21904	21854	\N	Pleśna
21905	21854	\N	Rychwałd
21906	21854	\N	Rzuchowa
21907	21854	\N	Szczepanowice
21908	21854	\N	Świebodzin
21909	21854	\N	Woźniczna
21910	21855	\N	Biskupice Radłowskie
21911	21855	\N	Brzeźnica
21912	21855	\N	Glów
21913	21855	\N	Łęka Siedlecka
21914	21855	\N	Marcinkowice
21915	21855	\N	Niwka
21916	21855	\N	Przybysławice
21917	21855	\N	Radłów
21918	21855	\N	Sanoka
21919	21855	\N	Siedlec
21920	21855	\N	Wał-Ruda
21921	21855	\N	Wola Radłowska
21922	21855	\N	Zabawa
21923	21855	\N	Zdrochec
21924	21856	\N	Ryglice
21925	21856	\N	Bistuszowa
21926	21856	\N	Joniny
21927	21856	\N	Kowalowa
21928	21856	\N	Lubcza
21929	21856	\N	Uniszowa
21930	21856	\N	Wola Lubecka
21931	21856	\N	Zalasowa
21932	21857	\N	Kołkówka
21933	21857	\N	Olszyny
21934	21857	\N	Rzepiennik Biskupi
21935	21857	\N	Rzepiennik Strzyżewski
21936	21857	\N	Rzepiennik Suchy
21937	21857	\N	Turza
21938	21858	\N	Ładna
21939	21858	\N	Łękawica
21940	21858	\N	Pogórska Wola
21941	21858	\N	Skrzyszów
21942	21858	\N	Szynwałd
21943	21859	\N	Czermna
21944	21859	\N	Ołpiny
21945	21859	\N	Swoszowa
21946	21859	\N	Szerzyny
21947	21859	\N	Żurowa
21948	21860	\N	Biała
21949	21860	\N	Błonie
21950	21860	\N	Jodłówka-Wałki
21951	21860	\N	Koszyce Małe
21952	21860	\N	Koszyce Wielkie
21953	21860	\N	Łękawka
21954	21860	\N	Nowodworze
21955	21860	\N	Poręba Radlna
21956	21860	\N	Radlna
21957	21860	\N	Tarnowiec
21958	21860	\N	Wola Rzędzińska
21959	21860	\N	Zawada
21960	21860	\N	Zbylitowska Góra
21961	21860	\N	Zgłobice
21962	21860	\N	Tarnów
21963	21861	\N	Tuchów
21964	21861	\N	Buchcice
21965	21861	\N	Burzyn
21966	21861	\N	Dąbrówka Tuchowska
21967	21861	\N	Jodłówka Tuchowska
21968	21861	\N	Karwodrza
21969	21861	\N	Lubaszowa
21970	21861	\N	Łowczów
21971	21861	\N	Meszna Opacka
21972	21861	\N	Piotrkowice
21973	21861	\N	Siedliska
21974	21861	\N	Trzemeszna
21975	21861	\N	Zabłędza
21976	21862	\N	Bobrowniki Małe
21977	21862	\N	Bogumiłowice
21978	21862	\N	Gosławice
21979	21862	\N	Kępa Bogumiłowicka
21980	21862	\N	Komorów
21981	21862	\N	Łętowice
21982	21862	\N	Mikołajowice
21983	21862	\N	Ostrów
21984	21862	\N	Rudka
21985	21862	\N	Sieciechowice
21986	21862	\N	Wierzchosławice
21987	21863	\N	Demblin
21988	21863	\N	Jadowniki Mokre
21989	21863	\N	Miechowice Małe
21990	21863	\N	Miechowice Wielkie
21991	21863	\N	Nowopole
21992	21863	\N	Pałuszyce
21993	21863	\N	Sikorzyce
21994	21863	\N	Wietrzychowice
21995	21863	\N	Wola Rogowska
21996	21864	\N	Wojnicz
21997	21864	\N	Biadoliny Radłowskie
21998	21864	\N	Dębina Łętowska
21999	21864	\N	Dębina Zakrzowska
22000	21864	\N	Grabno
22001	21864	\N	Isep
22002	21864	\N	Łopoń
22003	21864	\N	Łukanowice
22004	21864	\N	Milówka
22005	21864	\N	Olszyny
22006	21864	\N	Rudka
22007	21864	\N	Sukmanie
22008	21864	\N	Wielka Wieś
22009	21864	\N	Więckowice
22010	21864	\N	Zakrzów
22011	21865	\N	Zakliczyn
22012	21865	\N	Bieśnik
22013	21865	\N	Borowa
22014	21865	\N	Charzewice
22015	21865	\N	Dzierżaniny
22016	21865	\N	Faliszewice
22017	21865	\N	Faściszowa
22018	21865	\N	Filipowice
22019	21865	\N	Gwoździec
22020	21865	\N	Jamna
22021	21865	\N	Kończyska
22022	21865	\N	Lusławice
22023	21865	\N	Melsztyn
22024	21865	\N	Olszowa
22025	21865	\N	Paleśnica
22026	21865	\N	Roztoka
22027	21865	\N	Ruda Kameralna
22028	21865	\N	Słona
22029	21865	\N	Stróże
22030	21865	\N	Wesołów
22031	21865	\N	Wola Stróska
22032	21865	\N	Wróblowice
22033	21865	\N	Zawada Lanckorońska
22034	21865	\N	Zdonia
22035	21866	\N	Żabno
22036	21866	\N	Bobrowniki Wielkie
22037	21866	\N	Chorążec
22038	21866	\N	Czyżów
22039	21866	\N	Goruszów
22040	21866	\N	Gorzyce
22041	21866	\N	Ilkowice
22042	21866	\N	Janikowice
22043	21866	\N	Kłyż
22044	21866	\N	Łęg Tarnowski
22045	21866	\N	Nieciecza
22046	21866	\N	Niedomice
22047	21866	\N	Odporyszów
22048	21866	\N	Otfinów
22049	21866	\N	Pasieka Otfinowska
22050	21866	\N	Pierszyce
22051	21866	\N	Podlesie Dębowe
22052	21866	\N	Siedliszowice
22053	21866	\N	Sieradza
22054	142	\N	Zakopane
22055	142	\N	Biały Dunajec
22056	142	\N	Bukowina Tatrzańska
22057	142	\N	Kościelisko
22058	142	\N	Poronin
22059	22054	\N	Zakopane
22060	22055	\N	Biały Dunajec
22061	22055	\N	Gliczarów Dolny
22062	22055	\N	Gliczarów Górny
22063	22055	\N	Leszczyny
22064	22055	\N	Sierockie
22065	22056	\N	Białka Tatrzańska
22066	22056	\N	Brzegi
22067	22056	\N	Bukowina Tatrzańska
22068	22056	\N	Czarna Góra
22069	22056	\N	Dolina Pięciu Stawów
22070	22056	\N	Grocholów-Potok
22071	22056	\N	Groń
22072	22056	\N	Jurgów
22073	22056	\N	Leśnica
22074	22056	\N	Łysa Polana
22075	22056	\N	Morskie Oko
22076	22056	\N	Polana-Głodówka
22077	22056	\N	Roztoka
22078	22056	\N	Rzepiska
22079	22056	\N	Włosienica
22080	22056	\N	Wojtyczków-Potok
22081	22057	\N	Dolina Chochołowska
22082	22057	\N	Dzianisz
22083	22057	\N	Hala Pisana
22084	22057	\N	Kościelisko
22085	22057	\N	Ornak
22086	22057	\N	Witów
22087	22058	\N	Bustryk
22088	22058	\N	Małe Ciche
22089	22058	\N	Murzasichle
22090	22058	\N	Nowe Bystre
22091	22058	\N	Poronin
22092	22058	\N	Suche
22093	22058	\N	Ząb
22094	143	\N	Andrychów
22095	143	\N	Brzeźnica
22096	143	\N	Kalwaria Zebrzydowska
22097	143	\N	Lanckorona
22098	143	\N	Mucharz
22099	143	\N	Spytkowice
22100	143	\N	Stryszów
22101	143	\N	Tomice
22102	143	\N	Wadowice
22103	143	\N	Wieprz
22104	22094	\N	Andrychów
22105	22094	\N	Brzezinka
22106	22094	\N	Groń
22107	22094	\N	Inwałd
22108	22094	\N	Roczyny
22109	22094	\N	Rzyki
22110	22094	\N	Sułkowice
22111	22094	\N	Targanice
22112	22094	\N	Zagórnik
22113	22095	\N	Bęczyn
22114	22095	\N	Brzezinka
22115	22095	\N	Brzeźnica
22116	22095	\N	Chrząstowice
22117	22095	\N	Kopytówka
22118	22095	\N	Kossowa
22119	22095	\N	Łączany
22120	22095	\N	Marcyporęba
22121	22095	\N	Nowe Dwory
22122	22095	\N	Paszkówka
22123	22095	\N	Sosnowice
22124	22095	\N	Tłuczań
22125	22095	\N	Wyźrał
22126	22096	\N	Kalwaria Zebrzydowska
22127	22096	\N	Barwałd Górny
22128	22096	\N	Barwałd Średni
22129	22096	\N	Brody
22130	22096	\N	Bugaj
22131	22096	\N	Leńcze
22132	22096	\N	Podolany
22133	22096	\N	Przytkowice
22134	22096	\N	Stanisław Dolny
22135	22096	\N	Zarzyce Małe
22136	22096	\N	Zarzyce Wielkie
22137	22096	\N	Zebrzydowice
22138	22097	\N	Izdebnik
22139	22097	\N	Jastrzębia
22140	22097	\N	Lanckorona
22141	22097	\N	Podchybie
22142	22097	\N	Skawinki
22143	22098	\N	Jaszczurowa
22144	22098	\N	Koziniec
22145	22098	\N	Mucharz
22146	22098	\N	Skawce
22147	22098	\N	Świnna Poręba
22148	22098	\N	Zagórze
22149	22099	\N	Bachowice
22150	22099	\N	Lipowa
22151	22099	\N	Miejsce
22152	22099	\N	Półwieś
22153	22099	\N	Ryczów
22154	22099	\N	Spytkowice
22155	22100	\N	Dąbrówka
22156	22100	\N	Leśnica
22157	22100	\N	Łękawica
22158	22100	\N	Stronie
22159	22100	\N	Stryszów
22160	22100	\N	Zakrzów
22161	22101	\N	Lgota
22162	22101	\N	Radocza
22163	22101	\N	Tomice
22164	22101	\N	Witanowice
22165	22101	\N	Woźniki
22166	22101	\N	Zygodowice
22167	22102	\N	Wadowice
22168	22102	\N	Babica
22169	22102	\N	Barwałd Dolny
22170	22102	\N	Chocznia
22171	22102	\N	Gorzeń Dolny
22172	22102	\N	Gorzeń Górny
22173	22102	\N	Górnica
22174	22102	\N	Jaroszowice
22175	22102	\N	Kaczyna
22176	22102	\N	Klecza Dolna
22177	22102	\N	Klecza Górna
22178	22102	\N	Ponikiew
22179	22102	\N	Roków
22180	22102	\N	Stanisław Górny
22181	22102	\N	Wysoka
22182	22102	\N	Zawadka
22183	22103	\N	Frydrychowice
22184	22103	\N	Gierałtowice
22185	22103	\N	Gierałtowiczki
22186	22103	\N	Nidek
22187	22103	\N	Przybradz
22188	22103	\N	Wieprz
22189	144	\N	Biskupice
22190	144	\N	Gdów
22191	144	\N	Kłaj
22192	144	\N	Niepołomice
22193	144	\N	Wieliczka
22194	22189	\N	Biskupice
22195	22189	\N	Bodzanów
22196	22189	\N	Jawczyce
22197	22189	\N	Łazany
22198	22189	\N	Przebieczany
22199	22189	\N	Sławkowice
22200	22189	\N	Sułów
22201	22189	\N	Szczygłów
22202	22189	\N	Tomaszkowice
22203	22189	\N	Trąbki
22204	22189	\N	Zabłocie
22205	22190	\N	Bilczyce
22206	22190	\N	Cichawa
22207	22190	\N	Czyżów
22208	22190	\N	Fałkowice
22209	22190	\N	Gdów
22210	22190	\N	Hucisko
22211	22190	\N	Jaroszówka
22212	22190	\N	Klęczana
22213	22190	\N	Krakuszowice
22214	22190	\N	Książnice
22215	22190	\N	Kunice
22216	22190	\N	Liplas
22217	22190	\N	Marszowice
22218	22190	\N	Niegowić
22219	22190	\N	Niewiarów
22220	22190	\N	Nieznanowice
22221	22190	\N	Niżowa
22222	22190	\N	Pierzchów
22223	22190	\N	Podolany
22224	22190	\N	Stryszowa
22225	22190	\N	Szczytniki
22226	22190	\N	Świątniki Dolne
22227	22190	\N	Wiatowice
22228	22190	\N	Wieniec
22229	22190	\N	Winiary
22230	22190	\N	Zagórzany
22231	22190	\N	Zalesiany
22232	22190	\N	Zborczyce
22233	22190	\N	Zręczyce
22234	22191	\N	Brzezie
22235	22191	\N	Dąbrowa
22236	22191	\N	Grodkowice
22237	22191	\N	Kłaj
22238	22191	\N	Łężkowice
22239	22191	\N	Łysokanie
22240	22191	\N	Poszyna
22241	22191	\N	Poszynka
22242	22191	\N	Ptakówka
22243	22191	\N	Szarów
22244	22191	\N	Targowisko
22245	22192	\N	Niepołomice
22246	22192	\N	Chobot
22247	22192	\N	Ochmanów
22248	22192	\N	Podłęże
22249	22192	\N	Słomiróg
22250	22192	\N	Staniątki
22251	22192	\N	Suchoraba
22252	22192	\N	Wola Batorska
22253	22192	\N	Wola Zabierzowska
22254	22192	\N	Zabierzów Bocheński
22255	22192	\N	Zagórze
22256	22192	\N	Zakrzowiec
22257	22192	\N	Zakrzów
22258	22193	\N	Wieliczka
22259	22193	\N	Brzegi
22260	22193	\N	Byszyce
22261	22193	\N	Chorągwica
22262	22193	\N	Czarnochowice
22263	22193	\N	Dobranowice
22264	22193	\N	Golkowice
22265	22193	\N	Gorzków
22266	22193	\N	Grabie
22267	22193	\N	Grabówki
22268	22193	\N	Grajów
22269	22193	\N	Jankówka
22270	22193	\N	Janowice
22271	22193	\N	Kokotów
22272	22193	\N	Koźmice Małe
22273	22193	\N	Koźmice Wielkie
22274	22193	\N	Lednica Górna
22275	22193	\N	Mała Wieś
22276	22193	\N	Mietniów
22277	22193	\N	Pawlikowice
22278	22193	\N	Podstolice
22279	22193	\N	Raciborsko
22280	22193	\N	Rożnowa
22281	22193	\N	Siercza
22282	22193	\N	Strumiany
22283	22193	\N	Sułków
22284	22193	\N	Sygneczów
22285	22193	\N	Śledziejowice
22286	22193	\N	Węgrzce Wielkie
22287	22193	\N	Zabawa
22288	145	\N	M. Kraków
22289	145	\N	Kraków-Krowodrza
22290	145	\N	Kraków-Nowa Huta
22291	145	\N	Kraków-Podgórze
22292	145	\N	Kraków-Śródmieście
22293	22288	\N	Kraków
22294	22289	\N	Kraków-Krowodrza
22295	22290	\N	Kraków-Nowa Huta
22296	22291	\N	Kraków-Podgórze
22297	22292	\N	Kraków-Śródmieście
22298	147	\N	M. Nowy Sącz
22299	22298	\N	Nowy Sącz
22300	150	\N	Tarnów
22301	22300	\N	Tarnów
22302	151	\N	Białobrzegi
22303	151	\N	Promna
22304	151	\N	Radzanów
22305	151	\N	Stara Błotnica
22306	151	\N	Stromiec
22307	151	\N	Wyśmierzyce
22308	22302	\N	Białobrzegi
22309	22302	\N	Brzeska Wola
22310	22302	\N	Brzeźce
22311	22302	\N	Budy Brankowskie
22312	22302	\N	Dąbrówka
22313	22302	\N	Jasionna
22314	22302	\N	Kamień
22315	22302	\N	Kolonia Brzeźce
22316	22302	\N	Leopoldów
22317	22302	\N	Mikówka
22318	22302	\N	Okrąglik
22319	22302	\N	Pohulanka
22320	22302	\N	Stawiszyn
22321	22302	\N	Sucha
22322	22302	\N	Suski Młynek
22323	22302	\N	Szczyty
22324	22302	\N	Turno
22325	22302	\N	Wojciechówka
22326	22303	\N	Adamów
22327	22303	\N	Biejkowska Wola
22328	22303	\N	Biejków
22329	22303	\N	Bronisławów
22330	22303	\N	Broniszew
22331	22303	\N	Daltrozów
22332	22303	\N	Domaniewice
22333	22303	\N	Falęcice
22334	22303	\N	Falęcice-Parcela
22335	22303	\N	Falęcice-Wola
22336	22303	\N	Gajówka Jastrzębia
22337	22303	\N	Góry
22338	22303	\N	Helenów
22339	22303	\N	Jadwigów
22340	22303	\N	Karolin
22341	22303	\N	Lekarcice
22342	22303	\N	Lekarcice Nowe
22343	22303	\N	Lekarcice Stare
22344	22303	\N	Lisów
22345	22303	\N	Mała Wieś
22346	22303	\N	Mała Wysoka
22347	22303	\N	Olkowice
22348	22303	\N	Olszamy
22349	22303	\N	Osuchów
22350	22303	\N	Pacew
22351	22303	\N	Pelinów
22352	22303	\N	Piekarty
22353	22303	\N	Piotrów
22354	22303	\N	Pnie
22355	22303	\N	Promna
22356	22303	\N	Promna-Kolonia
22357	22303	\N	Przybyszew
22358	22303	\N	Rykały
22359	22303	\N	Sielce
22360	22303	\N	Stanisławów
22361	22303	\N	Wojciechówka
22362	22303	\N	Wola Branecka
22363	22303	\N	Zbrosza Mała
22364	22304	\N	Błeszno
22365	22304	\N	Branica
22366	22304	\N	Bukówno
22367	22304	\N	Czarnocin
22368	22304	\N	Gołosze
22369	22304	\N	Grotki
22370	22304	\N	Kadłubska Wola
22371	22304	\N	Kępina
22372	22304	\N	Kozłów
22373	22304	\N	Ludwików
22374	22304	\N	Łukaszów
22375	22304	\N	Młodynie Dolne
22376	22304	\N	Młodynie Górne
22377	22304	\N	Ocieść
22378	22304	\N	Podgórze
22379	22304	\N	Podlesie
22380	22304	\N	Radzanów
22381	22304	\N	Ratoszyn
22382	22304	\N	Rogolin
22383	22304	\N	Smardzew
22384	22304	\N	Wólka Kadłubska
22385	22304	\N	Zacharzów
22386	22304	\N	Żydy
22387	22305	\N	Chruściechów
22388	22305	\N	Czyżówka
22389	22305	\N	Gozdowska Wola
22390	22305	\N	Grodzisko
22391	22305	\N	Jakubów
22392	22305	\N	Kaszów
22393	22305	\N	Łępin
22394	22305	\N	Nowy Gózd
22395	22305	\N	Nowy Kadłubek
22396	22305	\N	Nowy Kiełbów
22397	22305	\N	Pągowiec
22398	22305	\N	Pierzchnia
22399	22305	\N	Recica
22400	22305	\N	Ryki
22401	22305	\N	Siemiradz
22402	22305	\N	Stara Błotnica
22403	22305	\N	Stare Siekluki
22404	22305	\N	Stare Żdżary
22405	22305	\N	Stary Gózd
22406	22305	\N	Stary Kadłub
22407	22305	\N	Stary Kadłubek
22408	22305	\N	Stary Kiełbów
22409	22305	\N	Stary Kobylnik
22410	22305	\N	Stary Osów
22411	22305	\N	Stary Sopot
22412	22305	\N	Trąbki
22413	22305	\N	Tursk
22414	22305	\N	Wólka Pierzchnieńska
22415	22305	\N	Żabia Wola
22416	22306	\N	Biała Góra
22417	22306	\N	Bobrek
22418	22306	\N	Bobrek-Kolonia
22419	22306	\N	Boska Wola
22420	22306	\N	Boże
22421	22306	\N	Dobieszyn
22422	22306	\N	Ducka Wola
22423	22306	\N	Grabowy Las
22424	22306	\N	Kalinów
22425	22306	\N	Kolonia Sielce
22426	22306	\N	Krzemień
22427	22306	\N	Ksawerów Nowy
22428	22306	\N	Ksawerów Stary
22429	22306	\N	Lipskie Budy
22430	22306	\N	Majdan
22431	22306	\N	Małe Boże
22432	22306	\N	Marianki
22433	22306	\N	Matyldzin
22434	22306	\N	Mokry Las
22435	22306	\N	Nadleśnictwo Dobieszyn
22436	22306	\N	Nętne
22437	22306	\N	Niedabyl
22438	22306	\N	Olszowa Dąbrowa
22439	22306	\N	Pietrusin
22440	22306	\N	Piróg
22441	22306	\N	Podgaje
22442	22306	\N	Podlesie Duże
22443	22306	\N	Podlesie Małe
22444	22306	\N	Pokrzywna
22445	22306	\N	Radosz
22446	22306	\N	Sielce
22447	22306	\N	Stara Wieś
22448	22306	\N	Stromiec
22449	22306	\N	Stromiecka Wola
22450	22306	\N	Sułków
22451	22306	\N	Zabagnie
22452	22306	\N	Zachmiel
22453	22307	\N	Wyśmierzyce
22454	22307	\N	Aleksandrów
22455	22307	\N	Brodek
22456	22307	\N	Górki
22457	22307	\N	Grzmiąca
22458	22307	\N	Jabłonna
22459	22307	\N	Jakubówka
22460	22307	\N	Jeruzal
22461	22307	\N	Kiedrzyn
22462	22307	\N	Klamy
22463	22307	\N	Korzeń
22464	22307	\N	Kostrzyn
22465	22307	\N	Kozłów
22466	22307	\N	Kożuchów
22467	22307	\N	Olszowe
22468	22307	\N	Paprotno
22469	22307	\N	Redlin
22470	22307	\N	Romanów
22471	22307	\N	Ulaski Grzmiąckie
22472	22307	\N	Ulaski Stamirowskie
22473	22307	\N	Witaszyn
22474	22307	\N	Wólka Kożuchowska
22475	152	\N	Ciechanów
22476	152	\N	Glinojeck
22477	152	\N	Gołymin-Ośrodek
22478	152	\N	Grudusk
22479	152	\N	Ojrzeń
22480	152	\N	Opinogóra Górna
22481	152	\N	Regimin
22482	152	\N	Sońsk
22483	22475	\N	Ciechanów
22484	22475	\N	Baby
22485	22475	\N	Baraki Chotumskie
22486	22475	\N	Chotum
22487	22475	\N	Chruszczewo
22488	22475	\N	Gąski
22489	22475	\N	Gołoty
22490	22475	\N	Gorysze
22491	22475	\N	Grędzice
22492	22475	\N	Gumowo
22493	22475	\N	Kanigówek
22494	22475	\N	Kargoszyn
22495	22475	\N	Kownaty Żędowe
22496	22475	\N	Mieszki-Różki
22497	22475	\N	Mieszki Wielkie
22498	22475	\N	Modełka
22499	22475	\N	Modła
22500	22475	\N	Niechodzin
22501	22475	\N	Niestum
22502	22475	\N	Nowa Wieś
22503	22475	\N	Nużewko
22504	22475	\N	Nużewo
22505	22475	\N	Pęchcin
22506	22475	\N	Przążewo
22507	22475	\N	Ropele
22508	22475	\N	Rutki-Begny
22509	22475	\N	Rutki-Borki
22510	22475	\N	Rutki-Głowice
22511	22475	\N	Rutki-Marszewice
22512	22475	\N	Rydzewo
22513	22475	\N	Rykaczewo
22514	22475	\N	Rzeczki
22515	22475	\N	Sokołówek
22516	22475	\N	Ujazdowo
22517	22475	\N	Ujazdówek
22518	22475	\N	Wola Pawłowska
22519	22475	\N	Wólka Rydzewska
22520	22476	\N	Glinojeck
22521	22476	\N	Bielawy
22522	22476	\N	Brody Młockie
22523	22476	\N	Budy Rumockie
22524	22476	\N	Dreglin
22525	22476	\N	Dukt
22526	22476	\N	Działy
22527	22476	\N	Faustynowo
22528	22476	\N	Gałczyn
22529	22476	\N	Juliszewo
22530	22476	\N	Kamionka
22531	22476	\N	Kondrajec Pański
22532	22476	\N	Kondrajec Szlachecki
22533	22476	\N	Kowalewko
22534	22476	\N	Krusz
22535	22476	\N	Lipiny
22536	22476	\N	Luszewo
22537	22476	\N	Malużyn
22538	22476	\N	Nowy Garwarz
22539	22476	\N	Ogonowo
22540	22476	\N	Ościsłowo
22541	22476	\N	Płaciszewo
22542	22476	\N	Rumoka
22543	22476	\N	Sadek
22544	22476	\N	Stare Szyjki
22545	22476	\N	Stary Garwarz
22546	22476	\N	Strzeszewo
22547	22476	\N	Sulerzyż
22548	22476	\N	Szyjki
22549	22476	\N	Śródborze
22550	22476	\N	Wkra
22551	22476	\N	Wola Młocka
22552	22476	\N	Wólka Garwarska
22553	22476	\N	Zalesie
22554	22476	\N	Zygmuntowo
22555	22476	\N	Żeleźnia
22556	22477	\N	Garnowo Duże
22557	22477	\N	Gogole Wielkie
22558	22477	\N	Gołymin-Ośrodek
22559	22477	\N	Gołymin-Południe
22560	22477	\N	Gołymin-Północ
22561	22477	\N	Konarzewo-Marcisze
22562	22477	\N	Konarzewo-Sławki
22563	22477	\N	Mierniki
22564	22477	\N	Morawka
22565	22477	\N	Nasierowo-Dziurawieniec
22566	22477	\N	Nasierowo Górne
22567	22477	\N	Nieradowo
22568	22477	\N	Nowy Gołymin
22569	22477	\N	Nowy Kałęczyn
22570	22477	\N	Obiedzino Górne
22571	22477	\N	Osiek-Aleksandrowo
22572	22477	\N	Osiek Górny
22573	22477	\N	Osiek-Wólka
22574	22477	\N	Pajewo-Szwelice
22575	22477	\N	Pajewo Wielkie
22576	22477	\N	Ruszkowo
22577	22477	\N	Smosarz-Dobki
22578	22477	\N	Stare Garnowo
22579	22477	\N	Stary Kałęczyn
22580	22477	\N	Watkowo
22581	22477	\N	Wielgołęka
22582	22477	\N	Wola Gołymińska
22583	22477	\N	Wróblewko
22584	22477	\N	Zawady Dworskie
22585	22477	\N	Zawady Włościańskie
22586	22478	\N	Grudusk
22587	22478	\N	Humięcino
22588	22478	\N	Humięcino-Andrychy
22589	22478	\N	Humięcino-Koski
22590	22478	\N	Kołaki Wielkie
22591	22478	\N	Leśniewo Dolne
22592	22478	\N	Leśniewo Górne
22593	22478	\N	Łysakowo
22594	22478	\N	Mierzanowo
22595	22478	\N	Nieborzyn
22596	22478	\N	Przywilcz
22597	22478	\N	Pszczółki-Czubaki
22598	22478	\N	Pszczółki Górne
22599	22478	\N	Pszczółki-Szerszenie
22600	22478	\N	Purzyce-Rozwory
22601	22478	\N	Purzyce-Trojany
22602	22478	\N	Rąbież Gruduski
22603	22478	\N	Sokołowo
22604	22478	\N	Sokólnik
22605	22478	\N	Stryjewo Małe
22606	22478	\N	Stryjewo Wielkie
22607	22478	\N	Strzelnia
22608	22478	\N	Wiksin
22609	22478	\N	Wiśniewo
22610	22478	\N	Zakrzewo Wielkie
22611	22478	\N	Żarnowo
22612	22479	\N	Baraniec
22613	22479	\N	Brodzięcin
22614	22479	\N	Bronisławie
22615	22479	\N	Dąbrowa
22616	22479	\N	Gostomin
22617	22479	\N	Grabówiec
22618	22479	\N	Halinin
22619	22479	\N	Kałki
22620	22479	\N	Kicin
22621	22479	\N	Kownaty-Borowe
22622	22479	\N	Kraszewo
22623	22479	\N	Lipówiec
22624	22479	\N	Luberadz
22625	22479	\N	Luberadzyk
22626	22479	\N	Łebki Wielkie
22627	22479	\N	Młock
22628	22479	\N	Młock-Kopacze
22629	22479	\N	Nowa Wieś
22630	22479	\N	Obrąb
22631	22479	\N	Ojrzeń
22632	22479	\N	Osada-Wola
22633	22479	\N	Przyrowa
22634	22479	\N	Radziwie
22635	22479	\N	Rzeszotko
22636	22479	\N	Skarżynek
22637	22479	\N	Trzpioły
22638	22479	\N	Wojtkowa Wieś
22639	22479	\N	Wola Wodzyńska
22640	22479	\N	Zielona
22641	22479	\N	Żochy
22642	22480	\N	Bacze
22643	22480	\N	Bogucin
22644	22480	\N	Chrzanowo
22645	22480	\N	Chrzanówek
22646	22480	\N	Czernice
22647	22480	\N	Długołęka
22648	22480	\N	Dzbonie
22649	22480	\N	Elżbiecin
22650	22480	\N	Goździe
22651	22480	\N	Janowięta
22652	22480	\N	Kąty
22653	22480	\N	Klonowo
22654	22480	\N	Kobylin
22655	22480	\N	Kołaczków
22656	22480	\N	Kołaki-Budzyno
22657	22480	\N	Kołaki-Kwasy
22658	22480	\N	Kotermań
22659	22480	\N	Łaguny
22660	22480	\N	Łęki
22661	22480	\N	Opinogóra Dolna
22662	22480	\N	Opinogóra Górna
22663	22480	\N	Opinogóra-Kolonia
22664	22480	\N	Pajewo-Króle
22665	22480	\N	Pałuki
22666	22480	\N	Patory
22667	22480	\N	Pokojewo
22668	22480	\N	Pomorze
22669	22480	\N	Przedwojewo
22670	22480	\N	Przytoka
22671	22480	\N	Rąbież
22672	22480	\N	Rembowo
22673	22480	\N	Rembówko
22674	22480	\N	Sosnowo
22675	22480	\N	Wierzbowo
22676	22480	\N	Wilkowo
22677	22480	\N	Władysławowo
22678	22480	\N	Wola Wierzbowska
22679	22480	\N	Wólka Łanięcka
22680	22480	\N	Załuże-Imbrzyki
22681	22480	\N	Zygmuntowo
22682	22481	\N	Grzybowo
22683	22481	\N	Jarluty Duże
22684	22481	\N	Jarluty Małe
22685	22481	\N	Kalisz
22686	22481	\N	Karniewo
22687	22481	\N	Kątki
22688	22481	\N	Klice
22689	22481	\N	Kliczki
22690	22481	\N	Kozdroje
22691	22481	\N	Koziczyn
22692	22481	\N	Lekowo
22693	22481	\N	Lekówiec
22694	22481	\N	Lipa
22695	22481	\N	Pawłowo
22696	22481	\N	Pawłówko
22697	22481	\N	Pniewo-Czeruchy
22698	22481	\N	Pniewo Wielkie
22699	22481	\N	Przybyszewo
22700	22481	\N	Radomka
22701	22481	\N	Regimin
22702	22481	\N	Szulmierz
22703	22481	\N	Targonie
22704	22481	\N	Trzcianka
22705	22481	\N	Zeńbok
22706	22482	\N	Bądkowo
22707	22482	\N	Bieńki-Karkuty
22708	22482	\N	Bieńki-Śmietanki
22709	22482	\N	Burkaty
22710	22482	\N	Chrościce
22711	22482	\N	Cichawy
22712	22482	\N	Ciemniewko
22713	22482	\N	Ciemniewo
22714	22482	\N	Damięty-Narwoty
22715	22482	\N	Drążewo
22716	22482	\N	Dziarno
22717	22482	\N	Gąsocin
22718	22482	\N	Gołotczyzna
22719	22482	\N	Gutków
22720	22482	\N	Kałęczyn
22721	22482	\N	Komory Błotne
22722	22482	\N	Komory Dąbrowne
22723	22482	\N	Kosmy-Pruszki
22724	22482	\N	Koźniewo-Łysaki
22725	22482	\N	Koźniewo Średnie
22726	22482	\N	Koźniewo Wielkie
22727	22482	\N	Łopacin
22728	22482	\N	Marianowo
22729	22482	\N	Marusy
22730	22482	\N	Mężenino-Węgłowice
22731	22482	\N	Niesłuchy
22732	22482	\N	Olszewka
22733	22482	\N	Ostaszewo
22734	22482	\N	Pękawka
22735	22482	\N	Sarnowa Góra
22736	22482	\N	Skrobocin
22737	22482	\N	Soboklęszcz
22738	22482	\N	Sońsk
22739	22482	\N	Spądoszyn
22740	22482	\N	Strusin
22741	22482	\N	Strusinek
22742	22482	\N	Szwejki
22743	22482	\N	Ślubowo
22744	22482	\N	Wola Ostaszewska
22745	153	\N	Garwolin
22746	153	\N	Łaskarzew
22747	153	\N	Borowie
22748	153	\N	Górzno
22749	153	\N	Maciejowice
22750	153	\N	Miastków Kościelny
22751	153	\N	Parysów
22752	153	\N	Pilawa
22753	153	\N	Sobolew
22754	153	\N	Trojanów
22755	153	\N	Wilga
22756	153	\N	Żelechów
22757	22745	\N	Garwolin
22758	22746	\N	Łaskarzew
22759	22747	\N	Borowie
22760	22747	\N	Borowie-Kolonia
22761	22747	\N	Brzuskowola
22762	22747	\N	Chromin
22763	22747	\N	Chrominek
22764	22747	\N	Czarnów
22765	22747	\N	Dudka
22766	22747	\N	Filipówka
22767	22747	\N	Głosków
22768	22747	\N	Głosków-Kolonia
22769	22747	\N	Gościewicz
22770	22747	\N	Gózd
22771	22747	\N	Gózd-Kolonia
22772	22747	\N	Iwowe
22773	22747	\N	Jaźwiny
22774	22747	\N	Kamionka
22775	22747	\N	Laliny
22776	22747	\N	Łętów
22777	22747	\N	Łopacianka
22778	22747	\N	Nowa Brzuza
22779	22747	\N	Podlaliny
22780	22747	\N	Słup Drugi
22781	22747	\N	Słup Pierwszy
22782	22747	\N	Stara Brzuza
22783	22747	\N	Wilchta
22784	22745	\N	Budy Uśniackie
22785	22745	\N	Czyszkówek
22786	22745	\N	Ewelin
22787	22745	\N	Górki
22788	22745	\N	Henryczyn
22789	22745	\N	Huta Garwolińska
22790	22745	\N	Izdebnik
22791	22745	\N	Jagodne
22792	22745	\N	Krystyna
22793	22745	\N	Lucin
22794	22745	\N	Marianów
22795	22745	\N	Miętne
22796	22745	\N	Niecieplin
22797	22745	\N	Nowy Puznów
22798	22745	\N	Parcele-Rębków
22799	22745	\N	Rębków
22800	22745	\N	Ruda Talubska
22801	22745	\N	Siedem Mórg
22802	22745	\N	Sławiny
22803	22745	\N	Stara Huta
22804	22745	\N	Stary Puznów
22805	22745	\N	Stoczek
22806	22745	\N	Sulbiny
22807	22745	\N	Taluba
22808	22745	\N	Unin-Kolonia
22809	22745	\N	Uśniaki
22810	22745	\N	Wilkowyja
22811	22745	\N	Władysławów
22812	22745	\N	Wola Rębkowska
22813	22745	\N	Wola Władysławowska
22814	22745	\N	Zakącie
22815	22748	\N	Chęciny
22816	22748	\N	Gąsów
22817	22748	\N	Goździk
22818	22748	\N	Górzno
22819	22748	\N	Górzno-Kolonia
22820	22748	\N	Józefów
22821	22748	\N	Kobyla Wola
22822	22748	\N	Łąki
22823	22748	\N	Mierżączka
22824	22748	\N	Piaski
22825	22748	\N	Potaszniki
22826	22748	\N	Reducin
22827	22748	\N	Samorządki
22828	22748	\N	Samorządki-Kolonia
22829	22748	\N	Unin
22830	22748	\N	Wólka Ostrożeńska
22831	22746	\N	Aleksandrów
22832	22746	\N	Budel
22833	22746	\N	Budy Krępskie
22834	22746	\N	Celinów
22835	22746	\N	Dąbrowa
22836	22746	\N	Dąbrowa-Kolonia
22837	22746	\N	Grabina
22838	22746	\N	Izdebno
22839	22746	\N	Izdebno-Kolonia
22840	22746	\N	Janków
22841	22746	\N	Kacprówek
22842	22746	\N	Krzywda
22843	22746	\N	Ksawerynów
22844	22746	\N	Leokadia
22845	22746	\N	Lewików
22846	22746	\N	Lipniki
22847	22746	\N	Melanów
22848	22746	\N	Nowy Helenów
22849	22746	\N	Nowy Pilczyn
22850	22746	\N	Polesie Rowskie
22851	22746	\N	Rowy
22852	22746	\N	Rywociny
22853	22746	\N	Sośninka
22854	22746	\N	Stary Helenów
22855	22746	\N	Stary Pilczyn
22856	22746	\N	Uścieniec
22857	22746	\N	Wanaty
22858	22746	\N	Włodków
22859	22746	\N	Wola Łaskarzewska
22860	22746	\N	Wola Rowska
22861	22746	\N	Zygmunty
22862	22749	\N	Antoniówka Świerżowska
22863	22749	\N	Antoniówka Wilczkowska
22864	22749	\N	Bączki
22865	22749	\N	Budy Podłęskie
22866	22749	\N	Domaszew
22867	22749	\N	Domaszew-Młyn
22868	22749	\N	Kawęczyn
22869	22749	\N	Kępa Podwierzbiańska
22870	22749	\N	Kobylnica
22871	22749	\N	Kobylnica-Kolonia
22872	22749	\N	Kochów
22873	22749	\N	Kraski Dolne
22874	22749	\N	Kraski Górne
22875	22749	\N	Leonów
22876	22749	\N	Maciejowice
22877	22749	\N	Malamówka
22878	22749	\N	Nowe Kraski
22879	22749	\N	Oblin
22880	22749	\N	Oblin-Grądki
22881	22749	\N	Oronne
22882	22749	\N	Ostrów
22883	22749	\N	Pasternik
22884	22749	\N	Podłęż
22885	22749	\N	Podoblin
22886	22749	\N	Podstolice
22887	22749	\N	Podwierzbie
22888	22749	\N	Podzamcze
22889	22749	\N	Pogorzelec
22890	22749	\N	Polik
22891	22749	\N	Przewóz
22892	22749	\N	Samogoszcz
22893	22749	\N	Strych
22894	22749	\N	Szkółki Krępskie
22895	22749	\N	Topolin
22896	22749	\N	Tyrzyn
22897	22749	\N	Uchacze
22898	22749	\N	Wróble-Wargocin
22899	22749	\N	Zakręty
22900	22750	\N	Brzegi
22901	22750	\N	Glinki
22902	22750	\N	Kruszówka
22903	22750	\N	Kujawy
22904	22750	\N	Miastków
22905	22750	\N	Miastków Kościelny
22906	22750	\N	Oziemkówka
22907	22750	\N	Przykory
22908	22750	\N	Ryczyska
22909	22750	\N	Stary Miastków
22910	22750	\N	Wola Miastkowska
22911	22750	\N	Zabruzdy
22912	22750	\N	Zabruzdy-Kolonia
22913	22750	\N	Zasiadały
22914	22750	\N	Zgórze
22915	22750	\N	Zwola
22916	22750	\N	Zwola Poduchowna
22917	22751	\N	Choiny
22918	22751	\N	Górki-Kolonia
22919	22751	\N	Kozłów
22920	22751	\N	Łukowiec
22921	22751	\N	Parysów
22922	22751	\N	Poschła
22923	22751	\N	Słup
22924	22751	\N	Starowola
22925	22751	\N	Stodzew
22926	22751	\N	Wola Starogrodzka
22927	22751	\N	Żabieniec
22928	22752	\N	Pilawa
22929	22752	\N	Gocław
22930	22752	\N	Grzebowilk
22931	22752	\N	Jaźwiny
22932	22752	\N	Kalonka
22933	22752	\N	Lipówki
22934	22752	\N	Łucznica
22935	22752	\N	Niesadna
22936	22752	\N	Puznówka
22937	22752	\N	Resztówka
22938	22752	\N	Rogalec
22939	22752	\N	Trąbki
22940	22752	\N	Wygoda
22941	22752	\N	Zawadka
22942	22752	\N	Żelazna
22943	22753	\N	Anielów
22944	22753	\N	Chotynia
22945	22753	\N	Godzisz
22946	22753	\N	Gończyce
22947	22753	\N	Grabniak
22948	22753	\N	Kaleń Drugi
22949	22753	\N	Kaleń Pierwszy
22950	22753	\N	Kobusy
22951	22753	\N	Kownacica
22952	22753	\N	Michałki
22953	22753	\N	Nowa Krępa
22954	22753	\N	Ostrożeń Drugi
22955	22753	\N	Ostrożeń Pierwszy
22956	22753	\N	Przyłęk
22957	22753	\N	Sobolew
22958	22753	\N	Sokół
22959	22753	\N	Trzcianka
22960	22753	\N	Uśniak
22961	22754	\N	Babice
22962	22754	\N	Budziska
22963	22754	\N	Damianów
22964	22754	\N	Derlatka
22965	22754	\N	Dębówka
22966	22754	\N	Dudki
22967	22754	\N	Elżbietów
22968	22754	\N	Jabłonowiec
22969	22754	\N	Korytnica
22970	22754	\N	Kozice
22971	22754	\N	Kruszyna
22972	22754	\N	Majdan
22973	22754	\N	Mościska
22974	22754	\N	Mroków
22975	22754	\N	Ochodne
22976	22754	\N	Piotrówek
22977	22754	\N	Podebłocie
22978	22754	\N	Prandocin
22979	22754	\N	Ruda
22980	22754	\N	Skruda
22981	22754	\N	Trojanów
22982	22754	\N	Więcków
22983	22754	\N	Wola Korycka Dolna
22984	22754	\N	Wola Korycka Górna
22985	22754	\N	Wola Życka
22986	22754	\N	Żabianka
22987	22754	\N	Życzyn
22988	22755	\N	Borowina
22989	22755	\N	Celejów
22990	22755	\N	Cyganówka
22991	22755	\N	Goźlin Górny
22992	22755	\N	Goźlin Mały
22993	22755	\N	Holendry
22994	22755	\N	Malinówka
22995	22755	\N	Mariańskie Porzecze
22996	22755	\N	Nieciecz
22997	22755	\N	Nowe Podole
22998	22755	\N	Nowy Żabieniec
22999	22755	\N	Olszynka
23000	22755	\N	Osiedle Wilga
23001	22755	\N	Ostrybór
23002	22755	\N	Podgórze
23003	22755	\N	Polewicz
23004	22755	\N	Ruda Tarnowska
23005	22755	\N	Skurcza
23006	22755	\N	Stare Podole
23007	22755	\N	Stary Żabieniec
23008	22755	\N	Tarnów
23009	22755	\N	Trzcianka
23010	22755	\N	Uścieniec-Kolonia
23011	22755	\N	Wicie
23012	22755	\N	Wilga
23013	22755	\N	Wólka Gruszczyńska
23014	22755	\N	Zakrzew
23015	22755	\N	Zarzecze
23016	22756	\N	Żelechów
23017	22756	\N	Gąsiory
23018	22756	\N	Gózdek
23019	22756	\N	Huta Żelechowska
23020	22756	\N	Janówek
23021	22756	\N	Kalinów
23022	22756	\N	Kotłówka
23023	22756	\N	Łomnica
23024	22756	\N	Nowy Goniwilk
23025	22756	\N	Nowy Kębłów
23026	22756	\N	Ostrożeń Trzeci
23027	22756	\N	Piastów
23028	22756	\N	Sokolniki
23029	22756	\N	Stary Goniwilk
23030	22756	\N	Stary Kębłów
23031	22756	\N	Stefanów
23032	22756	\N	Władysławów
23033	22756	\N	Wola Żelechowska
23034	22756	\N	Zakrzówek
23035	154	\N	Gostynin
23036	154	\N	Pacyna
23037	154	\N	Sanniki
23038	154	\N	Szczawin Kościelny
23039	23035	\N	Gostynin
23040	23035	\N	Aleksandrynów
23041	23035	\N	Anielin
23042	23035	\N	Antoninów
23043	23035	\N	Baby Dolne
23044	23035	\N	Baby Górne
23045	23035	\N	Belno
23046	23035	\N	Białe
23047	23035	\N	Białotarsk
23048	23035	\N	Bielawy
23049	23035	\N	Bierzewice
23050	23035	\N	Bolesławów
23051	23035	\N	Budy Kozickie
23052	23035	\N	Budy Lucieńskie
23053	23035	\N	Choinek
23054	23035	\N	Dąbrówka
23055	23035	\N	Emilianów
23056	23035	\N	Feliksów
23057	23035	\N	Gajówka Sokołowska
23058	23035	\N	Gaśno
23059	23035	\N	Gorzewo
23060	23035	\N	Górki Drugie
23061	23035	\N	Górki Pierwsze
23062	23035	\N	Gulewo
23063	23035	\N	Halinów
23064	23035	\N	Helenów
23065	23035	\N	Huta Nowa
23066	23035	\N	Huta Zaborowska
23067	23035	\N	Jastrzębia
23068	23035	\N	Jaworek
23069	23035	\N	Józefków
23070	23035	\N	Kazimierzów
23071	23035	\N	Kiełpieniec
23072	23035	\N	Kleniew
23073	23035	\N	Klusek
23074	23035	\N	Kozice
23075	23035	\N	Krzywie
23076	23035	\N	Legarda
23077	23035	\N	Leśniewice
23078	23035	\N	Lipa
23079	23035	\N	Lisica
23080	23035	\N	Lucień
23081	23035	\N	Łokietnica
23082	23035	\N	Marianka
23083	23035	\N	Marianów
23084	23035	\N	Marianów Sierakowski
23085	23035	\N	Miałkówek
23086	23035	\N	Mysłownia Nowa
23087	23035	\N	Nagodów
23088	23035	\N	Niecki
23089	23035	\N	Nowa Wieś
23090	23035	\N	Osada
23091	23035	\N	Osiny
23092	23035	\N	Piotrów
23093	23035	\N	Podgórze
23094	23035	\N	Polesie
23095	23035	\N	Pomarzanki
23096	23035	\N	Rębów
23097	23035	\N	Rogożewek
23098	23035	\N	Rumunki
23099	23035	\N	Ruszków
23100	23035	\N	Rybne
23101	23035	\N	Sałki
23102	23035	\N	Sieraków
23103	23035	\N	Sierakówek
23104	23035	\N	Skrzany
23105	23035	\N	Sokołów
23106	23035	\N	Solec
23107	23035	\N	Stanisławów
23108	23035	\N	Stanisławów Skrzański
23109	23035	\N	Stefanów
23110	23035	\N	Strzałki
23111	23035	\N	Wrząca
23112	23035	\N	Zaborów Nowy
23113	23035	\N	Zaborów Stary
23114	23035	\N	Zieleniec
23115	23035	\N	Zuzinów
23116	23035	\N	Zwoleń
23117	23036	\N	Anatolin
23118	23036	\N	Czarnów
23119	23036	\N	Czesławów
23120	23036	\N	Janówek
23121	23036	\N	Kamionka
23122	23036	\N	Kąty
23123	23036	\N	Luszyn
23124	23036	\N	Łuszczanów Drugi
23125	23036	\N	Łuszczanówek
23126	23036	\N	Model
23127	23036	\N	Pacyna
23128	23036	\N	Podatkówek
23129	23036	\N	Podczachy
23130	23036	\N	Poddębina-Gajówka
23131	23036	\N	Przylaski
23132	23036	\N	Radycza
23133	23036	\N	Rakowiec
23134	23036	\N	Raków
23135	23036	\N	Remki
23136	23036	\N	Robertów
23137	23036	\N	Romanów
23138	23036	\N	Rybie
23139	23036	\N	Sejkowice
23140	23036	\N	Skrzeszewy
23141	23036	\N	Słomków
23142	23036	\N	Wola Pacyńska
23143	23037	\N	Aleksandrów
23144	23037	\N	Brzezia
23145	23037	\N	Brzeziny
23146	23037	\N	Czyżew
23147	23037	\N	Działy
23148	23037	\N	Krubin
23149	23037	\N	Lasek
23150	23037	\N	Lubików
23151	23037	\N	Lwówek
23152	23037	\N	Mocarzewo
23153	23037	\N	Nowy Barcik
23154	23037	\N	Osmolin
23155	23037	\N	Osmólsk Górny
23156	23037	\N	Sanniki
23157	23037	\N	Sielce
23158	23037	\N	Staropol
23159	23037	\N	Stary Barcik
23160	23037	\N	Szkarada
23161	23037	\N	Wólka Niska
23162	23037	\N	Wólka Wysoka
23163	23038	\N	Adamów
23164	23038	\N	Annopol
23165	23038	\N	Białka
23166	23038	\N	Budki Suserskie
23167	23038	\N	Budy Kaleńskie
23168	23038	\N	Dobrów
23169	23038	\N	Gołas
23170	23038	\N	Gorzewo-Kolonia
23171	23038	\N	Helenów
23172	23038	\N	Helenów Słupski
23173	23038	\N	Helenów Trębski
23174	23038	\N	Holendry Dobrowskie
23175	23038	\N	Janki
23176	23038	\N	Jesionka
23177	23038	\N	Józefków
23178	23038	\N	Kaleń
23179	23038	\N	Kamieniec
23180	23038	\N	Kaźmierków
23181	23038	\N	Krzymów
23182	23038	\N	Kunki
23183	23038	\N	Lubieniek
23184	23038	\N	Łuszczanów Pierwszy
23185	23038	\N	Mellerów
23186	23038	\N	Misiadla
23187	23038	\N	Modrzew
23188	23038	\N	Mościska
23189	23038	\N	Osowia
23190	23038	\N	Pieryszew
23191	23038	\N	Przychód
23192	23038	\N	Reszki
23193	23038	\N	Sewerynów
23194	23038	\N	Słup
23195	23038	\N	Smolenta
23196	23038	\N	Staw
23197	23038	\N	Stefanów Suserski
23198	23038	\N	Suserz
23199	23038	\N	Swoboda
23200	23038	\N	Szczawin Borowy-Kolonia
23201	23038	\N	Szczawin Borowy-Wieś
23202	23038	\N	Szczawinek
23203	23038	\N	Szczawin Kościelny
23204	23038	\N	Teodorów
23205	23038	\N	Trębki
23206	23038	\N	Trębki-Leśniczówka
23207	23038	\N	Tuliska
23208	23038	\N	Waliszew
23209	23038	\N	Witoldów
23210	23038	\N	Wola Trębska
23211	23038	\N	Wola Trębska-Parcel
23212	157	\N	Milanówek
23213	157	\N	Podkowa Leśna
23214	157	\N	Baranów
23215	157	\N	Grodzisk Mazowiecki
23216	157	\N	Jaktorów
23217	157	\N	Żabia Wola
23218	23212	\N	Milanówek
23219	23213	\N	Podkowa Leśna
23220	23214	\N	Baranów
23221	23214	\N	Basin
23222	23214	\N	Boża Wola
23223	23214	\N	Bronisławów
23224	23214	\N	Buszyce
23225	23214	\N	Cegłów
23226	23214	\N	Drybus
23227	23214	\N	Gole
23228	23214	\N	Gongolina
23229	23214	\N	Holendry Baranowskie
23230	23214	\N	Karolina
23231	23214	\N	Kaski
23232	23214	\N	Kopiska
23233	23214	\N	Murowaniec
23234	23214	\N	Nowa Pułapina
23235	23214	\N	Osiny
23236	23214	\N	Regów
23237	23214	\N	Stanisławów
23238	23214	\N	Stara Pułapina
23239	23214	\N	Strumiany
23240	23214	\N	Wyczółki
23241	23214	\N	Żaby
23242	23215	\N	Grodzisk Mazowiecki
23243	23215	\N	Adamowizna
23244	23215	\N	Adamów
23245	23215	\N	Chlebnia
23246	23215	\N	Chrzanów Duży
23247	23215	\N	Chrzanów Mały
23248	23215	\N	Czarny Las
23249	23215	\N	Izdebno Kościelne
23250	23215	\N	Janinów
23251	23215	\N	Kady
23252	23215	\N	Kałęczyn
23253	23215	\N	Kłudzienko
23254	23215	\N	Kozerki
23255	23215	\N	Kozery
23256	23215	\N	Kraśnicza Wola
23257	23215	\N	Książenice
23258	23215	\N	Makówka
23259	23215	\N	Marynin
23260	23215	\N	Mościska
23261	23215	\N	Natolin
23262	23215	\N	Nowe Izdebno
23263	23215	\N	Nowe Kłudno
23264	23215	\N	Nowe Kozery
23265	23215	\N	Odrano-Wola
23266	23215	\N	Opypy
23267	23215	\N	Radonie
23268	23215	\N	Stare Kłudno
23269	23215	\N	Szczęsne
23270	23215	\N	Tłuste
23271	23215	\N	Urszulin
23272	23215	\N	Wężyk
23273	23215	\N	Władków
23274	23215	\N	Wólka Grodziska
23275	23215	\N	Zabłotnia
23276	23215	\N	Zapole
23277	23215	\N	Żuków
23278	23216	\N	Bieganów
23279	23216	\N	Budy-Grzybek
23280	23216	\N	Budy Michałowskie
23281	23216	\N	Budy Zosine
23282	23216	\N	Chylice
23283	23216	\N	Chylice-Kolonia
23284	23216	\N	Chyliczki
23285	23216	\N	Grabnik
23286	23216	\N	Grądy
23287	23216	\N	Henryszew
23288	23216	\N	Jaktorów
23289	23216	\N	Jaktorów-Kolonia
23290	23216	\N	Kołaczek
23291	23216	\N	Mariampol
23292	23216	\N	Maruna
23293	23216	\N	Międzyborów
23294	23216	\N	Sade Budy
23295	23216	\N	Stare Budy
23296	23217	\N	Bartoszówka
23297	23217	\N	Bieniewiec
23298	23217	\N	Bolesławek
23299	23217	\N	Ciepłe
23300	23217	\N	Ciepłe Pierwsze
23301	23217	\N	Grzegorzewice
23302	23217	\N	Grzmiąca
23303	23217	\N	Grzymek
23304	23217	\N	Huta Żabiowolska
23305	23217	\N	Jastrzębnik
23306	23217	\N	Józefina
23307	23217	\N	Kaleń
23308	23217	\N	Kaleń-Towarzystwo
23309	23217	\N	Lasek
23310	23217	\N	Lisówek
23311	23217	\N	Musuły
23312	23217	\N	Nowa Bukówka
23313	23217	\N	Oddział
23314	23217	\N	Ojrzanów
23315	23217	\N	Ojrzanów-Towarzystwo
23316	23217	\N	Osowiec
23317	23217	\N	Petrykozy
23318	23217	\N	Pieńki Słubickie
23319	23217	\N	Pieńki Zarębskie
23320	23217	\N	Piotrkowice
23321	23217	\N	Przeszkoda
23322	23217	\N	Redlanka
23323	23217	\N	Rumianka
23324	23217	\N	Siestrzeń
23325	23217	\N	Skuły
23326	23217	\N	Słubica A
23327	23217	\N	Słubica B
23328	23217	\N	Słubica Dobra
23329	23217	\N	Słubica-Wieś
23330	23217	\N	Stara Bukówka
23331	23217	\N	Władysławów
23332	23217	\N	Wycinki Osowskie
23333	23217	\N	Zalesie
23334	23217	\N	Zaręby
23335	23217	\N	Żabia Wola
23336	23217	\N	Żelechów
23337	155	\N	Belsk Duży
23338	155	\N	Błędów
23339	155	\N	Chynów
23340	155	\N	Goszczyn
23341	155	\N	Grójec
23342	155	\N	Jasieniec
23343	155	\N	Mogielnica
23344	155	\N	Nowe Miasto nad Pilicą
23345	155	\N	Pniewy
23346	155	\N	Warka
23347	23337	\N	Aleksandrówka
23348	23337	\N	Anielin
23349	23337	\N	Bartodzieje
23350	23337	\N	Belsk Duży
23351	23337	\N	Belsk Mały
23352	23337	\N	Bodzew
23353	23337	\N	Boruty
23354	23337	\N	Daszewice
23355	23337	\N	Gajówka Lewiczyn
23356	23337	\N	Gajówka Łęczeszyce
23357	23337	\N	Gajówka Modrzewina
23358	23337	\N	Grotów
23359	23337	\N	Jarochy
23360	23337	\N	Julianów
23361	23337	\N	Koziel
23362	23337	\N	Kussy
23363	23337	\N	Lewiczyn
23364	23337	\N	Łęczeszyce
23365	23337	\N	Maciejówka
23366	23337	\N	Mała Wieś
23367	23337	\N	Oczesały
23368	23337	\N	Odrzywołek
23369	23337	\N	Rębowola
23370	23337	\N	Rosochów
23371	23337	\N	Rożce
23372	23337	\N	Sadków Duchowny
23373	23337	\N	Sadków-Kolonia
23374	23337	\N	Sadków Szlachecki
23375	23337	\N	Skowronki
23376	23337	\N	Stara Wieś
23377	23337	\N	Tartaczek
23378	23337	\N	Widów
23379	23337	\N	Wilczogóra
23380	23337	\N	Wilczy Targ
23381	23337	\N	Wola Łęczeszycka
23382	23337	\N	Wola Starowiejska
23383	23337	\N	Wólka Łęczeszycka
23384	23337	\N	Zaborów
23385	23337	\N	Zaborówek
23386	23337	\N	Złota Góra
23387	23338	\N	Annopol
23388	23338	\N	Bielany
23389	23338	\N	Błędów
23390	23338	\N	Błogosław
23391	23338	\N	Bolesławiec Leśny
23392	23338	\N	Borzęcin
23393	23338	\N	Bronisławów
23394	23338	\N	Cesinów-Las
23395	23338	\N	Czesławin
23396	23338	\N	Dańków
23397	23338	\N	Dąbrówka Nowa
23398	23338	\N	Dąbrówka Stara
23399	23338	\N	Fabianów
23400	23338	\N	Gajówka Wilków
23401	23338	\N	Głudna
23402	23338	\N	Golianki
23403	23338	\N	Goliany
23404	23338	\N	Gołosze
23405	23338	\N	Huta Błędowska
23406	23338	\N	Ignaców
23407	23338	\N	Jadwigów
23408	23338	\N	Jakubów
23409	23338	\N	Julianów
23410	23338	\N	Kacperówka
23411	23338	\N	Katarzynów
23412	23338	\N	Kazimierki
23413	23338	\N	Lipie
23414	23338	\N	Łaszczyn
23415	23338	\N	Machnatka
23416	23338	\N	Machnatka-Parcela
23417	23338	\N	Nowy Błędów
23418	23338	\N	Oleśnik
23419	23338	\N	Pelinów
23420	23338	\N	Potencjonów
23421	23338	\N	Roztworów
23422	23338	\N	Sadurki
23423	23338	\N	Sakówka
23424	23338	\N	Śmiechówek
23425	23338	\N	Tomczyce
23426	23338	\N	Trzylatków Duży
23427	23338	\N	Trzylatków-Parcela
23428	23338	\N	Wilcze Średnie
23429	23338	\N	Wilhelmów
23430	23338	\N	Wilkonice
23431	23338	\N	Wilków Drugi
23432	23338	\N	Wilków Pierwszy
23433	23338	\N	Wilków Trzeci
23434	23338	\N	Wólka Dańkowska
23435	23338	\N	Wólka Gołoska
23436	23338	\N	Wólka Kurdybanowska
23437	23338	\N	Zalesie
23438	23338	\N	Załuski
23439	23338	\N	Ziemięcin
23440	23338	\N	Zofiówka
23441	23339	\N	Adamów Drwalewski
23442	23339	\N	Adamów Rososki
23443	23339	\N	Barcice Drwalewskie
23444	23339	\N	Barcice Rososkie
23445	23339	\N	Budy Sułkowskie
23446	23339	\N	Budziszyn
23447	23339	\N	Budziszynek
23448	23339	\N	Chynów
23449	23339	\N	Dąbrowa Duża
23450	23339	\N	Dobiecin
23451	23339	\N	Drwalew
23452	23339	\N	Drwalewice
23453	23339	\N	Edwardów
23454	23339	\N	Franciszków
23455	23339	\N	Gaj Żelechowski
23456	23339	\N	Gliczyn
23457	23339	\N	Grabina
23458	23339	\N	Grobice
23459	23339	\N	Henryków
23460	23339	\N	Hipolitów
23461	23339	\N	Jakubowizna
23462	23339	\N	Janina
23463	23339	\N	Janów
23464	23339	\N	Jurandów
23465	23339	\N	Kozłów
23466	23339	\N	Krężel
23467	23339	\N	Kukały
23468	23339	\N	Lasopole
23469	23339	\N	Ludwików
23470	23339	\N	Machcin
23471	23339	\N	Marianów
23472	23339	\N	Martynów
23473	23339	\N	Marynin
23474	23339	\N	Mąkosin
23475	23339	\N	Milanów
23476	23339	\N	Nowe Grobice
23477	23339	\N	Nowy Żelechów
23478	23339	\N	Ostrowiec
23479	23339	\N	Pawłówka
23480	23339	\N	Pieczyska
23481	23339	\N	Piekut
23482	23339	\N	Przyłom
23483	23339	\N	Rososz
23484	23339	\N	Rososzka
23485	23339	\N	Sikuty
23486	23339	\N	Staniszewice
23487	23339	\N	Sułkowice
23488	23339	\N	Watraszew
23489	23339	\N	Węszelówka
23490	23339	\N	Widok
23491	23339	\N	Wola Chynowska
23492	23339	\N	Wola Kukalska
23493	23339	\N	Wola Pieczyska
23494	23339	\N	Wola Żyrowska
23495	23339	\N	Wygodne
23496	23339	\N	Zadębie
23497	23339	\N	Zalesie
23498	23339	\N	Zawady
23499	23339	\N	Zbyszków
23500	23339	\N	Żelazna
23501	23339	\N	Żelechów
23502	23339	\N	Żyrów
23503	23340	\N	Bądków
23504	23340	\N	Bądków-Kolonia
23505	23340	\N	Długowola
23506	23340	\N	Goszczyn
23507	23340	\N	Jakubów-Kolonia
23508	23340	\N	Józefów
23509	23340	\N	Modrzewina
23510	23340	\N	Nowa Długowola
23511	23340	\N	Olszew
23512	23340	\N	Romanów
23513	23340	\N	Sielec
23514	23341	\N	Grójec
23515	23341	\N	Bikówek
23516	23341	\N	Chudowola
23517	23341	\N	Częstoniew
23518	23341	\N	Częstoniew-Kolonia
23519	23341	\N	Dębie
23520	23341	\N	Duży Dół
23521	23341	\N	Falęcin
23522	23341	\N	Głuchów
23523	23341	\N	Gościeńczyce
23524	23341	\N	Grudzkowola
23525	23341	\N	Janówek
23526	23341	\N	Kępina
23527	23341	\N	Kobylin
23528	23341	\N	Kociszew
23529	23341	\N	Kośmin
23530	23341	\N	Krobów
23531	23341	\N	Las Lesznowolski
23532	23341	\N	Lesznowola
23533	23341	\N	Lisówek
23534	23341	\N	Maciejowice
23535	23341	\N	Marianów
23536	23341	\N	Mieczysławówka
23537	23341	\N	Mięsy
23538	23341	\N	Mirowice
23539	23341	\N	Pabierowice
23540	23341	\N	Piekiełko
23541	23341	\N	Podole
23542	23341	\N	Skurów
23543	23341	\N	Słomczyn
23544	23341	\N	Szczęsna
23545	23341	\N	Uleniec
23546	23341	\N	Wola Krobowska
23547	23341	\N	Wola Worowska
23548	23341	\N	Worów
23549	23341	\N	Wólka Turowska
23550	23341	\N	Wysoczyn
23551	23341	\N	Zakrzewska Wola
23552	23341	\N	Zalesie
23553	23341	\N	Załącze
23554	23341	\N	Żyrówek
23555	23342	\N	Alfonsowo
23556	23342	\N	Boglewice
23557	23342	\N	Bronisławów
23558	23342	\N	Czachów
23559	23342	\N	Dobra Wola
23560	23342	\N	Franciszków
23561	23342	\N	Gajówka Rytomoczydła
23562	23342	\N	Gniejewice
23563	23342	\N	Gołębiów
23564	23342	\N	Gośniewice
23565	23342	\N	Ignaców
23566	23342	\N	Jasieniec
23567	23342	\N	Justynówka
23568	23342	\N	Koziegłowy
23569	23342	\N	Kurczowa Wieś
23570	23342	\N	Leżne
23571	23342	\N	Łychowska Wola
23572	23342	\N	Łychów
23573	23342	\N	Marynin
23574	23342	\N	Michałówka
23575	23342	\N	Miedzechów
23576	23342	\N	Nowy Miedzechów
23577	23342	\N	Olszany
23578	23342	\N	Orzechowo
23579	23342	\N	Osiny
23580	23342	\N	Przydróżek
23581	23342	\N	Ryszki
23582	23342	\N	Rytomoczydła
23583	23342	\N	Stefanków
23584	23342	\N	Szymanów
23585	23342	\N	Trzcianka
23586	23342	\N	Turowice
23587	23342	\N	Tworki
23588	23342	\N	Warpęsy
23589	23342	\N	Wierzchowina
23590	23342	\N	Wola Boglewska
23591	23342	\N	Zbrosza Duża
23592	23343	\N	Mogielnica
23593	23343	\N	Borowe
23594	23343	\N	Brzostowiec
23595	23343	\N	Cegielnia
23596	23343	\N	Dalboszek
23597	23343	\N	Dąbrowa
23598	23343	\N	Dębnowola
23599	23343	\N	Dobiecin
23600	23343	\N	Dylew
23601	23343	\N	Dziarnów
23602	23343	\N	Dziunin
23603	23343	\N	Główczyn
23604	23343	\N	Główczyn-Towarzystwo
23605	23343	\N	Górki-Izabelin
23606	23343	\N	Gracjanów
23607	23343	\N	Jastrzębia
23608	23343	\N	Jastrzębia Stara
23609	23343	\N	Kaplin
23610	23343	\N	Kozietuły
23611	23343	\N	Kozietuły Nowe
23612	23343	\N	Ługowice
23613	23343	\N	Marysin
23614	23343	\N	Michałowice
23615	23343	\N	Miechowice
23616	23343	\N	Odcinki Dylewskie
23617	23343	\N	Otaląż
23618	23343	\N	Otalążka
23619	23343	\N	Pawłowice
23620	23343	\N	Pączew
23621	23343	\N	Popowice
23622	23343	\N	Stamirowice
23623	23343	\N	Stryków
23624	23343	\N	Ślepowola
23625	23343	\N	Świdno
23626	23343	\N	Tomczyce
23627	23343	\N	Ulaski Gostomskie
23628	23343	\N	Wężowiec
23629	23343	\N	Wodziczna
23630	23343	\N	Wólka Gostomska
23631	23344	\N	Nowe Miasto nad Pilicą
23632	23344	\N	Bełek
23633	23344	\N	Bieliny
23634	23344	\N	Borowina
23635	23344	\N	Czerwona Karczma
23636	23344	\N	Dąbrowa
23637	23344	\N	Domaniewice
23638	23344	\N	Gilówka
23639	23344	\N	Godzimierz
23640	23344	\N	Gostomia
23641	23344	\N	Jankowice
23642	23344	\N	Józefów
23643	23344	\N	Łęgonice
23644	23344	\N	Nowe Bieliny
23645	23344	\N	Nowe Łęgonice
23646	23344	\N	Nowe Strzałki
23647	23344	\N	Pobiedna
23648	23344	\N	Promnik
23649	23344	\N	Prosna
23650	23344	\N	Rokitnica
23651	23344	\N	Rosocha
23652	23344	\N	Rudki
23653	23344	\N	Sacin
23654	23344	\N	Sańbórz
23655	23344	\N	Strzałki
23656	23344	\N	Świdrygały
23657	23344	\N	Waliska
23658	23344	\N	Wał
23659	23344	\N	Wierzchy
23660	23344	\N	Wola Pobiedzińska
23661	23344	\N	Wólka Ligęzowska
23662	23344	\N	Wólka Magierowa
23663	23344	\N	Zalesie
23664	23344	\N	Żdżarki
23665	23344	\N	Żdżary
23666	23345	\N	Aleksandrów
23667	23345	\N	Budki Petrykowskie
23668	23345	\N	Ciechlin
23669	23345	\N	Cychry
23670	23345	\N	Czekaj
23671	23345	\N	Daszew
23672	23345	\N	Dąbrówka
23673	23345	\N	Gajówka Petrykozy
23674	23345	\N	Gajówka Wiatrowiec
23675	23345	\N	Ginetówka
23676	23345	\N	Huta Jeżewska
23677	23345	\N	Jeziora
23678	23345	\N	Jeziora-Nowina
23679	23345	\N	Jeziórka
23680	23345	\N	Józefów
23681	23345	\N	Jurki
23682	23345	\N	Karolew
23683	23345	\N	Kocerany
23684	23345	\N	Kolonia Jurki
23685	23345	\N	Konie
23686	23345	\N	Kornelówka
23687	23345	\N	Kruszew
23688	23345	\N	Kruszewek
23689	23345	\N	Michrów
23690	23345	\N	Michrówek
23691	23345	\N	Michrów-Stefów
23692	23345	\N	Natalin
23693	23345	\N	Nowina-Przęsławice
23694	23345	\N	Osieczek
23695	23345	\N	Pniewy
23696	23345	\N	Przęsławice
23697	23345	\N	Przykory
23698	23345	\N	Rosołów
23699	23345	\N	Teodorówka
23700	23345	\N	Tomaszówka
23701	23345	\N	Wiatrowiec
23702	23345	\N	Wilczoruda
23703	23345	\N	Wilczoruda-Parcela
23704	23345	\N	Witalówka
23705	23345	\N	Wola Grabska
23706	23345	\N	Wola Pniewska
23707	23345	\N	Wólka Załęska
23708	23345	\N	Załęże Duże
23709	23346	\N	Warka
23710	23346	\N	Bończa
23711	23346	\N	Borowe
23712	23346	\N	Branków
23713	23346	\N	Brzezinki
23714	23346	\N	Budy Michałowskie
23715	23346	\N	Budy Opożdżewskie
23716	23346	\N	Dębnowola
23717	23346	\N	Gajówka Michałów
23718	23346	\N	Gąski
23719	23346	\N	Gośniewice
23720	23346	\N	Grażyna
23721	23346	\N	Grzegorzewice
23722	23346	\N	Gucin
23723	23346	\N	Hornigi
23724	23346	\N	Kalina
23725	23346	\N	Kazimierków
23726	23346	\N	Klonowa Wola
23727	23346	\N	Konary
23728	23346	\N	Krześniaków
23729	23346	\N	Laski
23730	23346	\N	Lechanice
23731	23346	\N	Magierowa Wola
23732	23346	\N	Michalczew
23733	23346	\N	Michałów Dolny
23734	23346	\N	Michałów Górny
23735	23346	\N	Michałów-Parcele
23736	23346	\N	Murowanka
23737	23346	\N	Niwy Ostrołęckie
23738	23346	\N	Nowa Ostrołęka
23739	23346	\N	Nowa Wieś
23740	23346	\N	Nowe Biskupice
23741	23346	\N	Opożdżew
23742	23346	\N	Ostrołęka
23743	23346	\N	Ostrówek
23744	23346	\N	Palczew
23745	23346	\N	Palczew-Parcela
23746	23346	\N	Piaseczno
23747	23346	\N	Pilica
23748	23346	\N	Podgórzyce
23749	23346	\N	Prusy
23750	23346	\N	Przylot
23751	23346	\N	Stara Warka
23752	23346	\N	Stare Biskupice
23753	23346	\N	Wichradz
23754	23346	\N	Wola Palczewska
23755	23346	\N	Wrociszew
23756	23346	\N	Zastruże
23757	158	\N	Garbatka-Letnisko
23758	158	\N	Głowaczów
23759	158	\N	Gniewoszów
23760	158	\N	Grabów nad Pilicą
23761	158	\N	Kozienice
23762	158	\N	Magnuszew
23763	158	\N	Sieciechów
23764	23757	\N	Anielin
23765	23757	\N	Bąkowiec
23766	23757	\N	Bogucin
23767	23757	\N	Brzustów
23768	23757	\N	Garbatka Długa
23769	23757	\N	Garbatka-Dziewiątka
23770	23757	\N	Garbatka-Letnisko
23771	23757	\N	Garbatka Nowa
23772	23757	\N	Garbatka-Zbyczyn
23773	23757	\N	Molendy
23774	23757	\N	Ponikwa
23775	23758	\N	Adamów
23776	23758	\N	Bobrowniki
23777	23758	\N	Brzóza
23778	23758	\N	Cecylówka-Brzózka
23779	23758	\N	Cecylówka Głowaczowska
23780	23758	\N	Chodków
23781	23758	\N	Dąbrówki
23782	23758	\N	Działki Brzóskie
23783	23758	\N	Emilów
23784	23758	\N	Głowaczów
23785	23758	\N	Grabnowola
23786	23758	\N	Grabnowola-Kolonia
23787	23758	\N	Helenów
23788	23758	\N	Helenówek
23789	23758	\N	Henryków
23790	23758	\N	Ignacówka Bobrowska
23791	23758	\N	Ignacówka Grabnowolska
23792	23758	\N	Jasieniec
23793	23758	\N	Józefów
23794	23758	\N	Klementynów
23795	23758	\N	Kosny
23796	23758	\N	Leżenice
23797	23758	\N	Lipa
23798	23758	\N	Lipska Wola
23799	23758	\N	Łukawa
23800	23758	\N	Łukawska Wola
23801	23758	\N	Maciejowice
23802	23758	\N	Mała Wieś
23803	23758	\N	Mariampol
23804	23758	\N	Marianów
23805	23758	\N	Michałów
23806	23758	\N	Michałówek
23807	23758	\N	Miejska Dąbrowa
23808	23758	\N	Moniochy
23809	23758	\N	Nadleśnictwo Studzianki
23810	23758	\N	Podmieście
23811	23758	\N	Przejazd
23812	23758	\N	Rogożek
23813	23758	\N	Sewerynów
23814	23758	\N	Stanisławów
23815	23758	\N	Stawki
23816	23758	\N	Studnie
23817	23758	\N	Studzianki Pancerne
23818	23758	\N	Ursynów
23819	23758	\N	Wólka Brzózka
23820	23758	\N	Zadąbrowie
23821	23758	\N	Zieleniec
23822	23759	\N	Boguszówka
23823	23759	\N	Borek
23824	23759	\N	Gniewoszów
23825	23759	\N	Kociołek
23826	23759	\N	Marianów
23827	23759	\N	Markowola
23828	23759	\N	Markowola-Kolonia
23829	23759	\N	Mieścisko
23830	23759	\N	Oleksów
23831	23759	\N	Podmieście
23832	23759	\N	Regów Nowy
23833	23759	\N	Regów Stary
23834	23759	\N	Sarnów
23835	23759	\N	Sławczyn
23836	23759	\N	Wólka Bachańska
23837	23759	\N	Wysokie Koło
23838	23759	\N	Zalesie
23839	23759	\N	Zdunków
23840	23759	\N	Zwola
23841	23760	\N	Augustów
23842	23760	\N	Broncin
23843	23760	\N	Brzozówka
23844	23760	\N	Budy Augustowskie
23845	23760	\N	Celinów
23846	23760	\N	Cychrowska Wola
23847	23760	\N	Czerwonka
23848	23760	\N	Dąbrówki
23849	23760	\N	Dziecinów
23850	23760	\N	Edwardów
23851	23760	\N	Gajówka Czerwonka
23852	23760	\N	Gajówka Lechowice
23853	23760	\N	Gajówka Paprotnia
23854	23760	\N	Grabina
23855	23760	\N	Grabowska Wola
23856	23760	\N	Grabów
23857	23760	\N	Grabów nad Pilicą
23858	23760	\N	Grabów Nowy
23859	23760	\N	Grabów Zaleśny
23860	23760	\N	Kępa Niemojewska
23861	23760	\N	Koziołek
23862	23760	\N	Kukawka
23863	23760	\N	Leśniczówka Nowa Wola
23864	23760	\N	Lipinki
23865	23760	\N	Łękawica
23866	23760	\N	Nowa Wola
23867	23760	\N	Paprotnia
23868	23760	\N	Strzyżyna
23869	23760	\N	Tomczyn
23870	23760	\N	Utniki
23871	23760	\N	Wyborów
23872	23760	\N	Zakrzew
23873	23760	\N	Zwierzyniec
23874	23761	\N	Kozienice
23875	23761	\N	Aleksandrówka
23876	23761	\N	Brzeźnica
23877	23761	\N	Chinów
23878	23761	\N	Cudów
23879	23761	\N	Cztery Kopce
23880	23761	\N	Dąbrówki
23881	23761	\N	Holendry Kozienickie
23882	23761	\N	Holendry Kuźmińskie
23883	23761	\N	Holendry Piotrkowskie
23884	23761	\N	Janików
23885	23761	\N	Janów
23886	23761	\N	Kępa Bielańska
23887	23761	\N	Kępa Wólczyńska
23888	23761	\N	Kępeczki
23889	23761	\N	Kociołki
23890	23761	\N	Kuźmy
23891	23761	\N	Łaszówka
23892	23761	\N	Łuczynów
23893	23761	\N	Majdany
23894	23761	\N	Michałówka
23895	23761	\N	Nowa Wieś
23896	23761	\N	Nowiny
23897	23761	\N	Opatkowice
23898	23761	\N	Piotrkowice
23899	23761	\N	Przewóz
23900	23761	\N	Psary
23901	23761	\N	Ruda
23902	23761	\N	Ryczywół
23903	23761	\N	Samwodzie
23904	23761	\N	Selwanówka
23905	23761	\N	Stanisławice
23906	23761	\N	Staszów
23907	23761	\N	Śmietanki
23908	23761	\N	Świerże Górne
23909	23761	\N	Wilczkowice Górne
23910	23761	\N	Wola Chodkowska
23911	23761	\N	Wójtostwo
23912	23761	\N	Wólka Tyrzyńska
23913	23761	\N	Wólka Tyrzyńska B
23914	23761	\N	Wymysłów
23915	23762	\N	Aleksandrów
23916	23762	\N	Anielin
23917	23762	\N	Basinów
23918	23762	\N	Boguszków
23919	23762	\N	Bożówka
23920	23762	\N	Chmielew
23921	23762	\N	Dębowola
23922	23762	\N	Gajówka Basinów
23923	23762	\N	Gruszczyn
23924	23762	\N	Grzybów
23925	23762	\N	Kępa Skórecka
23926	23762	\N	Kłoda
23927	23762	\N	Kolonia Rozniszew
23928	23762	\N	Kurki
23929	23762	\N	Latków
23930	23762	\N	Magnuszew
23931	23762	\N	Mniszew
23932	23762	\N	Osiemborów
23933	23762	\N	Ostrów
23934	23762	\N	Przewóz Stary
23935	23762	\N	Przewóz Tarnowski
23936	23762	\N	Przydworzyce
23937	23762	\N	Rękowice
23938	23762	\N	Rozniszew
23939	23762	\N	Trzebień
23940	23762	\N	Tyborów
23941	23762	\N	Urszulin
23942	23762	\N	Wilczkowice Dolne
23943	23762	\N	Wilczowola
23944	23762	\N	Wola Magnuszewska
23945	23762	\N	Wólka Tarnowska
23946	23762	\N	Zagroby
23947	23762	\N	Żelazna Nowa
23948	23762	\N	Żelazna Stara
23949	23763	\N	Głusiec
23950	23763	\N	Kępice
23951	23763	\N	Kresy
23952	23763	\N	Leśna Rzeka
23953	23763	\N	Łoje
23954	23763	\N	Mozolice Duże
23955	23763	\N	Mozolice Małe
23956	23763	\N	Nagórnik
23957	23763	\N	Nowe Słowiki
23958	23763	\N	Opactwo
23959	23763	\N	Przewóz
23960	23763	\N	Sieciechów
23961	23763	\N	Słowiki-Folwark
23962	23763	\N	Stare Słowiki
23963	23763	\N	Wola Klasztorna
23964	23763	\N	Wólka Wojcieszkowska
23965	23763	\N	Występ
23966	23763	\N	Zajezierze
23967	23763	\N	Zbyczyn
23968	159	\N	Legionowo
23969	159	\N	Jabłonna
23970	159	\N	Nieporęt
23971	159	\N	Serock
23972	159	\N	Wieliszew
23973	23968	\N	Legionowo
23974	23969	\N	Bagno
23975	23969	\N	Boża Wola
23976	23969	\N	Bukowiec
23977	23969	\N	Chotomów
23978	23969	\N	Dąbrowa Chotomowska
23979	23969	\N	Jabłonna
23980	23969	\N	Janówek Drugi
23981	23969	\N	Rajszew
23982	23969	\N	Skierdy
23983	23969	\N	Suchocin
23984	23969	\N	Trzciany
23985	23969	\N	Wólka Górska
23986	23970	\N	Aleksandrów
23987	23970	\N	Beniaminów
23988	23970	\N	Białobrzegi
23989	23970	\N	Dąbkowizna
23990	23970	\N	Izabelin
23991	23970	\N	Józefów
23992	23970	\N	Kąty Węgierskie
23993	23970	\N	Michałów-Grabina
23994	23970	\N	Nieporęt
23995	23970	\N	Rembelszczyzna
23996	23970	\N	Rynia
23997	23970	\N	Stanisławów Drugi
23998	23970	\N	Stanisławów Pierwszy
23999	23970	\N	Wola Aleksandra
24000	23970	\N	Wólka Radzymińska
24001	23970	\N	Zegrze Południowe
24002	23971	\N	Serock
24003	23971	\N	Bolesławowo
24004	23971	\N	Borowa Góra
24005	23971	\N	Cupel
24006	23971	\N	Dębe
24007	23971	\N	Dębinki
24008	23971	\N	Dosin
24009	23971	\N	Gąsiorowo
24010	23971	\N	Guty
24011	23971	\N	Izbica
24012	23971	\N	Jachranka
24013	23971	\N	Jadwisin
24014	23971	\N	Kania Nowa
24015	23971	\N	Kania Polska
24016	23971	\N	Karolino
24017	23971	\N	Ludwinowo Dębskie
24018	23971	\N	Ludwinowo Zegrzyńskie
24019	23971	\N	Łacha
24020	23971	\N	Marynino
24021	23971	\N	Nowa Wieś
24022	23971	\N	Skubianka
24023	23971	\N	Skubianka-Kolonia
24024	23971	\N	Stanisławowo
24025	23971	\N	Stasi Las
24026	23971	\N	Szadki
24027	23971	\N	Święcienica
24028	23971	\N	Wierzbica
24029	23971	\N	Wola Kiełpińska
24030	23971	\N	Wola Smolana
24031	23971	\N	Zabłocie
24032	23971	\N	Zalesie Borowe
24033	23971	\N	Zegrze
24034	23971	\N	Zegrzynek
24035	23972	\N	Góra
24036	23972	\N	Janówek Pierwszy
24037	23972	\N	Kałuszyn
24038	23972	\N	Komornica
24039	23972	\N	Krubin
24040	23972	\N	Łajski
24041	23972	\N	Michałów-Reginów
24042	23972	\N	Olszewnica
24043	23972	\N	Olszewnica Nowa
24044	23972	\N	Olszewnica Stara
24045	23972	\N	Poddębie
24046	23972	\N	Poniatów
24047	23972	\N	Sikory
24048	23972	\N	Skrzeszew
24049	23972	\N	Topolina
24050	23972	\N	Wieliszew
24051	160	\N	Chotcza
24052	160	\N	Ciepielów
24053	160	\N	Lipsko
24054	160	\N	Rzeczniów
24055	160	\N	Sienno
24056	160	\N	Solec nad Wisłą
24057	24051	\N	Baranów
24058	24051	\N	Białobrzegi
24059	24051	\N	Białobrzegi-Kolonia
24060	24051	\N	Borowiec
24061	24051	\N	Browarka
24062	24051	\N	Chotcza Dolna
24063	24051	\N	Chotcza Górna
24064	24051	\N	Chotcza-Józefów
24065	24051	\N	Gniazdków
24066	24051	\N	Gustawów
24067	24051	\N	Jarentowskie Pole
24068	24051	\N	Karolów
24069	24051	\N	Kijanka
24070	24051	\N	Kolonia Wola Solecka
24071	24051	\N	Niemieryczów
24072	24051	\N	Siekierka Nowa
24073	24051	\N	Siekierka Stara
24074	24051	\N	Tymienica Nowa
24075	24051	\N	Tymienica Stara
24076	24051	\N	Zajączków
24077	24051	\N	Chotcza
24078	24052	\N	Antoniów
24079	24052	\N	Anusin
24080	24052	\N	Bąkowa
24081	24052	\N	Bielany
24082	24052	\N	Borowiec
24083	24052	\N	Chotyze
24084	24052	\N	Ciepielów
24085	24052	\N	Ciepielów-Kolonia
24086	24052	\N	Czarnolas
24087	24052	\N	Czerwona
24088	24052	\N	Dąbrowa
24089	24052	\N	Drezno
24090	24052	\N	Gardzienice-Kolonia
24091	24052	\N	Kałków
24092	24052	\N	Kochanów
24093	24052	\N	Kunegundów
24094	24052	\N	Łaziska
24095	24052	\N	Marianki
24096	24052	\N	Nowy Kawęczyn
24097	24052	\N	Pasieki
24098	24052	\N	Pcin
24099	24052	\N	Podgórze
24100	24052	\N	Podolany
24101	24052	\N	Ranachów
24102	24052	\N	Rekówka
24103	24052	\N	Sajdy
24104	24052	\N	Stare Gardzienice
24105	24052	\N	Stary Ciepielów
24106	24052	\N	Stary Kawęczyn
24107	24052	\N	Struga
24108	24052	\N	Świesielice
24109	24052	\N	Wielgie
24110	24052	\N	Wólka Dąbrowska
24111	24053	\N	Lipsko
24112	24053	\N	Babilon
24113	24053	\N	Borowo
24114	24053	\N	Boży Dar
24115	24053	\N	Daniszów
24116	24053	\N	Dąbrówka
24117	24053	\N	Dąbrówka Daniszewska
24118	24053	\N	Długowola Druga
24119	24053	\N	Długowola Pierwsza
24120	24053	\N	Gołębiów
24121	24053	\N	Gruszczyn
24122	24053	\N	Helenów
24123	24053	\N	Huta
24124	24053	\N	Jakubówka
24125	24053	\N	Jelonek
24126	24053	\N	Józefów
24127	24053	\N	Katarzynów
24128	24053	\N	Krępa Górna
24129	24053	\N	Krępa Kościelna
24130	24053	\N	Leopoldów
24131	24053	\N	Leszczyny
24132	24053	\N	Lipa-Krępa
24133	24053	\N	Lipa-Miklas
24134	24053	\N	Lucjanów
24135	24053	\N	Małgorzacin
24136	24053	\N	Maruszów
24137	24053	\N	Maziarze
24138	24053	\N	Nowa Wieś
24139	24053	\N	Poręba
24140	24053	\N	Rafałów
24141	24053	\N	Ratyniec
24142	24053	\N	Rokitów
24143	24053	\N	Szymanów
24144	24053	\N	Śląsko
24145	24053	\N	Tomaszówka
24146	24053	\N	Walentynów
24147	24053	\N	Wiśniówek
24148	24053	\N	Władysławów
24149	24053	\N	Wola Solecka Druga
24150	24053	\N	Wola Solecka Pierwsza
24151	24053	\N	Wólka
24152	24053	\N	Wólka Krępska
24153	24053	\N	Zofiówka
24154	24054	\N	Berkowizna
24155	24054	\N	Borcuchy
24156	24054	\N	Ciecierówka
24157	24054	\N	Dąbrówki
24158	24054	\N	Dubrawa
24159	24054	\N	Gościniec
24160	24054	\N	Grabowiec
24161	24054	\N	Grechów
24162	24054	\N	Jelanka
24163	24054	\N	Kalinów Mały
24164	24054	\N	Kaniosy
24165	24054	\N	Kotłowacz
24166	24054	\N	Leśniczówka Michałów
24167	24054	\N	Marianów
24168	24054	\N	Michałów
24169	24054	\N	Mołdawa
24170	24054	\N	Osinki
24171	24054	\N	Pasztowa Wola
24172	24054	\N	Pasztowa Wola-Kolonia
24173	24054	\N	Pawliczka
24174	24054	\N	Płósy
24175	24054	\N	Podkońce
24176	24054	\N	Pod Michałowem
24177	24054	\N	Pole
24178	24054	\N	Rybiczyzna
24179	24054	\N	Rzechów-Kolonia
24180	24054	\N	Rzeczniów
24181	24054	\N	Rzeczniówek
24182	24054	\N	Rzeczniów-Kolonia
24183	24054	\N	Stary Rzechów
24184	24054	\N	Wincentów
24185	24054	\N	Wólka Modrzejowa
24186	24054	\N	Wólka Modrzejowa-Kolonia
24187	24054	\N	Zawały
24188	24055	\N	Adamów
24189	24055	\N	Aleksandrów
24190	24055	\N	Aleksandrów Duży
24191	24055	\N	Bronisławów
24192	24055	\N	Dąbrówka
24193	24055	\N	Dębowe Pole
24194	24055	\N	Eugeniów
24195	24055	\N	Gajówka Jawor Solecki
24196	24055	\N	Gozdawa
24197	24055	\N	Hieronimów
24198	24055	\N	Janów
24199	24055	\N	Jaworska Wola
24200	24055	\N	Jawor Solecki
24201	24055	\N	Kadłubek
24202	24055	\N	Karolów
24203	24055	\N	Kochanówka
24204	24055	\N	Kolonia A-Jawor Solecki
24205	24055	\N	Kolonia B-Jawor Solecki
24206	24055	\N	Kolonia Janów
24207	24055	\N	Kolonia Rogalin
24208	24055	\N	Krzyżanówka
24209	24055	\N	Leśniczówka
24210	24055	\N	Leśniczówka Jawor Solecki
24211	24055	\N	Ludwików
24212	24055	\N	Nowa Wieś
24213	24055	\N	Olechów Nowy
24214	24055	\N	Olechów Stary
24215	24055	\N	Osówka
24216	24055	\N	Piasków
24217	24055	\N	Praga Dolna
24218	24055	\N	Praga Górna
24219	24055	\N	Rogalin
24220	24055	\N	Sienno
24221	24055	\N	Stara Wieś
24222	24055	\N	Tarnówek
24223	24055	\N	Trzemcha Dolna
24224	24055	\N	Trzemcha Górna
24225	24055	\N	Wierzchowiska Drugie
24226	24055	\N	Wierzchowiska Pierwsze
24227	24055	\N	Wodąca
24228	24055	\N	Wyględów
24229	24055	\N	Wygoda
24230	24055	\N	Zapusta
24231	24056	\N	Boiska
24232	24056	\N	Boiska-Kolonia
24233	24056	\N	Dziurków
24234	24056	\N	Glina
24235	24056	\N	Gościniec Siennieński
24236	24056	\N	Kalinówek
24237	24056	\N	Kępa Piotrowińska
24238	24056	\N	Kłudzie
24239	24056	\N	Kolonia Nadwiślańska
24240	24056	\N	Kolonia Wola Pawłowska
24241	24056	\N	Las Gliniański
24242	24056	\N	Leśniczówka Dziurków
24243	24056	\N	Marianów
24244	24056	\N	Pawłowice
24245	24056	\N	Przedmieście Bliższe
24246	24056	\N	Przedmieście Dalsze
24247	24056	\N	Sadkowice
24248	24056	\N	Sadkowice-Kolonia
24249	24056	\N	Słuszczyn
24250	24056	\N	Solec nad Wisłą
24251	24056	\N	Wola Pawłowska
24252	24056	\N	Zemborzyn Drugi
24253	24056	\N	Zemborzyn Pierwszy
24254	183	\N	Huszlew
24255	183	\N	Łosice
24256	183	\N	Olszanka
24257	183	\N	Platerów
24258	183	\N	Sarnaki
24259	183	\N	Stara Kornica
24260	24254	\N	Bachorza
24261	24254	\N	Dziadkowskie
24262	24254	\N	Dziadkowskie-Folwark
24263	24254	\N	Felin
24264	24254	\N	Harachwosty
24265	24254	\N	Huszlew
24266	24254	\N	Juniewicze
24267	24254	\N	Kopce
24268	24254	\N	Kownaty
24269	24254	\N	Krasna
24270	24254	\N	Krasna-Kolonia
24271	24254	\N	Krzywośnity
24272	24254	\N	Liwki Szlacheckie
24273	24254	\N	Liwki Włościańskie
24274	24254	\N	Ławy
24275	24254	\N	Makarówka
24276	24254	\N	Mostów
24277	24254	\N	Nieznanki
24278	24254	\N	Sewerynów
24279	24254	\N	Siliwonki
24280	24254	\N	Waśkowólka
24281	24254	\N	Władysławów
24282	24254	\N	Wygoda
24283	24254	\N	Zienie
24284	24254	\N	Żurawlówka
24285	24255	\N	Łosice
24286	24255	\N	Biernaty Średnie
24287	24255	\N	Chotycze
24288	24255	\N	Chotycze-Kolonia
24289	24255	\N	Czuchleby
24290	24255	\N	Dzięcioły
24291	24255	\N	Jeziory
24292	24255	\N	Łuzki
24293	24255	\N	Meszki
24294	24255	\N	Niemojki
24295	24255	\N	Nowosielec
24296	24255	\N	Patków
24297	24255	\N	Różowa
24298	24255	\N	Rudnik
24299	24255	\N	Stare Biernaty
24300	24255	\N	Szańków
24301	24255	\N	Świniarów
24302	24255	\N	Toporów
24303	24255	\N	Woźniki
24304	24255	\N	Zakrze
24305	24256	\N	Bejdy
24306	24256	\N	Bolesty
24307	24256	\N	Dawidy
24308	24256	\N	Hadynów
24309	24256	\N	Klimy
24310	24256	\N	Korczówka
24311	24256	\N	Korczówka-Kolonia
24312	24256	\N	Mszanna
24313	24256	\N	Nowe Łepki
24314	24256	\N	Olszanka
24315	24256	\N	Pietrusy
24316	24256	\N	Próchenki
24317	24256	\N	Radlnia
24318	24256	\N	Stare Łepki
24319	24256	\N	Szawły
24320	24256	\N	Szydłówka
24321	24256	\N	Wyczółki
24322	24257	\N	Chłopków
24323	24257	\N	Chłopków-Kolonia
24324	24257	\N	Czuchów
24325	24257	\N	Czuchów-Pieńki
24326	24257	\N	Falatycze
24327	24257	\N	Górki
24328	24257	\N	Hruszew
24329	24257	\N	Hruszniew
24330	24257	\N	Hruszniew-Kolonia
24331	24257	\N	Kamianka
24332	24257	\N	Kisielew
24333	24257	\N	Lipno
24334	24257	\N	Mężenin
24335	24257	\N	Mężenin-Kolonia
24336	24257	\N	Michałów
24337	24257	\N	Myszkowice
24338	24257	\N	Nowodomki
24339	24257	\N	Ostromęczyn
24340	24257	\N	Ostromęczyn-Kolonia
24341	24257	\N	Platerów
24342	24257	\N	Puczyce
24343	24257	\N	Rusków
24344	24257	\N	Zaborze
24345	24258	\N	Binduga
24346	24258	\N	Bonin
24347	24258	\N	Bonin-Ogródki
24348	24258	\N	Borsuki
24349	24258	\N	Bużka
24350	24258	\N	Chlebczyn
24351	24258	\N	Chybów
24352	24258	\N	Franopol
24353	24258	\N	Grzybów
24354	24258	\N	Hołowczyce-Kolonia
24355	24258	\N	Horoszki Duże
24356	24258	\N	Horoszki Małe
24357	24258	\N	Klepaczew
24358	24258	\N	Klimczyce
24359	24258	\N	Klimczyce-Kolonia
24360	24258	\N	Kózki
24361	24258	\N	Mierzwice-Kolonia
24362	24258	\N	Nowe Hołowczyce
24363	24258	\N	Nowe Litewniki
24364	24258	\N	Nowe Mierzwice
24365	24258	\N	Płosków
24366	24258	\N	Płosków-Kolonia
24367	24258	\N	Raczki
24368	24258	\N	Rozwadów
24369	24258	\N	Rzewuszki
24370	24258	\N	Sarnaki
24371	24258	\N	Serpelice
24372	24258	\N	Stare Hołowczyce
24373	24258	\N	Stare Litewniki
24374	24258	\N	Stare Mierzwice
24375	24258	\N	Terlików
24376	24258	\N	Zabuże
24377	24259	\N	Czeberaki
24378	24259	\N	Dubicze
24379	24259	\N	Kazimierzów
24380	24259	\N	Kiełbaski
24381	24259	\N	Kobylany
24382	24259	\N	Kornica-Kolonia
24383	24259	\N	Koszelówka
24384	24259	\N	Nowa Kornica
24385	24259	\N	Nowe Szpaki
24386	24259	\N	Popławy
24387	24259	\N	Rudka
24388	24259	\N	Stara Kornica
24389	24259	\N	Stare Szpaki
24390	24259	\N	Szpaki-Kolonia
24391	24259	\N	Walim
24392	24259	\N	Walimek
24393	24259	\N	Wólka Nosowska
24394	24259	\N	Wygnanki
24395	24259	\N	Wyrzyki
24396	24259	\N	Zalesie
24397	161	\N	Maków Mazowiecki
24398	161	\N	Czerwonka
24399	161	\N	Karniewo
24400	161	\N	Krasnosielc
24401	161	\N	Młynarze
24402	161	\N	Płoniawy-Bramura
24403	161	\N	Różan
24404	161	\N	Rzewnie
24405	161	\N	Sypniewo
24406	161	\N	Szelków
24407	24397	\N	Maków Mazowiecki
24408	24398	\N	Adamowo
24409	24398	\N	Budzyno
24410	24398	\N	Budzyno-Bolki
24411	24398	\N	Budzyno-Lipniki
24412	24398	\N	Cieciórki Szlacheckie
24413	24398	\N	Cieciórki Włościańskie
24414	24398	\N	Ciemniewo
24415	24398	\N	Czerwonka Szlachecka
24416	24398	\N	Czerwonka Włościańska
24417	24398	\N	Dąbrówka
24418	24398	\N	Guty Duże
24419	24398	\N	Guty Małe
24420	24398	\N	Jankowo
24421	24398	\N	Janopole
24422	24398	\N	Kałęczyn
24423	24398	\N	Krzyżewo-Jurki
24424	24398	\N	Krzyżewo-Marki
24425	24398	\N	Lipniki
24426	24398	\N	Mariampole
24427	24398	\N	Nowe Zacisze
24428	24398	\N	Perzanowo
24429	24398	\N	Ponikiew Wielka
24430	24398	\N	Sewerynowo
24431	24398	\N	Soje
24432	24398	\N	Tłuszcz
24433	24398	\N	Ulaski
24434	24398	\N	Wąski Las
24435	24399	\N	Baraniec
24436	24399	\N	Byszewo
24437	24399	\N	Byszewo-Wygoda
24438	24399	\N	Chełchy-Chabdzyno
24439	24399	\N	Chełchy Iłowe
24440	24399	\N	Chełchy-Jakusy
24441	24399	\N	Chełchy-Klimki
24442	24399	\N	Chełchy Kmiece
24443	24399	\N	Chrzanowo-Bronisze
24444	24399	\N	Czarnostów
24445	24399	\N	Czarnostów-Polesie
24446	24399	\N	Gościejewo
24447	24399	\N	Karniewo
24448	24399	\N	Konarzewo-Bolesty
24449	24399	\N	Krzemień
24450	24399	\N	Leśniewo
24451	24399	\N	Łukowo
24452	24399	\N	Malechy
24453	24399	\N	Milewo-Malonki
24454	24399	\N	Milewo-Wypychy
24455	24399	\N	Obiecanowo
24456	24399	\N	Ośnica
24457	24399	\N	Rafały
24458	24399	\N	Romanowo
24459	24399	\N	Słoniawy
24460	24399	\N	Szlasy-Złotki
24461	24399	\N	Szwelice
24462	24399	\N	Tłucznice
24463	24399	\N	Wólka Łukowska
24464	24399	\N	Wronowo
24465	24399	\N	Zakrzewo
24466	24399	\N	Zaręby
24467	24399	\N	Zelki Dąbrowe
24468	24399	\N	Żabin Karniewski
24469	24399	\N	Żabin Łukowski
24470	24398	\N	Czerwonka
24471	24400	\N	Amelin
24472	24400	\N	Bagienice-Folwark
24473	24400	\N	Bagienice Szlacheckie
24474	24400	\N	Biernaty
24475	24400	\N	Budy Prywatne
24476	24400	\N	Chłopia Łąka
24477	24400	\N	Drążdżewo
24478	24400	\N	Drążdżewo-Kujawy
24479	24400	\N	Drążdżewo Małe
24480	24400	\N	Elżbiecin
24481	24400	\N	Grabowo
24482	24400	\N	Grądy
24483	24400	\N	Jasieniec
24484	24400	\N	Karłowo
24485	24400	\N	Karolewo
24486	24400	\N	Klin
24487	24400	\N	Krasnosielc
24488	24400	\N	Krasnosielc Leśny
24489	24400	\N	Łazy
24490	24400	\N	Niesułowo-Wieś
24491	24400	\N	Nowy Krasnosielc
24492	24400	\N	Nowy Sielc
24493	24400	\N	Pach
24494	24400	\N	Papierny Borek
24495	24400	\N	Perzanki-Borek
24496	24400	\N	Pieczyska
24497	24400	\N	Pienice
24498	24400	\N	Przytuły
24499	24400	\N	Raki
24500	24400	\N	Róg
24501	24400	\N	Ruzieck
24502	24400	\N	Sławki
24503	24400	\N	Suche
24504	24400	\N	Sulicha
24505	24400	\N	Wola-Józefowo
24506	24400	\N	Wola Włościańska
24507	24400	\N	Wólka Drążdżewska
24508	24400	\N	Wólka Rakowska
24509	24400	\N	Wykno
24510	24400	\N	Wymysły
24511	24400	\N	Załogi
24512	24400	\N	Zwierzyniec
24513	24401	\N	Długołęka-Koski
24514	24401	\N	Długołęka Wielka
24515	24401	\N	Gierwaty
24516	24401	\N	Głażewo-Cholewy
24517	24401	\N	Głażewo-Święszki
24518	24401	\N	Kołaki
24519	24401	\N	Młynarze
24520	24401	\N	Modzele
24521	24401	\N	Ochenki
24522	24401	\N	Ogony
24523	24401	\N	Rupin
24524	24401	\N	Sadykierz
24525	24401	\N	Sieluń
24526	24401	\N	Strzemieczne-Hieronimy
24527	24401	\N	Strzemieczne-Oleksy
24528	24401	\N	Strzemieczne-Wiosny
24529	24401	\N	Załęże-Ponikiewka
24530	24402	\N	Bobino-Grzybki
24531	24402	\N	Bobino Wielkie
24532	24402	\N	Bogdalec
24533	24402	\N	Bramura
24534	24402	\N	Cegielnia
24535	24402	\N	Chodkowo-Biernaty
24536	24402	\N	Chodkowo-Kuchny
24537	24402	\N	Chodkowo Wielkie
24538	24402	\N	Chodkowo-Załogi
24539	24402	\N	Choszczewka
24540	24402	\N	Dłutkowo
24541	24402	\N	Gołoniwy
24542	24402	\N	Jaciążek
24543	24402	\N	Kalinowiec
24544	24402	\N	Kobylin
24545	24402	\N	Kobylinek
24546	24402	\N	Krzyżewo Borowe
24547	24402	\N	Krzyżewo Nadrzeczne
24548	24402	\N	Łęgi
24549	24402	\N	Młodzianowo
24550	24402	\N	Nowa Zblicha
24551	24402	\N	Nowe Płoniawy
24552	24402	\N	Nowy Podoś
24553	24402	\N	Obłudzin
24554	24402	\N	Płoniawy-Bramura
24555	24402	\N	Płoniawy-Kolonia
24556	24402	\N	Popielarka
24557	24402	\N	Prace
24558	24402	\N	Retka
24559	24402	\N	Rogowo
24560	24402	\N	Stara Zblicha
24561	24402	\N	Stare Zacisze
24562	24402	\N	Stary Podoś
24563	24402	\N	Suche
24564	24402	\N	Szczuki
24565	24402	\N	Szlasy Bure
24566	24402	\N	Szlasy-Łozino
24567	24402	\N	Węgrzynowo
24568	24402	\N	Węgrzynówek
24569	24402	\N	Zawady Dworskie
24570	24402	\N	Zawady-Huta
24571	24403	\N	Różan
24572	24403	\N	Chełsty
24573	24403	\N	Chrzczonki
24574	24403	\N	Dąbrówka
24575	24403	\N	Dyszobaba
24576	24403	\N	Dzbądz
24577	24403	\N	Kaszewiec
24578	24403	\N	Miłony
24579	24403	\N	Mroczki-Rębiszewo
24580	24403	\N	Paulinowo
24581	24403	\N	Podborze
24582	24403	\N	Prycanowo
24583	24403	\N	Szygi
24584	24403	\N	Załęże-Eliasze
24585	24403	\N	Załęże-Gartki
24586	24403	\N	Załęże-Sędzięta
24587	24403	\N	Załęże Wielkie
24588	24403	\N	Załuzie
24589	24403	\N	Zawady-Ponikiew
24590	24404	\N	Bindużka
24591	24404	\N	Boruty
24592	24404	\N	Brzóze Duże
24593	24404	\N	Brzóze Małe
24594	24404	\N	Chrzanowo
24595	24404	\N	Chrzczony
24596	24404	\N	Dąbrówka
24597	24404	\N	Drozdowo
24598	24404	\N	Grudunki
24599	24404	\N	Łachy Włościańskie
24600	24404	\N	Łasiewity
24601	24404	\N	Łaś
24602	24404	\N	Małki
24603	24404	\N	Mroczki-Kawki
24604	24404	\N	Napiórki Butne
24605	24404	\N	Napiórki Ciężkie
24606	24404	\N	Nowe Drozdowo
24607	24404	\N	Nowe Łachy
24608	24404	\N	Nowy Sielc
24609	24404	\N	Orłowo
24610	24404	\N	Pruszki
24611	24404	\N	Rzewnie
24612	24404	\N	Słojki
24613	24404	\N	Stary Sielc
24614	24404	\N	Święta Rozalia
24615	24405	\N	Batogowo
24616	24405	\N	Biedrzyce-Koziegłowy
24617	24405	\N	Biedrzyce-Stara Wieś
24618	24405	\N	Boruty
24619	24405	\N	Chełchy
24620	24405	\N	Chojnowo
24621	24405	\N	Dylewo
24622	24405	\N	Gąsewo Poduchowne
24623	24405	\N	Glącka
24624	24405	\N	Glinki-Rafały
24625	24405	\N	Gutowo
24626	24405	\N	Jarzyły
24627	24405	\N	Majki-Tykiewki
24628	24405	\N	Mamino
24629	24405	\N	Nowe Gąsewo
24630	24405	\N	Nowy Szczeglin
24631	24405	\N	Olki
24632	24405	\N	Poświętne
24633	24405	\N	Rawy
24634	24405	\N	Rzechowo-Gać
24635	24405	\N	Rzechowo Wielkie
24636	24405	\N	Rzechówek
24637	24405	\N	Sławkowo
24638	24405	\N	Stare Glinki
24639	24405	\N	Strzemieczne-Sędki
24640	24405	\N	Sypniewo
24641	24405	\N	Szczeglin Poduchowny
24642	24405	\N	Zalesie
24643	24405	\N	Zamość
24644	24405	\N	Ziemaki
24645	24406	\N	Bazar
24646	24406	\N	Chrzanowo
24647	24406	\N	Chyliny
24648	24406	\N	Ciepielewo
24649	24406	\N	Dzierżanowo
24650	24406	\N	Głódki
24651	24406	\N	Grzanka
24652	24406	\N	Kaptury
24653	24406	\N	Laski
24654	24406	\N	Magnuszew
24655	24406	\N	Magnuszew Duży
24656	24406	\N	Magnuszew Mały
24657	24406	\N	Makowica
24658	24406	\N	Nowy Strachocin
24659	24406	\N	Nowy Szelków
24660	24406	\N	Orzyc
24661	24406	\N	Pomaski Małe
24662	24406	\N	Pomaski Wielkie
24663	24406	\N	Przeradowo
24664	24406	\N	Rostki
24665	24406	\N	Smrock-Dwór
24666	24406	\N	Smrock-Kolonia
24667	24406	\N	Stary Strachocin
24668	24406	\N	Stary Szelków
24669	24406	\N	Zakliczewo
24670	24406	\N	Szelków
24671	162	\N	Mińsk Mazowiecki
24672	162	\N	Sulejówek
24673	162	\N	Cegłów
24674	162	\N	Dębe Wielkie
24675	162	\N	Dobre
24676	162	\N	Halinów
24677	162	\N	Jakubów
24678	162	\N	Kałuszyn
24679	162	\N	Latowicz
24680	162	\N	Mrozy
24681	162	\N	Siennica
24682	162	\N	Stanisławów
24683	24671	\N	Mińsk Mazowiecki
24684	24672	\N	Sulejówek
24685	24673	\N	Cegłów
24686	24673	\N	Gajówka Posiadały
24687	24673	\N	Gajówka Rososz
24688	24673	\N	Gajówka Rudnik
24689	24673	\N	Gajówka Skwarne
24690	24673	\N	Gajówka Sokolnik
24691	24673	\N	Huta Kuflewska
24692	24673	\N	Kiczki Drugie
24693	24673	\N	Kiczki Pierwsze
24694	24673	\N	Kokoszki
24695	24673	\N	Leśniczówka Mienia
24696	24673	\N	Leśniczówka Pełczanka
24697	24673	\N	Leśniczówka Piaseczno
24698	24673	\N	Mienia
24699	24673	\N	Pełczanka
24700	24673	\N	Piaseczno
24701	24673	\N	Podciernie
24702	24673	\N	Podskwarne
24703	24673	\N	Posiadały
24704	24673	\N	Rososz
24705	24673	\N	Rudnik
24706	24673	\N	Skupie
24707	24673	\N	Skwarne
24708	24673	\N	Tyborów
24709	24673	\N	Wiciejów
24710	24673	\N	Wola Stanisławowska
24711	24673	\N	Woźbin
24712	24673	\N	Wólka Wiciejowska
24713	24674	\N	Aleksandrówka
24714	24674	\N	Bykowizna
24715	24674	\N	Celinów
24716	24674	\N	Cezarów
24717	24674	\N	Choszczówka Dębska
24718	24674	\N	Choszczówka Rudzka
24719	24674	\N	Choszczówka Stojecka
24720	24674	\N	Chrośla
24721	24674	\N	Cięciwa
24722	24674	\N	Cyganka
24723	24674	\N	Dębe Wielkie
24724	24674	\N	Gorzanka
24725	24674	\N	Górki
24726	24674	\N	Jędrzejnik
24727	24674	\N	Kąty Goździejewskie Drugie
24728	24674	\N	Kąty Goździejewskie Pierwsze
24729	24674	\N	Kobierne
24730	24674	\N	Nowy Walercin
24731	24674	\N	Olesin
24732	24674	\N	Ostrów-Kania
24733	24674	\N	Poręby
24734	24674	\N	Ruda
24735	24674	\N	Rysie
24736	24674	\N	Teresław
24737	24674	\N	Walercin
24738	24675	\N	Adamów
24739	24675	\N	Antonina
24740	24675	\N	Brzozowica
24741	24675	\N	Czarnocin
24742	24675	\N	Czarnogłów
24743	24675	\N	Dobre
24744	24675	\N	Drop
24745	24675	\N	Duchów
24746	24675	\N	Gęsianka
24747	24675	\N	Głęboczyca
24748	24675	\N	Grabniak
24749	24675	\N	Jaczewek
24750	24675	\N	Joanin
24751	24675	\N	Kąty-Borucza
24752	24675	\N	Kobylanka
24753	24675	\N	Makówiec Duży
24754	24675	\N	Makówiec Mały
24755	24675	\N	Marcelin
24756	24675	\N	Mlęcin
24757	24675	\N	Modecin
24758	24675	\N	Nowa Wieś
24759	24675	\N	Osęczyzna
24760	24675	\N	Pokrzywnik
24761	24675	\N	Poręby Nowe
24762	24675	\N	Poręby Stare
24763	24675	\N	Radoszyna
24764	24675	\N	Rakówiec
24765	24675	\N	Rąbierz-Kolonia
24766	24675	\N	Ruda-Pniewnik
24767	24675	\N	Rudno
24768	24675	\N	Rudzienko
24769	24675	\N	Rynia
24770	24675	\N	Sąchocin
24771	24675	\N	Sołki
24772	24675	\N	Świdrów
24773	24675	\N	Walentów
24774	24675	\N	Wólka Czarnogłowska
24775	24675	\N	Wólka Kobylańska
24776	24675	\N	Wólka Kokosia
24777	24675	\N	Wólka Mlęcka
24778	24675	\N	Zdrojówki
24779	24676	\N	Halinów
24780	24676	\N	Brzeziny
24781	24676	\N	Budziska
24782	24676	\N	Chobot
24783	24676	\N	Cisie
24784	24676	\N	Desno
24785	24676	\N	Długa Kościelna
24786	24676	\N	Długa Szlachecka
24787	24676	\N	Grabina
24788	24676	\N	Hipolitów
24789	24676	\N	Józefin
24790	24676	\N	Kazimierów
24791	24676	\N	Krzewina
24792	24676	\N	Michałów
24793	24676	\N	Mrowiska
24794	24676	\N	Nowy Konik
24795	24676	\N	Okuniew
24796	24676	\N	Stary Konik
24797	24676	\N	Wielgolas Brzeziński
24798	24676	\N	Wielgolas Duchnowski
24799	24676	\N	Zagórze
24800	24676	\N	Żwirówka
24801	24677	\N	Aleksandrów
24802	24677	\N	Anielinek
24803	24677	\N	Antonina
24804	24677	\N	Brzozówka
24805	24677	\N	Budy Kumińskie
24806	24677	\N	Góry
24807	24677	\N	Izabelin
24808	24677	\N	Jakubów
24809	24677	\N	Jędrzejów Nowy
24810	24677	\N	Jędrzejów Stary
24811	24677	\N	Józefin
24812	24677	\N	Kamionka
24813	24677	\N	Leontyna
24814	24677	\N	Ludwinów
24815	24677	\N	Łaziska
24816	24677	\N	Mistów
24817	24677	\N	Moczydła
24818	24677	\N	Nart
24819	24677	\N	Przedewsie
24820	24677	\N	Rządza
24821	24677	\N	Strzebula
24822	24677	\N	Szczytnik
24823	24677	\N	Turek
24824	24677	\N	Tymoteuszew
24825	24677	\N	Wiśniew
24826	24677	\N	Witkowizna
24827	24677	\N	Wola Polska
24828	24678	\N	Kałuszyn
24829	24678	\N	Abramy
24830	24678	\N	Budy Przytockie
24831	24678	\N	Chrościce
24832	24678	\N	Falbogi
24833	24678	\N	Garczyn Duży
24834	24678	\N	Garczyn Mały
24835	24678	\N	Gołębiówka
24836	24678	\N	Górki
24837	24678	\N	Kazimierzów
24838	24678	\N	Kluki
24839	24678	\N	Leonów
24840	24678	\N	Marianka
24841	24678	\N	Marysin
24842	24678	\N	Milew
24843	24678	\N	Mroczki
24844	24678	\N	Nowe Groszki
24845	24678	\N	Olszewice
24846	24678	\N	Patok
24847	24678	\N	Piotrowina
24848	24678	\N	Przytoka
24849	24678	\N	Ryczołek
24850	24678	\N	Sinołęka
24851	24678	\N	Stare Groszki
24852	24678	\N	Szembory
24853	24678	\N	Szymony
24854	24678	\N	Wąsy
24855	24678	\N	Wity
24856	24678	\N	Wólka Kałuska
24857	24678	\N	Zimnowoda
24858	24678	\N	Żebrówka
24859	24679	\N	Borówek
24860	24679	\N	Budy Wielgoleskie
24861	24679	\N	Budziska
24862	24679	\N	Chyżyny
24863	24679	\N	Dąbrówka
24864	24679	\N	Dębe Małe
24865	24679	\N	Generałowo
24866	24679	\N	Gołełąki
24867	24679	\N	Kamionka
24868	24679	\N	Latowicz
24869	24679	\N	Oleksianka
24870	24679	\N	Redzyńskie
24871	24679	\N	Stawek
24872	24679	\N	Strachomin
24873	24679	\N	Transbór
24874	24679	\N	Waliska
24875	24679	\N	Wężyczyn
24876	24679	\N	Wielgolas
24877	24671	\N	Anielew
24878	24671	\N	Arynów
24879	24671	\N	Barcząca
24880	24671	\N	Borek Miński
24881	24671	\N	Brzóze
24882	24671	\N	Budy Barcząckie
24883	24671	\N	Budy Janowskie
24884	24671	\N	Chmielew
24885	24671	\N	Chochół
24886	24671	\N	Cielechowizna
24887	24671	\N	Dłużka
24888	24671	\N	Dziękowizna
24889	24671	\N	Gamratka
24890	24671	\N	Gliniak
24891	24671	\N	Grabina
24892	24671	\N	Grębiszew
24893	24671	\N	Huta Mińska
24894	24671	\N	Ignaców
24895	24671	\N	Iłówiec
24896	24671	\N	Janów
24897	24671	\N	Józefów
24898	24671	\N	Karolina
24899	24671	\N	Karolina-Kolonia
24900	24671	\N	Kluki
24901	24671	\N	Kolonia Janów
24902	24671	\N	Królewiec
24903	24671	\N	Maliszew
24904	24671	\N	Marianka
24905	24671	\N	Mikanów
24906	24671	\N	Niedziałka Druga
24907	24671	\N	Nowe Osiny
24908	24671	\N	Osiny
24909	24671	\N	Podrudzie
24910	24671	\N	Prusy
24911	24671	\N	Stara Niedziałka
24912	24671	\N	Stare Zakole
24913	24671	\N	Stojadła
24914	24671	\N	Targówka
24915	24671	\N	Tartak
24916	24671	\N	Wólka Iłówiecka
24917	24671	\N	Wólka Mińska
24918	24671	\N	Zakole-Wiktorowo
24919	24671	\N	Zamienie
24920	24671	\N	Żuków
24921	24680	\N	Barania Ruda
24922	24680	\N	Borki
24923	24680	\N	Choszcze
24924	24680	\N	Dąbrowa
24925	24680	\N	Dębowce
24926	24680	\N	Gajówka Bernatowizna
24927	24680	\N	Gajówka Florianów
24928	24680	\N	Gajówka Gójszcz
24929	24680	\N	Gójszcz
24930	24680	\N	Grodzisk
24931	24680	\N	Guzew
24932	24680	\N	Jeruzal
24933	24680	\N	Jeziorek
24934	24680	\N	Kołacz
24935	24680	\N	Kruki
24936	24680	\N	Kuflew
24937	24680	\N	Lipiny
24938	24680	\N	Lubomin
24939	24680	\N	Łukówiec
24940	24680	\N	Mała Wieś
24941	24680	\N	Mrozy
24942	24680	\N	Natolin
24943	24680	\N	Płomieniec
24944	24680	\N	Porzewnica
24945	24680	\N	Rudka
24946	24680	\N	Rudka-Sanatorium
24947	24680	\N	Skruda
24948	24680	\N	Sokolnik
24949	24680	\N	Topór
24950	24680	\N	Trojanów
24951	24680	\N	Wola Paprotnia
24952	24680	\N	Wola Rafałowska
24953	24681	\N	Bestwiny
24954	24681	\N	Borówek
24955	24681	\N	Boża Wola
24956	24681	\N	Budy Łękawickie
24957	24681	\N	Chełst
24958	24681	\N	Dąbrowa
24959	24681	\N	Dłużew
24960	24681	\N	Drożdżówka
24961	24681	\N	Dzielnik
24962	24681	\N	Gągolina
24963	24681	\N	Grzebowilk
24964	24681	\N	Julianów
24965	24681	\N	Kąty
24966	24681	\N	Kośminy
24967	24681	\N	Krzywica
24968	24681	\N	Kulki
24969	24681	\N	Lasomin
24970	24681	\N	Łękawica
24971	24681	\N	Majdan
24972	24681	\N	Nowa Pogorzel
24973	24681	\N	Nowe Zalesie
24974	24681	\N	Nowodwór
24975	24681	\N	Nowodzielnik
24976	24681	\N	Nowy Starogród
24977	24681	\N	Nowy Zglechów
24978	24681	\N	Pogorzel
24979	24681	\N	Ptaki
24980	24681	\N	Siennica
24981	24681	\N	Siodło
24982	24681	\N	Stara Wieś
24983	24681	\N	Starogród
24984	24681	\N	Strugi Krzywickie
24985	24681	\N	Swoboda
24986	24681	\N	Świętochy
24987	24681	\N	Wiśniówka
24988	24681	\N	Wojciechówka
24989	24681	\N	Wólka Dłużewska
24990	24681	\N	Zalesie
24991	24681	\N	Zglechów
24992	24681	\N	Żaków
24993	24681	\N	Żakówek
24994	24682	\N	Borek Czarniński
24995	24682	\N	Choiny
24996	24682	\N	Ciopan
24997	24682	\N	Cisówka
24998	24682	\N	Czarna
24999	24682	\N	Goździówka
25000	24682	\N	Kolonie Stanisławów
25001	24682	\N	Legacz
25002	24682	\N	Lubomin
25003	24682	\N	Ładzyń
25004	24682	\N	Łęka
25005	24682	\N	Mały Stanisławów
25006	24682	\N	Ołdakowizna
25007	24682	\N	Papiernia
25008	24682	\N	Porąb
25009	24682	\N	Poręby Leśne
25010	24682	\N	Prądzewo-Kopaczewo
25011	24682	\N	Pustelnik
25012	24682	\N	Retków
25013	24682	\N	Rządza
25014	24682	\N	Sokóle
25015	24682	\N	Stanisławów
25016	24682	\N	Suchowizna
25017	24682	\N	Szymankowszczyzna
25018	24682	\N	Wólka Czarnińska
25019	24682	\N	Wólka-Konstancja
25020	24682	\N	Wólka Piecząca
25021	24682	\N	Wólka Wybraniecka
25022	24682	\N	Zalesie
25023	24682	\N	Zawiesiuchy
25024	163	\N	Mława
25025	163	\N	Dzierzgowo
25026	163	\N	Lipowiec Kościelny
25027	163	\N	Radzanów
25028	163	\N	Strzegowo
25029	163	\N	Stupsk
25030	163	\N	Szreńsk
25031	163	\N	Szydłowo
25032	163	\N	Wieczfnia Kościelna
25033	163	\N	Wiśniewo
25034	25024	\N	Mława
25035	25025	\N	Brzozowo-Czary
25036	25025	\N	Brzozowo-Dąbrówka
25037	25025	\N	Brzozowo-Łęg
25038	25025	\N	Brzozowo-Maje
25039	25025	\N	Choszczewka
25040	25025	\N	Dobrogosty
25041	25025	\N	Dzierzgowo
25042	25025	\N	Dzierzgówek
25043	25025	\N	Kamień
25044	25025	\N	Kitki
25045	25025	\N	Kolonia Choszczewka
25046	25025	\N	Krery
25047	25025	\N	Kurki
25048	25025	\N	Międzyleś
25049	25025	\N	Nowe Brzozowo
25050	25025	\N	Nowe Łączyno
25051	25025	\N	Pęcherze
25052	25025	\N	Pobodze
25053	25025	\N	Ruda
25054	25025	\N	Rzęgnowo
25055	25025	\N	Stare Brzozowo
25056	25025	\N	Stare Łączyno
25057	25025	\N	Stegna
25058	25025	\N	Szpaki
25059	25025	\N	Szumsk
25060	25025	\N	Tańsk-Chorąże
25061	25025	\N	Tańsk-Grzymki
25062	25025	\N	Tańsk-Kęsocha
25063	25025	\N	Tańsk-Kiernozy
25064	25025	\N	Tańsk-Przedbory
25065	25025	\N	Umiotki
25066	25025	\N	Wasiły
25067	25025	\N	Zawady
25068	25025	\N	Żaboklik
25069	25026	\N	Borowe
25070	25026	\N	Cegielnia Lewicka
25071	25026	\N	Dobra Wola
25072	25026	\N	Józefowo
25073	25026	\N	Kęczewo
25074	25026	\N	Krępa
25075	25026	\N	Lewiczyn
25076	25026	\N	Lipowiec Kościelny
25077	25026	\N	Łomia
25078	25026	\N	Niegocin
25079	25026	\N	Parcele Łomskie
25080	25026	\N	Rumoka
25081	25026	\N	Turza Mała
25082	25026	\N	Turza Wielka
25083	25026	\N	Wola Kęczewska
25084	25026	\N	Zawady
25085	25027	\N	Bębnowo
25086	25027	\N	Bębnówko
25087	25027	\N	Bieżany
25088	25027	\N	Bojanowo
25089	25027	\N	Bońkowo Kościelne
25090	25027	\N	Bońkowo-Podleśne
25091	25027	\N	Budy-Matusy
25092	25027	\N	Cegielnia Ratowska
25093	25027	\N	Gradzanowo-Kolonia
25094	25027	\N	Gradzanowo Włościańskie
25095	25027	\N	Gradzanowo Zbęskie
25096	25027	\N	Józefowo
25097	25027	\N	Leśniczówka Ratowo
25098	25027	\N	Luszewo
25099	25027	\N	Marysinek
25100	25027	\N	Radzanów
25101	25027	\N	Ratowo
25102	25027	\N	Trzciniec
25103	25027	\N	Wróblewo
25104	25027	\N	Zbrzeźnia
25105	25027	\N	Zgliczyn-Glinki
25106	25027	\N	Zgliczyn Kościelny
25107	25027	\N	Zgliczyn Witowy
25108	25027	\N	Zieluminek
25109	25028	\N	Adamowo
25110	25028	\N	Augustowo
25111	25028	\N	Breginie
25112	25028	\N	Budy Giżyńskie
25113	25028	\N	Budy Mdzewskie
25114	25028	\N	Budy Sułkowskie
25115	25028	\N	Budy Wolińskie
25116	25028	\N	Chądzyny-Krusze
25117	25028	\N	Chądzyny-Kuski
25118	25028	\N	Czarnocin
25119	25028	\N	Czarnocinek
25120	25028	\N	Dalnia
25121	25028	\N	Dąbrowa
25122	25028	\N	Drogiszka
25123	25028	\N	Giełczyn
25124	25028	\N	Giżyn
25125	25028	\N	Giżynek
25126	25028	\N	Grabienice Małe
25127	25028	\N	Ignacewo
25128	25028	\N	Józefowo
25129	25028	\N	Konotopa
25130	25028	\N	Kontrewers
25131	25028	\N	Kowalewko
25132	25028	\N	Kuskowo-Glinki
25133	25028	\N	Kuskowo Kmiece
25134	25028	\N	Leszczyna
25135	25028	\N	Łebki
25136	25028	\N	Marysinek
25137	25028	\N	Mączewo
25138	25028	\N	Mdzewko
25139	25028	\N	Mdzewo
25140	25028	\N	Niedzbórz
25141	25028	\N	Pokrytki
25142	25028	\N	Prusocin
25143	25028	\N	Radzimowice
25144	25028	\N	Rudowo
25145	25028	\N	Rydzyn Szlachecki
25146	25028	\N	Rydzyn Włościański
25147	25028	\N	Stara Maryśka
25148	25028	\N	Staroguby
25149	25028	\N	Strzegowo
25150	25028	\N	Sułkowo Borowe
25151	25028	\N	Sułkowo Polne
25152	25028	\N	Syberia
25153	25028	\N	Szachowo
25154	25028	\N	Unierzyż
25155	25028	\N	Unikowo
25156	25028	\N	Wola Kanigowska
25157	25028	\N	Wygoda
25158	25028	\N	Zabiele
25159	25029	\N	Bolewo
25160	25029	\N	Budy Bolewskie
25161	25029	\N	Dąbek
25162	25029	\N	Dunaj
25163	25029	\N	Jeże
25164	25029	\N	Konopki
25165	25029	\N	Krośnice
25166	25029	\N	Morawy
25167	25029	\N	Olszewo-Bołąki
25168	25029	\N	Olszewo-Borzymy
25169	25029	\N	Olszewo-Grzymki
25170	25029	\N	Pieńpole
25171	25029	\N	Rosochy
25172	25029	\N	Strzałkowo
25173	25029	\N	Stupsk
25174	25029	\N	Sułkowo-Kolonia
25175	25029	\N	Wola-Kolonia
25176	25029	\N	Wola Szydłowska
25177	25029	\N	Wyszyny Kościelne
25178	25029	\N	Zdroje
25179	25029	\N	Żmijewo-Gaje
25180	25029	\N	Żmijewo Kościelne
25181	25029	\N	Żmijewo-Kuce
25182	25029	\N	Żmijewo-Ponki
25183	25029	\N	Żmijewo-Trojany
25184	25030	\N	Bielawy
25185	25030	\N	Doziny
25186	25030	\N	Grądek
25187	25030	\N	Kobuszyn
25188	25030	\N	Krzywki-Bośki
25189	25030	\N	Krzywki-Piaski
25190	25030	\N	Kunki
25191	25030	\N	Liberadz
25192	25030	\N	Ługi
25193	25030	\N	Miączyn Duży
25194	25030	\N	Miączyn Mały
25195	25030	\N	Miłotki
25196	25030	\N	Mostowo
25197	25030	\N	Nowe Garkowo
25198	25030	\N	Ostrów
25199	25030	\N	Pączkowo
25200	25030	\N	Proszkowo
25201	25030	\N	Przychód
25202	25030	\N	Rochnia
25203	25030	\N	Sławkowo
25204	25030	\N	Stare Garkowo
25205	25030	\N	Szreńsk
25206	25030	\N	Wola Proszkowska
25207	25030	\N	Złotowo
25208	25031	\N	Budy Garlińskie
25209	25031	\N	Dębiny
25210	25031	\N	Dębsk
25211	25031	\N	Garlino
25212	25031	\N	Giednia
25213	25031	\N	Kluszewo
25214	25031	\N	Korzybie
25215	25031	\N	Kozły-Janowo
25216	25031	\N	Krzywonoś
25217	25031	\N	Marianowo
25218	25031	\N	Młodynin
25219	25031	\N	Nieradowo
25220	25031	\N	Nosarzewo Borowe
25221	25031	\N	Nosarzewo Polne
25222	25031	\N	Nowa Sławogóra
25223	25031	\N	Nowa Wieś
25224	25031	\N	Nowe Nosarzewo
25225	25031	\N	Nowe Piegłowo
25226	25031	\N	Pawłowo
25227	25031	\N	Piegłowo-Kolonia
25228	25031	\N	Piegłowo-Wieś
25229	25031	\N	Stara Sławogóra
25230	25031	\N	Szydłowo
25231	25031	\N	Szydłówek
25232	25031	\N	Trzcianka
25233	25031	\N	Trzcianka-Kolonia
25234	25031	\N	Tyszki-Bregendy
25235	25031	\N	Wola Dębska
25236	25031	\N	Zalesie
25237	25032	\N	Bąki
25238	25032	\N	Bonisław
25239	25032	\N	Chmielewko
25240	25032	\N	Chmielewo Małe
25241	25032	\N	Chmielewo Wielkie
25242	25032	\N	Długokąty
25243	25032	\N	Grzebsk
25244	25032	\N	Grzybowo
25245	25032	\N	Grzybowo-Kapuśnik
25246	25032	\N	Kobiałki
25247	25032	\N	Kuklin
25248	25032	\N	Kulany
25249	25032	\N	Łęg
25250	25032	\N	Michalinowo
25251	25032	\N	Pepłowo
25252	25032	\N	Pogorzel
25253	25032	\N	Turowo
25254	25032	\N	Uniszki-Cegielnia
25255	25032	\N	Uniszki Gumowskie
25256	25032	\N	Uniszki Zawadzkie
25257	25032	\N	Wąsosze
25258	25032	\N	Wieczfnia-Kolonia
25259	25032	\N	Wieczfnia Kościelna
25260	25032	\N	Windyki
25261	25032	\N	Zakrzewo Wielkie
25262	25032	\N	Załęże
25263	25033	\N	Bogurzyn
25264	25033	\N	Bogurzynek
25265	25033	\N	Głużek
25266	25033	\N	Korboniec
25267	25033	\N	Kosiny Bartosowe
25268	25033	\N	Kosiny Kapiczne
25269	25033	\N	Kowalewo
25270	25033	\N	Modła
25271	25033	\N	Nowa Otocznia
25272	25033	\N	Podkrajewo
25273	25033	\N	Stara Otocznia
25274	25033	\N	Stare Kosiny
25275	25033	\N	Wiśniewko
25276	25033	\N	Wiśniewo
25277	25033	\N	Wojnówka
25278	25033	\N	Żurominek
25279	164	\N	Nowy Dwór Mazowiecki
25280	164	\N	Czosnów
25281	164	\N	Leoncin
25282	164	\N	Nasielsk
25283	164	\N	Pomiechówek
25284	164	\N	Zakroczym
25285	25279	\N	Nowy Dwór Mazowiecki
25286	25280	\N	Adamówek
25287	25280	\N	Aleksandrów
25288	25280	\N	Augustówek
25289	25280	\N	Brzozówka
25290	25280	\N	Cybulice
25291	25280	\N	Cybulice Duże
25292	25280	\N	Cybulice Małe
25293	25280	\N	Cząstków Mazowiecki
25294	25280	\N	Cząstków Polski
25295	25280	\N	Czeczotki
25296	25280	\N	Czosnów
25297	25280	\N	Dąbrówka
25298	25280	\N	Dębina
25299	25280	\N	Dobrzyń
25300	25280	\N	Izabelin-Dziekanówek
25301	25280	\N	Janówek
25302	25280	\N	Janów-Mikołajówka
25303	25280	\N	Jesionka
25304	25280	\N	Kaliszki
25305	25280	\N	Kazuń-Bielany
25306	25280	\N	Kazuń Nowy
25307	25280	\N	Kazuń Polski
25308	25280	\N	Kiścinne
25309	25280	\N	Łomna
25310	25280	\N	Łomna-Las
25311	25280	\N	Łosia Wólka
25312	25280	\N	Małocice
25313	25280	\N	Nowy Kazuń
25314	25280	\N	Palmiry
25315	25280	\N	Pieńków
25316	25280	\N	Sady
25317	25280	\N	Sowia Wola
25318	25280	\N	Sowia Wola Folwarczna
25319	25280	\N	Truskawka
25320	25280	\N	Wiersze
25321	25280	\N	Wólka Czosnowska
25322	25280	\N	Wrzosówka
25323	25281	\N	Cisowe
25324	25281	\N	Gać
25325	25281	\N	Głusk
25326	25281	\N	Gniewniewice Folwarczne
25327	25281	\N	Górki
25328	25281	\N	Krubiczew
25329	25281	\N	Leoncin
25330	25281	\N	Mała Wieś przy Drodze
25331	25281	\N	Michałów
25332	25281	\N	Nowa Dąbrowa
25333	25281	\N	Nowa Mała Wieś
25334	25281	\N	Nowe Budy
25335	25281	\N	Nowe Gniewniewice
25336	25281	\N	Nowe Grochale
25337	25281	\N	Nowe Polesie
25338	25281	\N	Nowiny
25339	25281	\N	Nowy Secymin
25340	25281	\N	Nowy Wilków
25341	25281	\N	Ośniki
25342	25281	\N	Rybitew
25343	25281	\N	Secyminek
25344	25281	\N	Secymin Polski
25345	25281	\N	Stanisławów
25346	25281	\N	Stara Dąbrowa
25347	25281	\N	Stare Gniewniewice
25348	25281	\N	Stare Grochale
25349	25281	\N	Stare Polesie
25350	25281	\N	Teofile
25351	25281	\N	Wilków nad Wisłą
25352	25281	\N	Wilków Polski
25353	25281	\N	Wincentówek
25354	25281	\N	Zamość
25355	25282	\N	Nasielsk
25356	25282	\N	Aleksandrowo
25357	25282	\N	Andzin
25358	25282	\N	Borkowo
25359	25282	\N	Budy Siennickie
25360	25282	\N	Cegielnia Psucka
25361	25282	\N	Chechnówka
25362	25282	\N	Chlebiotki
25363	25282	\N	Chrcynno
25364	25282	\N	Cieksyn
25365	25282	\N	Czajki
25366	25282	\N	Dąbrowa
25367	25282	\N	Dębinki
25368	25282	\N	Dobra Wola
25369	25282	\N	Glice
25370	25282	\N	Głodowo Wielkie
25371	25282	\N	Jackowo Dworskie
25372	25282	\N	Jackowo Włościańskie
25373	25282	\N	Jaskółowo
25374	25282	\N	Kątne
25375	25282	\N	Kędzierzawice
25376	25282	\N	Kolonia Borkowo
25377	25282	\N	Kolonia Cieksyn
25378	25282	\N	Konary
25379	25282	\N	Kosewo
25380	25282	\N	Krogule
25381	25282	\N	Krzyczki-Pieniążki
25382	25282	\N	Krzyczki Szumne
25383	25282	\N	Krzyczki-Żabiczki
25384	25282	\N	Lelewo
25385	25282	\N	Lorcin
25386	25282	\N	Lubomin
25387	25282	\N	Malczyn
25388	25282	\N	Mazewo Dworskie"A"
25389	25282	\N	Mazewo Dworskie"B"
25390	25282	\N	Mazewo Włościańskie
25391	25282	\N	Miękoszyn
25392	25282	\N	Miękoszynek
25393	25282	\N	Młodzianowo
25394	25282	\N	Mogowo
25395	25282	\N	Mokrzyce Dworskie
25396	25282	\N	Mokrzyce Włościańskie
25397	25282	\N	Morgi
25398	25282	\N	Nowa Wrona
25399	25282	\N	Nowe Pieścirogi
25400	25282	\N	Nowiny
25401	25282	\N	Nuna
25402	25282	\N	Paulinowo
25403	25282	\N	Pianowo-Bargły
25404	25282	\N	Pianowo-Daczki
25405	25282	\N	Pianowo-Folwark
25406	25282	\N	Pianowo-Pątki
25407	25282	\N	Pniewo
25408	25282	\N	Popowo Borowe
25409	25282	\N	Popowo-Północ
25410	25282	\N	Psucin
25411	25282	\N	Ruszkowo
25412	25282	\N	Siennica
25413	25282	\N	Słustowo
25414	25282	\N	Stare Pieścirogi
25415	25282	\N	Studzianki
25416	25282	\N	Toruń Dworski
25417	25282	\N	Toruń Włościański
25418	25282	\N	Wągrodno
25419	25282	\N	Wiktorowo
25420	25282	\N	Winniki
25421	25282	\N	Zaborze
25422	25282	\N	Żabiczyn
25423	25283	\N	Błędowo
25424	25283	\N	Błędówko
25425	25283	\N	Brody
25426	25283	\N	Brody-Parcele
25427	25283	\N	Brody-Parcele Leśne
25428	25283	\N	Bronisławka
25429	25283	\N	Cegielnia-Kosewo
25430	25283	\N	Czarnowo
25431	25283	\N	Falbogi Borowe
25432	25283	\N	Goławice Drugie
25433	25283	\N	Goławice Pierwsze
25434	25283	\N	Kikoły
25435	25283	\N	Kolonia
25436	25283	\N	Kosewko
25437	25283	\N	Kosewo
25438	25283	\N	Nowe Orzechowo
25439	25283	\N	Nowy Modlin
25440	25283	\N	Pomiechowo
25441	25283	\N	Pomiechówek
25442	25283	\N	Pomocnia
25443	25283	\N	Stanisławowo
25444	25283	\N	Stare Orzechowo
25445	25283	\N	Szczypiorno
25446	25283	\N	Śniadówko
25447	25283	\N	Wola Błędowska
25448	25283	\N	Wójtostwo
25449	25283	\N	Wólka Kikolska
25450	25283	\N	Wymysły
25451	25283	\N	Zapiecki
25452	25284	\N	Zakroczym
25453	25284	\N	Błogosławie
25454	25284	\N	Czarna
25455	25284	\N	Emolinek
25456	25284	\N	Henrysin
25457	25284	\N	Janowo
25458	25284	\N	Jaworowo-Trębki Stare
25459	25284	\N	Mochty-Smok
25460	25284	\N	Smoły
25461	25284	\N	Smoszewo
25462	25284	\N	Strubiny
25463	25284	\N	Swobodnia
25464	25284	\N	Śniadowo
25465	25284	\N	Trębki Nowe
25466	25284	\N	Trębki Stare
25467	25284	\N	Wojszczyce
25468	25284	\N	Wólka Smoszewska
25469	25284	\N	Wygoda Smoszewska
25470	25284	\N	Zaręby
25471	187	\N	Baranowo
25472	187	\N	Czarnia
25473	187	\N	Czerwin
25474	187	\N	Goworowo
25475	187	\N	Kadzidło
25476	187	\N	Lelis
25477	187	\N	Łyse
25478	187	\N	Myszyniec
25479	187	\N	Olszewo-Borki
25480	187	\N	Rzekuń
25481	187	\N	Troszyn
25482	25471	\N	Adamczycha
25483	25471	\N	Bakuła
25484	25471	\N	Baranowo
25485	25471	\N	Błędowo
25486	25471	\N	Brodowe Łąki
25487	25471	\N	Budne Sowięta
25488	25471	\N	Cierpięta
25489	25471	\N	Czarnotrzew
25490	25471	\N	Czerwińskie
25491	25471	\N	Dąbrowa
25492	25471	\N	Dłutówka
25493	25471	\N	Gaczyska
25494	25471	\N	Glinki
25495	25471	\N	Grabownica
25496	25471	\N	Gutocha
25497	25471	\N	Guzowatka
25498	25471	\N	Jastrząbka
25499	25471	\N	Kalisko
25500	25471	\N	Kopaczyska
25501	25471	\N	Kucieje
25502	25471	\N	Lipowy Las
25503	25471	\N	Majdan
25504	25471	\N	Majk
25505	25471	\N	Oborczyska
25506	25471	\N	Orzoł
25507	25471	\N	Orzołek
25508	25471	\N	Ostrówek
25509	25471	\N	Ramiona
25510	25471	\N	Rupin
25511	25471	\N	Rycica
25512	25471	\N	Seborki
25513	25471	\N	Witowy Most
25514	25471	\N	Wola Błędowska
25515	25471	\N	Zawady
25516	25471	\N	Ziomek
25517	25472	\N	Bandysie
25518	25472	\N	Brzozowy Kąt
25519	25472	\N	Cupel
25520	25472	\N	Cyk
25521	25472	\N	Czarnia
25522	25472	\N	Długie
25523	25472	\N	Dunaj
25524	25472	\N	Michałowo
25525	25472	\N	Rutkowo
25526	25472	\N	Surowe
25527	25473	\N	Andrzejki-Tyszki
25528	25473	\N	Bobin
25529	25473	\N	Borek
25530	25473	\N	Buczyn
25531	25473	\N	Choromany-Witnice
25532	25473	\N	Chruśnice
25533	25473	\N	Czerwin
25534	25473	\N	Damiany
25535	25473	\N	Dąbek
25536	25473	\N	Dobki Nowe
25537	25473	\N	Dobki Stare
25538	25473	\N	Dzwonek
25539	25473	\N	Filochy
25540	25473	\N	Gocły
25541	25473	\N	Gostery
25542	25473	\N	Grodzisk Duży
25543	25473	\N	Grodzisk-Wieś
25544	25473	\N	Gucin
25545	25473	\N	Gumki
25546	25473	\N	Janki Młode
25547	25473	\N	Jarnuty
25548	25473	\N	Księżopole
25549	25473	\N	Laski Szlacheckie
25550	25473	\N	Laski Włościańskie
25551	25473	\N	Łady-Mans
25552	25473	\N	Malinowo Nowe
25553	25473	\N	Malinowo Stare
25554	25473	\N	Piotrowo
25555	25473	\N	Piski
25556	25473	\N	Pomian
25557	25473	\N	Seroczyn
25558	25473	\N	Skarżyn
25559	25473	\N	Sokołowo
25560	25473	\N	Stylągi
25561	25473	\N	Suchcice
25562	25473	\N	Tomasze
25563	25473	\N	Tyszki-Ciągaczki
25564	25473	\N	Tyszki-Nadbory
25565	25473	\N	Wiśniewo
25566	25473	\N	Wiśniówek
25567	25473	\N	Wojsze
25568	25473	\N	Wólka Czerwińska
25569	25473	\N	Wólka Seroczyńska
25570	25473	\N	Załuski
25571	25473	\N	Zaorze
25572	25473	\N	Żochy
25573	25474	\N	Borki
25574	25474	\N	Brzeźno
25575	25474	\N	Brzeźno-Kolonia
25576	25474	\N	Brzeźno-Wieś
25577	25474	\N	Cisk
25578	25474	\N	Czarnowo
25579	25474	\N	Czernie
25580	25474	\N	Damięty
25581	25474	\N	Daniłowo
25582	25474	\N	Dzbądzek
25583	25474	\N	Gierwaty
25584	25474	\N	Goworowo
25585	25474	\N	Goworówek
25586	25474	\N	Góry
25587	25474	\N	Grabowo
25588	25474	\N	Grodzisk Mały
25589	25474	\N	Jawory-Podmaście
25590	25474	\N	Jawory Stare
25591	25474	\N	Jawory-Wielkopole
25592	25474	\N	Jemieliste
25593	25474	\N	Józefowo
25594	25474	\N	Jurgi
25595	25474	\N	Kaczka
25596	25474	\N	Kobylin
25597	25474	\N	Kruszewo
25598	25474	\N	Kunin
25599	25474	\N	Lipianka
25600	25474	\N	Ludwinowo
25601	25474	\N	Michałowo
25602	25474	\N	Nogawki
25603	25474	\N	Pasieki
25604	25474	\N	Pokrzywnica
25605	25474	\N	Ponikiew Duża
25606	25474	\N	Ponikiew Mała
25607	25474	\N	Rębisze-Działy
25608	25474	\N	Rębisze-Kolonia
25609	25474	\N	Rębisze-Parcele
25610	25474	\N	Smólnik
25611	25474	\N	Struniawy
25612	25474	\N	Szarłat
25613	25474	\N	Szczawin
25614	25474	\N	Wólka Brzezińska
25615	25474	\N	Wólka Kunińska
25616	25474	\N	Zambrzyce
25617	25474	\N	Zaorze
25618	25474	\N	Żabin
25619	25475	\N	Brzozowa
25620	25475	\N	Brzozówka
25621	25475	\N	Chudek
25622	25475	\N	Czarnia
25623	25475	\N	Dylewo
25624	25475	\N	Gleba
25625	25475	\N	Golanka
25626	25475	\N	Grale
25627	25475	\N	Jazgarka
25628	25475	\N	Jeglijowiec
25629	25475	\N	Kadzidło
25630	25475	\N	Karaska
25631	25475	\N	Karaska-Gajówka
25632	25475	\N	Karaska-Leśniczówka
25633	25475	\N	Kierzek
25634	25475	\N	Klimki
25635	25475	\N	Krobia
25636	25475	\N	Kuczyńskie
25637	25475	\N	Piasecznia
25638	25475	\N	Podgórze
25639	25475	\N	Podgórze-Gajówka
25640	25475	\N	Rokitówka
25641	25475	\N	Rososz
25642	25475	\N	Siarcza Łąka
25643	25475	\N	Strzałki
25644	25475	\N	Sul
25645	25475	\N	Tatary
25646	25475	\N	Todzia
25647	25475	\N	Wach
25648	25475	\N	Wąglewo
25649	25475	\N	Wykrot
25650	25476	\N	Aleksandrowo
25651	25476	\N	Białobiel
25652	25476	\N	Dąbrówka
25653	25476	\N	Długi Kąt
25654	25476	\N	Durlasy
25655	25476	\N	Gąski
25656	25476	\N	Gibałka
25657	25476	\N	Gnaty
25658	25476	\N	Kurpiewskie
25659	25476	\N	Lelis
25660	25476	\N	Łęg Przedmiejski
25661	25476	\N	Łęg Starościński
25662	25476	\N	Łodziska
25663	25476	\N	Nasiadki
25664	25476	\N	Obierwia
25665	25476	\N	Olszewka
25666	25476	\N	Płoszyce
25667	25476	\N	Siemnocha
25668	25476	\N	Szafarczyska
25669	25476	\N	Szafarnia
25670	25476	\N	Szkwa
25671	25476	\N	Szwendrowy Most
25672	25477	\N	Antonia
25673	25477	\N	Baba
25674	25477	\N	Dawia
25675	25477	\N	Dęby
25676	25477	\N	Dudy Puszczańskie
25677	25477	\N	Grądzkie
25678	25477	\N	Klenkor
25679	25477	\N	Lipniki
25680	25477	\N	Łączki
25681	25477	\N	Łyse
25682	25477	\N	Piątkowizna
25683	25477	\N	Plewki
25684	25477	\N	Pupkowizna
25685	25477	\N	Serafin
25686	25477	\N	Szafranki
25687	25477	\N	Tartak
25688	25477	\N	Tyczek
25689	25477	\N	Warmiak
25690	25477	\N	Wejdo
25691	25477	\N	Wyżega
25692	25477	\N	Zalas
25693	25477	\N	Złota Góra
25694	25478	\N	Myszyniec
25695	25478	\N	Białusny Lasek
25696	25478	\N	Charciabałda
25697	25478	\N	Cięćk
25698	25478	\N	Drężek
25699	25478	\N	Gadomskie
25700	25478	\N	Krysiaki
25701	25478	\N	Myszyniec-Koryta
25702	25478	\N	Niedźwiedź
25703	25478	\N	Olszyny
25704	25478	\N	Pełty
25705	25478	\N	Stary Myszyniec
25706	25478	\N	Świdwiborek
25707	25478	\N	Wolkowe
25708	25478	\N	Wydmusy
25709	25478	\N	Wykrot
25710	25478	\N	Zalesie
25711	25478	\N	Zawady
25712	25478	\N	Zawodzie
25713	25478	\N	Zdunek
25714	25479	\N	Antonie
25715	25479	\N	Białobrzeg Bliższy
25716	25479	\N	Białobrzeg Dalszy
25717	25479	\N	Chojniki
25718	25479	\N	Dobrołęka
25719	25479	\N	Drężewo
25720	25479	\N	Działyń
25721	25479	\N	Grabnik
25722	25479	\N	Grabowo
25723	25479	\N	Grabówek
25724	25479	\N	Kordowo
25725	25479	\N	Kruki
25726	25479	\N	Łazy
25727	25479	\N	Mostowo
25728	25479	\N	Mostówek
25729	25479	\N	Nakły
25730	25479	\N	Nowa Wieś
25731	25479	\N	Nożewo
25732	25479	\N	Olszewo-Borki
25733	25479	\N	Przyłaje
25734	25479	\N	Przystań
25735	25479	\N	Rataje
25736	25479	\N	Rżaniec
25737	25479	\N	Siarki
25738	25479	\N	Skrzypek
25739	25479	\N	Stepna-Michałki
25740	25479	\N	Stepna Stara
25741	25479	\N	Wojska Biel
25742	25479	\N	Wyszel
25743	25479	\N	Zabiele-Piliki
25744	25479	\N	Zabiele Wielkie
25745	25479	\N	Zabrodzie
25746	25479	\N	Zambrzycha
25747	25479	\N	Żebry-Chudek
25748	25479	\N	Żebry-Ostrowy
25749	25479	\N	Żebry-Perosy
25750	25479	\N	Żebry-Sławki
25751	25479	\N	Żebry-Stara Wieś
25752	25479	\N	Żebry-Wierzchlas
25753	25479	\N	Żebry-Żabin
25754	25479	\N	Żerań Duży
25755	25479	\N	Żerań Mały
25756	25480	\N	Borawe
25757	25480	\N	Czarnowiec
25758	25480	\N	Daniszewo
25759	25480	\N	Drwęcz
25760	25480	\N	Dzbenin
25761	25480	\N	Goworki
25762	25480	\N	Kamianka
25763	25480	\N	Korczaki
25764	25480	\N	Kupniki
25765	25480	\N	Laskowiec
25766	25480	\N	Ławy
25767	25480	\N	Nowa Wieś Leśna
25768	25480	\N	Nowa Wieś Wschodnia
25769	25480	\N	Ołdaki
25770	25480	\N	Przytuły Nowe
25771	25480	\N	Przytuły Stare
25772	25480	\N	Rozwory
25773	25480	\N	Rzekuń
25774	25480	\N	Susk Nowy
25775	25480	\N	Susk Stary
25776	25480	\N	Teodorowo
25777	25480	\N	Tobolice
25778	25480	\N	Zabiele
25779	25481	\N	Aleksandrowo
25780	25481	\N	Borowce
25781	25481	\N	Budne
25782	25481	\N	Choromany
25783	25481	\N	Chrostowo
25784	25481	\N	Chrzczony
25785	25481	\N	Dąbek
25786	25481	\N	Dzbenin
25787	25481	\N	Grucele
25788	25481	\N	Janki Stare
25789	25481	\N	Janochy
25790	25481	\N	Kamionowo
25791	25481	\N	Kleczkowo
25792	25481	\N	Kurpie Dworskie
25793	25481	\N	Kurpie Szlacheckie
25794	25481	\N	Łątczyn
25795	25481	\N	Mieczki-Abramy
25796	25481	\N	Mieczki-Poziemaki
25797	25481	\N	Mieczki-Ziemaki
25798	25481	\N	Milewo-Łosie
25799	25481	\N	Milewo-Tosie
25800	25481	\N	Milewo Wielkie
25801	25481	\N	Ojcewo
25802	25481	\N	Opęchowo
25803	25481	\N	Puchały
25804	25481	\N	Rabędy
25805	25481	\N	Radgoszcz
25806	25481	\N	Repki
25807	25481	\N	Rostki
25808	25481	\N	Sawały
25809	25481	\N	Siemiątkowo
25810	25481	\N	Troszyn
25811	25481	\N	Trzaski
25812	25481	\N	Wysocarz
25813	25481	\N	Zamość
25814	25481	\N	Zapieczne
25815	25481	\N	Zawady
25816	25481	\N	Żmijewek-Mans
25817	25481	\N	Żmijewek Włościański
25818	25481	\N	Żmijewo-Zagroby
25819	25481	\N	Żyźniewo
25820	165	\N	Ostrów Mazowiecka
25821	165	\N	Andrzejewo
25822	165	\N	Boguty-Pianki
25823	165	\N	Brok
25824	165	\N	Małkinia Górna
25825	165	\N	Nur
25826	165	\N	Stary Lubotyń
25827	165	\N	Szulborze Wielkie
25828	165	\N	Wąsewo
25829	165	\N	Zaręby Kościelne
25830	25820	\N	Ostrów Mazowiecka
25831	25821	\N	Andrzejewo
25832	25821	\N	Dąbrowa
25833	25821	\N	Godlewo-Gorzejewo
25834	25821	\N	Gołębie-Leśniewo
25835	25821	\N	Grodzick-Ołdaki
25836	25821	\N	Jabłonowo-Klacze
25837	25821	\N	Jasienica-Parcele
25838	25821	\N	Kowalówka
25839	25821	\N	Króle Duże
25840	25821	\N	Króle Małe
25841	25821	\N	Kuleszki-Nienałty
25842	25821	\N	Łętownica-Parcele
25843	25821	\N	Mianowo
25844	25821	\N	Nowa Ruskołęka
25845	25821	\N	Olszewo-Cechny
25846	25821	\N	Ołdaki-Polonia
25847	25821	\N	Pęchratka Mała
25848	25821	\N	Pieńki-Sobótki
25849	25821	\N	Pieńki Wielkie
25850	25821	\N	Pieńki-Żaki
25851	25821	\N	Przeździecko-Dworaki
25852	25821	\N	Przeździecko-Grzymki
25853	25821	\N	Przeździecko-Jachy
25854	25821	\N	Przeździecko-Lenarty
25855	25821	\N	Ruskołęka-Parcele
25856	25821	\N	Stara Ruskołęka
25857	25821	\N	Załuski-Lipniewo
25858	25821	\N	Zaręby-Bolędy
25859	25821	\N	Zaręby-Choromany
25860	25821	\N	Zaręby-Warchoły
25861	25821	\N	Zaręby Zaborcze
25862	25821	\N	Żelazy-Brokowo
25863	25822	\N	Białe-Giezki
25864	25822	\N	Białe-Kwaczoły
25865	25822	\N	Białe-Misztale
25866	25822	\N	Białe-Papieże
25867	25822	\N	Białe-Szczepanowice
25868	25822	\N	Białe-Zieje
25869	25822	\N	Boguty-Augustyny
25870	25822	\N	Boguty-Leśne
25871	25822	\N	Boguty-Milczki
25872	25822	\N	Boguty-Pianki
25873	25822	\N	Boguty-Rubiesze
25874	25822	\N	Boguty-Żurawie
25875	25822	\N	Drewnowo-Gołyń
25876	25822	\N	Drewnowo-Lipskie
25877	25822	\N	Drewnowo-Ziemaki
25878	25822	\N	Godlewo-Baćki
25879	25822	\N	Godlewo-Łuby
25880	25822	\N	Kamieńczyk Borowy
25881	25822	\N	Kamieńczyk-Ryciorki
25882	25822	\N	Kamieńczyk Wielki
25883	25822	\N	Konarze
25884	25822	\N	Kraszewo Czarne
25885	25822	\N	Kunin-Zamek
25886	25822	\N	Kutyłowo-Bródki
25887	25822	\N	Kutyłowo-Perysie
25888	25822	\N	Michałowo-Wróble
25889	25822	\N	Murawskie-Czachy
25890	25822	\N	Murawskie-Miazgi
25891	25822	\N	Szpice-Chojnowo
25892	25822	\N	Trynisze-Kuniewo
25893	25822	\N	Trynisze-Moszewo
25894	25822	\N	Tymianki-Adamy
25895	25822	\N	Tymianki-Bucie
25896	25822	\N	Tymianki-Moderki
25897	25822	\N	Tymianki-Okunie
25898	25822	\N	Tymianki-Skóry
25899	25822	\N	Tymianki-Szklarze
25900	25822	\N	Zabiele-Pikuły
25901	25822	\N	Zawisty
25902	25822	\N	Złotki
25903	25823	\N	Brok
25904	25823	\N	Antonowo
25905	25823	\N	Bojany
25906	25823	\N	Dybki
25907	25823	\N	Laskowizna
25908	25823	\N	Nagoszewo
25909	25823	\N	Nowe Kaczkowo
25910	25823	\N	Nowiny
25911	25823	\N	Puzdrowizna
25912	25823	\N	Ruda
25913	25823	\N	Stare Kaczkowo
25914	25823	\N	Turka
25915	25823	\N	Żurawieniec
25916	25824	\N	Biel
25917	25824	\N	Błędnica
25918	25824	\N	Błędnica-Leśniczówka
25919	25824	\N	Boreczek
25920	25824	\N	Borowe
25921	25824	\N	Daniłowo
25922	25824	\N	Daniłowo-Parcele
25923	25824	\N	Daniłówka Druga
25924	25824	\N	Daniłówka Pierwsza
25925	25824	\N	Glina
25926	25824	\N	Grądy
25927	25824	\N	Kańkowo
25928	25824	\N	Kępina
25929	25824	\N	Kiełczew
25930	25824	\N	Klukowo
25931	25824	\N	Klukowo-Morgi
25932	25824	\N	Malinówka
25933	25824	\N	Małkinia Dolna
25934	25824	\N	Małkinia Górna
25935	25824	\N	Małkinia Mała-Przewóz
25936	25824	\N	Niegowiec
25937	25824	\N	Orło
25938	25824	\N	Parcel
25939	25824	\N	Podgórze-Gazdy
25940	25824	\N	Poniatowo
25941	25824	\N	Prostyń
25942	25824	\N	Rostki-Piotrowice
25943	25824	\N	Rostki Wielkie
25944	25824	\N	Sumiężne
25945	25824	\N	Treblinka
25946	25824	\N	Zawisty Dzikie
25947	25824	\N	Zawisty Nadbużne
25948	25824	\N	Zawisty Podleśne
25949	25824	\N	Żachy-Pawły
25950	25825	\N	Godlewo-Mierniki
25951	25825	\N	Godlewo-Milewek
25952	25825	\N	Godlewo-Warsze
25953	25825	\N	Godlewo Wielkie
25954	25825	\N	Kałęczyn
25955	25825	\N	Kamianka Nadbużna
25956	25825	\N	Kamianka-Stokowo
25957	25825	\N	Kossaki
25958	25825	\N	Kramkowo Lipskie
25959	25825	\N	Łęg Nurski
25960	25825	\N	Murawskie Nadbużne
25961	25825	\N	Myślibory
25962	25825	\N	Nur
25963	25825	\N	Obryte
25964	25825	\N	Ołowskie
25965	25825	\N	Ołtarze-Gołacze
25966	25825	\N	Opatowina
25967	25825	\N	Strękowo
25968	25825	\N	Strękowo Nieczykowskie
25969	25825	\N	Ślepowrony
25970	25825	\N	Zakrzewo-Słomy
25971	25825	\N	Zaszków
25972	25825	\N	Zaszków-Kolonia
25973	25825	\N	Zuzela
25974	25825	\N	Żebry-Kolonia
25975	25825	\N	Żebry-Laskowiec
25976	25820	\N	Antoniewo
25977	25820	\N	Biel
25978	25820	\N	Budy-Grudzie
25979	25820	\N	Dybki
25980	25820	\N	Fidury
25981	25820	\N	Grudzie
25982	25820	\N	Guty-Bujno
25983	25820	\N	Jasienica
25984	25820	\N	Jelenie
25985	25820	\N	Jelonki
25986	25820	\N	Jeziorko
25987	25820	\N	Kalinowo
25988	25820	\N	Kalinowo-Parcele
25989	25820	\N	Komorowo
25990	25820	\N	Komorowo-Kolonia
25991	25820	\N	Koziki
25992	25820	\N	Koziki-Majdan
25993	25820	\N	Kuskowizna
25994	25820	\N	Lipniki
25995	25820	\N	Nagoszewka
25996	25820	\N	Nagoszewka Druga
25997	25820	\N	Nagoszewka Pierwsza
25998	25820	\N	Nagoszewo
25999	25820	\N	Nieskórz
26000	25820	\N	Nieskórz Murowanka
26001	25820	\N	Nowa Grabownica
26002	25820	\N	Nowa Osuchowa
26003	25820	\N	Nowe Lubiejewo
26004	25820	\N	Pałapus Szlachecki
26005	25820	\N	Pałapus Włościański
26006	25820	\N	Pieńki
26007	25820	\N	Podborze
26008	25820	\N	Podgrzybowskie
26009	25820	\N	Popielarnia
26010	25820	\N	Pólki
26011	25820	\N	Prochowo
26012	25820	\N	Prosienica
26013	25820	\N	Przyjmy
26014	25820	\N	Przyjmy k. Poręby
26015	25820	\N	Rogóźnia
26016	25820	\N	Sadzawki
26017	25820	\N	Sagaje
26018	25820	\N	Sielc
26019	25820	\N	Skały
26020	25820	\N	Smolechy
26021	25820	\N	Stara Grabownica
26022	25820	\N	Stara Osuchowa
26023	25820	\N	Stare Lubiejewo
26024	25820	\N	Stawek
26025	25820	\N	Stok
26026	25820	\N	Sulęcin-Kolonia
26027	25820	\N	Ugniewo
26028	25820	\N	Wiśniewo
26029	25820	\N	Zakrzewek
26030	25820	\N	Zalesie
26031	25826	\N	Budziszki
26032	25826	\N	Chmielewo
26033	25826	\N	Gawki
26034	25826	\N	Gniazdowo
26035	25826	\N	Grądziki
26036	25826	\N	Gumowo
26037	25826	\N	Klimonty
26038	25826	\N	Kosewo
26039	25826	\N	Koskowo
26040	25826	\N	Lubotyń-Kolonia
26041	25826	\N	Lubotyń-Morgi
26042	25826	\N	Lubotyń-Włóki
26043	25826	\N	Podbiele
26044	25826	\N	Podbielko
26045	25826	\N	Rabędy
26046	25826	\N	Rogowo-Folwark
26047	25826	\N	Rogówek
26048	25826	\N	Rząśnik
26049	25826	\N	Stare Rogowo
26050	25826	\N	Stary Lubotyń
26051	25826	\N	Stary Turobin
26052	25826	\N	Sulęcin Szlachecki
26053	25826	\N	Sulęcin Włościański
26054	25826	\N	Świerże
26055	25826	\N	Turobin-Brzozowa
26056	25826	\N	Żochowo
26057	25826	\N	Żyłowo
26058	25827	\N	Brulino-Lipskie
26059	25827	\N	Godlewo-Gudosze
26060	25827	\N	Gostkowo
26061	25827	\N	Grędzice
26062	25827	\N	Gumowo-Dobki
26063	25827	\N	Helenowo
26064	25827	\N	Janczewo-Sukmanki
26065	25827	\N	Janczewo Wielkie
26066	25827	\N	Leśniewo
26067	25827	\N	Słup
26068	25827	\N	Słup-Kolonia
26069	25827	\N	Smolewo-Parcele
26070	25827	\N	Smolewo-Wieś
26071	25827	\N	Szulborze-Koty
26072	25827	\N	Szulborze Wielkie
26073	25827	\N	Świerże-Leśniewek
26074	25827	\N	Uścianek-Dębianka
26075	25827	\N	Zakrzewo-Zalesie
26076	25828	\N	Bagatele
26077	25828	\N	Bartosy
26078	25828	\N	Brudki Nowe
26079	25828	\N	Brudki Stare
26080	25828	\N	Brzezienko
26081	25828	\N	Choiny
26082	25828	\N	Czesin
26083	25828	\N	Dalekie
26084	25828	\N	Grądy
26085	25828	\N	Grębki
26086	25828	\N	Jarząbka
26087	25828	\N	Króle
26088	25828	\N	Majdan Suski
26089	25828	\N	Modlinek
26090	25828	\N	Mokrylas
26091	25828	\N	Przedświt
26092	25828	\N	Przyborowie
26093	25828	\N	Rososz
26094	25828	\N	Ruda
26095	25828	\N	Rynek
26096	25828	\N	Rząśnik-Majdan
26097	25828	\N	Rząśnik Szlachecki
26098	25828	\N	Rząśnik Włościański
26099	25828	\N	Trynosy
26100	25828	\N	Trynosy-Osiedle
26101	25828	\N	Ulasek
26102	25828	\N	Wąsewo
26103	25828	\N	Wąsewo-Kolonia
26104	25828	\N	Wąsewo-Lachowiec
26105	25828	\N	Wysocze
26106	25828	\N	Zastawie
26107	25828	\N	Zgorzałowo
26108	25829	\N	Budziszewo
26109	25829	\N	Chmielewo
26110	25829	\N	Gaczkowo
26111	25829	\N	Gąsiorowo
26112	25829	\N	Grabowo
26113	25829	\N	Kańkowo-Piecki
26114	25829	\N	Kępiste-Borowe
26115	25829	\N	Kietlanka
26116	25829	\N	Kosuty
26117	25829	\N	Niemiry
26118	25829	\N	Nienałty-Brewki
26119	25829	\N	Nienałty-Szymany
26120	25829	\N	Nowa Złotoria
26121	25829	\N	Pętkowo Wielkie
26122	25829	\N	Pułazie
26123	25829	\N	Rawy-Gaczkowo
26124	25829	\N	Rostki-Daćbogi
26125	25829	\N	Skłody-Piotrowice
26126	25829	\N	Skłody-Stachy
26127	25829	\N	Skłody Średnie
26128	25829	\N	Stara Złotoria
26129	25829	\N	Świerże-Kiełcze
26130	25829	\N	Świerże-Kolonia
26131	25829	\N	Świerże-Kończany
26132	25829	\N	Świerże-Panki
26133	25829	\N	Świerże Zielone
26134	25829	\N	Uścianek Wielki
26135	25829	\N	Zakrzewo-Kopijki
26136	25829	\N	Zakrzewo Wielkie
26137	25829	\N	Zaręby Kościelne
26138	25829	\N	Zaręby Leśne
26139	25829	\N	Zgleczewo Panieńskie
26140	25829	\N	Zgleczewo Szlacheckie
26141	166	\N	Józefów
26142	166	\N	Otwock
26143	166	\N	Celestynów
26144	166	\N	Karczew
26145	166	\N	Kołbiel
26146	166	\N	Osieck
26147	166	\N	Sobienie-Jeziory
26148	166	\N	Wiązowna
26149	26141	\N	Józefów
26150	26142	\N	Otwock
26151	26143	\N	Celestynów
26152	26143	\N	Dąbrówka
26153	26143	\N	Dyzin
26154	26143	\N	Glina
26155	26143	\N	Jatne
26156	26143	\N	Lasek
26157	26143	\N	Okoły
26158	26143	\N	Ostrowik
26159	26143	\N	Ostrów
26160	26143	\N	Podbiel
26161	26143	\N	Pogorzel
26162	26143	\N	Ponurzyca
26163	26143	\N	Regut
26164	26143	\N	Samuszyn
26165	26143	\N	Stara Wieś
26166	26143	\N	Tabor
26167	26143	\N	Zabieżki
26168	26144	\N	Karczew
26169	26144	\N	Brzezinka
26170	26144	\N	Całowanie
26171	26144	\N	Glinki
26172	26144	\N	Janów
26173	26144	\N	Kępa Nadbrzeska
26174	26144	\N	Kosumce
26175	26144	\N	Łukówiec
26176	26144	\N	Nadbrzeż
26177	26144	\N	Ostrówek
26178	26144	\N	Ostrówiec
26179	26144	\N	Otwock Mały
26180	26144	\N	Otwock Wielki
26181	26144	\N	Piotrowice
26182	26144	\N	Sobiekursk
26183	26144	\N	Władysławów
26184	26144	\N	Wygoda
26185	26145	\N	Antoninek
26186	26145	\N	Bocian
26187	26145	\N	Bolechówek
26188	26145	\N	Borków
26189	26145	\N	Chrosna
26190	26145	\N	Chrząszczówka
26191	26145	\N	Człekówka
26192	26145	\N	Dobrzyniec
26193	26145	\N	Gadka
26194	26145	\N	Głupianka
26195	26145	\N	Gózd
26196	26145	\N	Karpiska
26197	26145	\N	Kąty
26198	26145	\N	Kołbiel
26199	26145	\N	Kujawki
26200	26145	\N	Lubice
26201	26145	\N	Nowa Wieś
26202	26145	\N	Oleksin
26203	26145	\N	Podgórzno
26204	26145	\N	Radachówka
26205	26145	\N	Rudno
26206	26145	\N	Rudzienko
26207	26145	\N	Sępochów
26208	26145	\N	Siwianka
26209	26145	\N	Skorupy
26210	26145	\N	Stara Wieś Druga
26211	26145	\N	Sufczyn
26212	26145	\N	Teresin
26213	26145	\N	Wilczarz
26214	26145	\N	Władzin
26215	26145	\N	Wola Sufczyńska
26216	26146	\N	Augustówka
26217	26146	\N	Czarnowiec
26218	26146	\N	Górki
26219	26146	\N	Grabianka
26220	26146	\N	Lipiny
26221	26146	\N	Natolin
26222	26146	\N	Nowe Kościeliska
26223	26146	\N	Osieck
26224	26146	\N	Osieck pod Górą
26225	26146	\N	Osieck pod Grabinką
26226	26146	\N	Pod Rudnikiem
26227	26146	\N	Pogorzel
26228	26146	\N	Rudnik
26229	26146	\N	Sobieńki
26230	26146	\N	Stare Kościeliska
26231	26146	\N	Wójtowizna
26232	26147	\N	Dziecinów
26233	26147	\N	Gusin
26234	26147	\N	Karczunek
26235	26147	\N	Nowy Zambrzyków
26236	26147	\N	Piwonin
26237	26147	\N	Potok
26238	26147	\N	Przydawki
26239	26147	\N	Radwanków Królewski
26240	26147	\N	Radwanków Szlachecki
26241	26147	\N	Sewerynów
26242	26147	\N	Siedzów
26243	26147	\N	Sobienie Biskupie
26244	26147	\N	Sobienie-Jeziory
26245	26147	\N	Sobienie Kiełczewskie Drugie
26246	26147	\N	Sobienie Kiełczewskie Pierwsze
26247	26147	\N	Sobienie Szlacheckie
26248	26147	\N	Stary Zambrzyków
26249	26147	\N	Szymanowice Duże
26250	26147	\N	Szymanowice Małe
26251	26147	\N	Śniadków Dolny
26252	26147	\N	Śniadków Górny
26253	26147	\N	Śniadków Górny A
26254	26147	\N	Warszawice
26255	26147	\N	Warszówka
26256	26147	\N	Wysoczyn
26257	26147	\N	Zuzanów
26258	26148	\N	Bolesławów
26259	26148	\N	Boryszew
26260	26148	\N	Czarnówka
26261	26148	\N	Duchnów
26262	26148	\N	Dziechciniec
26263	26148	\N	Emów
26264	26148	\N	Glinianka
26265	26148	\N	Góraszka
26266	26148	\N	Izabela
26267	26148	\N	Kąck
26268	26148	\N	Kopki
26269	26148	\N	Kruszówiec
26270	26148	\N	Lipowo
26271	26148	\N	Majdan
26272	26148	\N	Malcanów
26273	26148	\N	Michałówek
26274	26148	\N	Pęclin
26275	26148	\N	Poręby
26276	26148	\N	Radiówek
26277	26148	\N	Rzakta
26278	26148	\N	Wiązowna
26279	26148	\N	Wiązowna Kościelna
26280	26148	\N	Wola Ducka
26281	26148	\N	Wola Karczewska
26282	26148	\N	Zagórze
26283	26148	\N	Zakręt
26284	26148	\N	Żanęcin
26285	167	\N	Góra Kalwaria
26286	167	\N	Konstancin-Jeziorna
26287	167	\N	Lesznowola
26288	167	\N	Piaseczno
26289	167	\N	Prażmów
26290	167	\N	Tarczyn
26291	26285	\N	Góra Kalwaria
26292	26285	\N	Aleksandrów
26293	26285	\N	Baniocha
26294	26285	\N	Borki
26295	26285	\N	Brześce
26296	26285	\N	Brzumin
26297	26285	\N	Buczynów
26298	26285	\N	Budki Moczydłowskie
26299	26285	\N	Cendrowice
26300	26285	\N	Coniew
26301	26285	\N	Czachówek
26302	26285	\N	Czaplin
26303	26285	\N	Czaplinek
26304	26285	\N	Czarny Las
26305	26285	\N	Czersk
26306	26285	\N	Dębówka
26307	26285	\N	Dobiesz
26308	26285	\N	Julianów
26309	26285	\N	Karolina
26310	26285	\N	Kąty
26311	26285	\N	Kępa Radwankowska
26312	26285	\N	Kolonia Sobików
26313	26285	\N	Królewski Las
26314	26285	\N	Krzaki Czaplinkowskie
26315	26285	\N	Krzymów
26316	26285	\N	Linin
26317	26285	\N	Lininek
26318	26285	\N	Łubna
26319	26285	\N	Ługówka
26320	26285	\N	Mikówiec
26321	26285	\N	Moczydłów
26322	26285	\N	Obręb
26323	26285	\N	Ostrówik
26324	26285	\N	Pęcław
26325	26285	\N	Podgóra
26326	26285	\N	Podłęcze
26327	26285	\N	Podosowa
26328	26285	\N	Potycz
26329	26285	\N	Sierzchów
26330	26285	\N	Sobików
26331	26285	\N	Solec
26332	26285	\N	Szymanów
26333	26285	\N	Tatary
26334	26285	\N	Tomice
26335	26285	\N	Wincentów
26336	26285	\N	Wojciechowice
26337	26285	\N	Wólka Dworska
26338	26285	\N	Wólka Załęska
26339	26286	\N	Konstancin-Jeziorna
26340	26286	\N	Bielawa
26341	26286	\N	Borowina
26342	26286	\N	Cieciszew
26343	26286	\N	Ciszyca
26344	26286	\N	Czarnów
26345	26286	\N	Czernidła
26346	26286	\N	Dębówka
26347	26286	\N	Gassy
26348	26286	\N	Habdzin
26349	26286	\N	Kawęczyn
26350	26286	\N	Kawęczynek
26351	26286	\N	Kępa Oborska
26352	26286	\N	Kępa Okrzewska
26353	26286	\N	Kierszek
26354	26286	\N	Łęg
26355	26286	\N	Łyczyn
26356	26286	\N	Obory
26357	26286	\N	Obórki
26358	26286	\N	Okrzeszyn
26359	26286	\N	Opacz
26360	26286	\N	Parcela-Obory
26361	26286	\N	Piaski
26362	26286	\N	Słomczyn
26363	26286	\N	Turowice
26364	26287	\N	Borowina
26365	26287	\N	Garbatka
26366	26287	\N	Jabłonowo
26367	26287	\N	Janczewice
26368	26287	\N	Jastrzębiec
26369	26287	\N	Jazgarzewszczyzna
26370	26287	\N	Kolonia Lesznowola
26371	26287	\N	Kolonia Mrokowska
26372	26287	\N	Kolonia Warszawska
26373	26287	\N	Kosów
26374	26287	\N	Lesznowola
26375	26287	\N	Łazy
26376	26287	\N	Łoziska
26377	26287	\N	Magdalenka
26378	26287	\N	Marysin
26379	26287	\N	Mroków
26380	26287	\N	Mysiadło
26381	26287	\N	Nowa Iwiczna
26382	26287	\N	Nowa Wola
26383	26287	\N	Podolszyn
26384	26287	\N	Stachowo
26385	26287	\N	Stara Iwiczna
26386	26287	\N	Stefanowo
26387	26287	\N	Warszawianka
26388	26287	\N	Wilcza Góra
26389	26287	\N	Władysławów
26390	26287	\N	Wola Mrokowska
26391	26287	\N	Wólka Kosowska
26392	26287	\N	Zamienie
26393	26287	\N	Zgorzała
26394	26288	\N	Piaseczno
26395	26288	\N	Antoninów
26396	26288	\N	Baszkówka
26397	26288	\N	Bąkówka
26398	26288	\N	Bobrowiec
26399	26288	\N	Bogatki
26400	26288	\N	Chojnów
26401	26288	\N	Chylice
26402	26288	\N	Chylice-Pólko
26403	26288	\N	Chyliczki
26404	26288	\N	Gajówka Biele
26405	26288	\N	Głosków
26406	26288	\N	Głosków-Letnisko
26407	26288	\N	Gołków
26408	26288	\N	Grochowa
26409	26288	\N	Henryków-Urocze
26410	26288	\N	Jastrzębie
26411	26288	\N	Jazgarzew
26412	26288	\N	Jesówka
26413	26288	\N	Józefosław
26414	26288	\N	Julianów
26415	26288	\N	Kamionka
26416	26288	\N	Karolin
26417	26288	\N	Kuleszówka
26418	26288	\N	Leśniczówka Na Zielonym
26419	26288	\N	Łbiska
26420	26288	\N	Mieszkowo
26421	26288	\N	Nowinki
26422	26288	\N	Orzeszyn
26423	26288	\N	Pęchery
26424	26288	\N	Pęchery-Łbiska
26425	26288	\N	Pilawa
26426	26288	\N	Robercin
26427	26288	\N	Runów
26428	26288	\N	Siedliska
26429	26288	\N	Szczaki
26430	26288	\N	Wola Gołkowska
26431	26288	\N	Wólka Kozodawska
26432	26288	\N	Wólka Pęcherska
26433	26288	\N	Wólka Pracka
26434	26288	\N	Zalesie Górne
26435	26288	\N	Złotokłos
26436	26288	\N	Żabieniec
26437	26289	\N	Biały Ług
26438	26289	\N	Błonie
26439	26289	\N	Bronisławów
26440	26289	\N	Chosna
26441	26289	\N	Dobrzenica
26442	26289	\N	Gabryelin
26443	26289	\N	Jaroszowa Wola
26444	26289	\N	Jeziórko
26445	26289	\N	Kamionka
26446	26289	\N	Kędzierówka
26447	26289	\N	Kolonia Gościeńczyce
26448	26289	\N	Koryta
26449	26289	\N	Krępa
26450	26289	\N	Krupia Wólka
26451	26289	\N	Ludwików
26452	26289	\N	Ławki
26453	26289	\N	Łoś
26454	26289	\N	Nowe Wągrodno
26455	26289	\N	Nowy Prażmów
26456	26289	\N	Piskórka
26457	26289	\N	Prażmów
26458	26289	\N	Ustanów
26459	26289	\N	Uwieliny
26460	26289	\N	Wągrodno
26461	26289	\N	Wilcza Wólka
26462	26289	\N	Wola Prażmowska
26463	26289	\N	Wola Wągrodzka
26464	26289	\N	Zadębie
26465	26289	\N	Zawodne
26466	26290	\N	Tarczyn
26467	26290	\N	Borowiec
26468	26290	\N	Bystrzanów
26469	26290	\N	Drozdy
26470	26290	\N	Gąski
26471	26290	\N	Gładków
26472	26290	\N	Grzędy
26473	26290	\N	Janówek
26474	26290	\N	Jeziorzany
26475	26290	\N	Jeżewice
26476	26290	\N	Józefowice
26477	26290	\N	Julianów
26478	26290	\N	Kawęczyn
26479	26290	\N	Komorniki
26480	26290	\N	Kopana
26481	26290	\N	Korzeniówka
26482	26290	\N	Kotorydz
26483	26290	\N	Księżak
26484	26290	\N	Księżowola
26485	26290	\N	Many
26486	26290	\N	Marianka
26487	26290	\N	Marylka
26488	26290	\N	Nosy
26489	26290	\N	Nowe Racibory
26490	26290	\N	Pawłowice
26491	26290	\N	Popielarze
26492	26290	\N	Prace Duże
26493	26290	\N	Prace Małe
26494	26290	\N	Przypki
26495	26290	\N	Racibory
26496	26290	\N	Rembertów
26497	26290	\N	Ruda
26498	26290	\N	Stefanówka
26499	26290	\N	Suchodół
26500	26290	\N	Suchostruga
26501	26290	\N	Świętochów
26502	26290	\N	Werdun
26503	26290	\N	Wola Przypkowska
26504	26290	\N	Wólka Jeżewska
26505	26290	\N	Wylezin
26506	189	\N	Bielsk
26507	189	\N	Bodzanów
26508	189	\N	Brudzeń Duży
26509	189	\N	Bulkowo
26510	189	\N	Drobin
26511	189	\N	Gąbin
26512	189	\N	Łąck
26513	189	\N	Mała Wieś
26514	189	\N	Nowy Duninów
26515	189	\N	Radzanowo
26516	189	\N	Słubice
26517	189	\N	Słupno
26518	189	\N	Stara Biała
26519	189	\N	Staroźreby
26520	189	\N	Wyszogród
26521	26506	\N	Bielsk
26522	26506	\N	Bolechowice
26523	26506	\N	Cekanowo
26524	26506	\N	Ciachcin
26525	26506	\N	Ciachcin Nowy
26526	26506	\N	Dębsk
26527	26506	\N	Drwały
26528	26506	\N	Dziedzice
26529	26506	\N	Gilino
26530	26506	\N	Giżyno
26531	26506	\N	Goślice
26532	26506	\N	Jaroszewo Biskupie
26533	26506	\N	Jaroszewo-Wieś
26534	26506	\N	Jączewo
26535	26506	\N	Józinek
26536	26506	\N	Kędzierzyn
26537	26506	\N	Kleniewo
26538	26506	\N	Kłobie
26539	26506	\N	Konary
26540	26506	\N	Kuchary-Jeżewo
26541	26506	\N	Leszczyn Księży
26542	26506	\N	Leszczyn Szlachecki
26543	26506	\N	Lubiejewo
26544	26506	\N	Machcinko
26545	26506	\N	Machcino
26546	26506	\N	Niszczyce
26547	26506	\N	Niszczyce-Pieńki
26548	26506	\N	Pęszyno
26549	26506	\N	Rudowo
26550	26506	\N	Sękowo
26551	26506	\N	Smolino
26552	26506	\N	Strusino
26553	26506	\N	Szewce
26554	26506	\N	Śmiłowo
26555	26506	\N	Tchórz
26556	26506	\N	Tłubice
26557	26506	\N	Ułtowo
26558	26506	\N	Umienino
26559	26506	\N	Umienino-Łubki
26560	26506	\N	Zagroba
26561	26506	\N	Zakrzewo
26562	26506	\N	Zągoty
26563	26506	\N	Żukowo
26564	26507	\N	Archutowo
26565	26507	\N	Archutówko
26566	26507	\N	Białobrzegi
26567	26507	\N	Bodzanów
26568	26507	\N	Borowice
26569	26507	\N	Budy Borowickie
26570	26507	\N	Chodkowo
26571	26507	\N	Chodkowo-Działki
26572	26507	\N	Cieśle
26573	26507	\N	Cybulin
26574	26507	\N	Garwacz
26575	26507	\N	Gąsewo
26576	26507	\N	Gromice
26577	26507	\N	Kanigowo
26578	26507	\N	Karwowo Duchowne
26579	26507	\N	Kępa Polska
26580	26507	\N	Kłaczkowo
26581	26507	\N	Krawieczyn
26582	26507	\N	Leksyn
26583	26507	\N	Łagiewniki
26584	26507	\N	Łętowo
26585	26507	\N	Małoszewo
26586	26507	\N	Małoszywka
26587	26507	\N	Mąkolin
26588	26507	\N	Mąkolin-Kolonia
26589	26507	\N	Miszewko
26590	26507	\N	Miszewo Murowane
26591	26507	\N	Niesłuchowo
26592	26507	\N	Nowe Kanigowo
26593	26507	\N	Nowe Miszewo
26594	26507	\N	Nowy Reczyn
26595	26507	\N	Osmolinek
26596	26507	\N	Parkoczewo
26597	26507	\N	Pepłowo
26598	26507	\N	Ramutówko
26599	26507	\N	Reczyn
26600	26507	\N	Stanowo
26601	26507	\N	Wiciejewo
26602	26508	\N	Bądkowo Jeziorne
26603	26508	\N	Bądkowo Kościelne
26604	26508	\N	Bądkowo-Podlasie
26605	26508	\N	Bądkowo-Rochny
26606	26508	\N	Bądkowo-Rumunki
26607	26508	\N	Biskupice
26608	26508	\N	Brudzeń Duży
26609	26508	\N	Brudzeń Mały
26610	26508	\N	Cegielnia
26611	26508	\N	Cierszewo
26612	26508	\N	Główina
26613	26508	\N	Gorzechowo
26614	26508	\N	Izabelin
26615	26508	\N	Janoszyce
26616	26508	\N	Karwosieki-Cholewice
26617	26508	\N	Karwosieki-Noskowice
26618	26508	\N	Kłobukowo-Patrze
26619	26508	\N	Krzyżanowo
26620	26508	\N	Lasotki
26621	26508	\N	Łukoszyno-Borki
26622	26508	\N	Murzynowo
26623	26508	\N	Myśliborzyce
26624	26508	\N	Nowe Karwosieki
26625	26508	\N	Parzeń
26626	26508	\N	Parzeń-Janówek
26627	26508	\N	Radotki
26628	26508	\N	Rembielin
26629	26508	\N	Robertowo
26630	26508	\N	Rokicie
26631	26508	\N	Siecień
26632	26508	\N	Siecień-Rumunki
26633	26508	\N	Sikórz
26634	26508	\N	Sobowo
26635	26508	\N	Strupczewo Duże
26636	26508	\N	Suchodół
26637	26508	\N	Turza Mała
26638	26508	\N	Turza Wielka
26639	26508	\N	Uniejewo
26640	26508	\N	Więcławice
26641	26508	\N	Wincentowo
26642	26508	\N	Winnica
26643	26508	\N	Zdziembórz
26644	26508	\N	Żerniki
26645	26509	\N	Blichowo
26646	26509	\N	Bulkowo
26647	26509	\N	Bulkowo-Kolonia
26648	26509	\N	Chlebowo
26649	26509	\N	Daniszewo
26650	26509	\N	Dobra
26651	26509	\N	Gniewkowo
26652	26509	\N	Gocłowo
26653	26509	\N	Golanki Górne
26654	26509	\N	Krubice Stare
26655	26509	\N	Krzykosy
26656	26509	\N	Nadułki
26657	26509	\N	Nadułki-Majdany
26658	26509	\N	Nowe Krubice
26659	26509	\N	Nowe Łubki
26660	26509	\N	Nowy Podleck
26661	26509	\N	Osiek
26662	26509	\N	Pilichowo
26663	26509	\N	Pilichówko
26664	26509	\N	Rogowo
26665	26509	\N	Słupca
26666	26509	\N	Sochocino-Badurki
26667	26509	\N	Sochocino-Czyżewo
26668	26509	\N	Sochocino-Praga
26669	26509	\N	Stare Łubki
26670	26509	\N	Stary Podleck
26671	26509	\N	Szasty
26672	26509	\N	Włóki
26673	26509	\N	Wołowa
26674	26509	\N	Worowice
26675	26510	\N	Drobin
26676	26510	\N	Biskupice
26677	26510	\N	Borowo
26678	26510	\N	Brelki
26679	26510	\N	Brzechowo
26680	26510	\N	Budkowo
26681	26510	\N	Chudzynek
26682	26510	\N	Chudzyno
26683	26510	\N	Cieszewko
26684	26510	\N	Cieszewo
26685	26510	\N	Cieśle
26686	26510	\N	Dobrosielice Drugie
26687	26510	\N	Dobrosielice Pierwsze
26688	26510	\N	Dziewanowo
26689	26510	\N	Karsy
26690	26510	\N	Kłaki
26691	26510	\N	Kowalewo
26692	26510	\N	Kozłowo
26693	26510	\N	Kozłówko
26694	26510	\N	Krajkowo
26695	26510	\N	Kuchary
26696	26510	\N	Łęg Kasztelański
26697	26510	\N	Łęg Kościelny
26698	26510	\N	Łęg Probostwo
26699	26510	\N	Maliszewko
26700	26510	\N	Małachowo
26701	26510	\N	Mlice-Kostery
26702	26510	\N	Mogielnica
26703	26510	\N	Mokrzk
26704	26510	\N	Nagórki Dobrskie
26705	26510	\N	Nagórki-Olszyny
26706	26510	\N	Niemczewo
26707	26510	\N	Nowa Wieś
26708	26510	\N	Psary
26709	26510	\N	Rogotwórsk
26710	26510	\N	Setropie
26711	26510	\N	Siemienie
26712	26510	\N	Stanisławowo
26713	26510	\N	Stare Sokolniki
26714	26510	\N	Świerczyn
26715	26510	\N	Świerczyn-Bęchy
26716	26510	\N	Świerczynek
26717	26510	\N	Tupadły
26718	26510	\N	Warszewka
26719	26510	\N	Wilkęsy
26720	26510	\N	Wrogocin
26721	26511	\N	Gąbin
26722	26511	\N	Borki
26723	26511	\N	Czermno
26724	26511	\N	Dobrzyków
26725	26511	\N	Górki
26726	26511	\N	Góry Małe
26727	26511	\N	Grabie Polskie
26728	26511	\N	Guzew
26729	26511	\N	Jadwigów
26730	26511	\N	Jordanów
26731	26511	\N	Kamień-Słubice
26732	26511	\N	Karolew
26733	26511	\N	Kępina
26734	26511	\N	Konstantynów
26735	26511	\N	Koszelew
26736	26511	\N	Lipińskie
26737	26511	\N	Ludwików
26738	26511	\N	Nowa Korzeniówka
26739	26511	\N	Nowe Grabie
26740	26511	\N	Nowe Wymyśle
26741	26511	\N	Nowy Kamień
26742	26511	\N	Nowy Troszyn
26743	26511	\N	Okolusz
26744	26511	\N	Piaski
26745	26511	\N	Plebanka
26746	26511	\N	Potrzebna
26747	26511	\N	Przemysłów
26748	26511	\N	Rumunki
26749	26511	\N	Stara Korzeniówka
26750	26511	\N	Stary Kamień
26751	26511	\N	Strzemeszno
26752	26511	\N	Topólno
26753	26511	\N	Troszyn Polski
26754	26512	\N	Antoninów
26755	26512	\N	Grabina
26756	26512	\N	Korzeń Królewski
26757	26512	\N	Korzeń Rządowy
26758	26512	\N	Koszelówka
26759	26512	\N	Kościuszków
26760	26512	\N	Ludwików
26761	26512	\N	Łąck
26762	26512	\N	Matyldów
26763	26512	\N	Nowe Rumunki
26764	26512	\N	Podlasie
26765	26512	\N	Sędeń Duży
26766	26512	\N	Sędeń Mały
26767	26512	\N	Wincentów
26768	26512	\N	Władysławów
26769	26512	\N	Wola Łącka
26770	26512	\N	Zaździerz
26771	26512	\N	Zdwórz
26772	26512	\N	Zofiówka
26773	26513	\N	Borzeń
26774	26513	\N	Brody Duże
26775	26513	\N	Brody Małe
26776	26513	\N	Chylin
26777	26513	\N	Dzierżanowo
26778	26513	\N	Dzierżanowo-Osada
26779	26513	\N	Główczyn
26780	26513	\N	Kiełtyki
26781	26513	\N	Lasocin
26782	26513	\N	Liwin
26783	26513	\N	Mała Wieś
26784	26513	\N	Murkowo
26785	26513	\N	Nakwasin
26786	26513	\N	Niździn
26787	26513	\N	Nowe Arciszewo
26788	26513	\N	Nowe Gałki
26789	26513	\N	Nowe Święcice
26790	26513	\N	Orszymowo
26791	26513	\N	Perki
26792	26513	\N	Podgórze
26793	26513	\N	Podgórze-Parcele
26794	26513	\N	Przykory
26795	26513	\N	Rąkcice
26796	26513	\N	Stare Arciszewo
26797	26513	\N	Stare Gałki
26798	26513	\N	Stare Święcice
26799	26513	\N	Ściborowo
26800	26513	\N	Węgrzynowo
26801	26513	\N	Wilkanowo
26802	26513	\N	Zakrzewo Kościelne
26803	26514	\N	Brwilno
26804	26514	\N	Brwilno Dolne
26805	26514	\N	Brzezinna Góra
26806	26514	\N	Duninów Duży
26807	26514	\N	Dzierzązna
26808	26514	\N	Grodziska
26809	26514	\N	Jeżewo
26810	26514	\N	Kamion
26811	26514	\N	Karolewo
26812	26514	\N	Lipianki
26813	26514	\N	Nowa Wieś
26814	26514	\N	Nowy Duninów
26815	26514	\N	Popłacin
26816	26514	\N	Soczewka
26817	26514	\N	Stary Duninów
26818	26514	\N	Środoń
26819	26514	\N	Trzcianno
26820	26514	\N	Wola Brwileńska
26821	26515	\N	Białkowo
26822	26515	\N	Brochocin
26823	26515	\N	Brochocinek
26824	26515	\N	Chełstowo
26825	26515	\N	Chomętowo
26826	26515	\N	Ciółkowo
26827	26515	\N	Ciółkówko
26828	26515	\N	Czerniewo
26829	26515	\N	Dźwierzno
26830	26515	\N	Juryszewo
26831	26515	\N	Kosino
26832	26515	\N	Kostrogaj
26833	26515	\N	Łoniewo
26834	26515	\N	Męczenino
26835	26515	\N	Nowe Boryszewo
26836	26515	\N	Radzanowo
26837	26515	\N	Radzanowo-Dębniki
26838	26515	\N	Radzanowo-Lasocin
26839	26515	\N	Rogozino
26840	26515	\N	Stare Boryszewo
26841	26515	\N	Stróżewko
26842	26515	\N	Szczytno
26843	26515	\N	Ślepkowo Królewskie
26844	26515	\N	Ślepkowo Szlacheckie
26845	26515	\N	Śniegocin
26846	26515	\N	Trębin
26847	26515	\N	Wodzymin
26848	26515	\N	Woźniki
26849	26515	\N	Woźniki-Paklewy
26850	26515	\N	Wólka
26851	26516	\N	Alfonsów
26852	26516	\N	Bończa
26853	26516	\N	Budy
26854	26516	\N	Grabowiec
26855	26516	\N	Grzybów
26856	26516	\N	Jamno
26857	26516	\N	Juliszew
26858	26516	\N	Leonów
26859	26516	\N	Łaziska
26860	26516	\N	Nowosiadło
26861	26516	\N	Nowy Wiączemin
26862	26516	\N	Nowy Życk
26863	26516	\N	Piotrkówek
26864	26516	\N	Potok Biały
26865	26516	\N	Rybaki
26866	26516	\N	Sady
26867	26516	\N	Słubice
26868	26516	\N	Studzieniec
26869	26516	\N	Świniary
26870	26516	\N	Wiączemin Polski
26871	26516	\N	Wymyśle Polskie
26872	26516	\N	Życk Polski
26873	26517	\N	Barcikowo
26874	26517	\N	Bielino
26875	26517	\N	Borowiczki-Pieńki
26876	26517	\N	Cekanowo
26877	26517	\N	Gulczewo
26878	26517	\N	Liszyno
26879	26517	\N	Mijakowo
26880	26517	\N	Mirosław
26881	26517	\N	Miszewko-Stefany
26882	26517	\N	Miszewko Strzałkowskie
26883	26517	\N	Nowe Gulczewo
26884	26517	\N	Ramutowo
26885	26517	\N	Rydzyno
26886	26517	\N	Sambórz
26887	26517	\N	Słupno
26888	26517	\N	Stare Gulczewo
26889	26517	\N	Szeligi
26890	26517	\N	Święcieniec
26891	26517	\N	Wykowo
26892	26518	\N	Biała
26893	26518	\N	Bronowo Kmiece
26894	26518	\N	Bronowo-Zalesie
26895	26518	\N	Brwilno
26896	26518	\N	Dziarnowo
26897	26518	\N	Kamionki
26898	26518	\N	Kobierniki
26899	26518	\N	Kowalewko
26900	26518	\N	Kruszczewo
26901	26518	\N	Ludwikowo
26902	26518	\N	Mańkowo
26903	26518	\N	Maszewo
26904	26518	\N	Maszewo Duże
26905	26518	\N	Miłodróż
26906	26518	\N	Nowa Biała
26907	26518	\N	Nowe Bronowo
26908	26518	\N	Nowe Draganie
26909	26518	\N	Nowe Proboszczewice
26910	26518	\N	Nowe Trzepowo
26911	26518	\N	Ogorzelice
26912	26518	\N	Srebrna
26913	26518	\N	Stara Biała
26914	26518	\N	Stare Draganie
26915	26518	\N	Stare Proboszczewice
26916	26518	\N	Trzebuń
26917	26518	\N	Ulaszewo
26918	26518	\N	Włoczewo
26919	26518	\N	Wyszyna
26920	26519	\N	Aleksandrowo
26921	26519	\N	Begno
26922	26519	\N	Bromierz
26923	26519	\N	Bromierzyk
26924	26519	\N	Brudzyno
26925	26519	\N	Bylino
26926	26519	\N	Dąbrusk
26927	26519	\N	Dłużniewo Duże
26928	26519	\N	Dłużniewo Małe
26929	26519	\N	Goszczyno
26930	26519	\N	Góra
26931	26519	\N	Karwowo-Podgórne
26932	26519	\N	Krzywanice
26933	26519	\N	Krzywanice-Trojany
26934	26519	\N	Marychnów
26935	26519	\N	Mieczyno
26936	26519	\N	Mikołajewo
26937	26519	\N	Mrówczewo
26938	26519	\N	Nowa Góra
26939	26519	\N	Nowa Wieś
26940	26519	\N	Nowe Staroźreby
26941	26519	\N	Nowe Żochowo
26942	26519	\N	Nowy Bromierz
26943	26519	\N	Nowy Bromierzyk
26944	26519	\N	Opatówiec
26945	26519	\N	Ostrzykowo
26946	26519	\N	Ostrzykówek
26947	26519	\N	Piączyn
26948	26519	\N	Płonna
26949	26519	\N	Przeciszewo
26950	26519	\N	Przeciszewo-Kolonia
26951	26519	\N	Przedbórz
26952	26519	\N	Przedpełce
26953	26519	\N	Rogowo
26954	26519	\N	Rostkowo
26955	26519	\N	Rostkowo-Orszymowice
26956	26519	\N	Sarzyn
26957	26519	\N	Sędek
26958	26519	\N	Słomkowo
26959	26519	\N	Smardzewo
26960	26519	\N	Staroźreby
26961	26519	\N	Staroźreby-Hektary
26962	26519	\N	Stoplin
26963	26519	\N	Strzeszewo
26964	26519	\N	Szulbory
26965	26519	\N	Teodorowo
26966	26519	\N	Worowice-Wyroby
26967	26519	\N	Zdziar-Las
26968	26519	\N	Zdziar Mały
26969	26519	\N	Zdziar Wielki
26970	26519	\N	Żochowo Stare
26971	26520	\N	Wyszogród
26972	26520	\N	Bolino
26973	26520	\N	Chmielewo
26974	26520	\N	Ciućkowo
26975	26520	\N	Drwały
26976	26520	\N	Grodkowo
26977	26520	\N	Kobylniki
26978	26520	\N	Marcjanka
26979	26520	\N	Pozarzyn
26980	26520	\N	Pruszczyn
26981	26520	\N	Rakowo
26982	26520	\N	Rębowo
26983	26520	\N	Rostkowice
26984	26520	\N	Słomin
26985	26520	\N	Starzyno
26986	26520	\N	Wiązówka
26987	26520	\N	Wilczkowo
26988	172	\N	Płońsk
26989	172	\N	Raciąż
26990	172	\N	Baboszewo
26991	172	\N	Czerwińsk nad Wisłą
26992	172	\N	Dzierzążnia
26993	172	\N	Joniec
26994	172	\N	Naruszewo
26995	172	\N	Nowe Miasto
26996	172	\N	Sochocin
26997	172	\N	Załuski
26998	26988	\N	Płońsk
26999	26989	\N	Raciąż
27000	26990	\N	Baboszewo
27001	26990	\N	Bożewo
27002	26990	\N	Brzeście
27003	26990	\N	Brzeście Małe
27004	26990	\N	Brzeście Nowe
27005	26990	\N	Budy Radzymińskie
27006	26990	\N	Cieszkowo-Kolonia
27007	26990	\N	Cieszkowo Nowe
27008	26990	\N	Cieszkowo Stare
27009	26990	\N	Cywiny-Dynguny
27010	26990	\N	Cywiny Wojskie
27011	26990	\N	Dłużniewo
27012	26990	\N	Dramin
27013	26990	\N	Dziektarzewo
27014	26990	\N	Dziektarzewo-Wylaty
27015	26990	\N	Galomin
27016	26990	\N	Galominek
27017	26990	\N	Galominek Nowy
27018	26990	\N	Goszczyce Poświętne
27019	26990	\N	Goszczyce Średnie
27020	26990	\N	Jarocin
27021	26990	\N	Jesionka
27022	26990	\N	Kiełki
27023	26990	\N	Korzybie
27024	26990	\N	Kowale
27025	26990	\N	Krościn
27026	26990	\N	Kruszewie
27027	26990	\N	Lachówiec
27028	26990	\N	Lutomierzyn
27029	26990	\N	Mystkowo
27030	26990	\N	Niedarzyn
27031	26990	\N	Pawłowo
27032	26990	\N	Pieńki Rzewińskie
27033	26990	\N	Polesie
27034	26990	\N	Rybitwy
27035	26990	\N	Rzewin
27036	26990	\N	Sarbiewo
27037	26990	\N	Sokolniki Nowe
27038	26990	\N	Sokolniki Stare
27039	26990	\N	Śródborze
27040	26990	\N	Wola Dłużniewska
27041	26990	\N	Wola-Folwark
27042	26990	\N	Zbyszyno
27043	26991	\N	Chociszewo
27044	26991	\N	Czerwińsk nad Wisłą
27045	26991	\N	Garwolewo
27046	26991	\N	Gawarzec Dolny
27047	26991	\N	Gawarzec Górny
27048	26991	\N	Goławin
27049	26991	\N	Goworowo
27050	26991	\N	Grodziec
27051	26991	\N	Janikowo
27052	26991	\N	Karnkowo
27053	26991	\N	Komsin
27054	26991	\N	Kuchary-Skotniki
27055	26991	\N	Łbowo
27056	26991	\N	Miączyn
27057	26991	\N	Miączynek
27058	26991	\N	Nieborzyn
27059	26991	\N	Nowe Przybojewo
27060	26991	\N	Nowe Radzikowo
27061	26991	\N	Nowy Boguszyn
27062	26991	\N	Osiek
27063	26991	\N	Parlin
27064	26991	\N	Radzikowo Scalone
27065	26991	\N	Raszewo Dworskie
27066	26991	\N	Raszewo Włościańskie
27067	26991	\N	Roguszyn
27068	26991	\N	Sielec
27069	26991	\N	Stare Przybojewo
27070	26991	\N	Stare Radzikowo
27071	26991	\N	Stary Boguszyn
27072	26991	\N	Stobiecin
27073	26991	\N	Wilkowuje
27074	26991	\N	Wilkówiec
27075	26991	\N	Wola
27076	26991	\N	Wólka Przybójewska
27077	26991	\N	Wychódźc
27078	26991	\N	Zarębin
27079	26991	\N	Zdziarka
27080	26992	\N	Błomino-Gule
27081	26992	\N	Błomino Gumowskie
27082	26992	\N	Błomino-Jeże
27083	26992	\N	Chrościn
27084	26992	\N	Cumino
27085	26992	\N	Dzierzążnia
27086	26992	\N	Gumowo
27087	26992	\N	Kadłubowo
27088	26992	\N	Korytowo
27089	26992	\N	Kucice
27090	26992	\N	Niwa
27091	26992	\N	Nowa Dzierzążnia
27092	26992	\N	Nowe Gumino
27093	26992	\N	Nowe Kucice
27094	26992	\N	Nowe Sarnowo
27095	26992	\N	Pluskocin
27096	26992	\N	Podmarszczyn
27097	26992	\N	Pomianowo
27098	26992	\N	Pomianowo-Dzierki
27099	26992	\N	Przemkowo
27100	26992	\N	Rakowo
27101	26992	\N	Sadkowo
27102	26992	\N	Sarnowo-Góry
27103	26992	\N	Siekluki
27104	26992	\N	Skołatowo
27105	26992	\N	Starczewo-Pobodze
27106	26992	\N	Starczewo Wielkie
27107	26992	\N	Stare Gumino
27108	26992	\N	Wierzbica Pańska
27109	26992	\N	Wierzbica Szlachecka
27110	26992	\N	Wilamowice
27111	26993	\N	Adamowo
27112	26993	\N	Joniec
27113	26993	\N	Joniec-Kolonia
27114	26993	\N	Józefowo
27115	26993	\N	Krajęczyn
27116	26993	\N	Królewo
27117	26993	\N	Ludwikowo
27118	26993	\N	Nowa Wrona
27119	26993	\N	Omięciny
27120	26993	\N	Osiek
27121	26993	\N	Popielżyn Górny
27122	26993	\N	Popielżyn-Zawady
27123	26993	\N	Proboszczewice
27124	26993	\N	Sobieski
27125	26993	\N	Soboklęszcz
27126	26993	\N	Stara Wrona
27127	26993	\N	Szumlin
27128	26994	\N	Beszyno
27129	26994	\N	Dłutowo
27130	26994	\N	Drochowo
27131	26994	\N	Drochówka
27132	26994	\N	Grąbczewo
27133	26994	\N	Januszewo
27134	26994	\N	Kębłowice
27135	26994	\N	Kozarzewo
27136	26994	\N	Krysk
27137	26994	\N	Łazęki
27138	26994	\N	Michałowo
27139	26994	\N	Nacpolsk
27140	26994	\N	Naruszewo
27141	26994	\N	Nowe Naruszewo
27142	26994	\N	Nowy Krysk
27143	26994	\N	Nowy Nacpolsk
27144	26994	\N	Pieścidła
27145	26994	\N	Postróże
27146	26994	\N	Potyry
27147	26994	\N	Radzymin
27148	26994	\N	Radzyminek
27149	26994	\N	Rąbież
27150	26994	\N	Skarboszewo
27151	26994	\N	Skarszyn
27152	26994	\N	Skwary
27153	26994	\N	Sobanice
27154	26994	\N	Sosenkowo
27155	26994	\N	Sosenkowo-Osiedle
27156	26994	\N	Srebrna
27157	26994	\N	Stachowo
27158	26994	\N	Stary Nacpolsk
27159	26994	\N	Strzembowo
27160	26994	\N	Troski
27161	26994	\N	Wichorowo
27162	26994	\N	Wola-Krysk
27163	26994	\N	Wronino
27164	26994	\N	Wróblewo
27165	26994	\N	Wróblewo-Osiedle
27166	26994	\N	Zaborowo
27167	26994	\N	Żukowo
27168	26994	\N	Żukowo Poświętne
27169	26994	\N	Żukówek
27170	26995	\N	Adamowo
27171	26995	\N	Aleksandria
27172	26995	\N	Anielin
27173	26995	\N	Belin
27174	26995	\N	Czarnoty
27175	26995	\N	Gawłowo
27176	26995	\N	Gawłówek
27177	26995	\N	Gościmin Wielki
27178	26995	\N	Grabie
27179	26995	\N	Gucin
27180	26995	\N	Henrykowo
27181	26995	\N	Janopole
27182	26995	\N	Jurzyn
27183	26995	\N	Jurzynek
27184	26995	\N	Kadłubówka
27185	26995	\N	Karolinowo
27186	26995	\N	Kubice
27187	26995	\N	Latonice
27188	26995	\N	Miszewo B
27189	26995	\N	Miszewo Wielkie
27190	26995	\N	Modzele-Bartłomieje
27191	26995	\N	Nowe Miasto
27192	26995	\N	Nowe Miasto-Folwark
27193	26995	\N	Nowosiółki
27194	26995	\N	Popielżyn Dolny
27195	26995	\N	Przepitki
27196	26995	\N	Rostki
27197	26995	\N	Salomonka
27198	26995	\N	Szczawin
27199	26995	\N	Tomaszewo
27200	26995	\N	Władysławowo
27201	26995	\N	Wólka Szczawińska
27202	26995	\N	Zakobiel
27203	26995	\N	Zasonie
27204	26995	\N	Zawady B
27205	26995	\N	Zawady Stare
27206	26995	\N	Żołędowo
27207	26988	\N	Arcelin
27208	26988	\N	Bogusławice
27209	26988	\N	Bońki
27210	26988	\N	Brody
27211	26988	\N	Cempkowo
27212	26988	\N	Cholewy
27213	26988	\N	Cieciórki
27214	26988	\N	Ćwiklin
27215	26988	\N	Ćwiklinek
27216	26988	\N	Dalanówko
27217	26988	\N	Ilinko
27218	26988	\N	Ilino
27219	26988	\N	Jeżewo
27220	26988	\N	Kluczewo
27221	26988	\N	Kownaty
27222	26988	\N	Koziminy-Stachowo
27223	26988	\N	Krępica
27224	26988	\N	Lisewo
27225	26988	\N	Michalinek
27226	26988	\N	Michowo
27227	26988	\N	Młyńsk
27228	26988	\N	Nowe Koziminy
27229	26988	\N	Pilitowo
27230	26988	\N	Poczernin
27231	26988	\N	Poświętne
27232	26988	\N	Pruszyn
27233	26988	\N	Raźniewo
27234	26988	\N	Siedlin
27235	26988	\N	Skarżyn
27236	26988	\N	Skrzynki
27237	26988	\N	Słoszewo
27238	26988	\N	Słoszewo-Kolonia
27239	26988	\N	Stare Koziminy
27240	26988	\N	Strachowo
27241	26988	\N	Strachówko
27242	26988	\N	Strubiny
27243	26988	\N	Szeromin
27244	26988	\N	Szerominek
27245	26988	\N	Szpondowo
27246	26988	\N	Szymaki
27247	26988	\N	Woźniki
27248	26988	\N	Wroninko
27249	26989	\N	Bielany
27250	26989	\N	Bogucin
27251	26989	\N	Budy Kraszewskie
27252	26989	\N	Charzyny
27253	26989	\N	Chyczewo
27254	26989	\N	Cieciersk
27255	26989	\N	Ćwiersk
27256	26989	\N	Dobrska-Kolonia
27257	26989	\N	Dobrska-Włościany
27258	26989	\N	Draminek
27259	26989	\N	Drozdowo
27260	26989	\N	Druchowo
27261	26989	\N	Folwark-Raciąż
27262	26989	\N	Grzybowo
27263	26989	\N	Jeżewo-Wesel
27264	26989	\N	Kaczorowy
27265	26989	\N	Kiełbowo
27266	26989	\N	Kiniki
27267	26989	\N	Kocięcin-Brodowy
27268	26989	\N	Kocięcin-Tworki
27269	26989	\N	Kodłutowo
27270	26989	\N	Kossobudy
27271	26989	\N	Koziebrody
27272	26989	\N	Kozolin
27273	26989	\N	Krajkowo
27274	26989	\N	Krajkowo-Budki
27275	26989	\N	Kraszewo-Czubaki
27276	26989	\N	Kraszewo-Falki
27277	26989	\N	Kraszewo-Gaczułty
27278	26989	\N	Kraszewo-Podborne
27279	26989	\N	Kraszewo-Rory
27280	26989	\N	Kraszewo-Sławęcin
27281	26989	\N	Kraśniewo
27282	26989	\N	Kruszenica
27283	26989	\N	Lipa
27284	26989	\N	Łempinek
27285	26989	\N	Łempino
27286	26989	\N	Malewo
27287	26989	\N	Mała Wieś
27288	26989	\N	Młody Niedróż
27289	26989	\N	Nowe Gralewo
27290	26989	\N	Nowe Młodochowo
27291	26989	\N	Nowy Komunin
27292	26989	\N	Pęsy
27293	26989	\N	Pólka-Raciąż
27294	26989	\N	Sierakowo
27295	26989	\N	Sikory
27296	26989	\N	Stare Gralewo
27297	26989	\N	Stary Komunin
27298	26989	\N	Stary Niedróż
27299	26989	\N	Strożęcin
27300	26989	\N	Szapsk
27301	26989	\N	Szczepkowo
27302	26989	\N	Unieck
27303	26989	\N	Wępiły
27304	26989	\N	Witkowo
27305	26989	\N	Zdunówek
27306	26989	\N	Złotopole
27307	26989	\N	Żukowo-Strusie
27308	26989	\N	Żukowo-Wawrzonki
27309	26989	\N	Żychowo
27310	26996	\N	Baraki
27311	26996	\N	Biele
27312	26996	\N	Bolęcin
27313	26996	\N	Budy Gutarzewskie
27314	26996	\N	Ciemniewo
27315	26996	\N	Drożdżyn
27316	26996	\N	Gromadzyn
27317	26996	\N	Gutarzewo
27318	26996	\N	Idzikowice
27319	26996	\N	Jędrzejewo
27320	26996	\N	Kępa
27321	26996	\N	Koliszewo
27322	26996	\N	Kolonia Sochocin
27323	26996	\N	Kołoząb
27324	26996	\N	Kondrajec
27325	26996	\N	Kuchary Królewskie
27326	26996	\N	Kuchary Żydowskie
27327	26996	\N	Milewo
27328	26996	\N	Niewikla
27329	26996	\N	Podsmardzewo
27330	26996	\N	Pruszkowo
27331	26996	\N	Rzy
27332	26996	\N	Smardzewo
27333	26996	\N	Sochocin
27334	26996	\N	Ślepowrony
27335	26996	\N	Wierzbówiec
27336	26996	\N	Wycinki
27337	26996	\N	Żelechy
27338	26997	\N	Falbogi Wielkie
27339	26997	\N	Gostolin
27340	26997	\N	Kamienica
27341	26997	\N	Kamienica-Kozaki
27342	26997	\N	Kamienica-Wygoda
27343	26997	\N	Karolinowo
27344	26997	\N	Koryciska
27345	26997	\N	Kroczewo
27346	26997	\N	Michałówek
27347	26997	\N	Naborowo
27348	26997	\N	Naborowo-Parcele
27349	26997	\N	Naborówiec
27350	26997	\N	Niepiekła
27351	26997	\N	Nowe Olszyny
27352	26997	\N	Nowe Wrońska
27353	26997	\N	Przyborowice Dolne
27354	26997	\N	Przyborowice Górne
27355	26997	\N	Sadówiec
27356	26997	\N	Słotwin
27357	26997	\N	Smulska
27358	26997	\N	Sobole
27359	26997	\N	Stare Olszyny
27360	26997	\N	Stare Wrońska
27361	26997	\N	Stróżewo
27362	26997	\N	Szczytniki
27363	26997	\N	Szczytno
27364	26997	\N	Wilamy
27365	26997	\N	Wojny
27366	26997	\N	Załuski
27367	26997	\N	Zdunowo
27368	26997	\N	Złotopolice
27369	168	\N	Piastów
27370	168	\N	Pruszków
27371	168	\N	Brwinów
27372	168	\N	Michałowice
27373	168	\N	Nadarzyn
27374	168	\N	Raszyn
27375	27369	\N	Piastów
27376	27370	\N	Pruszków
27377	27371	\N	Brwinów
27378	27371	\N	Biskupice
27379	27371	\N	Czubin
27380	27371	\N	Domaniew
27381	27371	\N	Domaniewek
27382	27371	\N	Falęcin
27383	27371	\N	Grudów
27384	27371	\N	Kanie
27385	27371	\N	Koszajec
27386	27371	\N	Kotowice
27387	27371	\N	Krosna-Parcela
27388	27371	\N	Krosna-Wieś
27389	27371	\N	Milęcin
27390	27371	\N	Moszna-Parcela
27391	27371	\N	Moszna-Wieś
27392	27371	\N	Otrębusy
27393	27371	\N	Owczarnia
27394	27371	\N	Parzniew
27395	27371	\N	Terenia
27396	27371	\N	Żółwin
27397	27372	\N	Granica
27398	27372	\N	Komorów
27399	27372	\N	Michałowice-Osiedle
27400	27372	\N	Michałowice-Wieś
27401	27372	\N	Nowa Wieś
27402	27372	\N	Opacz-Kolonia
27403	27372	\N	Opacz Mała
27404	27372	\N	Pęcice
27405	27372	\N	Reguły
27406	27372	\N	Sokołów
27407	27372	\N	Suchy Las
27408	27372	\N	Michałowice
27409	27373	\N	Kajetany
27410	27373	\N	Krakowiany
27411	27373	\N	Młochów
27412	27373	\N	Nadarzyn
27413	27373	\N	Parole
27414	27373	\N	Rozalin
27415	27373	\N	Rusiec
27416	27373	\N	Stara Wieś
27417	27373	\N	Strzeniówka
27418	27373	\N	Szamoty
27419	27373	\N	Urzut
27420	27373	\N	Walendów
27421	27373	\N	Wola Krakowiańska
27422	27373	\N	Wolica
27423	27374	\N	Dawidy
27424	27374	\N	Dawidy Bankowe
27425	27374	\N	Falenty
27426	27374	\N	Falenty Duże
27427	27374	\N	Falenty Nowe
27428	27374	\N	Janki
27429	27374	\N	Jaworowa
27430	27374	\N	Laszczki
27431	27374	\N	Łady
27432	27374	\N	Nowe Grocholice
27433	27374	\N	Podolszyn Nowy
27434	27374	\N	Puchały
27435	27374	\N	Raszyn
27436	27374	\N	Rybie
27437	27374	\N	Sękocin
27438	27374	\N	Sękocin-Las
27439	27374	\N	Sękocin Nowy
27440	27374	\N	Sękocin Stary
27441	27374	\N	Słomin
27442	27374	\N	Wypędy
27443	169	\N	Przasnysz
27444	169	\N	Chorzele
27445	169	\N	Czernice Borowe
27446	169	\N	Jednorożec
27447	169	\N	Krasne
27448	169	\N	Krzynowłoga Mała
27449	27443	\N	Przasnysz
27450	27444	\N	Chorzele
27451	27444	\N	Aleksandrowo
27452	27444	\N	Bagienice
27453	27444	\N	Binduga
27454	27444	\N	Bogdany Wielkie
27455	27444	\N	Brzeski-Kołaki
27456	27444	\N	Budki
27457	27444	\N	Bugzy Płoskie
27458	27444	\N	Czaplice Wielkie
27459	27444	\N	Czarzaste Małe
27460	27444	\N	Dąbrowa
27461	27444	\N	Dąbrówka
27462	27444	\N	Dąbrówka Ostrowska
27463	27444	\N	Duczymin
27464	27444	\N	Dzierzęga-Nadbory
27465	27444	\N	Gadomiec-Chrzczany
27466	27444	\N	Gadomiec-Miłocięta
27467	27444	\N	Gadomiec-Peronie
27468	27444	\N	Jarzynny Kierz
27469	27444	\N	Jedlinka
27470	27444	\N	Krukowo
27471	27444	\N	Krzynowłoga Wielka
27472	27444	\N	Kwiatkowo
27473	27444	\N	Kwiatkowo k. Duczymina
27474	27444	\N	Lipowiec
27475	27444	\N	Liwki
27476	27444	\N	Łaz
27477	27444	\N	Mącice
27478	27444	\N	Niskie Wielkie
27479	27444	\N	Nowa Wieś k. Duczymina
27480	27444	\N	Nowa Wieś Zarębska
27481	27444	\N	Opaleniec
27482	27444	\N	Poścień-Wieś
27483	27444	\N	Poścień-Zamion
27484	27444	\N	Pruskołęka
27485	27444	\N	Przysowy
27486	27444	\N	Rapaty-Sulimy
27487	27444	\N	Raszujka
27488	27444	\N	Rawki
27489	27444	\N	Rembielin
27490	27444	\N	Rycice
27491	27444	\N	Ryki
27492	27444	\N	Rzodkiewnica
27493	27444	\N	Skuze
27494	27444	\N	Stara Wieś
27495	27444	\N	Ścięciel
27496	27444	\N	Wasiły-Zygny
27497	27444	\N	Wierzchowizna
27498	27444	\N	Wólka Zdziwójska
27499	27444	\N	Zaręby
27500	27444	\N	Zdziwój Nowy
27501	27444	\N	Zdziwój Stary
27502	27445	\N	Borkowo-Boksy
27503	27445	\N	Borkowo-Falenta
27504	27445	\N	Chojnowo
27505	27445	\N	Chrostowo Wielkie
27506	27445	\N	Czernice Borowe
27507	27445	\N	Dzielin
27508	27445	\N	Grójec
27509	27445	\N	Jastrzębiec
27510	27445	\N	Kadzielnia
27511	27445	\N	Kosmowo
27512	27445	\N	Kuskowo
27513	27445	\N	Miłoszewiec
27514	27445	\N	Nowe Czernice
27515	27445	\N	Obrębiec
27516	27445	\N	Olszewiec
27517	27445	\N	Pawłowo Kościelne
27518	27445	\N	Pawłówko
27519	27445	\N	Piechy
27520	27445	\N	Pierzchały
27521	27445	\N	Rostkowo
27522	27445	\N	Skierki
27523	27445	\N	Smoleń-Poluby
27524	27445	\N	Szczepanki
27525	27445	\N	Toki
27526	27445	\N	Turowo
27527	27445	\N	Węgra
27528	27445	\N	Wyderka
27529	27445	\N	Załogi-Jędrzejki
27530	27445	\N	Zberoż
27531	27445	\N	Zembrzus Wielki
27532	27445	\N	Żebry-Kordy
27533	27446	\N	Budy Rządowe
27534	27446	\N	Budziska
27535	27446	\N	Drążdżewo Nowe
27536	27446	\N	Dynak
27537	27446	\N	Grądy
27538	27446	\N	Jednorożec
27539	27446	\N	Kamienica
27540	27446	\N	Kobylaki-Czarzaste
27541	27446	\N	Kobylaki-Konopki
27542	27446	\N	Kobylaki-Korysze
27543	27446	\N	Kobylaki-Wólka
27544	27446	\N	Kocenki
27545	27446	\N	Kurczy Lasek
27546	27446	\N	Lipa
27547	27446	\N	Małowidz
27548	27446	\N	Murowanka
27549	27446	\N	Nakieł
27550	27446	\N	Nisztalki
27551	27446	\N	Nowa Wieś
27552	27446	\N	Nowiny
27553	27446	\N	Obórki
27554	27446	\N	Olszewka
27555	27446	\N	Parciaki
27556	27446	\N	Parciaki-Stacja
27557	27446	\N	Połoń
27558	27446	\N	Pólka
27559	27446	\N	Przejmy
27560	27446	\N	Stara Wieś
27561	27446	\N	Stegna
27562	27446	\N	Szkopnik
27563	27446	\N	Ulatowo-Dąbrówka
27564	27446	\N	Ulatowo-Pogorzel
27565	27446	\N	Ulatowo-Słabogóra
27566	27446	\N	Uścianek
27567	27446	\N	Zadziory
27568	27446	\N	Zapola
27569	27446	\N	Żelazna Prywatna
27570	27446	\N	Żelazna Rządowa
27571	27446	\N	Żelazna Rządowa-Gutocha
27572	27447	\N	Augustów
27573	27447	\N	Bartołdy
27574	27447	\N	Brzozowo Małe
27575	27447	\N	Brzozowo Wielkie
27576	27447	\N	Filipy
27577	27447	\N	Grabowo Wielkie
27578	27447	\N	Gustawin
27579	27447	\N	Helenów
27580	27447	\N	Kozin
27581	27447	\N	Kraski-Ślesice
27582	27447	\N	Krasne
27583	27447	\N	Krasne-Elżbiecin
27584	27447	\N	Kurowo
27585	27447	\N	Milewo-Brzegędy
27586	27447	\N	Milewo-Rączki
27587	27447	\N	Milewo-Szwejki
27588	27447	\N	Milewo-Tabuły
27589	27447	\N	Mosaki-Rukle
27590	27447	\N	Mosaki-Stara Wieś
27591	27447	\N	Nowe Żmijewo
27592	27447	\N	Nowokrasne
27593	27447	\N	Pęczki-Kozłowo
27594	27447	\N	Stary Janin
27595	27447	\N	Szlasy-Umiemy
27596	27447	\N	Wężewo
27597	27447	\N	Zalesie
27598	27447	\N	Zielona
27599	27447	\N	Żbiki
27600	27447	\N	Żbiki-Gawronki
27601	27447	\N	Żbiki-Kierzki
27602	27448	\N	Borowe-Chrzczany
27603	27448	\N	Bystre-Chrzany
27604	27448	\N	Chmieleń Wielki
27605	27448	\N	Chmielonek
27606	27448	\N	Cichowo
27607	27448	\N	Czaplice-Bąki
27608	27448	\N	Czaplice-Kurki
27609	27448	\N	Gadomiec-Jebieńki
27610	27448	\N	Gadomiec-Jędryki
27611	27448	\N	Gadomiec-Wyroki
27612	27448	\N	Gąski-Wąsosze
27613	27448	\N	Grabowo-Grądy
27614	27448	\N	Grabowo-Skorupki
27615	27448	\N	Grabowo-Zawady
27616	27448	\N	Kaki-Mroczki
27617	27448	\N	Kawieczyno-Saksary
27618	27448	\N	Kosiły
27619	27448	\N	Krajewo-Kłódki
27620	27448	\N	Krajewo Wielkie
27621	27448	\N	Krajewo-Wierciochy
27622	27448	\N	Krzynowłoga Mała
27623	27448	\N	Łanięta
27624	27448	\N	Łoje
27625	27448	\N	Marianowo
27626	27448	\N	Masiak
27627	27448	\N	Morawy Wielkie
27628	27448	\N	Ostrowe-Stańczyki
27629	27448	\N	Ożumiech
27630	27448	\N	Piastów
27631	27448	\N	Plewnik
27632	27448	\N	Romany-Fuszki
27633	27448	\N	Romany-Janowięta
27634	27448	\N	Romany-Sebory
27635	27448	\N	Romany-Sędzięta
27636	27448	\N	Rudno Jeziorowe
27637	27448	\N	Rudno Kmiece
27638	27448	\N	Skierkowizna
27639	27448	\N	Świniary
27640	27448	\N	Ulatowo-Adamy
27641	27448	\N	Ulatowo-Borzuchy
27642	27448	\N	Ulatowo-Czerniaki
27643	27448	\N	Ulatowo-Gać
27644	27448	\N	Ulatowo Janowięta
27645	27448	\N	Ulatowo-Zalesie
27646	27448	\N	Ulatowo-Żyły
27647	27448	\N	Wiktorowo
27648	27448	\N	Wiśniówek
27649	27448	\N	Zbrochy
27650	27443	\N	Annopol
27651	27443	\N	Bartniki
27652	27443	\N	Bogate
27653	27443	\N	Cierpigórz
27654	27443	\N	Dębiny
27655	27443	\N	Dobrzankowo
27656	27443	\N	Emowo
27657	27443	\N	Fijałkowo
27658	27443	\N	Frankowo
27659	27443	\N	Golany
27660	27443	\N	Gostkowo
27661	27443	\N	Góry Karwackie
27662	27443	\N	Grabowo
27663	27443	\N	Helenowo Nowe
27664	27443	\N	Helenowo Stare
27665	27443	\N	Józefowo
27666	27443	\N	Karbówko
27667	27443	\N	Karwacz
27668	27443	\N	Kijewice
27669	27443	\N	Klewki
27670	27443	\N	Kuskowo
27671	27443	\N	Leszno
27672	27443	\N	Lisiogóra
27673	27443	\N	Mchowo
27674	27443	\N	Mchówko
27675	27443	\N	Mirów
27676	27443	\N	Obrąb
27677	27443	\N	Oględa
27678	27443	\N	Osówiec Kmiecy
27679	27443	\N	Osówiec Szlachecki
27680	27443	\N	Polny Młyn
27681	27443	\N	Sątrzaska
27682	27443	\N	Sierakowo
27683	27443	\N	Stara Krępa
27684	27443	\N	Szla
27685	27443	\N	Trzcianka
27686	27443	\N	Wandolin
27687	27443	\N	Wielodróż
27688	27443	\N	Wygoda
27689	27443	\N	Wyrąb Karwacki
27690	27443	\N	Zakocie
27691	27443	\N	Zawadki
27692	170	\N	Borkowice
27693	170	\N	Gielniów
27694	170	\N	Klwów
27695	170	\N	Odrzywół
27696	170	\N	Potworów
27697	170	\N	Przysucha
27698	170	\N	Rusinów
27699	170	\N	Wieniawa
27700	27692	\N	Bolęcin
27701	27692	\N	Borkowice
27702	27692	\N	Bryzgów
27703	27692	\N	Gródek
27704	27692	\N	Kochanów
27705	27692	\N	Krasna Góra
27706	27692	\N	Ninków
27707	27692	\N	Niska Jabłonica
27708	27692	\N	Pałąki
27709	27692	\N	Pod Dąbrową
27710	27692	\N	Politów
27711	27692	\N	Radestów
27712	27692	\N	Rudno
27713	27692	\N	Rusinów
27714	27692	\N	Ruszkowice
27715	27692	\N	Rzuców
27716	27692	\N	Smagów
27717	27692	\N	Wola Kuraszowa
27718	27692	\N	Wymysłów
27719	27692	\N	Za Gajem
27720	27692	\N	Za Olszowcem
27721	27692	\N	Zdonków
27722	27693	\N	Antoniów
27723	27693	\N	Bieliny
27724	27693	\N	Brzezinki
27725	27693	\N	Budy
27726	27693	\N	Gałki
27727	27693	\N	Gielniów
27728	27693	\N	Goździków
27729	27693	\N	Huta
27730	27693	\N	Jastrząb
27731	27693	\N	Kotfin
27732	27693	\N	Marysin
27733	27693	\N	Mechlin
27734	27693	\N	Puszcza
27735	27693	\N	Rozwady
27736	27693	\N	Snarki
27737	27693	\N	Sołtysy
27738	27693	\N	Stoczki
27739	27693	\N	Tartak
27740	27693	\N	Wywóz
27741	27693	\N	Zielonka
27742	27693	\N	Zygmuntów
27743	27694	\N	Borowa Wola
27744	27694	\N	Brzeski
27745	27694	\N	Drążno
27746	27694	\N	Głuszyna
27747	27694	\N	Kadź
27748	27694	\N	Klwowska Wola
27749	27694	\N	Klwów
27750	27694	\N	Kłudno
27751	27694	\N	Kolonia Ulów
27752	27694	\N	Ligęzów
27753	27694	\N	Nowy Świat
27754	27694	\N	Podczasza Wola
27755	27694	\N	Przystałowice Duże
27756	27694	\N	Przystałowice Duże-Kolonia
27757	27694	\N	Sady-Kolonia
27758	27694	\N	Sulgostów
27759	27694	\N	Ulów
27760	27695	\N	Badulki
27761	27695	\N	Ceteń
27762	27695	\N	Dąbrowa
27763	27695	\N	Dębowa Góra
27764	27695	\N	Emilianów
27765	27695	\N	Janówek
27766	27695	\N	Jelonek
27767	27695	\N	Kamienna Wola
27768	27695	\N	Kłonna
27769	27695	\N	Kłonna-Kolonia
27770	27695	\N	Kolonia Ossa
27771	27695	\N	Las Kamiennowolski
27772	27695	\N	Lipiny
27773	27695	\N	Łęgonice Małe
27774	27695	\N	Myślakowice
27775	27695	\N	Myślakowice-Kolonia
27776	27695	\N	Odrzywół
27777	27695	\N	Ossa
27778	27695	\N	Piaski
27779	27695	\N	Różanna
27780	27695	\N	Stanisławów
27781	27695	\N	Walerianów
27782	27695	\N	Wandzinów
27783	27695	\N	Wysokin
27784	27696	\N	Dąbrowa Goszczewicka
27785	27696	\N	Długie
27786	27696	\N	Dłuska Wola
27787	27696	\N	Grabowa
27788	27696	\N	Grabowska Wola
27789	27696	\N	Jamki
27790	27696	\N	Kacperków
27791	27696	\N	Kozieniec
27792	27696	\N	Łojków
27793	27696	\N	Marysin
27794	27696	\N	Mokrzec
27795	27696	\N	Nowy Wir-Kolonia
27796	27696	\N	Olszyna
27797	27696	\N	Potworów
27798	27696	\N	Rdzów
27799	27696	\N	Rdzuchów
27800	27696	\N	Rdzuchów-Kolonia
27801	27696	\N	Sady
27802	27696	\N	Wir
27803	27697	\N	Przysucha
27804	27697	\N	Beźnik
27805	27697	\N	Dębiny
27806	27697	\N	Dębiny-Kolonia
27807	27697	\N	Długa Brzezina
27808	27697	\N	Drutarnia
27809	27697	\N	Fryszerka
27810	27697	\N	Gaj
27811	27697	\N	Gajówka
27812	27697	\N	Gąsiorów
27813	27697	\N	Gliniec
27814	27697	\N	Głęboka Droga
27815	27697	\N	Gwarek
27816	27697	\N	Hucisko
27817	27697	\N	Jakubów
27818	27697	\N	Janików
27819	27697	\N	Janów
27820	27697	\N	Kolonia
27821	27697	\N	Kolonia Skrzyńsko
27822	27697	\N	Kolonia Szczerbacka
27823	27697	\N	Kozłowiec
27824	27697	\N	Krajów
27825	27697	\N	Kuźnica
27826	27697	\N	Lipno
27827	27697	\N	Mariówka
27828	27697	\N	Pomyków
27829	27697	\N	Puszcza
27830	27697	\N	Rawicz
27831	27697	\N	Rudnik
27832	27697	\N	Ruski Bród
27833	27697	\N	Skrzyńsko
27834	27697	\N	Smogorzów
27835	27697	\N	Wistka
27836	27697	\N	Wola Więcierzowa
27837	27697	\N	Zapniów
27838	27697	\N	Zawada
27839	27697	\N	Zbożenna
27840	27698	\N	Bąków
27841	27698	\N	Bąków-Kolonia
27842	27698	\N	Brogowa
27843	27698	\N	Gałki
27844	27698	\N	Grabowa
27845	27698	\N	Jabłonna
27846	27698	\N	Karczówka
27847	27698	\N	Klonowa
27848	27698	\N	Krzesławice
27849	27698	\N	Nieznamierowice
27850	27698	\N	Przystałowice Małe
27851	27698	\N	Rusinów
27852	27698	\N	Władysławów
27853	27698	\N	Wola Gałecka
27854	27698	\N	Zychorzyn
27855	27698	\N	Zychorzyn-Kolonia
27856	27698	\N	Żurawiniec
27857	27699	\N	Brudnów
27858	27699	\N	Brzozowica
27859	27699	\N	Głogów
27860	27699	\N	Jabłonica
27861	27699	\N	Kaleń
27862	27699	\N	Kamień Duży
27863	27699	\N	Kłudno
27864	27699	\N	Kochanów Wieniawski
27865	27699	\N	Komorów
27866	27699	\N	Komorów-Gajówka
27867	27699	\N	Koryciska
27868	27699	\N	Plec
27869	27699	\N	Pod Rogową
27870	27699	\N	Pogroszyn
27871	27699	\N	Romualdów
27872	27699	\N	Ryków
27873	27699	\N	Skrzynno
27874	27699	\N	Sokolniki Mokre
27875	27699	\N	Sokolniki Suche
27876	27699	\N	Wieniawa
27877	27699	\N	Wola Brudnowska
27878	27699	\N	Wydrzyn
27879	27699	\N	Zadąbrów
27880	27699	\N	Zagórze
27881	27699	\N	Zawady
27882	27699	\N	Żuków
27883	171	\N	Gzy
27884	171	\N	Obryte
27885	171	\N	Pokrzywnica
27886	171	\N	Pułtusk
27887	171	\N	Świercze
27888	171	\N	Winnica
27889	171	\N	Zatory
27890	27883	\N	Begno
27891	27883	\N	Borza-Strumiany
27892	27883	\N	Gotardy
27893	27883	\N	Grochy-Imbrzyki
27894	27883	\N	Grochy-Serwatki
27895	27883	\N	Gzy
27896	27883	\N	Gzy-Wisnowa
27897	27883	\N	Kęsy-Wypychy
27898	27883	\N	Kozłowo
27899	27883	\N	Kozłówka
27900	27883	\N	Łady-Krajęczyno
27901	27883	\N	Mierzeniec
27902	27883	\N	Nowe Borza
27903	27883	\N	Nowe Przewodowo
27904	27883	\N	Nowe Skaszewo
27905	27883	\N	Ołdaki
27906	27883	\N	Ostaszewo-Pańki
27907	27883	\N	Ostaszewo-Wielkie
27908	27883	\N	Ostaszewo-Włuski
27909	27883	\N	Pękowo
27910	27883	\N	Porzowo
27911	27883	\N	Przewodowo-Majorat
27912	27883	\N	Przewodowo-Parcele
27913	27883	\N	Przewodowo Poduchowne
27914	27883	\N	Sisice
27915	27883	\N	Skaszewo Włościańskie
27916	27883	\N	Słończewo
27917	27883	\N	Stare Grochy
27918	27883	\N	Sulnikowo
27919	27883	\N	Szyszki
27920	27883	\N	Tąsewy
27921	27883	\N	Wójty-Trojany
27922	27883	\N	Zalesie-Lenki
27923	27883	\N	Żebry-Falbogi
27924	27883	\N	Żebry-Wiatraki
27925	27884	\N	Bartodzieje
27926	27884	\N	Bartodzieje-Gajówka
27927	27884	\N	Ciółkowo Małe
27928	27884	\N	Ciółkowo Rządowe
27929	27884	\N	Cygany
27930	27884	\N	Działki
27931	27884	\N	Gostkowo
27932	27884	\N	Gródek Rządowy
27933	27884	\N	Kalinowo
27934	27884	\N	Lutobrok-Gajówka
27935	27884	\N	Mokrus
27936	27884	\N	Nowy Gródek
27937	27884	\N	Obryte
27938	27884	\N	Obryte-Leśniczówka
27939	27884	\N	Pawłówek-Gajówka
27940	27884	\N	Placusin-Gajówka
27941	27884	\N	Płusy
27942	27884	\N	Ponikiew-Leśniczówka
27943	27884	\N	Popławy-Gajówka
27944	27884	\N	Psary
27945	27884	\N	Psary-Gajówka
27946	27884	\N	Rowy
27947	27884	\N	Rozdziały
27948	27884	\N	Sadykierz
27949	27884	\N	Skłudy
27950	27884	\N	Sokołowo-Parcele
27951	27884	\N	Sokołowo Włościańskie
27952	27884	\N	Stare Zambski
27953	27884	\N	Tocznabiel
27954	27884	\N	Ulaski
27955	27884	\N	Wielgolas
27956	27884	\N	Wielgolas-Leśniczówka
27957	27884	\N	Wzgórze-Leśniczówka
27958	27884	\N	Zambski Kościelne
27959	27885	\N	Budy Ciepielińskie
27960	27885	\N	Budy Obrębskie
27961	27885	\N	Budy Pobyłkowskie
27962	27885	\N	Ciepielin
27963	27885	\N	Dzbanice
27964	27885	\N	Dzierżenin
27965	27885	\N	Gzowo
27966	27885	\N	Karniewek
27967	27885	\N	Kępiaste
27968	27885	\N	Klaski
27969	27885	\N	Klusek
27970	27885	\N	Koziegłowy
27971	27885	\N	Łępice
27972	27885	\N	Łosewo
27973	27885	\N	Łubienica
27974	27885	\N	Łubienica-Superunki
27975	27885	\N	Mory
27976	27885	\N	Murowanka
27977	27885	\N	Niestępowo Włościańskie
27978	27885	\N	Nowe Niestępowo
27979	27885	\N	Obręb
27980	27885	\N	Obrębek
27981	27885	\N	Olbrachcice
27982	27885	\N	Piskornia
27983	27885	\N	Pobyłkowo Duże
27984	27885	\N	Pobyłkowo Małe
27985	27885	\N	Pogorzelec
27986	27885	\N	Pokrzywnica
27987	27885	\N	Pomocnia
27988	27885	\N	Strzyże
27989	27885	\N	Świeszewo
27990	27885	\N	Trzepowo
27991	27885	\N	Witki
27992	27885	\N	Wólka Zaleska
27993	27885	\N	Zaborze
27994	27886	\N	Pułtusk
27995	27886	\N	Białowieża
27996	27886	\N	Boby
27997	27886	\N	Chmielewo
27998	27886	\N	Głodowo
27999	27886	\N	Gnojno
28000	27886	\N	Grabówiec
28001	27886	\N	Gromin
28002	27886	\N	Jeżewo
28003	27886	\N	Kacice
28004	27886	\N	Kleszewo
28005	27886	\N	Kokoszka
28006	27886	\N	Lipa
28007	27886	\N	Lipniki Nowe
28008	27886	\N	Lipniki Stare
28009	27886	\N	Moszyn
28010	27886	\N	Olszak
28011	27886	\N	Pawłówek
28012	27886	\N	Płocochowo
28013	27886	\N	Ponikiew
28014	27886	\N	Przemiarowo
28015	27886	\N	Szygówek
28016	27886	\N	Trzciniec
28017	27886	\N	Zakręt
28018	27887	\N	Brodowo
28019	27887	\N	Bruliny
28020	27887	\N	Bylice
28021	27887	\N	Chmielewo
28022	27887	\N	Dziarno
28023	27887	\N	Gaj
28024	27887	\N	Gąsiorowo
28025	27887	\N	Gąsiorówek
28026	27887	\N	Godacze
28027	27887	\N	Gołębie
28028	27887	\N	Klukowo
28029	27887	\N	Klukówek
28030	27887	\N	Kosiorowo
28031	27887	\N	Kościesze
28032	27887	\N	Kowalewice Nowe
28033	27887	\N	Kowalewice Włościańskie
28034	27887	\N	Ostrzeniewo
28035	27887	\N	Prusinowice
28036	27887	\N	Stpice
28037	27887	\N	Strzegocin
28038	27887	\N	Sulkowo
28039	27887	\N	Świercze
28040	27887	\N	Świercze-Siółki
28041	27887	\N	Świerkowo
28042	27887	\N	Świeszewko
28043	27887	\N	Świeszewo
28044	27887	\N	Wyrzyki
28045	27887	\N	Wyrzyki-Pękale
28046	27888	\N	Białe Błoto
28047	27888	\N	Bielany
28048	27888	\N	Błędostowo
28049	27888	\N	Brodowo-Bąboły
28050	27888	\N	Brodowo-Wity
28051	27888	\N	Budy-Zbroszki
28052	27888	\N	Domosław
28053	27888	\N	Gatka
28054	27888	\N	Glinice-Domaniewo
28055	27888	\N	Glinice Wielkie
28056	27888	\N	Gnaty-Lewiski
28057	27888	\N	Gnaty-Szczerbaki
28058	27888	\N	Gnaty-Wieśniany
28059	27888	\N	Golądkowo
28060	27888	\N	Górka Powielińska
28061	27888	\N	Górki-Baćki
28062	27888	\N	Górki Duże
28063	27888	\N	Górki-Witowice
28064	27888	\N	Kamionna
28065	27888	\N	Łachoń
28066	27888	\N	Mieszki-Kuligi
28067	27888	\N	Mieszki-Leśniki
28068	27888	\N	Nowe Bulkowo
28069	27888	\N	Pawłowo
28070	27888	\N	Poniaty-Cibory
28071	27888	\N	Poniaty Wielkie
28072	27888	\N	Powielin
28073	27888	\N	Rębkowo
28074	27888	\N	Skarżyce
28075	27888	\N	Skorosze
28076	27888	\N	Skoroszki
28077	27888	\N	Skórznice
28078	27888	\N	Smogorzewo Pańskie
28079	27888	\N	Smogorzewo Włościańskie
28080	27888	\N	Stare Bulkowo
28081	27888	\N	Winnica
28082	27888	\N	Winniczka
28083	27888	\N	Zbroszki
28084	27889	\N	Borsuki-Gajówka
28085	27889	\N	Borsuki-Kolonia
28086	27889	\N	Burlaki
28087	27889	\N	Cieńsza
28088	27889	\N	Ciski
28089	27889	\N	Dębiny
28090	27889	\N	Drwały
28091	27889	\N	Gładczyn
28092	27889	\N	Gładczyn Rządowy
28093	27889	\N	Gładczyn Szlachecki
28094	27889	\N	Kępa Zatorska-Gajówka
28095	27889	\N	Kruczy Borek
28096	27889	\N	Lemany
28097	27889	\N	Lemany-Nadleśnictwo
28098	27889	\N	Lutobrok
28099	27889	\N	Lutobrok-Folwark
28100	27889	\N	Łęcino
28101	27889	\N	Malwinowo
28102	27889	\N	Mierzęcin
28103	27889	\N	Mystkówiec-Kalinówka
28104	27889	\N	Mystkówiec-Szczucin
28105	27889	\N	Nowe Borsuki
28106	27889	\N	Pniewo
28107	27889	\N	Pniewo-Gajówka
28108	27889	\N	Pniewo-Kolonia
28109	27889	\N	Pniewo-Leśniczówka
28110	27889	\N	Przyłubie
28111	27889	\N	Stawinoga
28112	27889	\N	Stawinoga-Leśniczówka
28113	27889	\N	Stawinoga-Rybakówka
28114	27889	\N	Śliski
28115	27889	\N	Topolnica
28116	27889	\N	Wielęcin
28117	27889	\N	Wiktoryn
28118	27889	\N	Wólka Zatorska
28119	27889	\N	Wólka Zatorska-Gajówka
28120	27889	\N	Zatory
28121	191	\N	Pionki
28122	191	\N	Gózd
28123	191	\N	Iłża
28124	191	\N	Jastrzębia
28125	191	\N	Jedlińsk
28126	191	\N	Jedlnia-Letnisko
28127	191	\N	Kowala
28128	191	\N	Przytyk
28129	191	\N	Skaryszew
28130	191	\N	Wierzbica
28131	191	\N	Wolanów
28132	191	\N	Zakrzew
28133	28121	\N	Pionki
28134	28122	\N	Adamów
28135	28122	\N	Budy Niemianowskie
28136	28122	\N	Czarny Lasek
28137	28122	\N	Drożanki
28138	28122	\N	Gózd
28139	28122	\N	Grzmucin
28140	28122	\N	Karszówka
28141	28122	\N	Kiedrzyn
28142	28122	\N	Klwatka Królewska
28143	28122	\N	Kłonów
28144	28122	\N	Kłonówek
28145	28122	\N	Kuczki-Kolonia
28146	28122	\N	Kuczki-Wieś
28147	28122	\N	Lipiny
28148	28122	\N	Małęczyn
28149	28122	\N	Niemianowice
28150	28122	\N	Piskornica
28151	28122	\N	Podgóra
28152	28122	\N	Wojsławice
28153	28123	\N	Iłża
28154	28123	\N	Alojzów
28155	28123	\N	Białka
28156	28123	\N	Błaziny Dolne
28157	28123	\N	Błaziny Górne
28158	28123	\N	Błota
28159	28123	\N	Budy
28160	28123	\N	Chwałowice
28161	28123	\N	Florencja
28162	28123	\N	Gajówka Antoniów
28163	28123	\N	Gajówka Błaziny
28164	28123	\N	Gajówka Jasieniec
28165	28123	\N	Gajówka Kruki
28166	28123	\N	Gajówka Krzewa
28167	28123	\N	Gajówka Małyszyn
28168	28123	\N	Gajówka Maziarze
28169	28123	\N	Gajówka Niwy
28170	28123	\N	Gajówka Obrycie
28171	28123	\N	Gajówka Osiny
28172	28123	\N	Gajówka Pastwiska
28173	28123	\N	Gajówka Podrzecze
28174	28123	\N	Gajówka Seredzice
28175	28123	\N	Gaworzyna
28176	28123	\N	Jasieniec Iłżecki Dolny
28177	28123	\N	Jasieniec Iłżecki Górny
28178	28123	\N	Jasieniec-Maziarze
28179	28123	\N	Jedlanka Nowa
28180	28123	\N	Jedlanka Stara
28181	28123	\N	Kajetanów
28182	28123	\N	Kolonia Seredzice
28183	28123	\N	Koszary
28184	28123	\N	Kotlarka
28185	28123	\N	Krzewa
28186	28123	\N	Krzyżanowice
28187	28123	\N	Leśniczówka Antoniów
28188	28123	\N	Leśniczówka Błaziny
28189	28123	\N	Leśniczówka Jasieniec
28190	28123	\N	Leśniczówka Kruki
28191	28123	\N	Leśniczówka Lisiury
28192	28123	\N	Leśniczówka Niwy
28193	28123	\N	Leśniczówka Podrzecze
28194	28123	\N	Leśniczówka Polany
28195	28123	\N	Leśniczówka Seredzice
28196	28123	\N	Lipie
28197	28123	\N	Małomierzyce
28198	28123	\N	Marcule
28199	28123	\N	Maziarze Nowe
28200	28123	\N	Maziarze Stare
28201	28123	\N	Michałów
28202	28123	\N	Nadleśnictwo Małomierzyce
28203	28123	\N	Nowy Jasieniec Iłżecki
28204	28123	\N	Pakosław
28205	28123	\N	Pastwiska
28206	28123	\N	Pieńki
28207	28123	\N	Piłatka
28208	28123	\N	Piotrowe Pole
28209	28123	\N	Płudnica
28210	28123	\N	Prędocin
28211	28123	\N	Prędocinek
28212	28123	\N	Prędocin-Kolonia
28213	28123	\N	Seredzice
28214	28123	\N	Seredzice-Zawodzie
28215	28123	\N	Starosiedlice
28216	28123	\N	Walentynów
28217	28123	\N	Wólka Jedlańska
28218	28124	\N	Bartodzieje
28219	28124	\N	Brody
28220	28124	\N	Dąbrowa Jastrzębska
28221	28124	\N	Dąbrowa Kozłowska
28222	28124	\N	Goryń
28223	28124	\N	Jastrzębia
28224	28124	\N	Kolonia Lesiów
28225	28124	\N	Kozłów
28226	28124	\N	Lesiów
28227	28124	\N	Lewaszówka
28228	28124	\N	Mąkosy Nowe
28229	28124	\N	Mąkosy Stare
28230	28124	\N	Olszowa
28231	28124	\N	Owadów
28232	28124	\N	Wojciechów
28233	28124	\N	Wola Goryńska
28234	28124	\N	Wola Owadowska
28235	28124	\N	Wolska Dąbrowa
28236	28124	\N	Wólka Lesiowska
28237	28125	\N	Bierwce
28238	28125	\N	Bierwiecka Wola
28239	28125	\N	Boża Wola
28240	28125	\N	Czarny Ług
28241	28125	\N	Godzisz
28242	28125	\N	Górna Wola
28243	28125	\N	Gutów
28244	28125	\N	Janki
28245	28125	\N	Jankowice
28246	28125	\N	Jankowice-Kolonia
28247	28125	\N	Jedlanka
28248	28125	\N	Jedlińsk
28249	28125	\N	Jeziorno
28250	28125	\N	Józefów
28251	28125	\N	Józefówek
28252	28125	\N	Kamińsk
28253	28125	\N	Klwatka Szlachecka
28254	28125	\N	Klwaty
28255	28125	\N	Klwaty-Ludwików
28256	28125	\N	Kruszyna
28257	28125	\N	Lisów
28258	28125	\N	Ludwików
28259	28125	\N	Marcelów
28260	28125	\N	Mokrosęk
28261	28125	\N	Narty
28262	28125	\N	Nowa Wola
28263	28125	\N	Nowe Zawady
28264	28125	\N	Obózek
28265	28125	\N	Piaseczno
28266	28125	\N	Piastów
28267	28125	\N	Płasków
28268	28125	\N	Romanów
28269	28125	\N	Stare Zawady
28270	28125	\N	Urbanów
28271	28125	\N	Wielogóra
28272	28125	\N	Wierzchowiny
28273	28125	\N	Wola Gutowska
28274	28125	\N	Wsola
28275	28126	\N	Aleksandrów
28276	28126	\N	Antoniówka
28277	28126	\N	Cudnów
28278	28126	\N	Dawidów
28279	28126	\N	Groszowice
28280	28126	\N	Gzowice
28281	28126	\N	Gzowice-Folwark
28282	28126	\N	Gzowice-Kolonia
28283	28126	\N	Gzowskie Budy
28284	28126	\N	Jedlnia-Letnisko
28285	28126	\N	Lasowice
28286	28126	\N	Maryno
28287	28126	\N	Myśliszewice
28288	28126	\N	Natolin
28289	28126	\N	Piotrowice
28290	28126	\N	Rajec Poduchowny
28291	28126	\N	Rajec Szlachecki
28292	28126	\N	Sadków
28293	28126	\N	Siczki
28294	28126	\N	Słupica
28295	28127	\N	Augustów
28296	28127	\N	Bardzice
28297	28127	\N	Błonie
28298	28127	\N	Bukowiec
28299	28127	\N	Ciborów
28300	28127	\N	Dąbrówka Zabłotnia
28301	28127	\N	Grabina
28302	28127	\N	Huta Dolna
28303	28127	\N	Huta Mazowszańska
28304	28127	\N	Józefów
28305	28127	\N	Kończyce-Kolonia
28306	28127	\N	Kosów
28307	28127	\N	Kosów-Stacja
28308	28127	\N	Kosów Większy
28309	28127	\N	Kotarwice
28310	28127	\N	Kowala-Stępocina
28311	28127	\N	Ludwinów
28312	28127	\N	Maliszów
28313	28127	\N	Mazowszany
28314	28127	\N	Młodocin Mniejszy
28315	28127	\N	Osiek
28316	28127	\N	Parznice
28317	28127	\N	Pelagiów
28318	28127	\N	Romanów
28319	28127	\N	Rożki
28320	28127	\N	Ruda Mała
28321	28127	\N	Trablice
28322	28127	\N	Walentynów
28323	28127	\N	Zabierzów
28324	28127	\N	Kowala
28325	28121	\N	Adolfin
28326	28121	\N	Augustów
28327	28121	\N	Bażantarnia
28328	28121	\N	Bieliny
28329	28121	\N	Brzezinki
28330	28121	\N	Brzeziny
28331	28121	\N	Brzeźniczka
28332	28121	\N	Czarna Kolonia
28333	28121	\N	Czarna Wieś
28334	28121	\N	Działki Suskowolskie
28335	28121	\N	Gajówka
28336	28121	\N	Gajówka Januszno
28337	28121	\N	Gajówka Jaśce
28338	28121	\N	Gajówka Karpówka
28339	28121	\N	Gajówka Stoki
28340	28121	\N	Gajówka Zadobrze
28341	28121	\N	Helenów
28342	28121	\N	Huta
28343	28121	\N	Januszno
28344	28121	\N	Jaroszki
28345	28121	\N	Jaśce
28346	28121	\N	Jedlnia
28347	28121	\N	Jedlnia-Kolonia
28348	28121	\N	Kamyk
28349	28121	\N	Karpówka
28350	28121	\N	Kieszek
28351	28121	\N	Kolonka
28352	28121	\N	Kościuszków
28353	28121	\N	Krasna Dąbrowa
28354	28121	\N	Laski
28355	28121	\N	Leśniczówka Adolfin
28356	28121	\N	Leśniczówka Mąkosy
28357	28121	\N	Leśniczówka Stoki
28358	28121	\N	Lewaszówka-Leśniczówka
28359	28121	\N	Marcelów
28360	28121	\N	Mireń
28361	28121	\N	Ostrownica
28362	28121	\N	Patków
28363	28121	\N	Płachty
28364	28121	\N	Poświętne
28365	28121	\N	Sałki
28366	28121	\N	Sokoły
28367	28121	\N	Stoki
28368	28121	\N	Sucha
28369	28121	\N	Sucha Poduchowna
28370	28121	\N	Suskowola
28371	28121	\N	Tadeuszów
28372	28121	\N	Wincentów
28373	28121	\N	Zadobrze
28374	28121	\N	Zalesie
28375	28121	\N	Żdżary
28376	28128	\N	Borowiec Pierwszy
28377	28128	\N	Dęba
28378	28128	\N	Domaniów
28379	28128	\N	Duży Las
28380	28128	\N	Gaczkowice
28381	28128	\N	Glinice
28382	28128	\N	Goszczewice
28383	28128	\N	Jabłonna
28384	28128	\N	Jadwiniów
28385	28128	\N	Jagodno
28386	28128	\N	Kaszewska Wola
28387	28128	\N	Krzyszkowice
28388	28128	\N	Maksymilianów
28389	28128	\N	Młódnice
28390	28128	\N	Mścichów
28391	28128	\N	Oblas
28392	28128	\N	Ostrołęka
28393	28128	\N	Podgajek
28394	28128	\N	Podgajek-Kolonia
28395	28128	\N	Posada
28396	28128	\N	Potkanna
28397	28128	\N	Przytyk
28398	28128	\N	Sewerynów
28399	28128	\N	Słowików
28400	28128	\N	Stary Młyn
28401	28128	\N	Stefanów
28402	28128	\N	Studzienice
28403	28128	\N	Sukowska Wola
28404	28128	\N	Suków
28405	28128	\N	Witoldów
28406	28128	\N	Wola Wrzeszczowska
28407	28128	\N	Wólka Domaniowska
28408	28128	\N	Wrzeszczów
28409	28128	\N	Wrzos
28410	28128	\N	Wygnanów
28411	28128	\N	Zameczek
28412	28128	\N	Zameczek-Kolonia
28413	28128	\N	Żerdź
28414	28129	\N	Skaryszew
28415	28129	\N	Anielin
28416	28129	\N	Bogusławice
28417	28129	\N	Bogusławice-Kolonia
28418	28129	\N	Bujak
28419	28129	\N	Chomętów-Puszcz
28420	28129	\N	Chomętów-Socha
28421	28129	\N	Chomętów-Szczygieł
28422	28129	\N	Dąbrówka Makowska
28423	28129	\N	Edwardów
28424	28129	\N	Gębarzów
28425	28129	\N	Gębarzów-Kolonia
28426	28129	\N	Grabina
28427	28129	\N	Huta Skaryszewska
28428	28129	\N	Janów
28429	28129	\N	Kazimierówka
28430	28129	\N	Kłonowiec-Koracz
28431	28129	\N	Kłonowiec-Kurek
28432	28129	\N	Kobylany
28433	28129	\N	Kobylany-Kolonia
28434	28129	\N	Magierów
28435	28129	\N	Makowiec
28436	28129	\N	Makowiec-Leśniczówka
28437	28129	\N	Maków
28438	28129	\N	Maków Nowy
28439	28129	\N	Miasteczko
28440	28129	\N	Modrzejowice
28441	28129	\N	Modrzejowice-Kolonia
28442	28129	\N	Niwa Odechowska
28443	28129	\N	Nowy Dzierzkówek
28444	28129	\N	Odechowiec
28445	28129	\N	Odechów
28446	28129	\N	Podsuliszka
28447	28129	\N	Sołtyków
28448	28129	\N	Stanisławów
28449	28129	\N	Stary Dzierzkówek
28450	28129	\N	Tomaszów
28451	28129	\N	Wilczna
28452	28129	\N	Wólka Twarogowa
28453	28129	\N	Wymysłów
28454	28129	\N	Zalesie
28455	28130	\N	Błędów
28456	28130	\N	Dąbrówka Warszawska
28457	28130	\N	Łączany
28458	28130	\N	Podgórki
28459	28130	\N	Polany
28460	28130	\N	Polany-Kolonia
28461	28130	\N	Pomorzany
28462	28130	\N	Pomorzany-Kolonia
28463	28130	\N	Ruda Wielka
28464	28130	\N	Rzeczków
28465	28130	\N	Rzeczków-Kolonia
28466	28130	\N	Stanisławów
28467	28130	\N	Suliszka
28468	28130	\N	Wierzbica
28469	28130	\N	Wierzbica-Kolonia
28470	28130	\N	Zalesice
28471	28130	\N	Zalesice-Kolonia
28472	28131	\N	Bieniędzice
28473	28131	\N	Chruślice
28474	28131	\N	Franciszków
28475	28131	\N	Garno
28476	28131	\N	Jarosławice
28477	28131	\N	Kacprowice
28478	28131	\N	Kolonia Wawrzyszów
28479	28131	\N	Kolonia Wolanów
28480	28131	\N	Kowala-Duszocina
28481	28131	\N	Młodocin Większy
28482	28131	\N	Mniszek
28483	28131	\N	Podkończyce
28484	28131	\N	Podlesie
28485	28131	\N	Rogowa
28486	28131	\N	Sławno
28487	28131	\N	Strzałków
28488	28131	\N	Ślepowron
28489	28131	\N	Wacławów
28490	28131	\N	Waliny
28491	28131	\N	Wawrzyszów
28492	28131	\N	Wolanów
28493	28131	\N	Wola Wacławowska
28494	28131	\N	Wymysłów
28495	28131	\N	Zabłocie
28496	28132	\N	Bielicha
28497	28132	\N	Cerekiew
28498	28132	\N	Dąbrówka Nagórna-Wieś
28499	28132	\N	Dąbrówka Podłężna
28500	28132	\N	Golędzin
28501	28132	\N	Gózdek
28502	28132	\N	Gulin
28503	28132	\N	Gulinek
28504	28132	\N	Gustawów
28505	28132	\N	Janiszew
28506	28132	\N	Jaszowice
28507	28132	\N	Jaszowice-Kolonia
28508	28132	\N	Kolonia Piaski
28509	28132	\N	Kozia Wola
28510	28132	\N	Kozinki
28511	28132	\N	Las Janiszewski
28512	28132	\N	Legęzów
28513	28132	\N	Marianowice
28514	28132	\N	Milejowice
28515	28132	\N	Milejowice-Kolonia
28516	28132	\N	Mleczków
28517	28132	\N	Natalin
28518	28132	\N	Nieczatów
28519	28132	\N	Podlesie Mleczkowskie
28520	28132	\N	Taczowskie Pieńki
28521	28132	\N	Taczów
28522	28132	\N	Wacyn
28523	28132	\N	Wiktorów
28524	28132	\N	Wola Taczowska
28525	28132	\N	Zakrzew
28526	28132	\N	Zakrzew-Kolonia
28527	28132	\N	Zakrzew-Las
28528	28132	\N	Zakrzewska Wola
28529	28132	\N	Zatopolice
28530	28132	\N	Zdziechów
28531	193	\N	Domanice
28532	193	\N	Korczew
28533	193	\N	Kotuń
28534	193	\N	Mokobody
28535	193	\N	Mordy
28536	193	\N	Paprotnia
28537	193	\N	Przesmyki
28538	193	\N	Siedlce
28539	193	\N	Skórzec
28540	193	\N	Suchożebry
28541	193	\N	Wiśniew
28542	193	\N	Wodynie
28543	193	\N	Zbuczyn
28544	28531	\N	Czachy
28545	28531	\N	Domanice
28546	28531	\N	Domanice-Kolonia
28547	28531	\N	Emilianówka
28548	28531	\N	Jagodne
28549	28531	\N	Kopcie
28550	28531	\N	Olszyc-Folwark
28551	28531	\N	Olszyc Szlachecki
28552	28531	\N	Olszyc Włościański
28553	28531	\N	Pieńki
28554	28531	\N	Podzdrój
28555	28531	\N	Przywory Duże
28556	28531	\N	Przywory Małe
28557	28531	\N	Śmiary-Kolonia
28558	28531	\N	Zażelazna
28559	28532	\N	Bartków
28560	28532	\N	Bużyska
28561	28532	\N	Czaple Górne
28562	28532	\N	Drażniew
28563	28532	\N	Góry
28564	28532	\N	Józefin
28565	28532	\N	Juhana
28566	28532	\N	Knychówek
28567	28532	\N	Korczew
28568	28532	\N	Laskowice
28569	28532	\N	Mogielnica
28570	28532	\N	Mokrany-Gajówka
28571	28532	\N	Nowy Bartków
28572	28532	\N	Ruda
28573	28532	\N	Sarnowiec
28574	28532	\N	Starczewice
28575	28532	\N	Stary Bartków
28576	28532	\N	Szczeglacin
28577	28532	\N	Tokary
28578	28532	\N	Tokary-Gajówka
28579	28532	\N	Zacisze
28580	28532	\N	Zaleś
28581	28533	\N	Albinów
28582	28533	\N	Bojmie
28583	28533	\N	Broszków
28584	28533	\N	Chlewiska
28585	28533	\N	Cisie-Zagrudzie
28586	28533	\N	Czarnowąż
28587	28533	\N	Gręzów
28588	28533	\N	Jagodne
28589	28533	\N	Józefin
28590	28533	\N	Kępa
28591	28533	\N	Koszewnica
28592	28533	\N	Kotuń
28593	28533	\N	Łączka
28594	28533	\N	Łęki
28595	28533	\N	Marysin
28596	28533	\N	Mingosy
28597	28533	\N	Niechnabrz
28598	28533	\N	Nowa Dąbrówka
28599	28533	\N	Oleksin
28600	28533	\N	Pieńki
28601	28533	\N	Pieróg
28602	28533	\N	Polaki
28603	28533	\N	Rososz
28604	28533	\N	Ryczyca
28605	28533	\N	Sionna
28606	28533	\N	Sosnowe
28607	28533	\N	Trzemuszka
28608	28533	\N	Tymianka
28609	28533	\N	Wilczonek
28610	28533	\N	Żdżar
28611	28533	\N	Żeliszew Duży
28612	28533	\N	Żeliszew Podkościelny
28613	28534	\N	Bale
28614	28534	\N	Dąbrowa
28615	28534	\N	Jeruzale
28616	28534	\N	Kapuściaki
28617	28534	\N	Kisielany-Kuce
28618	28534	\N	Kisielany-Żmichy
28619	28534	\N	Księżopole-Jałmużny
28620	28534	\N	Księżopole-Smolaki
28621	28534	\N	Męczyn
28622	28534	\N	Męczyn-Kolonia
28623	28534	\N	Mokobody
28624	28534	\N	Mokobody-Kolonia
28625	28534	\N	Niwiski
28626	28534	\N	Osiny Dolne
28627	28534	\N	Osiny Górne
28628	28534	\N	Pieńki
28629	28534	\N	Skupie
28630	28534	\N	Świniary
28631	28534	\N	Wesoła
28632	28534	\N	Wólka Proszewska
28633	28534	\N	Wólka Żukowska
28634	28534	\N	Wyłazy
28635	28534	\N	Zaliwie-Brzozówka
28636	28534	\N	Zaliwie-Piegawki
28637	28534	\N	Zaliwie-Szpinki
28638	28534	\N	Zemły
28639	28534	\N	Ziomaki
28640	28534	\N	Żuków
28641	28535	\N	Mordy
28642	28535	\N	Czepielin
28643	28535	\N	Czepielin-Kolonia
28644	28535	\N	Czołomyje
28645	28535	\N	Doliwo
28646	28535	\N	Głuchów
28647	28535	\N	Klimonty
28648	28535	\N	Kolonia Mordy
28649	28535	\N	Krzymosze
28650	28535	\N	Leśniczówka
28651	28535	\N	Ogrodniki
28652	28535	\N	Olędy
28653	28535	\N	Ostoje
28654	28535	\N	Pieńki
28655	28535	\N	Pióry-Pytki
28656	28535	\N	Pióry Wielkie
28657	28535	\N	Płosodrza
28658	28535	\N	Ptaszki
28659	28535	\N	Radzików-Kornica
28660	28535	\N	Radzików-Oczki
28661	28535	\N	Radzików-Stopki
28662	28535	\N	Radzików Wielki
28663	28535	\N	Rogóziec
28664	28535	\N	Sosenki-Jajki
28665	28535	\N	Stara Wieś
28666	28535	\N	Stok Ruski
28667	28535	\N	Suchodołek
28668	28535	\N	Suchodół Wielki
28669	28535	\N	Wielgorz
28670	28535	\N	Wojnów
28671	28535	\N	Wólka-Biernaty
28672	28535	\N	Wólka Soseńska
28673	28535	\N	Wyczółki
28674	28536	\N	Czarnoty
28675	28536	\N	Grabowiec
28676	28536	\N	Hołubla
28677	28536	\N	Kaliski
28678	28536	\N	Kobylany-Kozy
28679	28536	\N	Koryciany
28680	28536	\N	Krynki
28681	28536	\N	Łęczycki
28682	28536	\N	Łozy
28683	28536	\N	Nasiłów
28684	28536	\N	Paprotnia
28685	28536	\N	Pliszki
28686	28536	\N	Pluty
28687	28536	\N	Podawce
28688	28536	\N	Rzeszotków
28689	28536	\N	Skwierczyn Lacki
28690	28536	\N	Stare Trębice
28691	28536	\N	Stasin
28692	28536	\N	Strusy
28693	28536	\N	Trębice Dolne
28694	28536	\N	Trębice Górne
28695	28536	\N	Uziębły
28696	28537	\N	Cierpigórz
28697	28537	\N	Dąbrowa
28698	28537	\N	Głuchówek
28699	28537	\N	Górki
28700	28537	\N	Kaliski
28701	28537	\N	Kamianki-Czabaje
28702	28537	\N	Kamianki Lackie
28703	28537	\N	Kamianki-Nicki
28704	28537	\N	Kamianki-Wańki
28705	28537	\N	Ksawerów
28706	28537	\N	Kukawki
28707	28537	\N	Lipiny
28708	28537	\N	Łysów
28709	28537	\N	Pniewiski
28710	28537	\N	Przesmyki
28711	28537	\N	Raczyny
28712	28537	\N	Stare Rzewuski
28713	28537	\N	Tarków
28714	28537	\N	Tarkówek
28715	28537	\N	Wólka Łysowska
28716	28537	\N	Zalesie
28717	28537	\N	Zawady
28718	28538	\N	Białki
28719	28538	\N	Biel
28720	28538	\N	Błogoszcz
28721	28538	\N	Chodów
28722	28538	\N	Golice
28723	28538	\N	Golice-Kolonia
28724	28538	\N	Grabianów
28725	28538	\N	Grubale
28726	28538	\N	Jagodnia
28727	28538	\N	Joachimów
28728	28538	\N	Nowe Iganie
28729	28538	\N	Nowe Opole
28730	28538	\N	Opole Świerczyna
28731	28538	\N	Osiny
28732	28538	\N	Ostrówek
28733	28538	\N	Pruszyn
28734	28538	\N	Pruszynek
28735	28538	\N	Pruszyn-Pieńki
28736	28538	\N	Purzec
28737	28538	\N	Pustki
28738	28538	\N	Rakowiec
28739	28538	\N	Rybakówka
28740	28538	\N	Stare Iganie
28741	28538	\N	Stare Opole
28742	28538	\N	Stok Lacki
28743	28538	\N	Stok Lacki-Folwark
28744	28538	\N	Strzała
28745	28538	\N	Topórek
28746	28538	\N	Ujrzanów
28747	28538	\N	Wołyńce
28748	28538	\N	Wołyńce-Kolonia
28749	28538	\N	Wólka Leśna
28750	28538	\N	Żabokliki
28751	28538	\N	Żabokliki-Kolonia
28752	28538	\N	Żelków-Kolonia
28753	28538	\N	Żytnia
28754	28538	\N	Siedlce
28755	28539	\N	Boroszków
28756	28539	\N	Czerniejew
28757	28539	\N	Dąbrówka-Ług
28758	28539	\N	Dąbrówka-Niwka
28759	28539	\N	Dąbrówka-Stany
28760	28539	\N	Dąbrówka-Wyłazy
28761	28539	\N	Dobrzanów
28762	28539	\N	Drupia
28763	28539	\N	Gołąbek
28764	28539	\N	Grala-Dąbrowizna
28765	28539	\N	Kłódzie
28766	28539	\N	Nowaki
28767	28539	\N	Ozorów
28768	28539	\N	Pieńki
28769	28539	\N	Skarżyn
28770	28539	\N	Skórzec
28771	28539	\N	Stara Dąbrówka
28772	28539	\N	Teodorów
28773	28539	\N	Trzciniec
28774	28539	\N	Wólka Kobyla
28775	28539	\N	Żebrak
28776	28539	\N	Żelków
28777	28540	\N	Borki Siedleckie
28778	28540	\N	Brzozów
28779	28540	\N	Kopcie
28780	28540	\N	Kownaciska
28781	28540	\N	Krynica
28782	28540	\N	Krześlin
28783	28540	\N	Krześlinek
28784	28540	\N	Nakory
28785	28540	\N	Podnieśno
28786	28540	\N	Przygody
28787	28540	\N	Sosna-Kicki
28788	28540	\N	Sosna-Korabie
28789	28540	\N	Sosna-Kozółki
28790	28540	\N	Sosna-Trojanki
28791	28540	\N	Stany Duże
28792	28540	\N	Stany Małe
28793	28540	\N	Suchożebry
28794	28540	\N	Wola Suchożebrska
28795	28541	\N	Borki-Kosiorki
28796	28541	\N	Borki-Paduchy
28797	28541	\N	Borki-Sołdy
28798	28541	\N	Ciosny
28799	28541	\N	Daćbogi
28800	28541	\N	Gostchorz
28801	28541	\N	Helenów
28802	28541	\N	Jastrzębie-Kąty
28803	28541	\N	Kaczory
28804	28541	\N	Leśniczówka
28805	28541	\N	Lipniak
28806	28541	\N	Łupiny
28807	28541	\N	Mościbrody
28808	28541	\N	Mroczki
28809	28541	\N	Myrcha
28810	28541	\N	Nowe Okniny
28811	28541	\N	Okniny-Podzdrój
28812	28541	\N	Pluty
28813	28541	\N	Radomyśl
28814	28541	\N	Stare Okniny
28815	28541	\N	Stok Wiśniewski
28816	28541	\N	Śmiary
28817	28541	\N	Tworki
28818	28541	\N	Wiśniew
28819	28541	\N	Wiśniew-Kolonia
28820	28541	\N	Wólka Wiśniewska
28821	28541	\N	Wólka Wołyniecka
28822	28541	\N	Zabłocie
28823	28542	\N	Borki
28824	28542	\N	Brodki
28825	28542	\N	Budy
28826	28542	\N	Czajków
28827	28542	\N	Helenów
28828	28542	\N	Jedlina
28829	28542	\N	Kaczory
28830	28542	\N	Kamieniec
28831	28542	\N	Kochany
28832	28542	\N	Kołodziąż
28833	28542	\N	Lipiny
28834	28542	\N	Łomnica
28835	28542	\N	Młynki
28836	28542	\N	Nowiny
28837	28542	\N	Oleśnica
28838	28542	\N	Ruda Szostkowska
28839	28542	\N	Ruda Wolińska
28840	28542	\N	Rudnik Duży
28841	28542	\N	Rudnik Mały
28842	28542	\N	Seroczyn
28843	28542	\N	Soćki
28844	28542	\N	Szostek
28845	28542	\N	Toki
28846	28542	\N	Wodynie
28847	28542	\N	Wola Serocka
28848	28542	\N	Wola Wodyńska
28849	28542	\N	Żebraczka
28850	28543	\N	Borki-Kosy
28851	28543	\N	Borki-Wyrki
28852	28543	\N	Bzów
28853	28543	\N	Choja
28854	28543	\N	Chromna
28855	28543	\N	Cielemęc
28856	28543	\N	Czuryły
28857	28543	\N	Dziewule
28858	28543	\N	Grochówka
28859	28543	\N	Grodzisk
28860	28543	\N	Izdebki-Błażeje
28861	28543	\N	Izdebki-Kosny
28862	28543	\N	Izdebki-Kośmidry
28863	28543	\N	Izdebki-Wąsy
28864	28543	\N	Januszówka
28865	28543	\N	Jasionka
28866	28543	\N	Karcze
28867	28543	\N	Krzesk-Królowa Niwa
28868	28543	\N	Krzesk-Majątek
28869	28543	\N	Kwasy
28870	28543	\N	Lipiny
28871	28543	\N	Lucynów
28872	28543	\N	Łęcznowola
28873	28543	\N	Ługi-Rętki
28874	28543	\N	Ługi Wielkie
28875	28543	\N	Maciejowice
28876	28543	\N	Modrzew
28877	28543	\N	Olędy
28878	28543	\N	Pogonów
28879	28543	\N	Rówce
28880	28543	\N	Rzążew
28881	28543	\N	Smolanka
28882	28543	\N	Sobicze
28883	28543	\N	Stary Krzesk
28884	28543	\N	Tarcze
28885	28543	\N	Tchórzew
28886	28543	\N	Tchórzew-Plewki
28887	28543	\N	Tęczki
28888	28543	\N	Wesółka
28889	28543	\N	Wólka Kamienna
28890	28543	\N	Zawady
28891	28543	\N	Zbuczyn
28892	28543	\N	Zdany
28893	173	\N	Sierpc
28894	173	\N	Gozdowo
28895	173	\N	Mochowo
28896	173	\N	Rościszewo
28897	173	\N	Szczutowo
28898	173	\N	Zawidz
28899	28894	\N	Antoniewo
28900	28894	\N	Białuty
28901	28894	\N	Bombalice
28902	28894	\N	Bonisław
28903	28894	\N	Bronoszewice
28904	28894	\N	Cetlin
28905	28894	\N	Czachorowo
28906	28894	\N	Czachowo
28907	28894	\N	Czarnominek
28908	28894	\N	Dzięgielewo
28909	28894	\N	Głuchowo
28910	28894	\N	Gnaty
28911	28894	\N	Golejewo
28912	28894	\N	Gozdowo
28913	28894	\N	Kolczyn
28914	28894	\N	Kolonia Przybyszewo
28915	28894	\N	Kowalewo-Boguszyce
28916	28894	\N	Kowalewo Podborne
28917	28894	\N	Kowalewo-Skorupki
28918	28894	\N	Kozice
28919	28894	\N	Kuniewo
28920	28894	\N	Kurowo
28921	28894	\N	Kurówko
28922	28894	\N	Lelice
28923	28894	\N	Lisewo Duże
28924	28894	\N	Lisewo Małe
28925	28894	\N	Lisice-Folwark
28926	28894	\N	Łysakowo
28927	28894	\N	Miodusy
28928	28894	\N	Ostrowy
28929	28894	\N	Reczewo
28930	28894	\N	Rempin
28931	28894	\N	Rękawczyn
28932	28894	\N	Rogienice
28933	28894	\N	Rogieniczki
28934	28894	\N	Rycharcice
28935	28894	\N	Smorzewo
28936	28894	\N	Stradzewo
28937	28894	\N	Węgrzynowo
28938	28894	\N	Zakrzewko
28939	28894	\N	Zbójno
28940	28895	\N	Adamowo
28941	28895	\N	Bendorzyn
28942	28895	\N	Bożewo
28943	28895	\N	Bożewo Nowe
28944	28895	\N	Choczeń
28945	28895	\N	Cieślin
28946	28895	\N	Dobaczewo
28947	28895	\N	Dobrzenice Duże
28948	28895	\N	Dobrzenice Małe
28949	28895	\N	Florencja
28950	28895	\N	Gozdy
28951	28895	\N	Grabówiec
28952	28895	\N	Grodnia
28953	28895	\N	Kapuśniki
28954	28895	\N	Kokoszczyn
28955	28895	\N	Ligowo
28956	28895	\N	Ligówko
28957	28895	\N	Lisice Nowe
28958	28895	\N	Łukoszyn
28959	28895	\N	Łukoszyno-Biki
28960	28895	\N	Malanowo Nowe
28961	28895	\N	Malanowo Stare
28962	28895	\N	Malanówko
28963	28895	\N	Mochowo
28964	28895	\N	Mochowo Nowe
28965	28895	\N	Mochowo-Parcele
28966	28895	\N	Myszki
28967	28895	\N	Obręb
28968	28895	\N	Osiek
28969	28895	\N	Rokicie
28970	28895	\N	Romatowo
28971	28895	\N	Sulkowo-Bariany
28972	28895	\N	Sulkowo Rzeczne
28973	28895	\N	Śniechy
28974	28895	\N	Załszyn
28975	28895	\N	Zglenice-Budy
28976	28895	\N	Zglenice Duże
28977	28895	\N	Zglenice Małe
28978	28895	\N	Żabiki
28979	28895	\N	Żółtowo
28980	28895	\N	Żuki
28981	28895	\N	Żurawin
28982	28895	\N	Żurawinek
28983	28896	\N	Babiec Piaseczny
28984	28896	\N	Babiec Rżały
28985	28896	\N	Babiec-Więczanki
28986	28896	\N	Borowo
28987	28896	\N	Bryski
28988	28896	\N	Komorowo
28989	28896	\N	Kownatka
28990	28896	\N	Kuski
28991	28896	\N	Lipniki
28992	28896	\N	Łukomie
28993	28896	\N	Łukomie-Kolonia
28994	28896	\N	Nowe Rościszewo
28995	28896	\N	Nowy Zamość
28996	28896	\N	Ostrów
28997	28896	\N	Pianki
28998	28896	\N	Polik
28999	28896	\N	Puszcza
29000	28896	\N	Rościszewo
29001	28896	\N	Rumunki-Chwały
29002	28896	\N	Rzeszotary-Chwały
29003	28896	\N	Rzeszotary-Gortaty
29004	28896	\N	Rzeszotary-Pszczele
29005	28896	\N	Rzeszotary-Stara Wieś
29006	28896	\N	Rzeszotary-Zawady
29007	28896	\N	Stopin
29008	28896	\N	Śniedzanowo
29009	28896	\N	Topiąca
29010	28896	\N	Września
29011	28896	\N	Zamość
29012	28893	\N	Białe Błoto
29013	28893	\N	Białoskóry
29014	28893	\N	Białyszewo
29015	28893	\N	Białyszewo-Towarzystwo
29016	28893	\N	Bledzewko
29017	28893	\N	Bledzewo
29018	28893	\N	Borkowo Kościelne
29019	28893	\N	Borkowo Wielkie
29020	28893	\N	Dąbrówki
29021	28893	\N	Dębowo
29022	28893	\N	Dziembakowo
29023	28893	\N	Goleszyn
29024	28893	\N	Gorzewo
29025	28893	\N	Grodkowo-Włóki
29026	28893	\N	Grodkowo-Zawisze
29027	28893	\N	Karolewo
29028	28893	\N	Kisielewo
29029	28893	\N	Kręćkowo
29030	28893	\N	Kwaśno
29031	28893	\N	Lipniak
29032	28893	\N	Mieszaki
29033	28893	\N	Mieszczk
29034	28893	\N	Miłobędzyn
29035	28893	\N	Nowe Piastowo
29036	28893	\N	Nowy Susk
29037	28893	\N	Osówka
29038	28893	\N	Pawłowo
29039	28893	\N	Piaski
29040	28893	\N	Podwierzbie
29041	28893	\N	Rachocin
29042	28893	\N	Rydzewo
29043	28893	\N	Stare Piastowo
29044	28893	\N	Studzieniec
29045	28893	\N	Sudragi
29046	28893	\N	Sułocin-Teodory
29047	28893	\N	Sułocin-Towarzystwo
29048	28893	\N	Susk
29049	28893	\N	Szczepanki
29050	28893	\N	Warzyn Kmiecy
29051	28893	\N	Warzyn-Skóry
29052	28893	\N	Wernerowo
29053	28893	\N	Wilczogóra
29054	28893	\N	Żochowo
29055	28893	\N	Sierpc
29056	28897	\N	Agnieszkowo
29057	28897	\N	Białasy
29058	28897	\N	Blinno
29059	28897	\N	Blizno
29060	28897	\N	Całownia
29061	28897	\N	Cisse
29062	28897	\N	Dąbkowa Parowa
29063	28897	\N	Dziki Bór
29064	28897	\N	Gorzeń
29065	28897	\N	Gójsk
29066	28897	\N	Grabal
29067	28897	\N	Grądy
29068	28897	\N	Gugoły
29069	28897	\N	Jaroszewo
29070	28897	\N	Jaźwiny
29071	28897	\N	Józefowo
29072	28897	\N	Karlewo
29073	28897	\N	Łazy
29074	28897	\N	Majewo
29075	28897	\N	Maluszyn
29076	28897	\N	Mierzęcin
29077	28897	\N	Modrzewie
29078	28897	\N	Mościska
29079	28897	\N	Podlesie
29080	28897	\N	Słupia
29081	28897	\N	Stara Wola
29082	28897	\N	Stare Grądy
29083	28897	\N	Szczechowo
29084	28897	\N	Szczutowo
29085	28897	\N	Zawady
29086	28898	\N	Budy Milewskie
29087	28898	\N	Budy Piaseczne
29088	28898	\N	Chabowo Świniary
29089	28898	\N	Gołocin
29090	28898	\N	Grabowo
29091	28898	\N	Grąbiec
29092	28898	\N	Gutowo-Górki
29093	28898	\N	Gutowo-Stradzyno
29094	28898	\N	Jaworowo Jastrzębie
29095	28898	\N	Jaworowo-Kłódź
29096	28898	\N	Jaworowo-Kolonia
29097	28898	\N	Jaworowo-Lipa
29098	28898	\N	Jeżewo
29099	28898	\N	Kęsice
29100	28898	\N	Kosemin
29101	28898	\N	Kosmaczewo
29102	28898	\N	Krajewice Duże
29103	28898	\N	Krajewice Małe
29104	28898	\N	Majki
29105	28898	\N	Majki Duże
29106	28898	\N	Majki Małe
29107	28898	\N	Makomazy
29108	28898	\N	Mańkowo
29109	28898	\N	Milewko
29110	28898	\N	Milewo
29111	28898	\N	Młotkowo-Kolonia
29112	28898	\N	Młotkowo-Wieś
29113	28898	\N	Nowe Kowalewo
29114	28898	\N	Nowe Zgagowo
29115	28898	\N	Orłowo
29116	28898	\N	Osiek
29117	28898	\N	Osiek-Parcele
29118	28898	\N	Osiek Piaseczny
29119	28898	\N	Osiek-Włostybory
29120	28898	\N	Ostrowy
29121	28898	\N	Petrykozy
29122	28898	\N	Rekowo
29123	28898	\N	Skoczkowo
29124	28898	\N	Słupia
29125	28898	\N	Stare Chabowo
29126	28898	\N	Stropkowo
29127	28898	\N	Szumanie
29128	28898	\N	Szumanie-Bakalary
29129	28898	\N	Szumanie-Pustoły
29130	28898	\N	Wola Grąbiecka
29131	28898	\N	Zalesie
29132	28898	\N	Zawidz Kościelny
29133	28898	\N	Zawidz Mały
29134	28898	\N	Zgagowo-Wieś
29135	28898	\N	Żabowo
29136	28898	\N	Żytowo
29137	28898	\N	Zawidz
29138	174	\N	Sochaczew
29139	174	\N	Brochów
29140	174	\N	Iłów
29141	174	\N	Młodzieszyn
29142	174	\N	Nowa Sucha
29143	174	\N	Rybno
29144	174	\N	Teresin
29145	29138	\N	Sochaczew
29146	29139	\N	Andrzejów
29147	29139	\N	Bieliny
29148	29139	\N	Brochocin
29149	29139	\N	Brochów
29150	29139	\N	Brochów-Kolonia
29151	29139	\N	Famułki Brochowskie
29152	29139	\N	Famułki Królewskie
29153	29139	\N	Famułki Łazowskie
29154	29139	\N	Gorzewnica
29155	29139	\N	Górki
29156	29139	\N	Hilarów
29157	29139	\N	Janów
29158	29139	\N	Konary
29159	29139	\N	Kromnów
29160	29139	\N	Lasocin
29161	29139	\N	Łasice
29162	29139	\N	Malanowo
29163	29139	\N	Miszory
29164	29139	\N	Nowa Wieś-Śladów
29165	29139	\N	Olszowiec
29166	29139	\N	Piaski Duchowne
29167	29139	\N	Piaski Królewskie
29168	29139	\N	Plecewice
29169	29139	\N	Przęsławice
29170	29139	\N	Sianno
29171	29139	\N	Śladów
29172	29139	\N	Tułowice
29173	29139	\N	Wilcze Śladowskie
29174	29139	\N	Wilcze Tułowskie
29175	29139	\N	Władysławów
29176	29139	\N	Wólka Smolana
29177	29140	\N	Aleksandrów
29178	29140	\N	Arciechów
29179	29140	\N	Arciechówek
29180	29140	\N	Białocin
29181	29140	\N	Bieniew
29182	29140	\N	Brzozowiec
29183	29140	\N	Brzozów A
29184	29140	\N	Brzozówek
29185	29140	\N	Brzozów Nowy
29186	29140	\N	Brzozów Stary
29187	29140	\N	Budy Iłowskie
29188	29140	\N	Dobki
29189	29140	\N	Emilianów
29190	29140	\N	Gilówka Dolna
29191	29140	\N	Gilówka Górna
29192	29140	\N	Giżyce
29193	29140	\N	Giżyczki
29194	29140	\N	Henryków
29195	29140	\N	Iłów
29196	29140	\N	Kaptury
29197	29140	\N	Karłowo
29198	29140	\N	Kępa Karolińska
29199	29140	\N	Krzyżyk Iłowski
29200	29140	\N	Lasotka
29201	29140	\N	Leśniaki
29202	29140	\N	Lubatka
29203	29140	\N	Łady
29204	29140	\N	Łaziska
29205	29140	\N	Miękinki
29206	29140	\N	Miękiny
29207	29140	\N	Narty
29208	29140	\N	Obory
29209	29140	\N	Olszowiec
29210	29140	\N	Olunin
29211	29140	\N	Paulinka
29212	29140	\N	Pieczyska Iłowskie
29213	29140	\N	Pieczyska Łowickie
29214	29140	\N	Piotrów
29215	29140	\N	Piskorzec
29216	29140	\N	Przejma
29217	29140	\N	Rokocina
29218	29140	\N	Rzepki
29219	29140	\N	Sadowo
29220	29140	\N	Sewerynów
29221	29140	\N	Stegna
29222	29140	\N	Suchodół
29223	29140	\N	Szarglew
29224	29140	\N	Uderz
29225	29140	\N	Wieniec
29226	29140	\N	Wisowa
29227	29140	\N	Władysławów
29228	29140	\N	Wola Ładowska
29229	29140	\N	Wołyńskie
29230	29140	\N	Wszeliwy
29231	29140	\N	Zalesie
29232	29140	\N	Załusków
29233	29141	\N	Adamowa Góra
29234	29141	\N	Bibiampol
29235	29141	\N	Bieliny
29236	29141	\N	Helenka
29237	29141	\N	Helenów
29238	29141	\N	Janów
29239	29141	\N	Januszew
29240	29141	\N	Juliopol
29241	29141	\N	Justynów
29242	29141	\N	Kamion
29243	29141	\N	Leontynów
29244	29141	\N	Marysin
29245	29141	\N	Mistrzewice
29246	29141	\N	Młodzieszyn
29247	29141	\N	Młodzieszynek
29248	29141	\N	Nowa Wieś
29249	29141	\N	Nowe Mistrzewice
29250	29141	\N	Olszynki
29251	29141	\N	Radziwiłka
29252	29141	\N	Rokicina
29253	29141	\N	Skutki
29254	29141	\N	Stare Budy
29255	29141	\N	Witkowice
29256	29142	\N	Nazwa Miejscowości
29257	29142	\N	Antoniew
29258	29142	\N	Borzymówka
29259	29142	\N	Braki
29260	29142	\N	Glinki
29261	29142	\N	Kolonia Gradowska
29262	29142	\N	Kornelin
29263	29142	\N	Kościelna Góra
29264	29142	\N	Kozłów Biskupi
29265	29142	\N	Kozłów Szlachecki
29266	29142	\N	Kurdwanów
29267	29142	\N	Leonów
29268	29142	\N	Marysinek
29269	29142	\N	Mizerka
29270	29142	\N	Nowa Sucha
29271	29142	\N	Nowy Białynin
29272	29142	\N	Nowy Dębsk
29273	29142	\N	Nowy Kozłów Drugi
29274	29142	\N	Nowy Kozłów Pierwszy
29275	29142	\N	Nowy Żylin
29276	29142	\N	Okopy
29277	29142	\N	Orłów
29278	29142	\N	Rokotów
29279	29142	\N	Roztropna
29280	29142	\N	Stara Sucha
29281	29142	\N	Stary Białynin
29282	29142	\N	Stary Dębsk
29283	29142	\N	Stary Żylin
29284	29142	\N	Szeligi
29285	29142	\N	Wikcinek
29286	29142	\N	Zakrzew
29287	29143	\N	Aleksandrów
29288	29143	\N	Antosin
29289	29143	\N	Bronisławy
29290	29143	\N	Cypriany
29291	29143	\N	Ćmiszew-Parcel
29292	29143	\N	Ćmiszew Rybnowski
29293	29143	\N	Erminów
29294	29143	\N	Jasieniec
29295	29143	\N	Józin
29296	29143	\N	Kamieńszczyzna
29297	29143	\N	Karolków Rybnowski
29298	29143	\N	Karolków Szwarocki
29299	29143	\N	Konstantynów
29300	29143	\N	Koszajec
29301	29143	\N	Ludwików
29302	29143	\N	Matyldów
29303	29143	\N	Nowa Wieś
29304	29143	\N	Nowy Szwarocin
29305	29143	\N	Rybionek
29306	29143	\N	Rybno
29307	29143	\N	Sarnów
29308	29143	\N	Stary Szwarocin
29309	29143	\N	Wesoła
29310	29143	\N	Wężyki
29311	29143	\N	Złota
29312	29138	\N	Altanka
29313	29138	\N	Andrzejów Duranowski
29314	29138	\N	Bielice
29315	29138	\N	Bogdaniec
29316	29138	\N	Bronisławy
29317	29138	\N	Chodakówek
29318	29138	\N	Chrzczany
29319	29138	\N	Czerwonka-Parcel
29320	29138	\N	Czerwonka-Wieś
29321	29138	\N	Czyste
29322	29138	\N	Dachowa
29323	29138	\N	Duranów
29324	29138	\N	Dzięglewo
29325	29138	\N	Feliksów
29326	29138	\N	Gawłów
29327	29138	\N	Ignacówka
29328	29138	\N	Janaszówek
29329	29138	\N	Janówek Duranowski
29330	29138	\N	Jeżówka
29331	29138	\N	Karwowo
29332	29138	\N	Kaźmierów
29333	29138	\N	Kąty
29334	29138	\N	Kożuszki-Kolonia
29335	29138	\N	Kożuszki-Parcel
29336	29138	\N	Kuznocin
29337	29138	\N	Lubiejew
29338	29138	\N	Mokas
29339	29138	\N	Nowe Mostki
29340	29138	\N	Orły-Cesin
29341	29138	\N	Pilawice
29342	29138	\N	Rozlazłów
29343	29138	\N	Sielice
29344	29138	\N	Sochaczew-Wieś
29345	29138	\N	Władysławów
29346	29138	\N	Wojtówka
29347	29138	\N	Wyczółki
29348	29138	\N	Wyjazd
29349	29138	\N	Wymysłów
29350	29138	\N	Zosin
29351	29138	\N	Żdżarów
29352	29138	\N	Żelazowa Wola
29353	29138	\N	Żuków
29354	29144	\N	Budki Piaseckie
29355	29144	\N	Dębówka
29356	29144	\N	Elżbietów
29357	29144	\N	Gaj
29358	29144	\N	Granice
29359	29144	\N	Izbiska
29360	29144	\N	Kawęczyn
29361	29144	\N	Lisice
29362	29144	\N	Ludwików
29363	29144	\N	Maszna
29364	29144	\N	Maurycew
29365	29144	\N	Mikołajew
29366	29144	\N	Nowa Piasecznica
29367	29144	\N	Nowe Gnatowice
29368	29144	\N	Nowe Paski
29369	29144	\N	Paprotnia
29370	29144	\N	Pawłowice
29371	29144	\N	Pawłówek
29372	29144	\N	Seroki-Parcela
29373	29144	\N	Seroki-Wieś
29374	29144	\N	Skotniki
29375	29144	\N	Skrzelew
29376	29144	\N	Stara Piasecznica
29377	29144	\N	Stare Paski
29378	29144	\N	Strugi
29379	29144	\N	Szymanów
29380	29144	\N	Teresin
29381	29144	\N	Teresin-Gaj
29382	29144	\N	Topołowa
29383	29144	\N	Witoldów
29384	175	\N	Sokołów Podlaski
29385	175	\N	Bielany
29386	175	\N	Ceranów
29387	175	\N	Jabłonna Lacka
29388	175	\N	Kosów Lacki
29389	175	\N	Repki
29390	175	\N	Sabnie
29391	175	\N	Sterdyń
29392	29384	\N	Sokołów Podlaski
29393	29385	\N	Bielany-Jarosławy
29394	29385	\N	Bielany-Wąsy
29395	29385	\N	Bielany-Żyłaki
29396	29385	\N	Błonie Duże
29397	29385	\N	Błonie Małe
29398	29385	\N	Brodacze
29399	29385	\N	Dmochy-Rętki
29400	29385	\N	Dmochy-Rogale
29401	29385	\N	Korabie
29402	29385	\N	Kowiesy
29403	29385	\N	Kożuchów
29404	29385	\N	Kożuchówek
29405	29385	\N	Księżopole-Budki
29406	29385	\N	Księżopole-Komory
29407	29385	\N	Kudelczyn
29408	29385	\N	Paczuski Duże
29409	29385	\N	Patrykozy
29410	29385	\N	Patrykozy-Kolonia
29411	29385	\N	Rozbity Kamień
29412	29385	\N	Ruciany
29413	29385	\N	Ruda-Kolonia
29414	29385	\N	Sikory
29415	29385	\N	Trebień
29416	29385	\N	Urbanki
29417	29385	\N	Wańtuchy
29418	29385	\N	Wiechetki Duże
29419	29385	\N	Wiechetki Małe
29420	29385	\N	Wojewódki Dolne
29421	29385	\N	Wojewódki Górne
29422	29385	\N	Wyszomierz
29423	29385	\N	Bielany
29424	29386	\N	Adolfów
29425	29386	\N	Bór
29426	29386	\N	Ceranów
29427	29386	\N	Długie Grodzieckie
29428	29386	\N	Długie Grzymki
29429	29386	\N	Długie Kamieńskie
29430	29386	\N	Garnek
29431	29386	\N	Holendernia
29432	29386	\N	Lubiesza
29433	29386	\N	Majdan
29434	29386	\N	Natolin
29435	29386	\N	Noski
29436	29386	\N	Olszew
29437	29386	\N	Podorle
29438	29386	\N	Przewóz Nurski
29439	29386	\N	Pustelnik
29440	29386	\N	Radość
29441	29386	\N	Rytele-Olechny
29442	29386	\N	Rytele Suche
29443	29386	\N	Rytele-Wszołki
29444	29386	\N	Wólka Nadbużna
29445	29386	\N	Wólka Rytelska
29446	29386	\N	Wszebory
29447	29386	\N	Zawady
29448	29387	\N	Bujały-Gniewosze
29449	29387	\N	Bujały-Mikosze
29450	29387	\N	Czekanów
29451	29387	\N	Czortki
29452	29387	\N	Dzierzby Szlacheckie
29453	29387	\N	Dzierzby-Włościańskie
29454	29387	\N	Gródek
29455	29387	\N	Gródek-Dwór
29456	29387	\N	Gródek-Kolonia
29457	29387	\N	Jabłonna Lacka
29458	29387	\N	Jabłonna Średnia
29459	29387	\N	Kolonia Toczyski Średnie
29460	29387	\N	Krzemień-Wieś
29461	29387	\N	Krzemień-Zagacie
29462	29387	\N	Ludwinów
29463	29387	\N	Łuzki
29464	29387	\N	Łuzki-Kolonia
29465	29387	\N	Mołożew-Dwór
29466	29387	\N	Mołożew-Wieś
29467	29387	\N	Morszków
29468	29387	\N	Niemirki
29469	29387	\N	Nowomodna
29470	29387	\N	Stara Jabłonna
29471	29387	\N	Teofilówka
29472	29387	\N	Toczyski Podborne
29473	29387	\N	Toczyski Średnie
29474	29387	\N	Tończa
29475	29387	\N	Wierzbice-Guzy
29476	29387	\N	Wierzbice-Strupki
29477	29387	\N	Wieska-Wieś
29478	29387	\N	Wirów
29479	29387	\N	Wirów-Klasztor
29480	29387	\N	Władysławów
29481	29388	\N	Kosów Lacki
29482	29388	\N	Albinów
29483	29388	\N	Bojary
29484	29388	\N	Buczyn Dworski
29485	29388	\N	Buczyn Szlachecki
29486	29388	\N	Chruszczewka Szlachecka
29487	29388	\N	Chruszczewka Włościańska
29488	29388	\N	Dębe
29489	29388	\N	Dybów
29490	29388	\N	Grzymały
29491	29388	\N	Guty
29492	29388	\N	Henrysin
29493	29388	\N	Jakubiki
29494	29388	\N	Kosów-Hulidów
29495	29388	\N	Kosów Ruski
29496	29388	\N	Krupy
29497	29388	\N	Kutyski
29498	29388	\N	Łomna
29499	29388	\N	Nowa Maliszewa
29500	29388	\N	Nowa Wieś
29501	29388	\N	Nowy Buczyn
29502	29388	\N	Rytele Święckie
29503	29388	\N	Sągole
29504	29388	\N	Stara Maliszewa
29505	29388	\N	Telaki
29506	29388	\N	Tosie
29507	29388	\N	Trzciniec Duży
29508	29388	\N	Trzciniec Mały
29509	29388	\N	Wólka Dolna
29510	29388	\N	Wólka Okrąglik
29511	29388	\N	Wyszomierz
29512	29388	\N	Żochy
29513	29389	\N	Baczki
29514	29389	\N	Bałki
29515	29389	\N	Bohy
29516	29389	\N	Borychów
29517	29389	\N	Czaple-Andrelewicze
29518	29389	\N	Czaple-Kolonia
29519	29389	\N	Frankopol
29520	29389	\N	Gałki
29521	29389	\N	Ignacopol
29522	29389	\N	Jasień
29523	29389	\N	Józin
29524	29389	\N	Kamianka
29525	29389	\N	Kanabród
29526	29389	\N	Karskie
29527	29389	\N	Kobylany Górne
29528	29389	\N	Kobylany-Skorupki
29529	29389	\N	Kolonie Sawickie
29530	29389	\N	Liszki
29531	29389	\N	Miotki
29532	29389	\N	Mołomotki
29533	29389	\N	Mołomotki-Dwór
29534	29389	\N	Ostrowiec
29535	29389	\N	Ostrówek
29536	29389	\N	Pieńki Skrzeszewskie
29537	29389	\N	Remiszew Duży
29538	29389	\N	Remiszew Mały
29539	29389	\N	Repki
29540	29389	\N	Rogów
29541	29389	\N	Rudniki
29542	29389	\N	Salusin
29543	29389	\N	Sawice-Bronisze
29544	29389	\N	Sawice-Dwór
29545	29389	\N	Sawice-Wieś
29546	29389	\N	Skorupki
29547	29389	\N	Skrzeszew
29548	29389	\N	Skrzeszew E
29549	29389	\N	Skwierczyn-Dwór
29550	29389	\N	Skwierczyn-Wieś
29551	29389	\N	Smuniew
29552	29389	\N	Szkopy
29553	29389	\N	Szymanówka
29554	29389	\N	Wasilew Skrzeszewski
29555	29389	\N	Wasilew Szlachecki
29556	29389	\N	Wierzbice Górne
29557	29389	\N	Wirów-Kolonia
29558	29389	\N	Włodki
29559	29389	\N	Wyrozęby-Konaty
29560	29389	\N	Wyrozęby-Podawce
29561	29389	\N	Zawady
29562	29389	\N	Żółkwy
29563	29390	\N	Chmielnik
29564	29390	\N	Emilin
29565	29390	\N	Grodzisk
29566	29390	\N	Hilarów
29567	29390	\N	Hołowienki
29568	29390	\N	Jadwisin
29569	29390	\N	Klepki
29570	29390	\N	Kolonia Hołowienki
29571	29390	\N	Kolonia Kurowice
29572	29390	\N	Kolonia Zembrów
29573	29390	\N	Kostki-Pieńki
29574	29390	\N	Kupientyn
29575	29390	\N	Kupientyn-Kolonia
29576	29390	\N	Kurowice
29577	29390	\N	Nieciecz-Dwór
29578	29390	\N	Nieciecz Włościańska
29579	29390	\N	Niewiadoma
29580	29390	\N	Pieńki Suchodolskie
29581	29390	\N	Poświątne
29582	29390	\N	Sabnie
29583	29390	\N	Stasin
29584	29390	\N	Suchodół Szlachecki
29585	29390	\N	Suchodół Włościański
29586	29390	\N	Tchórznica Szlachecka
29587	29390	\N	Tchórznica Włościańska
29588	29390	\N	Wymysły
29589	29390	\N	Zembrów
29590	29384	\N	Bachorza
29591	29384	\N	Bartosz
29592	29384	\N	Brzozów
29593	29384	\N	Brzozów-Kolonia
29594	29384	\N	Budy Kupientyńskie
29595	29384	\N	Chmielew
29596	29384	\N	Czerwonka
29597	29384	\N	Dąbrowa
29598	29384	\N	Dolne Pole
29599	29384	\N	Dziegietnia
29600	29384	\N	Dziegietnia-Kolonia
29601	29384	\N	Emilianów
29602	29384	\N	Grochów Szlachecki
29603	29384	\N	Grochów Włościański
29604	29384	\N	Justynów
29605	29384	\N	Karlusin
29606	29384	\N	Karolew
29607	29384	\N	Kolonia Dąbrowa
29608	29384	\N	Kosierady Wielkie
29609	29384	\N	Kostki
29610	29384	\N	Krasnodęby-Kasmy
29611	29384	\N	Krasnodęby-Rafały
29612	29384	\N	Krasnodęby-Sypytki
29613	29384	\N	Krasów
29614	29384	\N	Łubianki
29615	29384	\N	Nowa Wieś
29616	29384	\N	Podkupientyn
29617	29384	\N	Podrogów
29618	29384	\N	Pogorzel
29619	29384	\N	Przeździatka-Kolonia
29620	29384	\N	Przeździatka-Leśniczówka
29621	29384	\N	Przywózki
29622	29384	\N	Skibniew-Kurcze
29623	29384	\N	Skibniew-Podawce
29624	29384	\N	Walerów
29625	29384	\N	Węże
29626	29384	\N	Wólka Miedzyńska
29627	29384	\N	Wyrąb
29628	29384	\N	Ząbków
29629	29384	\N	Ząbków-Kolonia
29630	29384	\N	Żanecin
29631	29391	\N	Białobrzegi
29632	29391	\N	Borki
29633	29391	\N	Chądzyń
29634	29391	\N	Dąbrówka
29635	29391	\N	Dzięcioły Bliższe
29636	29391	\N	Dzięcioły Dalsze
29637	29391	\N	Dzięcioły-Kolonia
29638	29391	\N	Golanki
29639	29391	\N	Granie
29640	29391	\N	Grądy
29641	29391	\N	Kamieńczyk
29642	29391	\N	Kiełpiniec
29643	29391	\N	Kiezie
29644	29391	\N	Kolonia Dzięcioły Dalsze
29645	29391	\N	Kolonia Kamieńczykowska
29646	29391	\N	Kolonia Kuczaby
29647	29391	\N	Kolonia Paderewek
29648	29391	\N	Kolonia Stary Ratyniec
29649	29391	\N	Kuczaby
29650	29391	\N	Lebiedzie
29651	29391	\N	Lebiedzie-Kolonia
29652	29391	\N	Łazów
29653	29391	\N	Łazówek
29654	29391	\N	Matejki
29655	29391	\N	Nowe Mursy
29656	29391	\N	Nowy Ratyniec
29657	29391	\N	Paderew
29658	29391	\N	Paderewek
29659	29391	\N	Paulinów
29660	29391	\N	Seroczyn
29661	29391	\N	Seroczyn-Kolonia
29662	29391	\N	Sewerynówka
29663	29391	\N	Stare Mursy
29664	29391	\N	Stary Ratyniec
29665	29391	\N	Stelągi
29666	29391	\N	Stelągi-Kolonia
29667	29391	\N	Sterdyń
29668	29391	\N	Szwejki
29669	29391	\N	Zaleś
29670	176	\N	Chlewiska
29671	176	\N	Jastrząb
29672	176	\N	Mirów
29673	176	\N	Orońsko
29674	176	\N	Szydłowiec
29675	29670	\N	Aleksandrów
29676	29670	\N	Antoniów
29677	29670	\N	Borki
29678	29670	\N	Broniów
29679	29670	\N	Budki
29680	29670	\N	Chlewiska
29681	29670	\N	Cukrówka
29682	29670	\N	Huta
29683	29670	\N	Koszorów
29684	29670	\N	Krawara
29685	29670	\N	Leszczyny
29686	29670	\N	Majdanki
29687	29670	\N	Nadolna
29688	29670	\N	Ostałów
29689	29670	\N	Ostałówek
29690	29670	\N	Pawłów
29691	29670	\N	Skłoby
29692	29670	\N	Stanisławów
29693	29670	\N	Stefanków
29694	29670	\N	Sulistrowice
29695	29670	\N	Wola Zagrodnia
29696	29670	\N	Zaława
29697	29670	\N	Zawonia
29698	29671	\N	Gąsawy Plebańskie
29699	29671	\N	Gąsawy Rządowe
29700	29671	\N	Gąsawy Rządowe-Niwy
29701	29671	\N	Jastrząb
29702	29671	\N	Kolonia Kuźnia
29703	29671	\N	Kuźnia
29704	29671	\N	Lipienice
29705	29671	\N	Nowy Dwór
29706	29671	\N	Orłów
29707	29671	\N	Śmiłów
29708	29671	\N	Wola Lipieniecka Duża
29709	29671	\N	Wola Lipieniecka Mała
29710	29672	\N	Bieszków Dolny
29711	29672	\N	Bieszków Górny
29712	29672	\N	Mirówek
29713	29672	\N	Mirów Nowy
29714	29672	\N	Mirów Stary
29715	29672	\N	Rogów
29716	29672	\N	Zbijów Duży
29717	29672	\N	Zbijów Mały
29718	29673	\N	Bąków
29719	29673	\N	Chałupki Łaziskie
29720	29673	\N	Chronów
29721	29673	\N	Chronówek
29722	29673	\N	Chronów-Kolonia
29723	29673	\N	Ciepła
29724	29673	\N	Dobrut
29725	29673	\N	Gozdków
29726	29673	\N	Guzów
29727	29673	\N	Guzów-Kolonia
29728	29673	\N	Helenów
29729	29673	\N	Krogulcza Mokra
29730	29673	\N	Krogulcza Sucha
29731	29673	\N	Łaziska
29732	29673	\N	Orońsko
29733	29673	\N	Śniadków
29734	29673	\N	Tomaszów
29735	29673	\N	Wałsnów
29736	29673	\N	Zaborowie
29737	29674	\N	Szydłowiec
29738	29674	\N	Barak
29739	29674	\N	Chustki
29740	29674	\N	Ciechostowice
29741	29674	\N	Długosz
29742	29674	\N	Hucisko
29743	29674	\N	Jankowice
29744	29674	\N	Jarzębia
29745	29674	\N	Korzyce
29746	29674	\N	Krzcięcin
29747	29674	\N	Łazy
29748	29674	\N	Majdów
29749	29674	\N	Marywil
29750	29674	\N	Mszadla
29751	29674	\N	Omięcin
29752	29674	\N	Rybianka
29753	29674	\N	Sadek
29754	29674	\N	Szydłówek
29755	29674	\N	Świerczek
29756	29674	\N	Świniów
29757	29674	\N	Wilcza Wola
29758	29674	\N	Wola Korzeniowa
29759	29674	\N	Wysocko
29760	29674	\N	Wysoka
29761	29674	\N	Zastronie
29762	29674	\N	Zdziechów
29763	29674	\N	Ziomaki
29764	178	\N	Błonie
29765	178	\N	Izabelin
29766	178	\N	Kampinos
29767	178	\N	Leszno
29768	178	\N	Łomianki
29769	178	\N	Ożarów Mazowiecki
29770	178	\N	Stare Babice
29771	29764	\N	Błonie
29772	29764	\N	Białutki
29773	29764	\N	Białuty
29774	29764	\N	Bieniewice
29775	29764	\N	Bieniewo-Parcela
29776	29764	\N	Bieniewo-Wieś
29777	29764	\N	Błonie-Wieś
29778	29764	\N	Bramki
29779	29764	\N	Cholewy
29780	29764	\N	Dębówka
29781	29764	\N	Górna Wieś
29782	29764	\N	Konstantów
29783	29764	\N	Kopytów
29784	29764	\N	Łaźniew
29785	29764	\N	Łaźniewek
29786	29764	\N	Nowa Górna
29787	29764	\N	Nowa Wieś
29788	29764	\N	Nowe Faszczyce
29789	29764	\N	Nowy Łuszczewek
29790	29764	\N	Pass
29791	29764	\N	Piorunów
29792	29764	\N	Radonice
29793	29764	\N	Radzików
29794	29764	\N	Rochaliki
29795	29764	\N	Rokitno
29796	29764	\N	Rokitno-Majątek
29797	29764	\N	Stare Faszczyce
29798	29764	\N	Stary Łuszczewek
29799	29764	\N	Wawrzyszew
29800	29764	\N	Witki
29801	29764	\N	Wola Łuszczewska
29802	29764	\N	Żukówka
29803	29765	\N	Hornówek
29804	29765	\N	Izabelin
29805	29765	\N	Izabelin B
29806	29765	\N	Izabelin C
29807	29765	\N	Laski
29808	29765	\N	Mościska
29809	29765	\N	Sieraków
29810	29765	\N	Truskaw
29811	29766	\N	Bieliny
29812	29766	\N	Bromierzyk
29813	29766	\N	Budki Żelazowskie
29814	29766	\N	Grabnik
29815	29766	\N	Granica
29816	29766	\N	Józefów
29817	29766	\N	Kampinos
29818	29766	\N	Kampinos A
29819	29766	\N	Karolinów
29820	29766	\N	Kirsztajnów
29821	29766	\N	Komorów
29822	29766	\N	Koszówka
29823	29766	\N	Kwiatkówek
29824	29766	\N	Łazy
29825	29766	\N	Łazy Leśne
29826	29766	\N	Pasikonie
29827	29766	\N	Pindal
29828	29766	\N	Podkampinos
29829	29766	\N	Prusy
29830	29766	\N	Rzęszyce
29831	29766	\N	Skarbikowo
29832	29766	\N	Stare Gnatowice
29833	29766	\N	Strojec
29834	29766	\N	Strzyżew
29835	29766	\N	Szczytno
29836	29766	\N	Wiejca
29837	29766	\N	Wola Pasikońska
29838	29766	\N	Zawady
29839	29767	\N	Białuty
29840	29767	\N	Czarnów
29841	29767	\N	Czarnów-Towarzystwo
29842	29767	\N	Feliksów
29843	29767	\N	Gawartowa Wola
29844	29767	\N	Grabina
29845	29767	\N	Grądki
29846	29767	\N	Grądy
29847	29767	\N	Julinek
29848	29767	\N	Kępiaste
29849	29767	\N	Korfowe
29850	29767	\N	Leszno
29851	29767	\N	Ławy
29852	29767	\N	Łubiec
29853	29767	\N	Marianów
29854	29767	\N	Plewniak
29855	29767	\N	Podrochale
29856	29767	\N	Powązki
29857	29767	\N	Roztoka
29858	29767	\N	Stelmachowo
29859	29767	\N	Szadkówek
29860	29767	\N	Szymanówek
29861	29767	\N	Trzciniec
29862	29767	\N	Walentów
29863	29767	\N	Wąsy-Kolonia
29864	29767	\N	Wąsy-Wieś
29865	29767	\N	Wiktorów
29866	29767	\N	Wilkowa Wieś
29867	29767	\N	Wilków
29868	29767	\N	Wólka
29869	29767	\N	Wyględy
29870	29767	\N	Zaborów
29871	29767	\N	Zaborówek
29872	29768	\N	Łomianki
29873	29768	\N	Dąbrowa
29874	29768	\N	Dziekanów Leśny
29875	29768	\N	Dziekanów Polski
29876	29768	\N	Kępa Kiełpińska
29877	29768	\N	Kiełpin
29878	29768	\N	Kiełpin Poduchowny
29879	29768	\N	Łomianki Dolne
29880	29768	\N	Nowy Dziekanów
29881	29768	\N	Sadowa
29882	29769	\N	Ożarów Mazowiecki
29883	29769	\N	Bronisze
29884	29769	\N	Domaniewek Pierwszy
29885	29769	\N	Duchnice
29886	29769	\N	Gołaszew
29887	29769	\N	Jawczyce
29888	29769	\N	Józefów
29889	29769	\N	Kaputy
29890	29769	\N	Konotopa
29891	29769	\N	Koprki
29892	29769	\N	Kręczki
29893	29769	\N	Macierzysz
29894	29769	\N	Michałówek
29895	29769	\N	Mory
29896	29769	\N	Myszczyn
29897	29769	\N	Ołtarzew
29898	29769	\N	Orły
29899	29769	\N	Ożarów
29900	29769	\N	Pilaszków
29901	29769	\N	Piotrkówek Duży
29902	29769	\N	Piotrkówek Mały
29903	29769	\N	Płochocin
29904	29769	\N	Pogroszew
29905	29769	\N	Pogroszew-Kolonia
29906	29769	\N	Strzykuły
29907	29769	\N	Szeligi
29908	29769	\N	Święcice
29909	29769	\N	Umiastów
29910	29769	\N	Wieruchów
29911	29769	\N	Wolica
29912	29769	\N	Wolskie
29913	29770	\N	Babice Nowe
29914	29770	\N	Blizne Jasińskiego
29915	29770	\N	Blizne Łaszczyńskiego
29916	29770	\N	Borzęcin
29917	29770	\N	Borzęcin Duży
29918	29770	\N	Borzęcin Mały
29919	29770	\N	Buda
29920	29770	\N	Janów
29921	29770	\N	Klaudyn
29922	29770	\N	Koczargi Nowe
29923	29770	\N	Koczargi Stare
29924	29770	\N	Kwirynów
29925	29770	\N	Latchorzew
29926	29770	\N	Lipków
29927	29770	\N	Lubiczów
29928	29770	\N	Mariew
29929	29770	\N	Stanisławów
29930	29770	\N	Stare Babice
29931	29770	\N	Topolin
29932	29770	\N	Wierzbin
29933	29770	\N	Wojcieszyn
29934	29770	\N	Zalesie
29935	29770	\N	Zielonki
29936	29770	\N	Zielonki-Parcela
29937	29770	\N	Zielonki-Wieś
29938	181	\N	Węgrów
29939	181	\N	Grębków
29940	181	\N	Korytnica
29941	181	\N	Liw
29942	181	\N	Łochów
29943	181	\N	Miedzna
29944	181	\N	Sadowne
29945	181	\N	Stoczek
29946	181	\N	Wierzbno
29947	29938	\N	Węgrów
29948	29939	\N	Aleksandrówka
29949	29939	\N	Chojeczno-Cesarze
29950	29939	\N	Chojeczno-Sybilaki
29951	29939	\N	Gałki
29952	29939	\N	Grębków
29953	29939	\N	Grodzisk
29954	29939	\N	Jabłonna
29955	29939	\N	Kolonia Gałki
29956	29939	\N	Kolonia Polków-Sagały
29957	29939	\N	Kolonia Sinołęka
29958	29939	\N	Kopcie
29959	29939	\N	Kózki
29960	29939	\N	Kwaśnianka
29961	29939	\N	Leśnogóra
29962	29939	\N	Nowa Sucha
29963	29939	\N	Nowa Trzcianka
29964	29939	\N	Ogródek
29965	29939	\N	Oszczerze
29966	29939	\N	Piotrowice
29967	29939	\N	Pobratymy
29968	29939	\N	Podsusze
29969	29939	\N	Polków-Daćbogi
29970	29939	\N	Polków-Sagały
29971	29939	\N	Proszew A
29972	29939	\N	Proszew B
29973	29939	\N	Słuchocin
29974	29939	\N	Stara Sucha
29975	29939	\N	Stara Trzcianka
29976	29939	\N	Stawiska
29977	29939	\N	Stoczek
29978	29939	\N	Suchodół
29979	29939	\N	Trzebucza
29980	29939	\N	Ulaski
29981	29939	\N	Zagoździe
29982	29939	\N	Ziomaki
29983	29939	\N	Żarnówka
29984	29940	\N	Adampol
29985	29940	\N	Bednarze
29986	29940	\N	Chmielew
29987	29940	\N	Czaple
29988	29940	\N	Dąbrowa
29989	29940	\N	Decie
29990	29940	\N	Górki Borze
29991	29940	\N	Górki Grubaki
29992	29940	\N	Górki Średnie
29993	29940	\N	Jaczew
29994	29940	\N	Jugi
29995	29940	\N	Kąty
29996	29940	\N	Kietlanka
29997	29940	\N	Kolonia Paplin
29998	29940	\N	Komory
29999	29940	\N	Korytnica
30000	29940	\N	Kruszew
30001	29940	\N	Kupce
30002	29940	\N	Kwaśnianka
30003	29940	\N	Leśniczówka Turna
30004	29940	\N	Leśniki
30005	29940	\N	Lipniki
30006	29940	\N	Maksymilianów
30007	29940	\N	Nojszew
30008	29940	\N	Nowy Świętochów
30009	29940	\N	Paplin
30010	29940	\N	Pniewnik
30011	29940	\N	Połazie Świętochowskie
30012	29940	\N	Rabiany
30013	29940	\N	Rąbież
30014	29940	\N	Roguszyn
30015	29940	\N	Rowiska
30016	29940	\N	Sekłak
30017	29940	\N	Sewerynów
30018	29940	\N	Stary Świętochów
30019	29940	\N	Szczurów
30020	29940	\N	Trawy
30021	29940	\N	Turna
30022	29940	\N	Wielądki
30023	29940	\N	Wola Korytnicka
30024	29940	\N	Wypychy
30025	29940	\N	Zakrzew
30026	29940	\N	Zalesie
30027	29940	\N	Żabokliki
30028	29940	\N	Żelazów
30029	29941	\N	Borzychy
30030	29941	\N	Ignasin
30031	29941	\N	Janowo
30032	29941	\N	Jarnice
30033	29941	\N	Jartypory
30034	29941	\N	Krypy
30035	29941	\N	Kucyk
30036	29941	\N	Liw
30037	29941	\N	Ludwinów
30038	29941	\N	Maciejów
30039	29941	\N	Ossolin
30040	29941	\N	Pierzchały
30041	29941	\N	Połazie
30042	29941	\N	Popielów
30043	29941	\N	Ruchenka
30044	29941	\N	Ruchna
30045	29941	\N	Sitarze
30046	29941	\N	Starawieś
30047	29941	\N	Stary Kantor
30048	29941	\N	Stawy
30049	29941	\N	Szaruty
30050	29941	\N	Śnice
30051	29941	\N	Tończa
30052	29941	\N	Witanki
30053	29941	\N	Wyszków
30054	29941	\N	Zając
30055	29941	\N	Zawady
30056	29942	\N	Łochów
30057	29942	\N	Baczki
30058	29942	\N	Barchów
30059	29942	\N	Brzóza
30060	29942	\N	Brzuza
30061	29942	\N	Budziska
30062	29942	\N	Burakowskie
30063	29942	\N	Czaplowizna-Gajówka
30064	29942	\N	Dąbrowa
30065	29942	\N	Gajówka Nadkole
30066	29942	\N	Gwizdały
30067	29942	\N	Jasiorówka
30068	29942	\N	Jerzyska
30069	29942	\N	Jerzyska-Gajówka
30070	29942	\N	Kaczeniec
30071	29942	\N	Kalinowiec
30072	29942	\N	Kaliska
30073	29942	\N	Kamionna
30074	29942	\N	Karczewizna
30075	29942	\N	Kolonia Kamionna
30076	29942	\N	Koszelanka
30077	29942	\N	Laski
30078	29942	\N	Łazy
30079	29942	\N	Łojew
30080	29942	\N	Łojki
30081	29942	\N	Łopianka
30082	29942	\N	Łosiewice
30083	29942	\N	Majdan
30084	29942	\N	Matały
30085	29942	\N	Nadkole
30086	29942	\N	Ogrodniki
30087	29942	\N	Ostrówek
30088	29942	\N	Pogorzelec
30089	29942	\N	Poterka
30090	29942	\N	Samotrzask
30091	29942	\N	Szumin
30092	29942	\N	Twarogi
30093	29942	\N	Wólka Paplińska
30094	29942	\N	Zagrodniki
30095	29942	\N	Zambrzyniec
30096	29943	\N	Glina
30097	29943	\N	Miedzna
30098	29943	\N	Międzyleś
30099	29943	\N	Orzeszówka
30100	29943	\N	Poszewka
30101	29943	\N	Rostki
30102	29943	\N	Syberia
30103	29943	\N	Tchórzowa
30104	29943	\N	Tchórzowa-Gajówka
30105	29943	\N	Ugoszcz
30106	29943	\N	Ugoszcz-Gajówka
30107	29943	\N	Warchoły
30108	29943	\N	Wola Orzeszowska
30109	29943	\N	Wrotnów
30110	29943	\N	Wrotnówek-Gajówka
30111	29943	\N	Wrzoski
30112	29943	\N	Zuzułka
30113	29943	\N	Żeleźniki
30114	29944	\N	Bojewo
30115	29944	\N	Czaplowizna
30116	29944	\N	Gać
30117	29944	\N	Grabiny
30118	29944	\N	Klin
30119	29944	\N	Kocielnik
30120	29944	\N	Kolonia Złotki
30121	29944	\N	Kołodziąż
30122	29944	\N	Kołodziąż-Rybie
30123	29944	\N	Krupińskie
30124	29944	\N	Majdan Kiełczewski
30125	29944	\N	Morzyczyn Włościański
30126	29944	\N	Morzyczyn-Włóki
30127	29944	\N	Ocięte
30128	29944	\N	Orzełek
30129	29944	\N	Płatkownica
30130	29944	\N	Rażny
30131	29944	\N	Sadoleś
30132	29944	\N	Sadowne
30133	29944	\N	Sokółka
30134	29944	\N	Sójkówek
30135	29944	\N	Szynkarzyzna
30136	29944	\N	Wilczogęby
30137	29944	\N	Zabielowa
30138	29944	\N	Zachoina
30139	29944	\N	Zalesie
30140	29944	\N	Zarzetka
30141	29944	\N	Zieleniec
30142	29944	\N	Złotki
30143	29945	\N	Błotki
30144	29945	\N	Brzózka
30145	29945	\N	Drgicz
30146	29945	\N	Gajówka Wschodnia
30147	29945	\N	Gajówka Zachodnia
30148	29945	\N	Grabiny
30149	29945	\N	Grabowiec
30150	29945	\N	Gruszczyno
30151	29945	\N	Grygrów
30152	29945	\N	Huta Gruszczyno
30153	29945	\N	Kalaty
30154	29945	\N	Kałęczyn
30155	29945	\N	Kazimierzów
30156	29945	\N	Kozołupy
30157	29945	\N	Księżyzna
30158	29945	\N	Lipka-Podborze
30159	29945	\N	Lubierz-Leśniczówka
30160	29945	\N	Majdan
30161	29945	\N	Marianów
30162	29945	\N	Miednik
30163	29945	\N	Mrozowa Wola
30164	29945	\N	Nowe Lipki
30165	29945	\N	Polkowo
30166	29945	\N	Stare Lipki
30167	29945	\N	Stoczek
30168	29945	\N	Toboły-Gajówka
30169	29945	\N	Topór
30170	29945	\N	Wieliczna
30171	29945	\N	Wycech-Gajówka
30172	29945	\N	Zgrzebichy
30173	29945	\N	Żulin
30174	29946	\N	Adamów
30175	29946	\N	Brzeźnik
30176	29946	\N	Cierpięta
30177	29946	\N	Czerwonka
30178	29946	\N	Czerwonka-Folwark
30179	29946	\N	Emin
30180	29946	\N	Filipy
30181	29946	\N	Helenów
30182	29946	\N	Janówek
30183	29946	\N	Jaworek
30184	29946	\N	Józefy
30185	29946	\N	Kaczy Dół
30186	29946	\N	Karczewiec
30187	29946	\N	Kazimierzów
30188	29946	\N	Koszewnica
30189	29946	\N	Krypy
30190	29946	\N	Las Jaworski
30191	29946	\N	Majdan
30192	29946	\N	Nadzieja
30193	29946	\N	Natolin
30194	29946	\N	Orzechów
30195	29946	\N	Ossówno
30196	29946	\N	Pawłówka-Gajówka
30197	29946	\N	Przecze
30198	29946	\N	Rąbież
30199	29946	\N	Sitarze
30200	29946	\N	Skarżyn
30201	29946	\N	Soboń
30202	29946	\N	Stary Dwór
30203	29946	\N	Strupiechów
30204	29946	\N	Sulki
30205	29946	\N	Świdno
30206	29946	\N	Wąsosze
30207	29946	\N	Wierzbno
30208	29946	\N	Wólka
30209	29946	\N	Wyczółki
30210	29946	\N	Wyględówek
30211	179	\N	Kobyłka
30212	179	\N	Marki
30213	179	\N	Ząbki
30214	179	\N	Zielonka
30215	179	\N	Dąbrówka
30216	179	\N	Jadów
30217	179	\N	Klembów
30218	179	\N	Poświętne
30219	179	\N	Radzymin
30220	179	\N	Strachówka
30221	179	\N	Tłuszcz
30222	179	\N	Wołomin
\.


--
-- Name: region_geog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY region_geog
    ADD CONSTRAINT region_geog_pkey PRIMARY KEY (id);


--
-- Name: region_geog_id_parent_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY region_geog
    ADD CONSTRAINT region_geog_id_parent_fkey FOREIGN KEY (id_parent) REFERENCES region_geog(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

