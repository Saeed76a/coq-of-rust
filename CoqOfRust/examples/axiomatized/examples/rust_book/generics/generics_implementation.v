(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

(* StructRecord
  {
    name := "Val";
    ty_params := [];
    fields := [ ("val", Ty.path "f64") ];
  } *)

(* StructRecord
  {
    name := "GenVal";
    ty_params := [ ("T", None) ];
    fields := [ ("gen_val", T) ];
  } *)

Module Impl_generics_implementation_Val.
  Definition Self : Ty.t := Ty.path "generics_implementation::Val".
  
  Parameter value : (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_value : M.IsAssociatedFunction Self "value" value.
End Impl_generics_implementation_Val.

Module Impl_generics_implementation_GenVal_T.
  Definition Self (T : Ty.t) : Ty.t :=
    Ty.apply (Ty.path "generics_implementation::GenVal") [ T ].
  
  Parameter value : forall (T : Ty.t), (list Ty.t) -> (list Value.t) -> M.
  
  Axiom AssociatedFunction_value :
    forall (T : Ty.t),
    M.IsAssociatedFunction (Self T) "value" (value T).
End Impl_generics_implementation_GenVal_T.

Parameter main : (list Ty.t) -> (list Value.t) -> M.