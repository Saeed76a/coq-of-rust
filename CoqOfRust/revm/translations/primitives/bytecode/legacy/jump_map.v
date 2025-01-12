(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module bytecode.
  Module legacy.
    Module jump_map.
      (* StructTuple
        {
          name := "JumpTable";
          const_params := [];
          ty_params := [];
          fields :=
            [
              Ty.apply
                (Ty.path "alloc::sync::Arc")
                []
                [
                  Ty.apply
                    (Ty.path "bitvec::vec::BitVec")
                    []
                    [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                  Ty.path "alloc::alloc::Global"
                ]
            ];
        } *)
      
      Module Impl_core_clone_Clone_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
        Definition Self : Ty.t := Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable".
        
        (* Clone *)
        Definition clone (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              Value.StructTuple
                "revm_primitives::bytecode::legacy::jump_map::JumpTable"
                [
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.apply
                        (Ty.path "alloc::sync::Arc")
                        []
                        [
                          Ty.apply
                            (Ty.path "bitvec::vec::BitVec")
                            []
                            [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_tuple_field (|
                        M.read (| self |),
                        "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                        0
                      |)
                    ]
                  |)
                ]))
          | _, _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::clone::Clone"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("clone", InstanceField.Method clone) ].
      End Impl_core_clone_Clone_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
      
      Module Impl_core_default_Default_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
        Definition Self : Ty.t := Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable".
        
        (* Default *)
        Definition default (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [], [] =>
            ltac:(M.monadic
              (Value.StructTuple
                "revm_primitives::bytecode::legacy::jump_map::JumpTable"
                [
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.apply
                        (Ty.path "alloc::sync::Arc")
                        []
                        [
                          Ty.apply
                            (Ty.path "bitvec::vec::BitVec")
                            []
                            [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "default",
                      []
                    |),
                    []
                  |)
                ]))
          | _, _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::default::Default"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("default", InstanceField.Method default) ].
      End Impl_core_default_Default_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
      
      Module Impl_core_marker_StructuralPartialEq_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
        Definition Self : Ty.t := Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable".
        
        Axiom Implements :
          M.IsTraitInstance
            "core::marker::StructuralPartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [].
      End Impl_core_marker_StructuralPartialEq_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
      
      Module Impl_core_cmp_PartialEq_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
        Definition Self : Ty.t := Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable".
        
        (* PartialEq *)
        Definition eq (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [], [ self; other ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let other := M.alloc (| other |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::cmp::PartialEq",
                  Ty.apply
                    (Ty.path "alloc::sync::Arc")
                    []
                    [
                      Ty.apply
                        (Ty.path "bitvec::vec::BitVec")
                        []
                        [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                      Ty.path "alloc::alloc::Global"
                    ],
                  [
                    Ty.apply
                      (Ty.path "alloc::sync::Arc")
                      []
                      [
                        Ty.apply
                          (Ty.path "bitvec::vec::BitVec")
                          []
                          [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                        Ty.path "alloc::alloc::Global"
                      ]
                  ],
                  "eq",
                  []
                |),
                [
                  M.SubPointer.get_struct_tuple_field (|
                    M.read (| self |),
                    "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                    0
                  |);
                  M.SubPointer.get_struct_tuple_field (|
                    M.read (| other |),
                    "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                    0
                  |)
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::PartialEq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("eq", InstanceField.Method eq) ].
      End Impl_core_cmp_PartialEq_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
      
      Module Impl_core_cmp_Eq_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
        Definition Self : Ty.t := Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable".
        
        (* Eq *)
        Definition assert_receiver_is_total_eq
            (ε : list Value.t)
            (τ : list Ty.t)
            (α : list Value.t)
            : M :=
          match ε, τ, α with
          | [], [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.read (|
                M.match_operator (|
                  Value.DeclaredButUndefined,
                  [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                |)
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::cmp::Eq"
            Self
            (* Trait polymorphic types *) []
            (* Instance *)
            [ ("assert_receiver_is_total_eq", InstanceField.Method assert_receiver_is_total_eq) ].
      End Impl_core_cmp_Eq_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
      
      Module Impl_core_hash_Hash_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
        Definition Self : Ty.t := Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable".
        
        (* Hash *)
        Definition hash (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [ __H ], [ self; state ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let state := M.alloc (| state |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::hash::Hash",
                  Ty.apply
                    (Ty.path "alloc::sync::Arc")
                    []
                    [
                      Ty.apply
                        (Ty.path "bitvec::vec::BitVec")
                        []
                        [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                      Ty.path "alloc::alloc::Global"
                    ],
                  [],
                  "hash",
                  [ __H ]
                |),
                [
                  M.SubPointer.get_struct_tuple_field (|
                    M.read (| self |),
                    "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                    0
                  |);
                  M.read (| state |)
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::hash::Hash"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("hash", InstanceField.Method hash) ].
      End Impl_core_hash_Hash_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
      
      Module Impl_core_fmt_Debug_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
        Definition Self : Ty.t := Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable".
        
        (*
            fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
                f.debug_struct("JumpTable")
                    .field("map", &hex::encode(self.0.as_raw_slice()))
                    .finish()
            }
        *)
        Definition fmt (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [], [ self; f ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let f := M.alloc (| f |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::fmt::builders::DebugStruct",
                  "finish",
                  []
                |),
                [
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::fmt::builders::DebugStruct",
                      "field",
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
                          [ M.read (| f |); M.read (| Value.String "JumpTable" |) ]
                        |)
                      |);
                      M.read (| Value.String "map" |);
                      M.alloc (|
                        M.call_closure (|
                          M.get_function (|
                            "const_hex::encode",
                            [
                              Ty.apply
                                (Ty.path "&")
                                []
                                [ Ty.apply (Ty.path "slice") [] [ Ty.path "u8" ] ]
                            ]
                          |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.apply
                                  (Ty.path "bitvec::vec::BitVec")
                                  []
                                  [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ],
                                "as_raw_slice",
                                []
                              |),
                              [
                                M.call_closure (|
                                  M.get_trait_method (|
                                    "core::ops::deref::Deref",
                                    Ty.apply
                                      (Ty.path "alloc::sync::Arc")
                                      []
                                      [
                                        Ty.apply
                                          (Ty.path "bitvec::vec::BitVec")
                                          []
                                          [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                                        Ty.path "alloc::alloc::Global"
                                      ],
                                    [],
                                    "deref",
                                    []
                                  |),
                                  [
                                    M.SubPointer.get_struct_tuple_field (|
                                      M.read (| self |),
                                      "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                                      0
                                    |)
                                  ]
                                |)
                              ]
                            |)
                          ]
                        |)
                      |)
                    ]
                  |)
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom Implements :
          M.IsTraitInstance
            "core::fmt::Debug"
            Self
            (* Trait polymorphic types *) []
            (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
      End Impl_core_fmt_Debug_for_revm_primitives_bytecode_legacy_jump_map_JumpTable.
      
      Module Impl_revm_primitives_bytecode_legacy_jump_map_JumpTable.
        Definition Self : Ty.t := Ty.path "revm_primitives::bytecode::legacy::jump_map::JumpTable".
        
        (*
            pub fn as_slice(&self) -> &[u8] {
                self.0.as_raw_slice()
            }
        *)
        Definition as_slice (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [], [ self ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              M.call_closure (|
                M.get_associated_function (|
                  Ty.apply
                    (Ty.path "bitvec::vec::BitVec")
                    []
                    [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ],
                  "as_raw_slice",
                  []
                |),
                [
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::ops::deref::Deref",
                      Ty.apply
                        (Ty.path "alloc::sync::Arc")
                        []
                        [
                          Ty.apply
                            (Ty.path "bitvec::vec::BitVec")
                            []
                            [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "deref",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_tuple_field (|
                        M.read (| self |),
                        "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                        0
                      |)
                    ]
                  |)
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_as_slice : M.IsAssociatedFunction Self "as_slice" as_slice.
        
        (*
            pub fn from_slice(slice: &[u8]) -> Self {
                Self(Arc::new(BitVec::from_slice(slice)))
            }
        *)
        Definition from_slice (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [], [ slice ] =>
            ltac:(M.monadic
              (let slice := M.alloc (| slice |) in
              Value.StructTuple
                "revm_primitives::bytecode::legacy::jump_map::JumpTable"
                [
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "alloc::sync::Arc")
                        []
                        [
                          Ty.apply
                            (Ty.path "bitvec::vec::BitVec")
                            []
                            [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      "new",
                      []
                    |),
                    [
                      M.call_closure (|
                        M.get_associated_function (|
                          Ty.apply
                            (Ty.path "bitvec::vec::BitVec")
                            []
                            [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ],
                          "from_slice",
                          []
                        |),
                        [ M.read (| slice |) ]
                      |)
                    ]
                  |)
                ]))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_from_slice : M.IsAssociatedFunction Self "from_slice" from_slice.
        
        (*
            pub fn is_valid(&self, pc: usize) -> bool {
                pc < self.0.len() && self.0[pc]
            }
        *)
        Definition is_valid (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          match ε, τ, α with
          | [], [], [ self; pc ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let pc := M.alloc (| pc |) in
              LogicalOp.and (|
                BinOp.Pure.lt
                  (M.read (| pc |))
                  (M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "bitvec::vec::BitVec")
                        []
                        [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ],
                      "len",
                      []
                    |),
                    [
                      M.call_closure (|
                        M.get_trait_method (|
                          "core::ops::deref::Deref",
                          Ty.apply
                            (Ty.path "alloc::sync::Arc")
                            []
                            [
                              Ty.apply
                                (Ty.path "bitvec::vec::BitVec")
                                []
                                [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                              Ty.path "alloc::alloc::Global"
                            ],
                          [],
                          "deref",
                          []
                        |),
                        [
                          M.SubPointer.get_struct_tuple_field (|
                            M.read (| self |),
                            "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                            0
                          |)
                        ]
                      |)
                    ]
                  |)),
                ltac:(M.monadic
                  (M.read (|
                    M.call_closure (|
                      M.get_trait_method (|
                        "core::ops::index::Index",
                        Ty.apply
                          (Ty.path "bitvec::vec::BitVec")
                          []
                          [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ],
                        [ Ty.path "usize" ],
                        "index",
                        []
                      |),
                      [
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::deref::Deref",
                            Ty.apply
                              (Ty.path "alloc::sync::Arc")
                              []
                              [
                                Ty.apply
                                  (Ty.path "bitvec::vec::BitVec")
                                  []
                                  [ Ty.path "u8"; Ty.path "bitvec::order::Lsb0" ];
                                Ty.path "alloc::alloc::Global"
                              ],
                            [],
                            "deref",
                            []
                          |),
                          [
                            M.SubPointer.get_struct_tuple_field (|
                              M.read (| self |),
                              "revm_primitives::bytecode::legacy::jump_map::JumpTable",
                              0
                            |)
                          ]
                        |);
                        M.read (| pc |)
                      ]
                    |)
                  |)))
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_is_valid : M.IsAssociatedFunction Self "is_valid" is_valid.
      End Impl_revm_primitives_bytecode_legacy_jump_map_JumpTable.
    End jump_map.
  End legacy.
End bytecode.
