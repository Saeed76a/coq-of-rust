(* Generated by coq-of-rust *)
Require Import Coq.Strings.String.
Require Import Coq.ZArith.ZArith.
Local Open Scope Z.

(* Approximation *)

Definition u8 : Set := Z.
Definition u16 : Set := Z.
Definition u32 : Set := Z.
Definition u64 : Set := Z.
Definition u128 : Set := Z.

Definition i8 : Set := Z.
Definition i16 : Set := Z.
Definition i32 : Set := Z.
Definition i64 : Set := Z.
Definition i128 : Set := Z.

Definition f32 : Set := Z.
Definition f64 : Set := Z.

Definition give_adult (_ : unit) :=
  match drink with
  | Some (Str("lemonade", Cooked)) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1 ["Yuck! Too sugary.\n"] []) ;;
    tt
  | Some (inner) =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1
        ["";"? How nice.\n"]
        [_crate::fmt::ImplArgumentV1.new_display inner]) ;;
    tt
  | None =>
    _crate.io._print
      (_crate::fmt::ImplArguments.new_v1 ["No drink? Oh well.\n"] []) ;;
    tt
  end.

Definition drink (_ : unit) :=
  let inside := unwrap drink in
  if eq inside "lemonade" then
    _crate.rt.begin_panic "AAAaaaaa!!!!" ;;
    tt
  else
    tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["I love ";"s!!!!!\n"]
      [_crate::fmt::ImplArgumentV1.new_display inside]) ;;
  tt ;;
  tt.

Definition main (_ : unit) :=
  let water := Some "water" in
  let lemonade := Some "lemonade" in
  let void := None in
  give_adult water ;;
  give_adult lemonade ;;
  give_adult void ;;
  let coffee := Some "coffee" in
  let nothing := None in
  drink coffee ;;
  drink nothing ;;
  tt.