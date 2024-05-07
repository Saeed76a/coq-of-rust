(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module interpreter_action.
  Module eof_create_outcome.
    (* StructRecord
      {
        name := "EOFCreateOutcome";
        ty_params := [];
        fields :=
          [
            ("result", Ty.path "revm_interpreter::interpreter::InterpreterResult");
            ("address", Ty.path "alloy_primitives::bits::address::Address");
            ("return_memory_range",
              Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ])
          ];
      } *)
    
    Module Impl_core_fmt_Debug_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome".
      
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
                "debug_struct_field3_finish",
                []
              |),
              [
                M.read (| f |);
                M.read (| Value.String "EOFCreateOutcome" |);
                M.read (| Value.String "result" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                    "result"
                  |));
                M.read (| Value.String "address" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                    "address"
                  |));
                M.read (| Value.String "return_memory_range" |);
                (* Unsize *)
                M.pointer_coercion
                  (M.alloc (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                      "return_memory_range"
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
    End Impl_core_fmt_Debug_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
    
    Module Impl_core_clone_Clone_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome".
      
      (* Clone *)
      Definition clone (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            Value.StructRecord
              "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome"
              [
                ("result",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.path "revm_interpreter::interpreter::InterpreterResult",
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                        "result"
                      |)
                    ]
                  |));
                ("address",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.path "alloy_primitives::bits::address::Address",
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                        "address"
                      |)
                    ]
                  |));
                ("return_memory_range",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ],
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                        "return_memory_range"
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
    End Impl_core_clone_Clone_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
    
    Module Impl_core_marker_StructuralPartialEq_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralPartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralPartialEq_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
    
    Module Impl_core_cmp_PartialEq_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome".
      
      (* PartialEq *)
      Definition eq (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
            LogicalOp.and (|
              LogicalOp.and (|
                M.call_closure (|
                  M.get_trait_method (|
                    "core::cmp::PartialEq",
                    Ty.path "revm_interpreter::interpreter::InterpreterResult",
                    [ Ty.path "revm_interpreter::interpreter::InterpreterResult" ],
                    "eq",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                      "result"
                    |);
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                      "result"
                    |)
                  ]
                |),
                ltac:(M.monadic
                  (M.call_closure (|
                    M.get_trait_method (|
                      "core::cmp::PartialEq",
                      Ty.path "alloy_primitives::bits::address::Address",
                      [ Ty.path "alloy_primitives::bits::address::Address" ],
                      "eq",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                        "address"
                      |);
                      M.SubPointer.get_struct_record_field (|
                        M.read (| other |),
                        "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                        "address"
                      |)
                    ]
                  |)))
              |),
              ltac:(M.monadic
                (M.call_closure (|
                  M.get_trait_method (|
                    "core::cmp::PartialEq",
                    Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ],
                    [ Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ] ],
                    "eq",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                      "return_memory_range"
                    |);
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                      "return_memory_range"
                    |)
                  ]
                |)))
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::cmp::PartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("eq", InstanceField.Method eq) ].
    End Impl_core_cmp_PartialEq_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
    
    Module Impl_core_marker_StructuralEq_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralEq_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
    
    Module Impl_core_cmp_Eq_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome".
      
      (* Eq *)
      Definition assert_receiver_is_total_eq (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.match_operator (|
                Value.DeclaredButUndefined,
                [
                  fun γ =>
                    ltac:(M.monadic
                      (M.match_operator (|
                        Value.DeclaredButUndefined,
                        [
                          fun γ =>
                            ltac:(M.monadic
                              (M.match_operator (|
                                Value.DeclaredButUndefined,
                                [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                              |)))
                        ]
                      |)))
                ]
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
    End Impl_core_cmp_Eq_for_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
    
    Module Impl_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome".
      
      (*
          pub fn new(
              result: InterpreterResult,
              address: Address,
              return_memory_range: Range<usize>,
          ) -> Self {
              Self {
                  result,
                  address,
                  return_memory_range,
              }
          }
      *)
      Definition new (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ result; address; return_memory_range ] =>
          ltac:(M.monadic
            (let result := M.alloc (| result |) in
            let address := M.alloc (| address |) in
            let return_memory_range := M.alloc (| return_memory_range |) in
            Value.StructRecord
              "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome"
              [
                ("result", M.read (| result |));
                ("address", M.read (| address |));
                ("return_memory_range", M.read (| return_memory_range |))
              ]))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
      
      (*
          pub fn instruction_result(&self) -> &InstructionResult {
              &self.result.result
          }
      *)
      Definition instruction_result (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.SubPointer.get_struct_record_field (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                "result"
              |),
              "revm_interpreter::interpreter::InterpreterResult",
              "result"
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_instruction_result :
        M.IsAssociatedFunction Self "instruction_result" instruction_result.
      
      (*
          pub fn output(&self) -> &Bytes {
              &self.result.output
          }
      *)
      Definition output (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.SubPointer.get_struct_record_field (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                "result"
              |),
              "revm_interpreter::interpreter::InterpreterResult",
              "output"
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_output : M.IsAssociatedFunction Self "output" output.
      
      (*
          pub fn gas(&self) -> &Gas {
              &self.result.gas
          }
      *)
      Definition gas (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.SubPointer.get_struct_record_field (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                "result"
              |),
              "revm_interpreter::interpreter::InterpreterResult",
              "gas"
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_gas : M.IsAssociatedFunction Self "gas" gas.
      
      (*
          pub fn return_range(&self) -> Range<usize> {
              self.return_memory_range.clone()
          }
      *)
      Definition return_range (τ : list Ty.t) (α : list Value.t) : M :=
        match τ, α with
        | [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::clone::Clone",
                Ty.apply (Ty.path "core::ops::range::Range") [ Ty.path "usize" ],
                [],
                "clone",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::interpreter_action::eof_create_outcome::EOFCreateOutcome",
                  "return_memory_range"
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_return_range :
        M.IsAssociatedFunction Self "return_range" return_range.
    End Impl_revm_interpreter_interpreter_action_eof_create_outcome_EOFCreateOutcome.
  End eof_create_outcome.
End interpreter_action.