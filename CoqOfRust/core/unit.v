(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module unit_.
  Module Impl_core_iter_traits_collect_FromIterator_Tuple__for_Tuple_.
    Definition Self : Ty.t := Ty.tuple [].
    
    (*
        fn from_iter<I: IntoIterator<Item = ()>>(iter: I) -> Self {
            iter.into_iter().for_each(|()| {})
        }
    *)
    Definition from_iter (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ _ as I ], [ iter ] =>
        ltac:(M.monadic
          (let iter := M.alloc (| iter |) in
          M.call_closure (|
            M.get_trait_method (|
              "core::iter::traits::iterator::Iterator",
              Ty.associated,
              [],
              "for_each",
              [ Ty.function [ Ty.tuple [ Ty.tuple [] ] ] (Ty.tuple []) ]
            |),
            [
              M.call_closure (|
                M.get_trait_method (|
                  "core::iter::traits::collect::IntoIterator",
                  I,
                  [],
                  "into_iter",
                  []
                |),
                [ M.read (| iter |) ]
              |);
              M.closure
                (fun γ =>
                  ltac:(M.monadic
                    match γ with
                    | [ α0 ] =>
                      M.match_operator (|
                        M.alloc (| α0 |),
                        [ fun γ => ltac:(M.monadic (Value.Tuple [])) ]
                      |)
                    | _ => M.impossible (||)
                    end))
            ]
          |)))
      | _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::iter::traits::collect::FromIterator"
        Self
        (* Trait polymorphic types *) [ (* A *) Ty.tuple [] ]
        (* Instance *) [ ("from_iter", InstanceField.Method from_iter) ].
  End Impl_core_iter_traits_collect_FromIterator_Tuple__for_Tuple_.
End unit_.