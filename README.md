basedOn.nim
===
A library for cleanly creating an object or tuple _based on_ another object or tuple.
It has simple syntax and compiles directly to a `block` wherein a variable is mutated
according to the body of the statement.

This project is licensed under the MIT License.

Installation
---

Install with `nimble`.

```bash
$ nimble install basedOn
```

Usage
---

```nim
basedOn(base):
  member1 = expression
  # ...
  memberN = expression
```

Usage Example
---

Let us say we have a class...

```nim
type Foo = object
  bar: int
  foobar: string
```
...and a base object.

```nim
const myFoo = Foo(bar: 1, foobar: "Hello")
```

We can make a new object _based on_ `MyFoo`:

```nim
import basedOn

const myNewFoo = basedOn(myFoo):
  bar = myFoo.bar * 10 + 20
  foobar = myFoo.foobar & " world!"
  
# is the essentially the same as:
# 
# const myNewFoo = Foo(
#   bar: myFoo.bar * 10 + 20,
#   foobar: myFoo.foobar & " world!"
#   )

assert myNewFoo.bar == 1 * 10 + 20
assert myNewFoo.foobar == "Hello" & " world!"
```
```nim
const myNewFoo2 = basedOn(myFoo):
  bar = 30
  # We don't even have to change all of the object's members!

# is the essentially the same as:
# 
# const myNewFoo2 = Foo(
#   bar: 30,
#   foobar: myFoo.foobar
#   )

assert myNewFoo2.bar == 30
assert myNewFoo2.foobar == "Hello"
```

Compilation Example
---

The previous code...

```nim
const myNewFoo = basedOn(myFoo):
  bar = myFoo.bar * 10 + 20
  foobar = myFoo.foobar & " world!"
```

is **exactly** the same as:

```nim
const myNewFoo = block:
  var result = myFoo
  result.bar = myFoo.bar * 10 + 20
  result.foobar = myFoo.foobar & " world!"
  result
```
