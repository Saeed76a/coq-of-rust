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

(* Impl [Unit] of trait [_crate.fmt.Debug]*)
Module ImplUnit.
  Definition
    fmt
    (self : static_ref Unit)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.write_str f "Unit".
End ImplUnit.
(* End impl [Unit] *)

(* Impl [Unit] of trait [_crate.clone.Clone]*)
Module ImplUnit.
  Definition clone (self : static_ref Unit) : Unit :=
    deref self.
End ImplUnit.
(* End impl [Unit] *)

(* Impl [Unit] of trait [_crate.marker.Copy]*)
Module ImplUnit.
  
End ImplUnit.
(* End impl [Unit] *)

Definition Pair : Set :=
  Box * Box.

(* Impl [Pair] of trait [_crate.clone.Clone]*)
Module ImplPair.
  Definition clone (self : static_ref Pair) : Pair :=
    Pair (_crate.clone.Clone.clone self.0) (_crate.clone.Clone.clone self.1).
End ImplPair.
(* End impl [Pair] *)

(* Impl [Pair] of trait [_crate.fmt.Debug]*)
Module ImplPair.
  Definition
    fmt
    (self : static_ref Pair)
    (f : mut_ref _crate.fmt.Formatter)
    : _crate.fmt.Result :=
    _crate::fmt::ImplFormatter.debug_tuple_field2_finish f "Pair" self.0 self.1.
End ImplPair.
(* End impl [Pair] *)

Definition main (_ : unit) :=
  let unit := Unit in
  let copied_unit := unit in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["original: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug unit]) ;;
  tt ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["copy: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug copied_unit]) ;;
  tt ;;
  let pair := Pair (ImplBox.new 1) (ImplBox.new 2) in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["original: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug pair]) ;;
  tt ;;
  let moved_pair := pair in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["moved: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug moved_pair]) ;;
  tt ;;
  let cloned_pair := clone moved_pair in
  drop moved_pair ;;
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["clone: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_debug cloned_pair]) ;;
  tt ;;
  tt.