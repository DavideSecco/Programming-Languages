Object subclass: #Polygon
	instanceVariableNames: 'vertices name ' "nome superiore or top name(?)"
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ProgrammingLanguages'!			


!Polygon methodsFor: 'initialize-release'!

initialize: NumberOfVertices name: newName
	"object constructor - polygon"
	name:=newName.					"name: = newName"
	vertices:=Array new: NumberOfVertices. "vertices: = Array new: number of vertices."
	vertices at: 1 put: 0@0.! !


!Polygon methodsFor: 'accessing'!
name "name"
	"enter the name of the polygon"
	^name!						
name: new_name
	"sets the new name of the polygon"
	name:=new_name! !


				"quadrato(?)"
Polygon subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ProgrammingLanguages'! "Programming languages"


!Kwadrat methodsFor: 'arithmetic'!

+ figura		

	| p |
	p:=self area + figura area.
	^(Kwadrat new) initialize: p sqrt! !

!Kwadrat methodsFor: 'actions'!
area
	"calculate square area (con una piccola correzione)"
	"count square o quadrato conteggio"
	
	"non sono riuscito..."
	^(vertices at: 2) x squared! !

!Kwadrat methodsFor: 'initialize-release'!

			"lato"
initialize: side
	"create a square with given side"
	"crea un quadrato con il lato dato"
	super initialize: 4 name: 'Kwadrat'.
	vertices at: 2 put: side@0.
	vertices at: 3 put: side@side.
	vertices at: 4 put: 0@side.! !