import macros

## usage:
  ## basedOn( base: some object or tuple ):
  ##   p1: object variable = some value
  ##   p2: another object variable = some other value
## converts into
  ## block:
  ##   var result = base
  ##   result.p1 = some value
  ##   result.p2 = some other value
  ##   result
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
