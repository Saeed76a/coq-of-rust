(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module vec.
  Module spec_from_iter_nested.
    (* Trait *)
    (* Empty module 'SpecFromIterNested' *)
    
    Module Impl_alloc_vec_spec_from_iter_nested_SpecFromIterNested_where_core_iter_traits_iterator_Iterator_I_T_I_for_alloc_vec_Vec_T_alloc_alloc_Global.
      Definition Self (T I : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "alloc::vec::Vec") [ T; Ty.path "alloc::alloc::Global" ].
      
      (*
          default fn from_iter(mut iterator: I) -> Self {
              // Unroll the first iteration, as the vector is going to be
              // expanded on this iteration in every case when the iterable is not
              // empty, but the loop in extend_desugared() is not going to see the
              // vector being full in the few subsequent loop iterations.
              // So we get better branch prediction.
              let mut vector = match iterator.next() {
                  None => return Vec::new(),
                  Some(element) => {
                      let (lower, _) = iterator.size_hint();
                      let initial_capacity =
                          cmp::max(RawVec::<T>::MIN_NON_ZERO_CAP, lower.saturating_add(1));
                      let mut vector = Vec::with_capacity(initial_capacity);
                      unsafe {
                          // SAFETY: We requested capacity at least 1
                          ptr::write(vector.as_mut_ptr(), element);
                          vector.set_len(1);
                      }
                      vector
                  }
              };
              // must delegate to spec_extend() since extend() itself delegates
              // to spec_from for empty Vecs
              <Vec<T> as SpecExtend<T, I>>::spec_extend(&mut vector, iterator);
              vector
          }
      *)
      Definition from_iter (T I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T I in
        match τ, α with
        | [], [ iterator ] =>
          ltac:(M.monadic
            (let iterator := M.alloc (| iterator |) in
            M.catch_return (|
              ltac:(M.monadic
                (M.read (|
                  let vector :=
                    M.copy (|
                      M.match_operator (|
                        M.alloc (|
                          M.call_closure (|
                            M.get_trait_method (|
                              "core::iter::traits::iterator::Iterator",
                              I,
                              [],
                              "next",
                              []
                            |),
                            [ iterator ]
                          |)
                        |),
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (M.alloc (|
                                M.never_to_any (|
                                  M.read (|
                                    M.return_ (|
                                      M.call_closure (|
                                        M.get_associated_function (|
                                          Ty.apply
                                            (Ty.path "alloc::vec::Vec")
                                            [ T; Ty.path "alloc::alloc::Global" ],
                                          "new",
                                          []
                                        |),
                                        []
                                      |)
                                    |)
                                  |)
                                |)
                              |)));
                          fun γ =>
                            ltac:(M.monadic
                              (let γ0_0 :=
                                M.get_struct_tuple_field_or_break_match (|
                                  γ,
                                  "core::option::Option::Some",
                                  0
                                |) in
                              let element := M.copy (| γ0_0 |) in
                              M.match_operator (|
                                M.alloc (|
                                  M.call_closure (|
                                    M.get_trait_method (|
                                      "core::iter::traits::iterator::Iterator",
                                      I,
                                      [],
                                      "size_hint",
                                      []
                                    |),
                                    [ iterator ]
                                  |)
                                |),
                                [
                                  fun γ =>
                                    ltac:(M.monadic
                                      (let γ0_0 := M.get_tuple_field γ 0 in
                                      let γ0_1 := M.get_tuple_field γ 1 in
                                      let lower := M.copy (| γ0_0 |) in
                                      let initial_capacity :=
                                        M.alloc (|
                                          M.call_closure (|
                                            M.get_function (|
                                              "core::cmp::max",
                                              [ Ty.path "usize" ]
                                            |),
                                            [
                                              M.read (|
                                                M.get_constant (|
                                                  "alloc::raw_vec::MIN_NON_ZERO_CAP"
                                                |)
                                              |);
                                              M.call_closure (|
                                                M.get_associated_function (|
                                                  Ty.path "usize",
                                                  "saturating_add",
                                                  []
                                                |),
                                                [ M.read (| lower |); Value.Integer Integer.Usize 1
                                                ]
                                              |)
                                            ]
                                          |)
                                        |) in
                                      let vector :=
                                        M.alloc (|
                                          M.call_closure (|
                                            M.get_associated_function (|
                                              Ty.apply
                                                (Ty.path "alloc::vec::Vec")
                                                [ T; Ty.path "alloc::alloc::Global" ],
                                              "with_capacity",
                                              []
                                            |),
                                            [ M.read (| initial_capacity |) ]
                                          |)
                                        |) in
                                      let _ :=
                                        let _ :=
                                          M.alloc (|
                                            M.call_closure (|
                                              M.get_function (| "core::ptr::write", [ T ] |),
                                              [
                                                M.call_closure (|
                                                  M.get_associated_function (|
                                                    Ty.apply
                                                      (Ty.path "alloc::vec::Vec")
                                                      [ T; Ty.path "alloc::alloc::Global" ],
                                                    "as_mut_ptr",
                                                    []
                                                  |),
                                                  [ vector ]
                                                |);
                                                M.read (| element |)
                                              ]
                                            |)
                                          |) in
                                        let _ :=
                                          M.alloc (|
                                            M.call_closure (|
                                              M.get_associated_function (|
                                                Ty.apply
                                                  (Ty.path "alloc::vec::Vec")
                                                  [ T; Ty.path "alloc::alloc::Global" ],
                                                "set_len",
                                                []
                                              |),
                                              [ vector; Value.Integer Integer.Usize 1 ]
                                            |)
                                          |) in
                                        M.alloc (| Value.Tuple [] |) in
                                      vector))
                                ]
                              |)))
                        ]
                      |)
                    |) in
                  let _ :=
                    M.alloc (|
                      M.call_closure (|
                        M.get_trait_method (|
                          "alloc::vec::spec_extend::SpecExtend",
                          Ty.apply
                            (Ty.path "alloc::vec::Vec")
                            [ T; Ty.path "alloc::alloc::Global" ],
                          [ T; I ],
                          "spec_extend",
                          []
                        |),
                        [ vector; M.read (| iterator |) ]
                      |)
                    |) in
                  vector
                |)))
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T I : Ty.t),
        M.IsTraitInstance
          "alloc::vec::spec_from_iter_nested::SpecFromIterNested"
          (Self T I)
          (* Trait polymorphic types *) [ (* T *) T; (* I *) I ]
          (* Instance *) [ ("from_iter", InstanceField.Method (from_iter T I)) ].
    End Impl_alloc_vec_spec_from_iter_nested_SpecFromIterNested_where_core_iter_traits_iterator_Iterator_I_T_I_for_alloc_vec_Vec_T_alloc_alloc_Global.
    
    Module Impl_alloc_vec_spec_from_iter_nested_SpecFromIterNested_where_core_iter_traits_marker_TrustedLen_I_T_I_for_alloc_vec_Vec_T_alloc_alloc_Global.
      Definition Self (T I : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "alloc::vec::Vec") [ T; Ty.path "alloc::alloc::Global" ].
      
      (*
          fn from_iter(iterator: I) -> Self {
              let mut vector = match iterator.size_hint() {
                  (_, Some(upper)) => Vec::with_capacity(upper),
                  // TrustedLen contract guarantees that `size_hint() == (_, None)` means that there
                  // are more than `usize::MAX` elements.
                  // Since the previous branch would eagerly panic if the capacity is too large
                  // (via `with_capacity`) we do the same here.
                  _ => panic!("capacity overflow"),
              };
              // reuse extend specialization for TrustedLen
              vector.spec_extend(iterator);
              vector
          }
      *)
      Definition from_iter (T I : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T I in
        match τ, α with
        | [], [ iterator ] =>
          ltac:(M.monadic
            (let iterator := M.alloc (| iterator |) in
            M.read (|
              let vector :=
                M.copy (|
                  M.match_operator (|
                    M.alloc (|
                      M.call_closure (|
                        M.get_trait_method (|
                          "core::iter::traits::iterator::Iterator",
                          I,
                          [],
                          "size_hint",
                          []
                        |),
                        [ iterator ]
                      |)
                    |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ0_0 := M.get_tuple_field γ 0 in
                          let γ0_1 := M.get_tuple_field γ 1 in
                          let γ1_0 :=
                            M.get_struct_tuple_field_or_break_match (|
                              γ0_1,
                              "core::option::Option::Some",
                              0
                            |) in
                          let upper := M.copy (| γ1_0 |) in
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply
                                  (Ty.path "alloc::vec::Vec")
                                  [ T; Ty.path "alloc::alloc::Global" ],
                                "with_capacity",
                                []
                              |),
                              [ M.read (| upper |) ]
                            |)
                          |)));
                      fun γ =>
                        ltac:(M.monadic
                          (M.alloc (|
                            M.never_to_any (|
                              M.call_closure (|
                                M.get_function (| "core::panicking::panic_fmt", [] |),
                                [
                                  M.call_closure (|
                                    M.get_associated_function (|
                                      Ty.path "core::fmt::Arguments",
                                      "new_const",
                                      []
                                    |),
                                    [
                                      (* Unsize *)
                                      M.pointer_coercion
                                        (M.alloc (|
                                          Value.Array
                                            [ M.read (| Value.String "capacity overflow" |) ]
                                        |))
                                    ]
                                  |)
                                ]
                              |)
                            |)
                          |)))
                    ]
                  |)
                |) in
              let _ :=
                M.alloc (|
                  M.call_closure (|
                    M.get_trait_method (|
                      "alloc::vec::spec_extend::SpecExtend",
                      Ty.apply (Ty.path "alloc::vec::Vec") [ T; Ty.path "alloc::alloc::Global" ],
                      [ T; I ],
                      "spec_extend",
                      []
                    |),
                    [ vector; M.read (| iterator |) ]
                  |)
                |) in
              vector
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T I : Ty.t),
        M.IsTraitInstance
          "alloc::vec::spec_from_iter_nested::SpecFromIterNested"
          (Self T I)
          (* Trait polymorphic types *) [ (* T *) T; (* I *) I ]
          (* Instance *) [ ("from_iter", InstanceField.Method (from_iter T I)) ].
    End Impl_alloc_vec_spec_from_iter_nested_SpecFromIterNested_where_core_iter_traits_marker_TrustedLen_I_T_I_for_alloc_vec_Vec_T_alloc_alloc_Global.
  End spec_from_iter_nested.
End vec.