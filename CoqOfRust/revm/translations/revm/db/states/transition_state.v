(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module db.
  Module states.
    Module transition_state.
      (* StructRecord
        {
          name := "TransitionState";
          ty_params := [];
          fields :=
            [
              ("transitions",
                Ty.apply
                  (Ty.path "std::collections::hash::map::HashMap")
                  [
                    Ty.path "alloy_primitives::bits::address::Address";
                    Ty.path "revm::db::states::transition_account::TransitionAccount";
                    Ty.path "std::hash::random::RandomState"
                  ])
            ];
        } *)
      
      Module Impl_core_clone_Clone_for_revm_db_states_transition_state_TransitionState.
        Definition Self : Ty.t := Ty.path "revm::db::states::transition_state::TransitionState".
        
        (* Clone *)
        Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              Value.StructRecord
                "revm::db::states::transition_state::TransitionState"
                [
                  ("transitions",
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::clone::Clone",
                        Ty.apply
                          (Ty.path "std::collections::hash::map::HashMap")
                          [
                            Ty.path "alloy_primitives::bits::address::Address";
                            Ty.path "revm::db::states::transition_account::TransitionAccount";
                            Ty.path "std::hash::random::RandomState"
                          ],
                        [],
                        "clone",
                        []
                      |),
                      [
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "revm::db::states::transition_state::TransitionState",
                          "transitions"
                        |)
                      ]
                    |))
                ]))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::clone::Clone"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("clone", InstanceField.Method clone) ].
      End Impl_core_clone_Clone_for_revm_db_states_transition_state_TransitionState.
      
      Module Impl_core_default_Default_for_revm_db_states_transition_state_TransitionState.
        Definition Self : Ty.t := Ty.path "revm::db::states::transition_state::TransitionState".
        
        (* Default *)
        Definition default (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [] =>
            ltac:(M.monadic
              (Value.StructRecord
                "revm::db::states::transition_state::TransitionState"
                [
                  ("transitions",
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::default::Default",
                        Ty.apply
                          (Ty.path "std::collections::hash::map::HashMap")
                          [
                            Ty.path "alloy_primitives::bits::address::Address";
                            Ty.path "revm::db::states::transition_account::TransitionAccount";
                            Ty.path "std::hash::random::RandomState"
                          ],
                        [],
                        "default",
                        []
                      |),
                      []
                    |))
                ]))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::default::Default"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("default", InstanceField.Method default) ].
      End Impl_core_default_Default_for_revm_db_states_transition_state_TransitionState.
      
      Module Impl_core_fmt_Debug_for_revm_db_states_transition_state_TransitionState.
        Definition Self : Ty.t := Ty.path "revm::db::states::transition_state::TransitionState".
        
        (* Debug *)
        Definition fmt (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::fmt::Formatter",
                  "debug_struct_field1_finish",
                  []
                |),
                [
                  M.read (| f |);
                  M.read (| Value.String "TransitionState" |);
                  M.read (| Value.String "transitions" |);
                  (* Unsize *)
                  M.pointer_coercion
                    (M.alloc (|
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm::db::states::transition_state::TransitionState",
                        "transitions"
                      |)
                    |))
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::fmt::Debug"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
      End Impl_core_fmt_Debug_for_revm_db_states_transition_state_TransitionState.
      
      Module Impl_core_marker_StructuralPartialEq_for_revm_db_states_transition_state_TransitionState.
        Definition Self : Ty.t := Ty.path "revm::db::states::transition_state::TransitionState".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::StructuralPartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_StructuralPartialEq_for_revm_db_states_transition_state_TransitionState.
      
      Module Impl_core_cmp_PartialEq_for_revm_db_states_transition_state_TransitionState.
        Definition Self : Ty.t := Ty.path "revm::db::states::transition_state::TransitionState".
        
        (* PartialEq *)
        Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; other ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let other := M.alloc (| other |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::cmp::PartialEq",
                  Ty.apply
                    (Ty.path "std::collections::hash::map::HashMap")
                    [
                      Ty.path "alloy_primitives::bits::address::Address";
                      Ty.path "revm::db::states::transition_account::TransitionAccount";
                      Ty.path "std::hash::random::RandomState"
                    ],
                  [
                    Ty.apply
                      (Ty.path "std::collections::hash::map::HashMap")
                      [
                        Ty.path "alloy_primitives::bits::address::Address";
                        Ty.path "revm::db::states::transition_account::TransitionAccount";
                        Ty.path "std::hash::random::RandomState"
                      ]
                  ],
                  "eq",
                  []
                |),
                [
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm::db::states::transition_state::TransitionState",
                    "transitions"
                  |);
                  M.SubPointer.get_struct_record_field (|
                    M.read (| other |),
                    "revm::db::states::transition_state::TransitionState",
                    "transitions"
                  |)
                ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::PartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("eq", InstanceField.Method eq) ].
      End Impl_core_cmp_PartialEq_for_revm_db_states_transition_state_TransitionState.
      
      Module Impl_core_marker_StructuralEq_for_revm_db_states_transition_state_TransitionState.
        Definition Self : Ty.t := Ty.path "revm::db::states::transition_state::TransitionState".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::StructuralEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_StructuralEq_for_revm_db_states_transition_state_TransitionState.
      
      Module Impl_core_cmp_Eq_for_revm_db_states_transition_state_TransitionState.
        Definition Self : Ty.t := Ty.path "revm::db::states::transition_state::TransitionState".
        
        (* Eq *)
        Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                M.match_operator (|
                  Value.DeclaredButUndefined,
                  [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::Eq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *)
            [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
      End Impl_core_cmp_Eq_for_revm_db_states_transition_state_TransitionState.
      
      Module Impl_revm_db_states_transition_state_TransitionState.
        Definition Self : Ty.t := Ty.path "revm::db::states::transition_state::TransitionState".
        
        (*
            pub fn single(address: Address, transition: TransitionAccount) -> Self {
                let mut transitions = HashMap::new();
                transitions.insert(address, transition);
                TransitionState { transitions }
            }
        *)
        Definition single (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ address; transition ] =>
            ltac:(M.monadic
              (let address := M.alloc (| address |) in
              let transition := M.alloc (| transition |) in
              M.read (|
                let~ transitions :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "std::collections::hash::map::HashMap")
                          [
                            Ty.path "alloy_primitives::bits::address::Address";
                            Ty.path "revm::db::states::transition_account::TransitionAccount";
                            Ty.path "std::hash::random::RandomState"
                          ],
                        "new",
                        []
                      |),
                      []
                    |)
                  |) in
                let~ _ :=
                  M.alloc (|
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "std::collections::hash::map::HashMap")
                          [
                            Ty.path "alloy_primitives::bits::address::Address";
                            Ty.path "revm::db::states::transition_account::TransitionAccount";
                            Ty.path "std::hash::random::RandomState"
                          ],
                        "insert",
                        []
                      |),
                      [ transitions; M.read (| address |); M.read (| transition |) ]
                    |)
                  |) in
                M.alloc (|
                  Value.StructRecord
                    "revm::db::states::transition_state::TransitionState"
                    [ ("transitions", M.read (| transitions |)) ]
                |)
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_single : M.IsAssociatedFunction Self "single" single.
        
        (*
            pub fn take(&mut self) -> TransitionState {
                core::mem::take(self)
            }
        *)
        Definition take (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_function (|
                  "core::mem::take",
                  [ Ty.path "revm::db::states::transition_state::TransitionState" ]
                |),
                [ M.read (| self |) ]
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_take : M.IsAssociatedFunction Self "take" take.
        
        (*
            pub fn add_transitions(&mut self, transitions: Vec<(Address, TransitionAccount)>) {
                for (address, account) in transitions {
                    match self.transitions.entry(address) {
                        Entry::Occupied(entry) => {
                            let entry = entry.into_mut();
                            entry.update(account);
                        }
                        Entry::Vacant(entry) => {
                            entry.insert(account);
                        }
                    }
                }
            }
        *)
        Definition add_transitions (τ : list Ty.t) (α : list Value.t) : M :=
          match τ, α with
          | [], [ self; transitions ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let transitions := M.alloc (| transitions |) in
              M.read (|
                M.use
                  (M.match_operator (|
                    M.alloc (|
                      M.call_closure (|
                        M.get_trait_method (|
                          "core::iter::traits::collect::IntoIterator",
                          Ty.apply
                            (Ty.path "alloc::vec::Vec")
                            [
                              Ty.tuple
                                [
                                  Ty.path "alloy_primitives::bits::address::Address";
                                  Ty.path "revm::db::states::transition_account::TransitionAccount"
                                ];
                              Ty.path "alloc::alloc::Global"
                            ],
                          [],
                          "into_iter",
                          []
                        |),
                        [ M.read (| transitions |) ]
                      |)
                    |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let iter := M.copy (| γ |) in
                          M.loop (|
                            ltac:(M.monadic
                              (let~ _ :=
                                M.match_operator (|
                                  M.alloc (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::iter::traits::iterator::Iterator",
                                        Ty.apply
                                          (Ty.path "alloc::vec::into_iter::IntoIter")
                                          [
                                            Ty.tuple
                                              [
                                                Ty.path "alloy_primitives::bits::address::Address";
                                                Ty.path
                                                  "revm::db::states::transition_account::TransitionAccount"
                                              ];
                                            Ty.path "alloc::alloc::Global"
                                          ],
                                        [],
                                        "next",
                                        []
                                      |),
                                      [ iter ]
                                    |)
                                  |),
                                  [
                                    fun γ =>
                                      ltac:(M.monadic
                                        (let _ :=
                                          M.is_struct_tuple (| γ, "core::option::Option::None" |) in
                                        M.alloc (|
                                          M.never_to_any (| M.read (| M.break (||) |) |)
                                        |)));
                                    fun γ =>
                                      ltac:(M.monadic
                                        (let γ0_0 :=
                                          M.SubPointer.get_struct_tuple_field (|
                                            γ,
                                            "core::option::Option::Some",
                                            0
                                          |) in
                                        let γ1_0 := M.SubPointer.get_tuple_field (| γ0_0, 0 |) in
                                        let γ1_1 := M.SubPointer.get_tuple_field (| γ0_0, 1 |) in
                                        let address := M.copy (| γ1_0 |) in
                                        let account := M.copy (| γ1_1 |) in
                                        M.match_operator (|
                                          M.alloc (|
                                            M.call_closure (|
                                              M.get_associated_function (|
                                                Ty.apply
                                                  (Ty.path "std::collections::hash::map::HashMap")
                                                  [
                                                    Ty.path
                                                      "alloy_primitives::bits::address::Address";
                                                    Ty.path
                                                      "revm::db::states::transition_account::TransitionAccount";
                                                    Ty.path "std::hash::random::RandomState"
                                                  ],
                                                "entry",
                                                []
                                              |),
                                              [
                                                M.SubPointer.get_struct_record_field (|
                                                  M.read (| self |),
                                                  "revm::db::states::transition_state::TransitionState",
                                                  "transitions"
                                                |);
                                                M.read (| address |)
                                              ]
                                            |)
                                          |),
                                          [
                                            fun γ =>
                                              ltac:(M.monadic
                                                (let γ0_0 :=
                                                  M.SubPointer.get_struct_tuple_field (|
                                                    γ,
                                                    "std::collections::hash::map::Entry::Occupied",
                                                    0
                                                  |) in
                                                let entry := M.copy (| γ0_0 |) in
                                                let~ entry :=
                                                  M.alloc (|
                                                    M.call_closure (|
                                                      M.get_associated_function (|
                                                        Ty.apply
                                                          (Ty.path
                                                            "std::collections::hash::map::OccupiedEntry")
                                                          [
                                                            Ty.path
                                                              "alloy_primitives::bits::address::Address";
                                                            Ty.path
                                                              "revm::db::states::transition_account::TransitionAccount"
                                                          ],
                                                        "into_mut",
                                                        []
                                                      |),
                                                      [ M.read (| entry |) ]
                                                    |)
                                                  |) in
                                                let~ _ :=
                                                  M.alloc (|
                                                    M.call_closure (|
                                                      M.get_associated_function (|
                                                        Ty.path
                                                          "revm::db::states::transition_account::TransitionAccount",
                                                        "update",
                                                        []
                                                      |),
                                                      [ M.read (| entry |); M.read (| account |) ]
                                                    |)
                                                  |) in
                                                M.alloc (| Value.Tuple [] |)));
                                            fun γ =>
                                              ltac:(M.monadic
                                                (let γ0_0 :=
                                                  M.SubPointer.get_struct_tuple_field (|
                                                    γ,
                                                    "std::collections::hash::map::Entry::Vacant",
                                                    0
                                                  |) in
                                                let entry := M.copy (| γ0_0 |) in
                                                let~ _ :=
                                                  M.alloc (|
                                                    M.call_closure (|
                                                      M.get_associated_function (|
                                                        Ty.apply
                                                          (Ty.path
                                                            "std::collections::hash::map::VacantEntry")
                                                          [
                                                            Ty.path
                                                              "alloy_primitives::bits::address::Address";
                                                            Ty.path
                                                              "revm::db::states::transition_account::TransitionAccount"
                                                          ],
                                                        "insert",
                                                        []
                                                      |),
                                                      [ M.read (| entry |); M.read (| account |) ]
                                                    |)
                                                  |) in
                                                M.alloc (| Value.Tuple [] |)))
                                          ]
                                        |)))
                                  ]
                                |) in
                              M.alloc (| Value.Tuple [] |)))
                          |)))
                    ]
                  |))
              |)))
          | _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_add_transitions :
          M.IsAssociatedFunction Self "add_transitions" add_transitions.
      End Impl_revm_db_states_transition_state_TransitionState.
    End transition_state.
  End states.
End db.