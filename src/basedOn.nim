import macros

## usage:
## basedOn( baseObj ):
##   p1 = expression
##   p2 = expression
macro basedOn*(head, body: untyped): untyped =
  head.expectKind(nnkIdent)
  body.expectKind(nnkStmtList)
  var modified = 
      nnkStmtList.newTree(
        nnkVarSection.newTree(
          nnkIdentDefs.newTree(
            newIdentNode("result"),
            newEmptyNode(),
            head
          )
        )
      )

  for assignment in body:
    assignment.expectKind(nnkAsgn)
    modified.add(
      nnkAsgn.newTree(
        nnkDotExpr.newTree(
          newIdentNode("result"), 
          assignment[0]
        ),
        assignment[1]
      )
    )

  modified.add(newIdentNode("result"))
  return nnkStmtList.newTree(
      nnkBlockStmt.newTree(
        newEmptyNode(),
        modified
      )
    ) 
