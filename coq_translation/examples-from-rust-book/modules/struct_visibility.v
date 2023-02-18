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

Module my :=
  Module OpenBox.
    Record t : Set := {
      contents : T;
    }.
  End OpenBox.
  Definition OpenBox : Set := OpenBox.t.
  
  Module ClosedBox.
    Record t : Set := {
      contents : T;
    }.
  End ClosedBox.
  Definition ClosedBox : Set := ClosedBox.t.
  
  (* Impl [ClosedBox] *)
  Module ImplClosedBox.
    Definition new (contents : T) : ClosedBox :=
      {| ClosedBox.contents := contents; |}.
  End ImplClosedBox.
  (* End impl [ClosedBox] *).

Module OpenBox.
  Record t : Set := {
    contents : T;
  }.
End OpenBox.
Definition OpenBox : Set := OpenBox.t.

Module ClosedBox.
  Record t : Set := {
    contents : T;
  }.
End ClosedBox.
Definition ClosedBox : Set := ClosedBox.t.

(* Impl [ClosedBox] *)
Module ImplClosedBox.
  Definition new (contents : T) : ClosedBox :=
    {| ClosedBox.contents := contents; |}.
End ImplClosedBox.
(* End impl [ClosedBox] *)

Definition main (_ : unit) :=
  let open_box := {| my.OpenBox.contents := "public information"; |} in
  _crate.io._print
    (_crate::fmt::ImplArguments.new_v1
      ["The open box contains: ";"\n"]
      [_crate::fmt::ImplArgumentV1.new_display open_box.contents]) ;;
  tt ;;
  let _closed_box := my::ImplClosedBox.new "classified information" in
  tt.