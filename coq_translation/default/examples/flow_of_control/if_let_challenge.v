(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module Foo.
  Inductive t : Set :=
  | Bar.
End Foo.
Definition Foo := Foo.t.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main `{H : State.Trait} : M (H := H) unit :=
  let a := if_let_challenge.Foo.Bar in
  match a with
  | if_let_challenge.Foo.Bar =>
    let* _ :=
      let* _ :=
        let* α0 :=
          format_arguments::["new_const"] (addr_of [ "a is foobar
" ]) in
        std.io.stdio._print α0 in
      Pure tt in
    Pure tt
  end.