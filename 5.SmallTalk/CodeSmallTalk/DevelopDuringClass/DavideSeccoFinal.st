<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.3 of 28 luglio 2017 on 19 gennaio 2022 at 14:39:46</time-stamp>


<component-created>
<name>Programming Languages</name> <type>package</type>
</component-created><!-- Package Programming Languages* -->


<component-property>
<name>Programming Languages</name> <type>package</type>
<property>comment</property> <value>'Programs for the Programming Languages course.'</value>
</component-property>

<class>
<name>Wielokat</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wierzcholki nazwa </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>Programming Languages</package>
</attributes>
</class>

<comment>
<class-id>Wielokat</class-id>
<body>Wielokat has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.Instance Variables:	nazwa	&lt;AbstractProxy | MessageArchiver | Object | ProtoObject&gt;	description of nazwa	wierzcholki	&lt;(Collection of: Point)&gt;	description of wierzcholki</body>
</comment>

<class>
<name>Kwadrat</name>
<environment>Smalltalk</environment>
<super>Wielokat</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>Programming Languages</package>
</attributes>
</class>

<comment>
<class-id>Kwadrat</class-id>
<body>Kwadrat has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.</body>
</comment>

<class>
<name>Romb</name>
<environment>Smalltalk</environment>
<super>Wielokat</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars></inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category></category>
<attributes>
<package>Programming Languages</package>
</attributes>
</class>

<comment>
<class-id>Romb</class-id>
<body>Romb has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.</body>
</comment>

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="Programming Languages" selector="drukuj">drukuj "print"	"stampa le informazioni su un poligono"		Transcript show: nazwa printString.	Transcript show: ''; cr.  	Transcript show: 'Area = '.  	Transcript show: self pole printString.	Transcript show: ''; cr.  	1 to: (wierzcholki capacity) do: [:i|  	Transcript show: ' Nr: '.	Transcript show: (i printString).	Transcript show: ' x: '.	Transcript show: (wierzcholki at: i) x printString.	Transcript show: ' y: '.	Transcript show: (wierzcholki at: i) y printString.	Transcript show: ''; cr.  	]."Stampa""stampa le informazioni su un poligono"</body>

<body package="Programming Languages" selector="przesun:">przesun: vector " = shift = translation"	1 to: (wierzcholki capacity) do: [:i| 		wierzcholki at: i put: (((wierzcholki at: i ) x) + vector x) @ (((wierzcholki at: i) y) + vector y).	].</body>

<body package="Programming Languages" selector="nazwa">nazwa	"podaje nazwe wielokata"	^nazwa</body>

<body package="Programming Languages" selector="nazwa:">nazwa: nowa_nazwa	"ustawia nowa nazwe wielokata"	nazwa:=nowa_nazwa</body>

<body package="Programming Languages" selector="addBag:">addBag: bag	| temp |	temp := self.	bag do: [:i|		temp:=(temp + i)].^temp.</body>
</methods>

<methods>
<class-id>Wielokat</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize:name:">initialize: liczbaWierzcholkow name: nowaNazwa	"konstruktor obiektu - wielokata"	nazwa:=nowaNazwa.	wierzcholki:=Array new: liczbaWierzcholkow.	wierzcholki at: 1 put: 0@0.</body>
</methods>


<methods>
<class-id>Kwadrat</class-id> <category>actions</category>

<body package="Programming Languages" selector="pole">pole	"calculate square area"	"teacher version: ^(wierzcholki at: 2) x squared"	^((wierzcholki at: 2) - (wierzcholki at: 1)) x squared</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>arithmetic</category>

<body package="Programming Languages" selector="+">+ figura	"dodaj 2 figury w sensie pola"	| p |	p:=self pole + figura pole.	^(Kwadrat new) initialize: p sqrt</body>
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize:">initialize: bok	"tworz kwadrat o podanym boku"	super initialize: 4 name: 'Kwadrat'.	wierzcholki at: 2 put: bok@0.	wierzcholki at: 3 put: bok@bok.	wierzcholki at: 4 put: 0@bok.</body>
</methods>


<methods>
<class-id>Romb</class-id> <category>actions</category>

<body package="Programming Languages" selector="pole">pole 			| side height |	side := (wierzcholki at: 2) x - (wierzcholki at: 1) x.	height:=((3 sqrt) / 2)*side.		^ (side * height).</body>
</methods>

<methods>
<class-id>Romb</class-id> <category>arithmetic</category>

<body package="Programming Languages" selector="+">+ figura	"add 2 figures in the sense of a field"	"aggiungi 2 cifre nel senso di un campo"		| newArea side newRhombus |		newArea:=self pole + figura pole.					"Calc the new area"	side := (newArea *2 / (3 sqrt)) sqrt.				"Calc the value of side from the new area"	newRhombus:= (Romb new) initialize: side.		"Create a rhombus"	^newRhombus									"return the rhombus"		"A = ((radice 3 ) / 4 ) L^2 --&gt; this is the formule for triangolo equilatero"</body>
</methods>

<methods>
<class-id>Romb</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize">initialize	"Initialize a newly created instance. This method must answer the receiver."	super initialize.	" *** Replace this comment with the appropriate initialization code *** "	^self</body>

<body package="Programming Languages" selector="initialize:">initialize: bok "== side"		| height |	super initialize: 4 name: 'Romb'.	height:=((3 sqrt)/2)*bok.	wierzcholki at: 2 put: bok@0.	wierzcholki at: 3 put: (bok + (bok/2))@height.	wierzcholki at: 4 put: (bok/2)@height.	"bok == side""wierzcholki == vertice"</body>
</methods>



</st-source>
