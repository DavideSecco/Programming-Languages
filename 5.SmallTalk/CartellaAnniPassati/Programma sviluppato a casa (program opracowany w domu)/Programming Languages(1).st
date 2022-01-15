<?xml version="1.0"?>

<st-source>
<time-stamp>From VisualWorks® Personal Use Edition, 8.3 of 28 lipca 2017 on 21 listopada 2019 at 19:41:46</time-stamp>


<component-created>
<name>Programming Languages</name> <type>package</type>
</component-created><!-- Package Programming Languages* -->


<component-property>
<name>Programming Languages</name> <type>package</type>
<property>comment</property> <value>'Programs for programming languages.'</value>
</component-property>

<class>
<name>Wielokat</name>
<environment>Smalltalk</environment>
<super>Core.Object</super>
<private>false</private>
<indexed-type>none</indexed-type>
<inst-vars>wierzcholki nazwa obroty </inst-vars>
<class-inst-vars></class-inst-vars>
<imports></imports>
<category>JezykiProgramowania</category>
<attributes>
<package>Programming Languages</package>
</attributes>
</class>

<comment>
<class-id>Wielokat</class-id>
<body>Wielokat is a class with contained all geometric figures. Addictionally the class rotates the figure and prints information about it.
</comment>

<class>
<name>Szesciokat</name>
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
<class-id>Szesciokat</class-id>
<body>Szesciokat is a geometric figure.
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
<body>Kwadrat is a geometric figure. 
</comment>

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="Programming Languages" selector="obrot">obrot

<body package="Programming Languages" selector="drukuj">drukuj

<body package="Programming Languages" selector="nazwa">nazwa

<body package="Programming Languages" selector="nazwa:">nazwa: nowa_nazwa
</methods>

<methods>
<class-id>Wielokat</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize:name:">initialize: liczbaWierzcholkow name: nowaNazwa
</methods>


<methods>
<class-id>Szesciokat class</class-id> <category>instance creation</category>

<body package="Programming Languages" selector="new">new
</methods>


<methods>
<class-id>Szesciokat</class-id> <category>actions</category>

<body package="Programming Languages" selector="pole">pole 
</methods>

<methods>
<class-id>Szesciokat</class-id> <category>arithmetic</category>

<body package="Programming Languages" selector="+">+ figura
</methods>

<methods>
<class-id>Szesciokat</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize:">initialize: bok

<body package="Programming Languages" selector="initialize">initialize
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



</st-source>