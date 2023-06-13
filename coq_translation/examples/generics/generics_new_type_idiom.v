(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Import Root.std.prelude.rust_2015.

Module Years.
  Record t : Set := { _ : i64;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Years.
Definition Years := Years.t.

Module Days.
  Record t : Set := { _ : i64;}.
  
  Global Instance Get_0 : Notation.Dot 0 := {
    Notation.dot '(Build_t x0) := x0;
  }.
End Days.
Definition Days := Days.t.

Module ImplYears.
  Definition Self := Years.
  
  Definition to_days (self : ref Self) : M Days :=
    let* α0 := (self.[0]).["mul"] 365 in
    Pure (Days.Build_t α0).
  
  Global Instance Method_to_days : Notation.Dot "to_days" := {
    Notation.dot := to_days;
  }.
End ImplYears.

Module ImplDays.
  Definition Self := Days.
  
  Definition to_years (self : ref Self) : M Years :=
    let* α0 := (self.[0]).["div"] 365 in
    Pure (Years.Build_t α0).
  
  Global Instance Method_to_years : Notation.Dot "to_years" := {
    Notation.dot := to_years;
  }.
End ImplDays.

Definition old_enough (age : ref Years) : M bool := (age.[0]).["ge"] 18.

(* #[allow(dead_code)] - function was ignored by the compiler *)
Definition main (_ : unit) : M unit :=
  let age := Years.Build_t 5 in
  let* age_days := age.["to_days"] in
  let* _ :=
    let* _ :=
      let* α0 := old_enough (addr_of age) in
      let* α1 := format_argument::["new_display"] (addr_of α0) in
      let* α2 :=
        format_arguments::["new_v1"]
          (addr_of [ "Old enough "; "
" ])
          (addr_of [ α1 ]) in
      _crate.io._print α2 in
    Pure tt in
  let* _ :=
    let* _ :=
      let* α0 := age_days.["to_years"] in
      let* α1 := old_enough (addr_of α0) in
      let* α2 := format_argument::["new_display"] (addr_of α1) in
      let* α3 :=
        format_arguments::["new_v1"]
          (addr_of [ "Old enough "; "
" ])
          (addr_of [ α2 ]) in
      _crate.io._print α3 in
    Pure tt in
  Pure tt.