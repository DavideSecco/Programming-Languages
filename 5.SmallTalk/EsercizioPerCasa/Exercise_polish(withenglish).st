"Object class is the top most class in smalltalk"
Object subclass: #Polygon 	
	"each instance of Polygon has two variables --> nota che non hanno un tipo"
	instanceVariableNames: 'vertices name ' "nome superiore or top name(?)"
	"Class variables are those values that are shared among all class"
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ProgrammingLanguages'!			

"Initialize-release tells to visual works under which label should be store this method"
!Polygon methodsFor: 'initialize-release'!
"credo che questi siano i due parametri passati a funzione"
initialize: numberOfVertices name: newName
	"object constructor - polygon"
	name:= newName.					"name: = newName"
	"Penso che stiamo creando un array grande quanto il numero di vertici"
	vertices:= Array new: numberOfVertices. "vertices: = Array new: number of vertices."
	vertices at: 1 put: 0@0.! !


!Polygon methodsFor: 'accessing'!
name "name"
	"enter the name of the polygon"
	^name!						
name: new_name
	"sets the new name of the polygon"
	name:=new_name! !


				"quadrato(?)"
Polygon subclass: #Square
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ProgrammingLanguages'! "Programming languages"


!Square methodsFor: 'arithmetic'!


+ figura 	"figura o figure"
	"aggiungi 2 cifre nel senso di un campo"
	"add 2 figures in the sense of a field"
	| p |
	p:=self area + figura area.
	^(Square new) initialize: p sqrt! !

!Square methodsFor: 'actions'!
area
	"calculate square area (con una piccola correzione)"
	"count square o quadrato conteggio"
	
	"non sono riuscito..."
	^(vertices at: 2) x squared! !

!Square methodsFor: 'initialize-release'!

			"lato"
initialize: side
	"create a square with given side"
	"crea un quadrato con il lato dato"
	super initialize: 4 name: 'Square'.
	vertices at: 2 put: side@0.
	vertices at: 3 put: side@side.
	vertices at: 4 put: 0@side.! !