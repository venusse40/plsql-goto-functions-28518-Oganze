# Reflection (C2)


## 1. What I learned about GOTO

GOTO jumps straight to a label in the code. PL/SQL allows it, but it makes code hard to follow because the flow jumps around. In A3, [check] my GOTO jumped to a label that wasn’t allowed (into another block or inside an IF/loop), or created an endless loop. The fix was to put the label in a valid place and make sure the jump has a clear exit.

## 2. GOTO vs structured code

A4 (is all about structured and using IF/LOOP/EXIT) it is easier to read and maintain. You read it top to bottom with no jumping. A1 (GOTO) makes you hunt for labels, and a small change can break the flow.

## 3. Functions

A stored function is a named block saved in the database that always returns one value. In B1-B4 and C1, I handled errors with an EXCEPTION block, using things like NO_DATA_FOUND and WHEN OTHERS. The function either returns a safe value (e.g. NULL or -1) or raises a clear error.

## 4. Functions in SQL

In B5 I called my function inside a SELECT, and it ran once per row. [check] Limits: the function can’t do INSERT/UPDATE/DELETE or COMMIT when called from SELECT, and it must return a SQL-compatible type, not a PL/SQL-only one like BOOLEAN. It can also be slow on large tables.

## 5. Challenges and how I solved them

[check] Label/GOTO error (e.g. PLS-00375): moved the label to a valid spot.
[check] Function compiled with errors: checked with SHOW ERRORS and fixed the typo/missing RETURN.
[check] SERVEROUTPUT off, so no output: ran SET SERVEROUTPUT ON.