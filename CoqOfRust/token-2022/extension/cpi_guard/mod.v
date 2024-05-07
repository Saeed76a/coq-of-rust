(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module extension.
  Module cpi_guard.
    (* StructRecord
      {
        name := "CpiGuard";
        ty_params := [];
        fields := [ ("lock_cpi", Ty.path "spl_pod::primitives::PodBool") ];
      } *)
    
    Module Impl_core_clone_Clone_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
      (* Clone *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.match_operator (|
                Value.DeclaredButUndefined,
                [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
              |)
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    Module Impl_core_marker_Copy_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::Copy"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    Module Impl_core_fmt_Debug_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
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
                M.read (| Value.String "CpiGuard" |);
                M.read (| Value.String "lock_cpi" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "spl_token_2022::extension::cpi_guard::CpiGuard",
                      "lock_cpi"
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
    End Impl_core_fmt_Debug_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    Module Impl_core_default_Default_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
      (* Default *)
      Definition default (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [] =>
          ltac:(M.monadic
            (Value.StructRecord
              "spl_token_2022::extension::cpi_guard::CpiGuard"
              [
                ("lock_cpi",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "spl_pod::primitives::PodBool",
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
    End Impl_core_default_Default_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    Module Impl_core_marker_StructuralPartialEq_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralPartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralPartialEq_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    Module Impl_core_cmp_PartialEq_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
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
                Ty.path "spl_pod::primitives::PodBool",
                [ Ty.path "spl_pod::primitives::PodBool" ],
                "eq",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "spl_token_2022::extension::cpi_guard::CpiGuard",
                  "lock_cpi"
                |);
                M.SubPointer.get_struct_record_field (|
                  M.read (| other |),
                  "spl_token_2022::extension::cpi_guard::CpiGuard",
                  "lock_cpi"
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
    End Impl_core_cmp_PartialEq_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    Module Impl_bytemuck_pod_Pod_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
      Axiom Implements :
        M.IsTraitInstance
          "bytemuck::pod::Pod"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_bytemuck_pod_Pod_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    Module Impl_bytemuck_zeroable_Zeroable_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
      Axiom Implements :
        M.IsTraitInstance
          "bytemuck::zeroable::Zeroable"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_bytemuck_zeroable_Zeroable_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    Module Impl_spl_token_2022_extension_Extension_for_spl_token_2022_extension_cpi_guard_CpiGuard.
      Definition Self : Ty.t := Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard".
      
      (*     const TYPE: ExtensionType = ExtensionType::CpiGuard; *)
      (* Ty.path "spl_token_2022::extension::ExtensionType" *)
      Definition value_TYPE : Value.t :=
        M.run
          ltac:(M.monadic
            (M.alloc (|
              Value.StructTuple "spl_token_2022::extension::ExtensionType::CpiGuard" []
            |))).
      
      Axiom Implements :
        M.IsTraitInstance
          "spl_token_2022::extension::Extension"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("value_TYPE", InstanceField.Constant value_TYPE) ].
    End Impl_spl_token_2022_extension_Extension_for_spl_token_2022_extension_cpi_guard_CpiGuard.
    
    (*
    pub fn cpi_guard_enabled(account_state: &StateWithExtensionsMut<Account>) -> bool {
        if let Ok(extension) = account_state.get_extension::<CpiGuard>() {
            return extension.lock_cpi.into();
        }
        false
    }
    *)
    Definition cpi_guard_enabled (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [ account_state ] =>
        ltac:(M.monadic
          (let account_state := M.alloc (| account_state |) in
          M.catch_return (|
            ltac:(M.monadic
              (M.read (|
                let _ :=
                  M.match_operator (|
                    M.alloc (| Value.Tuple [] |),
                    [
                      fun γ =>
                        ltac:(M.monadic
                          (let γ :=
                            M.alloc (|
                              M.call_closure (|
                                M.get_trait_method (|
                                  "spl_token_2022::extension::BaseStateWithExtensions",
                                  Ty.apply
                                    (Ty.path "spl_token_2022::extension::StateWithExtensionsMut")
                                    [ Ty.path "spl_token_2022::state::Account" ],
                                  [ Ty.path "spl_token_2022::state::Account" ],
                                  "get_extension",
                                  [ Ty.path "spl_token_2022::extension::cpi_guard::CpiGuard" ]
                                |),
                                [ M.read (| account_state |) ]
                              |)
                            |) in
                          let γ0_0 :=
                            M.SubPointer.get_struct_tuple_field (|
                              γ,
                              "core::result::Result::Ok",
                              0
                            |) in
                          let extension := M.copy (| γ0_0 |) in
                          M.alloc (|
                            M.never_to_any (|
                              M.read (|
                                M.return_ (|
                                  M.call_closure (|
                                    M.get_trait_method (|
                                      "core::convert::Into",
                                      Ty.path "spl_pod::primitives::PodBool",
                                      [ Ty.path "bool" ],
                                      "into",
                                      []
                                    |),
                                    [
                                      M.read (|
                                        M.SubPointer.get_struct_record_field (|
                                          M.read (| extension |),
                                          "spl_token_2022::extension::cpi_guard::CpiGuard",
                                          "lock_cpi"
                                        |)
                                      |)
                                    ]
                                  |)
                                |)
                              |)
                            |)
                          |)));
                      fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                    ]
                  |) in
                M.alloc (| Value.Bool false |)
              |)))
          |)))
      | _, _ => M.impossible
      end.
    
    (*
    pub fn in_cpi() -> bool {
        get_stack_height() > TRANSACTION_LEVEL_STACK_HEIGHT
    }
    *)
    Definition in_cpi (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [], [] =>
        ltac:(M.monadic
          (BinOp.Pure.gt
            (M.call_closure (|
              M.get_function (| "solana_program::instruction::get_stack_height", [] |),
              []
            |))
            (M.read (|
              M.get_constant (| "solana_program::instruction::TRANSACTION_LEVEL_STACK_HEIGHT" |)
            |))))
      | _, _ => M.impossible
      end.
  End cpi_guard.
End extension.