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

Error Struct.

Error Struct.

Class DoubleDrop : Set := {
  double_drop : Self -> T -> _;
}.

(* Impl [U] of trait [DoubleDrop]*)
Module ImplU.
  Definition double_drop (self : U) (Pattern : T) :=
    tt.
End ImplU.
(* End impl [U] *)

Definition main (_ : unit) :=
  let empty := Empty in
  let null := Null in
  double_drop empty null ;;
  tt.