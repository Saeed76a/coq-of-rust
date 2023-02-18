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

Definition main (_ : unit) :=
  let val := add 1 2 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";" = ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        "1 + 2";_crate::fmt::ImplArgumentV1.new_display val]) ;;
  tt ;;
  tt ;;
  let val := add 3 4 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";" = ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        "3 + 4";_crate::fmt::ImplArgumentV1.new_display val]) ;;
  tt ;;
  tt ;;
  let val := add (mul 2 3) 1 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["";" = ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display
        "(2 * 3) + 1";_crate::fmt::ImplArgumentV1.new_display val]) ;;
  tt ;;
  tt.