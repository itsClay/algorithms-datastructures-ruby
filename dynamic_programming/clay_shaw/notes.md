Lets take a bottom-up approach, which says that perhaps the solution at any given point may be based on the solutions that precede it

- what is the solution to [1,5]
- what is the solution to [1,5,2]
- what is the solution to [1,5,2,6]
- what is the solution to [1,5,2,6,10]
- what is the solution to [1,5,2,6,10,4]
- what is the solution to [1,5,2,6,10,5,20]

2 problem solving steps we have to apply.
@ each index the solution is the longest preceding solution

defining the recursive relationship is the key,
what is the relationship between a given solution and other solutions that lead up to it?
