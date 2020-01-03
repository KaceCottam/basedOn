# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

type Foo = object
  bar: int
  foobar: string

import basedOn

test "basedOn const object":
  const myFoo: Foo = Foo(bar: 1, foobar: "Hello")

  const myNewFoo = basedOn(myFoo):
    bar = myFoo.bar * 10 + 20
    foobar = myFoo.foobar & " world!"

  check myFoo.bar == 1
  check myFoo.foobar == "Hello"
  check myNewFoo.bar == 1 * 10 + 20
  check myNewFoo.foobar == "Hello" & " world!"

test "basedOn let object":
  let myFoo: Foo = Foo(bar: 1, foobar: "Hello")

  let myNewFoo = basedOn(myFoo):
    bar = myFoo.bar * 10 + 20
    foobar = myFoo.foobar & " world!"

  check myFoo.bar == 1
  check myFoo.foobar == "Hello"
  check myNewFoo.bar == 1 * 10 + 20
  check myNewFoo.foobar == "Hello" & " world!"

test "basedOn var object":
  var myFoo: Foo = Foo(bar: 1, foobar: "Hello")

  var myNewFoo = basedOn(myFoo):
    bar = myFoo.bar * 10 + 20
    foobar = myFoo.foobar & " world!"

  check myFoo.bar == 1
  check myFoo.foobar == "Hello"
  check myNewFoo.bar == 1 * 10 + 20
  check myNewFoo.foobar == "Hello" & " world!"

type Bar = tuple[foo: int, foobar: string]

test "basedOn const tuple":
  const myBar: Bar = (foo: 1, foobar: "Hello")

  const myNewBar = basedOn(myBar):
    foo = myBar.foo * 10 + 20
    foobar = myBar.foobar & " world!"

  check myBar.foo == 1
  check myBar.foobar == "Hello"
  check myNewBar.foo == 1 * 10 + 20
  check myNewBar.foobar == "Hello" & " world!"

test "basedOn let tuple":
  let myBar: Bar = (foo: 1, foobar: "Hello")

  let myNewBar = basedOn(myBar):
    foo = myBar.foo * 10 + 20
    foobar = myBar.foobar & " world!"

  check myBar.foo == 1
  check myBar.foobar == "Hello"
  check myNewBar.foo == 1 * 10 + 20
  check myNewBar.foobar == "Hello" & " world!"

test "basedOn var tuple":
  var myBar: Bar = (foo: 1, foobar: "Hello")

  var myNewBar = basedOn(myBar):
    foo = myBar.foo * 10 + 20
    foobar = myBar.foobar & " world!"

  check myBar.foo == 1
  check myBar.foobar == "Hello"
  check myNewBar.foo == 1 * 10 + 20
  check myNewBar.foobar == "Hello" & " world!"
