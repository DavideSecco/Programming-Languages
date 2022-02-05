<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.3 of 28 luglio 2017 on 20 gennaio 2022 at 10:06:05</time-stamp>


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
<body>
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

<class>
<name>Trojkat</name>
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

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="Programming Languages" selector="drukuj">drukuj

<body package="Programming Languages" selector="nazwa">nazwa

<body package="Programming Languages" selector="obrot">obrot

<body package="Programming Languages" selector="nazwa:">nazwa: nowa_nazwa
</methods>

<methods>
<class-id>Wielokat</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize:name:">initialize: liczbaWierzcholkow name: nowaNazwa
</methods>


<methods>
<class-id>Kwadrat</class-id> <category>actions</category>

<body package="Programming Languages" selector="pole">pole
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>arithmetic</category>

<body package="Programming Languages" selector="+">+ figura
</methods>

<methods>
<class-id>Kwadrat</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize:">initialize: bok
</methods>


<methods>
<class-id>Trojkat class</class-id> <category>instance creation</category>

<body package="Programming Languages" selector="new">new
</methods>


<methods>
<class-id>Trojkat</class-id> <category>actions</category>

<body package="Programming Languages" selector="pole">pole 
</methods>

<methods>
<class-id>Trojkat</class-id> <category>arithmetic</category>

<body package="Programming Languages" selector="+">+ figura
</methods>

<methods>
<class-id>Trojkat</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize">initialize

<body package="Programming Languages" selector="initialize:wysokosc:">initialize: base wysokosc: height
</methods>



</st-source>