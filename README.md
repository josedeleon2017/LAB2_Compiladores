# DOCUMENTACIÓN LAB2

## GRAMÁTICA
0	bExpr -> bExpr or bTerm

1	bExpr -> bTerm

2	bTerm -> bTerm and bFactor

3	bTerm -> bFactor

4	bFactor -> not bFactor

5	bFactor -> ( bExpr )

6	bFactor -> true

7	bFactor -> false

	Simplificando notación
0	E -> E or T

1	E -> T

2	T -> T and F

3	T -> F

4	F -> not F

5	F -> ( E )

6	F -> true

7	F -> false


