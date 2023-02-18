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

Definition division (_ : unit) :=
  if eq divisor 0 then
    _crate.rt.begin_panic "division by zero" ;;
    tt
  else
    div dividend divisor.

Definition main (_ : unit) :=
  let _x := ImplBox.new 0 in
  division 3 0 ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1 ["This point won't be reached!\n"] []) ;;
  tt ;;
  tt.