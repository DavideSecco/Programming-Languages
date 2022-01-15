"Object class is the top most class in smalltalk"
Object subclass: #Polygon 	
	"each instance of Polygon has two variables --> nota che non hanno un tipo"
	instanceVariableNames: 'vertices name ' "nome superiore or top name(?)"
	"Class variables are those values that are shared among all class"
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ProgrammingLanguages'!		

"-------------------------------------------------------------------"	

"Initialize-release tells to visual works under which label should be store this method"
!Polygon methodsFor: 'initialize-release'!
"credo che questi siano i due parametri passati a funzione"
initialize: numberOfVertices name: newName
	"object constructor - polygon"
	name:= newName.					"name: = newName"
	"Penso che stiamo creando un oggetto array 'vertici' grande quanto il numero di vertici"
	vertices:= Array new: numberOfVertices. "vertices: = Array new: number of vertices."
	"sempre all'array vertici stiamo dicendo: nella prima cella metti [0.0]"
	"0@0 fa parte della point"
	vertices at: 1 put: 0@0.! !

"-------------------------------------------------------------------"
"nota che qui sono due i metodi"

!Polygon methodsFor: 'accessing'!
name "name"
	"enter the name of the polygon"
	^name!	"ritorna il valore del poligono"
"---"		
name: new_name
	"sets the new name of the polygon"
	name:=new_name! !

"---------------------------------------------------------------------"

				"quadrato(?)"
Polygon subclass: #Square
	"Nota che eredità le varibile precendenti!!!!"
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ProgrammingLanguages'! "Programming languages"


!Square methodsFor: 'arithmetic'!
+ figura 	"figura o figure"
	"aggiungi 2 cifre nel senso di un campo"
	"add 2 figures in the sense of a field"
	| p |
	"Non ho capito questa linea"
	p:=self area + figura area.
	^(Square new) initialize: p sqrt! !

"---------------------------------------------------------------------"

!Square methodsFor: 'actions'!
area
	"calculate square area (con una piccola correzione)"
	"Considerò il vertice nella seconda posizione, perchè contiene 
	side@0 e la 'x' dice di prendere solo quel valore"
	^(vertices at: 2) x squared! !

"---------------------------------------------------------------------"

!Square methodsFor: 'initialize-release'!
initialize: side "lato"
	"create a square with given side"
	"crea un quadrato con il lato dato"
	"penso che super sia perchè la classe initialize è già definita 
	nel padre, e la devo ridefinire"
	super initialize: 4 name: 'Square'.
	vertices at: 2 put: side@0.
	vertices at: 3 put: side@side.
	vertices at: 4 put: 0@side.! !

"---------------------------------------------------------------------"