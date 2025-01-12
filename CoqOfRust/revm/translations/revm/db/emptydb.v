(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module db.
  Module emptydb.
    Axiom EmptyDB :
      (Ty.path "revm::db::emptydb::EmptyDB") =
        (Ty.apply
          (Ty.path "revm::db::emptydb::EmptyDBTyped")
          []
          [ Ty.path "core::convert::Infallible" ]).
    
    (* StructRecord
      {
        name := "EmptyDBTyped";
        const_params := [];
        ty_params := [ "E" ];
        fields := [ ("_phantom", Ty.apply (Ty.path "core::marker::PhantomData") [] [ E ]) ];
      } *)
    
    Module Impl_core_clone_Clone_for_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      (*
          fn clone(&self) -> Self {
              *self
          }
      *)
      Definition clone (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (| M.read (| self |) |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (E : Ty.t),
        M.IsTraitInstance
          "core::clone::Clone"
          (Self E)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method (clone E)) ].
    End Impl_core_clone_Clone_for_revm_db_emptydb_EmptyDBTyped_E.
    
    Module Impl_core_marker_Copy_for_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      Axiom Implements :
        forall (E : Ty.t),
        M.IsTraitInstance
          "core::marker::Copy"
          (Self E)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_for_revm_db_emptydb_EmptyDBTyped_E.
    
    Module Impl_core_default_Default_for_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      (*
          fn default() -> Self {
              Self::new()
          }
      *)
      Definition default (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [] =>
          ltac:(M.monadic
            (M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ],
                "new",
                []
              |),
              []
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (E : Ty.t),
        M.IsTraitInstance
          "core::default::Default"
          (Self E)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("default", InstanceField.Method (default E)) ].
    End Impl_core_default_Default_for_revm_db_emptydb_EmptyDBTyped_E.
    
    Module Impl_core_fmt_Debug_for_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      (*
          fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
              f.debug_struct("EmptyDB").finish_non_exhaustive()
          }
      *)
      Definition fmt (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; f ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let f := M.alloc (| f |) in
            M.call_closure (|
              M.get_associated_function (|
                Ty.path "core::fmt::builders::DebugStruct",
                "finish_non_exhaustive",
                []
              |),
              [
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::fmt::Formatter",
                      "debug_struct",
                      []
                    |),
                    [ M.read (| f |); M.read (| Value.String "EmptyDB" |) ]
                  |)
                |)
              ]
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (E : Ty.t),
        M.IsTraitInstance
          "core::fmt::Debug"
          (Self E)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method (fmt E)) ].
    End Impl_core_fmt_Debug_for_revm_db_emptydb_EmptyDBTyped_E.
    
    Module Impl_core_cmp_PartialEq_for_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      (*
          fn eq(&self, _: &Self) -> bool {
              true
          }
      *)
      Definition eq (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; β1 ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let β1 := M.alloc (| β1 |) in
            M.match_operator (| β1, [ fun γ => ltac:(M.monadic (Value.Bool true)) ] |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (E : Ty.t),
        M.IsTraitInstance
          "core::cmp::PartialEq"
          (Self E)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("eq", InstanceField.Method (eq E)) ].
    End Impl_core_cmp_PartialEq_for_revm_db_emptydb_EmptyDBTyped_E.
    
    Module Impl_core_cmp_Eq_for_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      Axiom Implements :
        forall (E : Ty.t),
        M.IsTraitInstance
          "core::cmp::Eq"
          (Self E)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_cmp_Eq_for_revm_db_emptydb_EmptyDBTyped_E.
    
    Module Impl_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      (*
          pub fn new() -> Self {
              Self {
                  _phantom: PhantomData,
              }
          }
      *)
      Definition new (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [] =>
          ltac:(M.monadic
            (Value.StructRecord
              "revm::db::emptydb::EmptyDBTyped"
              [ ("_phantom", Value.StructTuple "core::marker::PhantomData" []) ]))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new :
        forall (E : Ty.t),
        M.IsAssociatedFunction (Self E) "new" (new E).
      
      (*
          pub fn new_keccak_block_hash() -> Self {
              Self::new()
          }
      *)
      Definition new_keccak_block_hash
          (E : Ty.t)
          (ε : list Value.t)
          (τ : list Ty.t)
          (α : list Value.t)
          : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [] =>
          ltac:(M.monadic
            (M.call_closure (|
              M.get_associated_function (|
                Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ],
                "new",
                []
              |),
              []
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new_keccak_block_hash :
        forall (E : Ty.t),
        M.IsAssociatedFunction (Self E) "new_keccak_block_hash" (new_keccak_block_hash E).
    End Impl_revm_db_emptydb_EmptyDBTyped_E.
    
    Module Impl_revm_primitives_db_Database_for_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      (*     type Error = E; *)
      Definition _Error (E : Ty.t) : Ty.t := E.
      
      (*
          fn basic(&mut self, address: Address) -> Result<Option<AccountInfo>, Self::Error> {
              <Self as DatabaseRef>::basic_ref(self, address)
          }
      *)
      Definition basic (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; address ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let address := M.alloc (| address |) in
            M.call_closure (|
              M.get_trait_method (|
                "revm_primitives::db::DatabaseRef",
                Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ],
                [],
                "basic_ref",
                []
              |),
              [ M.read (| self |); M.read (| address |) ]
            |)))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn code_by_hash(&mut self, code_hash: B256) -> Result<Bytecode, Self::Error> {
              <Self as DatabaseRef>::code_by_hash_ref(self, code_hash)
          }
      *)
      Definition code_by_hash
          (E : Ty.t)
          (ε : list Value.t)
          (τ : list Ty.t)
          (α : list Value.t)
          : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; code_hash ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let code_hash := M.alloc (| code_hash |) in
            M.call_closure (|
              M.get_trait_method (|
                "revm_primitives::db::DatabaseRef",
                Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ],
                [],
                "code_by_hash_ref",
                []
              |),
              [ M.read (| self |); M.read (| code_hash |) ]
            |)))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn storage(&mut self, address: Address, index: U256) -> Result<U256, Self::Error> {
              <Self as DatabaseRef>::storage_ref(self, address, index)
          }
      *)
      Definition storage (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; address; index ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let address := M.alloc (| address |) in
            let index := M.alloc (| index |) in
            M.call_closure (|
              M.get_trait_method (|
                "revm_primitives::db::DatabaseRef",
                Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ],
                [],
                "storage_ref",
                []
              |),
              [ M.read (| self |); M.read (| address |); M.read (| index |) ]
            |)))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn block_hash(&mut self, number: U256) -> Result<B256, Self::Error> {
              <Self as DatabaseRef>::block_hash_ref(self, number)
          }
      *)
      Definition block_hash (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; number ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let number := M.alloc (| number |) in
            M.call_closure (|
              M.get_trait_method (|
                "revm_primitives::db::DatabaseRef",
                Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ],
                [],
                "block_hash_ref",
                []
              |),
              [ M.read (| self |); M.read (| number |) ]
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (E : Ty.t),
        M.IsTraitInstance
          "revm_primitives::db::Database"
          (Self E)
          (* Trait polymorphic types *) []
          (* Instance *)
          [
            ("Error", InstanceField.Ty (_Error E));
            ("basic", InstanceField.Method (basic E));
            ("code_by_hash", InstanceField.Method (code_by_hash E));
            ("storage", InstanceField.Method (storage E));
            ("block_hash", InstanceField.Method (block_hash E))
          ].
    End Impl_revm_primitives_db_Database_for_revm_db_emptydb_EmptyDBTyped_E.
    
    Module Impl_revm_primitives_db_DatabaseRef_for_revm_db_emptydb_EmptyDBTyped_E.
      Definition Self (E : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "revm::db::emptydb::EmptyDBTyped") [] [ E ].
      
      (*     type Error = E; *)
      Definition _Error (E : Ty.t) : Ty.t := E.
      
      (*
          fn basic_ref(&self, _address: Address) -> Result<Option<AccountInfo>, Self::Error> {
              Ok(None)
          }
      *)
      Definition basic_ref (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; _address ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let _address := M.alloc (| _address |) in
            Value.StructTuple
              "core::result::Result::Ok"
              [ Value.StructTuple "core::option::Option::None" [] ]))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn code_by_hash_ref(&self, _code_hash: B256) -> Result<Bytecode, Self::Error> {
              Ok(Bytecode::default())
          }
      *)
      Definition code_by_hash_ref
          (E : Ty.t)
          (ε : list Value.t)
          (τ : list Ty.t)
          (α : list Value.t)
          : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; _code_hash ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let _code_hash := M.alloc (| _code_hash |) in
            Value.StructTuple
              "core::result::Result::Ok"
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::default::Default",
                    Ty.path "revm_primitives::bytecode::Bytecode",
                    [],
                    "default",
                    []
                  |),
                  []
                |)
              ]))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn storage_ref(&self, _address: Address, _index: U256) -> Result<U256, Self::Error> {
              Ok(U256::default())
          }
      *)
      Definition storage_ref (E : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; _address; _index ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let _address := M.alloc (| _address |) in
            let _index := M.alloc (| _index |) in
            Value.StructTuple
              "core::result::Result::Ok"
              [
                M.call_closure (|
                  M.get_trait_method (|
                    "core::default::Default",
                    Ty.apply (Ty.path "ruint::Uint") [ Value.Integer 256; Value.Integer 4 ] [],
                    [],
                    "default",
                    []
                  |),
                  []
                |)
              ]))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn block_hash_ref(&self, number: U256) -> Result<B256, Self::Error> {
              Ok(keccak256(number.to_string().as_bytes()))
          }
      *)
      Definition block_hash_ref
          (E : Ty.t)
          (ε : list Value.t)
          (τ : list Ty.t)
          (α : list Value.t)
          : M :=
        let Self : Ty.t := Self E in
        match ε, τ, α with
        | [], [], [ self; number ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let number := M.alloc (| number |) in
            Value.StructTuple
              "core::result::Result::Ok"
              [
                M.call_closure (|
                  M.get_function (|
                    "alloy_primitives::utils::keccak256",
                    [ Ty.apply (Ty.path "&") [] [ Ty.apply (Ty.path "slice") [] [ Ty.path "u8" ] ] ]
                  |),
                  [
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.path "alloc::string::String",
                        "as_bytes",
                        []
                      |),
                      [
                        M.alloc (|
                          M.call_closure (|
                            M.get_trait_method (|
                              "alloc::string::ToString",
                              Ty.apply
                                (Ty.path "ruint::Uint")
                                [ Value.Integer 256; Value.Integer 4 ]
                                [],
                              [],
                              "to_string",
                              []
                            |),
                            [ number ]
                          |)
                        |)
                      ]
                    |)
                  ]
                |)
              ]))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (E : Ty.t),
        M.IsTraitInstance
          "revm_primitives::db::DatabaseRef"
          (Self E)
          (* Trait polymorphic types *) []
          (* Instance *)
          [
            ("Error", InstanceField.Ty (_Error E));
            ("basic_ref", InstanceField.Method (basic_ref E));
            ("code_by_hash_ref", InstanceField.Method (code_by_hash_ref E));
            ("storage_ref", InstanceField.Method (storage_ref E));
            ("block_hash_ref", InstanceField.Method (block_hash_ref E))
          ].
    End Impl_revm_primitives_db_DatabaseRef_for_revm_db_emptydb_EmptyDBTyped_E.
  End emptydb.
End db.
