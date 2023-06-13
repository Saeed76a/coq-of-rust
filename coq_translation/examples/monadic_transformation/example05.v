(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Foo.
  Record t : Set := { _ : u32;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Foo.
Definition Foo := Foo.t.

Module ImplFoo.
  Definition Self := Foo.
  
  Definition plus1 (s : Self) : M u32 := (s.[0]).["add"] 1.
  
  Global Instance AssociatedFunction_plus1 :
    Notation.DoubleColon Self "plus1" := {
    Notation.double_colon := plus1;
  }.
End ImplFoo.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let foo := Foo.Build_t 0 in
  let _ := foo.["plus1"] in
  Pure tt.