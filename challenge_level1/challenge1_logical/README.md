## Bug explanation with screenshot: 
1. test.S:15855: Error: illegal operands `and s7,ra,z4' 
   The register z4 is invalid source register.
2. test.S:25584: Error: illegal operands `andi s5,t1,s0'
   The operand s0 is illegal in this context, it needs to be an immediate operand.    
![bug screenshot](image-1.png)

## Screenshot of the fix:
![bug fix screenshot](image-2.png)

## Explanation of the fix   
1. test.S:15855: Error: illegal operands `and s7,ra,z4' 
   The register name z4 is invalid source register name, replaced it with s4.
2. test.S:25584: Error: illegal operands `andi s5,t1,s0'
   The operand s0 is illegal in this context, it needs to be an immediate operand. Replaced it with 0.  