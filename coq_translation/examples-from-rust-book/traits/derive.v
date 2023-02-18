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

Definition Centimeters : Set :=
  f64.

(* Impl [Centimeters] of trait [_crate.marker.StructuralPartialEq]*)
Module ImplCentimeters.
  
End ImplCentimeters.
(* End impl [Centimeters] *)

(* Impl [Centimeters] of trait [_crate.cmp.PartialEq]*)
Module ImplCentimeters.
  Definition
    eq
    (self : static_ref Centimeters)
    (other : static_ref Centimeters)
    : bool :=
    eq self.0 other.0.
End ImplCentimeters.
(* End impl [Centimeters] *)

(* Impl [Centimeters] of trait [_crate.cmp.PartialOrd]*)
Module ImplCentimeters.
  Definition
    partial_cmp
    (self : static_ref Centimeters)
    (other : static_ref Centimeters)
    : _crate.option.Option :=
    _crate.cmp.PartialOrd.partial_cmp self.0 other.0.
End ImplCentimeters.
(* End impl [Centimeters] *)

Definition Inches : Set :=
  i32.

(* Impl [Inches] of trait [_crate.fmt.Debug]*)
Module ImplInches.
  Definition
    fmt
    (self : static_ref Inches)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.debug_tuple_field1_finish f "Inches" self.0.
End ImplInches.
(* End impl [Inches] *)

(* Impl [Inches] *)
Module ImplInches.
  Definition to_centimeters (self : static_ref Inches) : Centimeters :=
    let Inches (inches) := self in
    Centimeters (mul inches 3 (* 2.54 *)).
End ImplInches.
(* End impl [Inches] *)

Definition Seconds : Set :=
  i32.

Definition main (_ : unit) :=
  let _one_second := Seconds 1 in
  let foot := Inches 12 in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["One foot equals ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug foot]) ;;
  tt ;;
  let meter := Centimeters 100 (* 100.0 *) in
  let cmp := if lt (to_centimeters foot) meter then
    "smaller"
  else
    "bigger" in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["One foot is ";" than one meter.\n"]
      [_crate::fmt::ImplArgumentV1.new_display cmp]) ;;
  tt ;;
  tt.