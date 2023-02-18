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

Error Struct.

Class Red : Set := {
}.

Class Blue : Set := {
}.

(* Impl [Cardinal] of trait [Red]*)
Module ImplCardinal.
  
End ImplCardinal.
(* End impl [Cardinal] *)

(* Impl [BlueJay] of trait [Blue]*)
Module ImplBlueJay.
  
End ImplBlueJay.
(* End impl [BlueJay] *)

Definition red (_ : unit) :=
  "red".

Definition blue (_ : unit) :=
  "blue".

Definition main (_ : unit) :=
  let cardinal := Cardinal in
  let blue_jay := BlueJay in
  let _turkey := Turkey in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["A cardinal is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (red cardinal)]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["A blue jay is ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display (blue blue_jay)]) ;;
  tt ;;
  tt.