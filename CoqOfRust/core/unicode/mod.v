(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module unicode.
  Definition value_UNICODE_VERSION : Value.t :=
    M.run ltac:(M.monadic (M.get_constant (| "core::unicode::unicode_data::UNICODE_VERSION" |))).
End unicode.