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
<body>Wielokat has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.
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
<body>Kwadrat has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.
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
<body>Romb has not been commented.  The comment should state the purpose of the class and also explain any unobvious aspects of the implementation.
</comment>

<methods>
<class-id>Wielokat</class-id> <category>accessing</category>

<body package="Programming Languages" selector="drukuj">drukuj "print"

<body package="Programming Languages" selector="przesun:">przesun: vector " = shift = translation"

<body package="Programming Languages" selector="nazwa">nazwa

<body package="Programming Languages" selector="nazwa:">nazwa: nowa_nazwa

<body package="Programming Languages" selector="addBag:">addBag: bag
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
<class-id>Romb</class-id> <category>actions</category>

<body package="Programming Languages" selector="pole">pole 
</methods>

<methods>
<class-id>Romb</class-id> <category>arithmetic</category>

<body package="Programming Languages" selector="+">+ figura
</methods>

<methods>
<class-id>Romb</class-id> <category>initialize-release</category>

<body package="Programming Languages" selector="initialize">initialize

<body package="Programming Languages" selector="initialize:">initialize: bok "== side"
</methods>



</st-source>