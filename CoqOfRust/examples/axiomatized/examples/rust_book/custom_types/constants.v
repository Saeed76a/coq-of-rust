(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Parameter LANGUAGE : Value.t.

Parameter THRESHOLD : Value.t.

Parameter is_big : (list Ty.t) -> (list Value.t) -> M.

Parameter main : (list Ty.t) -> (list Value.t) -> M.