(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module interpreter_action.
  Module call_outcome.
    (* StructRecord
      {
        name := "CallOutcome";
        const_params := [];
        ty_params := [];
        fields :=
          [
            ("result", Ty.path "revm_interpreter::interpreter::InterpreterResult");
            ("memory_offset", Ty.apply (Ty.path "core::ops::range::Range") [] [ Ty.path "usize" ])
          ];
      } *)
    
    Module Impl_core_clone_Clone_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::call_outcome::CallOutcome".
      
      (* Clone *)
      Definition clone (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            Value.StructRecord
              "revm_interpreter::interpreter_action::call_outcome::CallOutcome"
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
                        "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                        "result"
                      |)
                    ]
                  |));
                ("memory_offset",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::clone::Clone",
                      Ty.apply (Ty.path "core::ops::range::Range") [] [ Ty.path "usize" ],
                      [],
                      "clone",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                        "memory_offset"
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
    End Impl_core_clone_Clone_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
    
    Module Impl_core_fmt_Debug_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::call_outcome::CallOutcome".
      
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
                "debug_struct_field2_finish",
                []
              |),
              [
                M.read (| f |);
                M.read (| Value.String "CallOutcome" |);
                M.read (| Value.String "result" |);
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                  "result"
                |);
                M.read (| Value.String "memory_offset" |);
                M.alloc (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                    "memory_offset"
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
    End Impl_core_fmt_Debug_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
    
    Module Impl_core_marker_StructuralPartialEq_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::call_outcome::CallOutcome".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::StructuralPartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_StructuralPartialEq_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
    
    Module Impl_core_cmp_PartialEq_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::call_outcome::CallOutcome".
      
      (* PartialEq *)
      Definition eq (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self; other ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let other := M.alloc (| other |) in
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
                    "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                    "result"
                  |);
                  M.SubPointer.get_struct_record_field (|
                    M.read (| other |),
                    "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                    "result"
                  |)
                ]
              |),
              ltac:(M.monadic
                (M.call_closure (|
                  M.get_trait_method (|
                    "core::cmp::PartialEq",
                    Ty.apply (Ty.path "core::ops::range::Range") [] [ Ty.path "usize" ],
                    [ Ty.apply (Ty.path "core::ops::range::Range") [] [ Ty.path "usize" ] ],
                    "eq",
                    []
                  |),
                  [
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                      "memory_offset"
                    |);
                    M.SubPointer.get_struct_record_field (|
                      M.read (| other |),
                      "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                      "memory_offset"
                    |)
                  ]
                |)))
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::cmp::PartialEq"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("eq", InstanceField.Method eq) ].
    End Impl_core_cmp_PartialEq_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
    
    Module Impl_core_cmp_Eq_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::call_outcome::CallOutcome".
      
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
                [
                  fun γ =>
                    ltac:(M.monadic
                      (M.match_operator (|
                        Value.DeclaredButUndefined,
                        [ fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |))) ]
                      |)))
                ]
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
    End Impl_core_cmp_Eq_for_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
    
    Module Impl_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
      Definition Self : Ty.t :=
        Ty.path "revm_interpreter::interpreter_action::call_outcome::CallOutcome".
      
      (*
          pub fn new(result: InterpreterResult, memory_offset: Range<usize>) -> Self {
              Self {
                  result,
                  memory_offset,
              }
          }
      *)
      Definition new (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ result; memory_offset ] =>
          ltac:(M.monadic
            (let result := M.alloc (| result |) in
            let memory_offset := M.alloc (| memory_offset |) in
            Value.StructRecord
              "revm_interpreter::interpreter_action::call_outcome::CallOutcome"
              [ ("result", M.read (| result |)); ("memory_offset", M.read (| memory_offset |)) ]))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
      
      (*
          pub fn instruction_result(&self) -> &InstructionResult {
              &self.result.result
          }
      *)
      Definition instruction_result (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.SubPointer.get_struct_record_field (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                "result"
              |),
              "revm_interpreter::interpreter::InterpreterResult",
              "result"
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_instruction_result :
        M.IsAssociatedFunction Self "instruction_result" instruction_result.
      
      (*
          pub fn gas(&self) -> Gas {
              self.result.gas
          }
      *)
      Definition gas (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                  "result"
                |),
                "revm_interpreter::interpreter::InterpreterResult",
                "gas"
              |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_gas : M.IsAssociatedFunction Self "gas" gas.
      
      (*
          pub fn output(&self) -> &Bytes {
              &self.result.output
          }
      *)
      Definition output (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.SubPointer.get_struct_record_field (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                "result"
              |),
              "revm_interpreter::interpreter::InterpreterResult",
              "output"
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_output : M.IsAssociatedFunction Self "output" output.
      
      (*
          pub fn memory_start(&self) -> usize {
              self.memory_offset.start
          }
      *)
      Definition memory_start (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                  "memory_offset"
                |),
                "core::ops::range::Range",
                "start"
              |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_memory_start :
        M.IsAssociatedFunction Self "memory_start" memory_start.
      
      (*
          pub fn memory_length(&self) -> usize {
              self.memory_offset.len()
          }
      *)
      Definition memory_length (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::iter::traits::exact_size::ExactSizeIterator",
                Ty.apply (Ty.path "core::ops::range::Range") [] [ Ty.path "usize" ],
                [],
                "len",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                  "memory_offset"
                |)
              ]
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_memory_length :
        M.IsAssociatedFunction Self "memory_length" memory_length.
    End Impl_revm_interpreter_interpreter_action_call_outcome_CallOutcome.
  End call_outcome.
End interpreter_action.
