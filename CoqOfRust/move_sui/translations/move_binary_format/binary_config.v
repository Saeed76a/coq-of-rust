(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module binary_config.
  (* StructRecord
    {
      name := "TableConfig";
      const_params := [];
      ty_params := [];
      fields :=
        [
          ("module_handles", Ty.path "u16");
          ("struct_handles", Ty.path "u16");
          ("function_handles", Ty.path "u16");
          ("function_instantiations", Ty.path "u16");
          ("signatures", Ty.path "u16");
          ("constant_pool", Ty.path "u16");
          ("identifiers", Ty.path "u16");
          ("address_identifiers", Ty.path "u16");
          ("struct_defs", Ty.path "u16");
          ("struct_def_instantiations", Ty.path "u16");
          ("function_defs", Ty.path "u16");
          ("field_handles", Ty.path "u16");
          ("field_instantiations", Ty.path "u16");
          ("friend_decls", Ty.path "u16")
        ];
    } *)
  
  Module Impl_core_clone_Clone_for_move_binary_format_binary_config_TableConfig.
    Definition Self : Ty.t := Ty.path "move_binary_format::binary_config::TableConfig".
    
    (* Clone *)
    Definition clone (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match ε, τ, α with
      | [], [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          Value.StructRecord
            "move_binary_format::binary_config::TableConfig"
            [
              ("module_handles",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "module_handles"
                    |)
                  ]
                |));
              ("struct_handles",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "struct_handles"
                    |)
                  ]
                |));
              ("function_handles",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "function_handles"
                    |)
                  ]
                |));
              ("function_instantiations",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "function_instantiations"
                    |)
                  ]
                |));
              ("signatures",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "signatures"
                    |)
                  ]
                |));
              ("constant_pool",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "constant_pool"
                    |)
                  ]
                |));
              ("identifiers",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "identifiers"
                    |)
                  ]
                |));
              ("address_identifiers",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "address_identifiers"
                    |)
                  ]
                |));
              ("struct_defs",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "struct_defs"
                    |)
                  ]
                |));
              ("struct_def_instantiations",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "struct_def_instantiations"
                    |)
                  ]
                |));
              ("function_defs",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "function_defs"
                    |)
                  ]
                |));
              ("field_handles",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "field_handles"
                    |)
                  ]
                |));
              ("field_instantiations",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "field_instantiations"
                    |)
                  ]
                |));
              ("friend_decls",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u16", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::TableConfig",
                      "friend_decls"
                    |)
                  ]
                |))
            ]))
      | _, _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::clone::Clone"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("clone", InstanceField.Method clone) ].
  End Impl_core_clone_Clone_for_move_binary_format_binary_config_TableConfig.
  
  Module Impl_core_fmt_Debug_for_move_binary_format_binary_config_TableConfig.
    Definition Self : Ty.t := Ty.path "move_binary_format::binary_config::TableConfig".
    
    (* Debug *)
    Definition fmt (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match ε, τ, α with
      | [], [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.read (|
            let~ names :=
              M.alloc (|
                M.alloc (|
                  Value.Array
                    [
                      M.read (| Value.String "module_handles" |);
                      M.read (| Value.String "struct_handles" |);
                      M.read (| Value.String "function_handles" |);
                      M.read (| Value.String "function_instantiations" |);
                      M.read (| Value.String "signatures" |);
                      M.read (| Value.String "constant_pool" |);
                      M.read (| Value.String "identifiers" |);
                      M.read (| Value.String "address_identifiers" |);
                      M.read (| Value.String "struct_defs" |);
                      M.read (| Value.String "struct_def_instantiations" |);
                      M.read (| Value.String "function_defs" |);
                      M.read (| Value.String "field_handles" |);
                      M.read (| Value.String "field_instantiations" |);
                      M.read (| Value.String "friend_decls" |)
                    ]
                |)
              |) in
            let~ values :=
              M.alloc (|
                M.alloc (|
                  Value.Array
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "module_handles"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "struct_handles"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "function_handles"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "function_instantiations"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "signatures"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "constant_pool"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "identifiers"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "address_identifiers"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "struct_defs"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "struct_def_instantiations"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "function_defs"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "field_handles"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "move_binary_format::binary_config::TableConfig",
                        "field_instantiations"
                      |);
                      M.alloc (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "move_binary_format::binary_config::TableConfig",
                          "friend_decls"
                        |)
                      |)
                    ]
                |)
              |) in
            M.alloc (|
              M.call_closure (|
                M.get_associated_function (|
                  Ty.path "core::fmt::Formatter",
                  "debug_struct_fields_finish",
                  []
                |),
                [
                  M.read (| f |);
                  M.read (| Value.String "TableConfig" |);
                  M.read (| names |);
                  M.read (| values |)
                ]
              |)
            |)
          |)))
      | _, _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::fmt::Debug"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
  End Impl_core_fmt_Debug_for_move_binary_format_binary_config_TableConfig.
  
  Module Impl_move_binary_format_binary_config_TableConfig.
    Definition Self : Ty.t := Ty.path "move_binary_format::binary_config::TableConfig".
    
    (*
        pub fn legacy() -> Self {
            TableConfig {
                module_handles: u16::MAX,
                struct_handles: u16::MAX,
                function_handles: u16::MAX,
                function_instantiations: u16::MAX,
                signatures: u16::MAX,
                constant_pool: u16::MAX,
                identifiers: u16::MAX,
                address_identifiers: u16::MAX,
                struct_defs: u16::MAX,
                struct_def_instantiations: u16::MAX,
                function_defs: u16::MAX,
                field_handles: u16::MAX,
                field_instantiations: u16::MAX,
                friend_decls: u16::MAX,
            }
        }
    *)
    Definition legacy (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match ε, τ, α with
      | [], [], [] =>
        ltac:(M.monadic
          (Value.StructRecord
            "move_binary_format::binary_config::TableConfig"
            [
              ("module_handles", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("struct_handles", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("function_handles", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("function_instantiations", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("signatures", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("constant_pool", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("identifiers", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("address_identifiers", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("struct_defs", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("struct_def_instantiations", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("function_defs", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("field_handles", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("field_instantiations", M.read (| M.get_constant (| "core::num::MAX" |) |));
              ("friend_decls", M.read (| M.get_constant (| "core::num::MAX" |) |))
            ]))
      | _, _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_legacy : M.IsAssociatedFunction Self "legacy" legacy.
  End Impl_move_binary_format_binary_config_TableConfig.
  
  (* StructRecord
    {
      name := "BinaryConfig";
      const_params := [];
      ty_params := [];
      fields :=
        [
          ("max_binary_format_version", Ty.path "u32");
          ("check_no_extraneous_bytes", Ty.path "bool");
          ("table_config", Ty.path "move_binary_format::binary_config::TableConfig")
        ];
    } *)
  
  Module Impl_core_clone_Clone_for_move_binary_format_binary_config_BinaryConfig.
    Definition Self : Ty.t := Ty.path "move_binary_format::binary_config::BinaryConfig".
    
    (* Clone *)
    Definition clone (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match ε, τ, α with
      | [], [], [ self ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          Value.StructRecord
            "move_binary_format::binary_config::BinaryConfig"
            [
              ("max_binary_format_version",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "u32", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::BinaryConfig",
                      "max_binary_format_version"
                    |)
                  ]
                |));
              ("check_no_extraneous_bytes",
                M.call_closure (|
                  M.get_trait_method (| "core::clone::Clone", Ty.path "bool", [], "clone", [] |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::BinaryConfig",
                      "check_no_extraneous_bytes"
                    |)
                  ]
                |));
              ("table_config",
                M.call_closure (|
                  M.get_trait_method (|
                    "core::clone::Clone",
                    Ty.path "move_binary_format::binary_config::TableConfig",
                    [],
                    "clone",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "move_binary_format::binary_config::BinaryConfig",
                      "table_config"
                    |)
                  ]
                |))
            ]))
      | _, _, _ => M.impossible
      end.
    
    Axiom Implements :
      M.IsTraitInstance
        "core::clone::Clone"
        Self
        (* Trait polymorphic types *) []
        (* Instance *) [ ("clone", InstanceField.Method clone) ].
  End Impl_core_clone_Clone_for_move_binary_format_binary_config_BinaryConfig.
  
  Module Impl_core_fmt_Debug_for_move_binary_format_binary_config_BinaryConfig.
    Definition Self : Ty.t := Ty.path "move_binary_format::binary_config::BinaryConfig".
    
    (* Debug *)
    Definition fmt (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match ε, τ, α with
      | [], [], [ self; f ] =>
        ltac:(M.monadic
          (let self := M.alloc (| self |) in
          let f := M.alloc (| f |) in
          M.call_closure (|
            M.get_associated_function (|
              Ty.path "core::fmt::Formatter",
              "debug_struct_field3_finish",
              []
            |),
            [
              M.read (| f |);
              M.read (| Value.String "BinaryConfig" |);
              M.read (| Value.String "max_binary_format_version" |);
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "move_binary_format::binary_config::BinaryConfig",
                "max_binary_format_version"
              |);
              M.read (| Value.String "check_no_extraneous_bytes" |);
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "move_binary_format::binary_config::BinaryConfig",
                "check_no_extraneous_bytes"
              |);
              M.read (| Value.String "table_config" |);
              M.alloc (|
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "move_binary_format::binary_config::BinaryConfig",
                  "table_config"
                |)
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
  End Impl_core_fmt_Debug_for_move_binary_format_binary_config_BinaryConfig.
  
  Module Impl_move_binary_format_binary_config_BinaryConfig.
    Definition Self : Ty.t := Ty.path "move_binary_format::binary_config::BinaryConfig".
    
    (*
        pub fn new(
            max_binary_format_version: u32,
            check_no_extraneous_bytes: bool,
            table_config: TableConfig,
        ) -> Self {
            Self {
                max_binary_format_version,
                check_no_extraneous_bytes,
                table_config,
            }
        }
    *)
    Definition new (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match ε, τ, α with
      | [], [], [ max_binary_format_version; check_no_extraneous_bytes; table_config ] =>
        ltac:(M.monadic
          (let max_binary_format_version := M.alloc (| max_binary_format_version |) in
          let check_no_extraneous_bytes := M.alloc (| check_no_extraneous_bytes |) in
          let table_config := M.alloc (| table_config |) in
          Value.StructRecord
            "move_binary_format::binary_config::BinaryConfig"
            [
              ("max_binary_format_version", M.read (| max_binary_format_version |));
              ("check_no_extraneous_bytes", M.read (| check_no_extraneous_bytes |));
              ("table_config", M.read (| table_config |))
            ]))
      | _, _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
    
    (*
        pub fn legacy(max_binary_format_version: u32, check_no_extraneous_bytes: bool) -> Self {
            Self {
                max_binary_format_version,
                check_no_extraneous_bytes,
                table_config: TableConfig::legacy(),
            }
        }
    *)
    Definition legacy (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match ε, τ, α with
      | [], [], [ max_binary_format_version; check_no_extraneous_bytes ] =>
        ltac:(M.monadic
          (let max_binary_format_version := M.alloc (| max_binary_format_version |) in
          let check_no_extraneous_bytes := M.alloc (| check_no_extraneous_bytes |) in
          Value.StructRecord
            "move_binary_format::binary_config::BinaryConfig"
            [
              ("max_binary_format_version", M.read (| max_binary_format_version |));
              ("check_no_extraneous_bytes", M.read (| check_no_extraneous_bytes |));
              ("table_config",
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "move_binary_format::binary_config::TableConfig",
                    "legacy",
                    []
                  |),
                  []
                |))
            ]))
      | _, _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_legacy : M.IsAssociatedFunction Self "legacy" legacy.
    
    (*
        pub fn with_extraneous_bytes_check(check_no_extraneous_bytes: bool) -> Self {
            Self {
                max_binary_format_version: VERSION_MAX,
                check_no_extraneous_bytes,
                table_config: TableConfig::legacy(),
            }
        }
    *)
    Definition with_extraneous_bytes_check
        (ε : list Value.t)
        (τ : list Ty.t)
        (α : list Value.t)
        : M :=
      match ε, τ, α with
      | [], [], [ check_no_extraneous_bytes ] =>
        ltac:(M.monadic
          (let check_no_extraneous_bytes := M.alloc (| check_no_extraneous_bytes |) in
          Value.StructRecord
            "move_binary_format::binary_config::BinaryConfig"
            [
              ("max_binary_format_version",
                M.read (|
                  M.get_constant (| "move_binary_format::file_format_common::VERSION_MAX" |)
                |));
              ("check_no_extraneous_bytes", M.read (| check_no_extraneous_bytes |));
              ("table_config",
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "move_binary_format::binary_config::TableConfig",
                    "legacy",
                    []
                  |),
                  []
                |))
            ]))
      | _, _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_with_extraneous_bytes_check :
      M.IsAssociatedFunction Self "with_extraneous_bytes_check" with_extraneous_bytes_check.
    
    (*
        pub fn standard() -> Self {
            Self {
                max_binary_format_version: VERSION_MAX,
                check_no_extraneous_bytes: true,
                table_config: TableConfig::legacy(),
            }
        }
    *)
    Definition standard (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
      match ε, τ, α with
      | [], [], [] =>
        ltac:(M.monadic
          (Value.StructRecord
            "move_binary_format::binary_config::BinaryConfig"
            [
              ("max_binary_format_version",
                M.read (|
                  M.get_constant (| "move_binary_format::file_format_common::VERSION_MAX" |)
                |));
              ("check_no_extraneous_bytes", Value.Bool true);
              ("table_config",
                M.call_closure (|
                  M.get_associated_function (|
                    Ty.path "move_binary_format::binary_config::TableConfig",
                    "legacy",
                    []
                  |),
                  []
                |))
            ]))
      | _, _, _ => M.impossible
      end.
    
    Axiom AssociatedFunction_standard : M.IsAssociatedFunction Self "standard" standard.
  End Impl_move_binary_format_binary_config_BinaryConfig.
End binary_config.