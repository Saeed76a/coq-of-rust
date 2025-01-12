(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module inspector.
  Module gas.
    (* StructRecord
      {
        name := "GasInspector";
        const_params := [];
        ty_params := [];
        fields := [ ("gas_remaining", Ty.path "u64"); ("last_gas_cost", Ty.path "u64") ];
      } *)
    
    Module Impl_core_clone_Clone_for_revm_inspector_gas_GasInspector.
      Definition Self : Ty.t := Ty.path "revm::inspector::gas::GasInspector".
      
      (* Clone *)
      Definition clone (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.match_operator (|
                Value.DeclaredButUndefined,
                [ fun γ => ltac:(M.monadic (M.read (| self |))) ]
              |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::clone::Clone"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("clone", InstanceField.Method clone) ].
    End Impl_core_clone_Clone_for_revm_inspector_gas_GasInspector.
    
    Module Impl_core_marker_Copy_for_revm_inspector_gas_GasInspector.
      Definition Self : Ty.t := Ty.path "revm::inspector::gas::GasInspector".
      
      Axiom Implements :
        M.IsTraitInstance
          "core::marker::Copy"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Copy_for_revm_inspector_gas_GasInspector.
    
    Module Impl_core_fmt_Debug_for_revm_inspector_gas_GasInspector.
      Definition Self : Ty.t := Ty.path "revm::inspector::gas::GasInspector".
      
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
                M.read (| Value.String "GasInspector" |);
                M.read (| Value.String "gas_remaining" |);
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "revm::inspector::gas::GasInspector",
                  "gas_remaining"
                |);
                M.read (| Value.String "last_gas_cost" |);
                M.alloc (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm::inspector::gas::GasInspector",
                    "last_gas_cost"
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
    End Impl_core_fmt_Debug_for_revm_inspector_gas_GasInspector.
    
    Module Impl_core_default_Default_for_revm_inspector_gas_GasInspector.
      Definition Self : Ty.t := Ty.path "revm::inspector::gas::GasInspector".
      
      (* Default *)
      Definition default (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [] =>
          ltac:(M.monadic
            (Value.StructRecord
              "revm::inspector::gas::GasInspector"
              [
                ("gas_remaining",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "u64",
                      [],
                      "default",
                      []
                    |),
                    []
                  |));
                ("last_gas_cost",
                  M.call_closure (|
                    M.get_trait_method (|
                      "core::default::Default",
                      Ty.path "u64",
                      [],
                      "default",
                      []
                    |),
                    []
                  |))
              ]))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::default::Default"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("default", InstanceField.Method default) ].
    End Impl_core_default_Default_for_revm_inspector_gas_GasInspector.
    
    Module Impl_revm_inspector_gas_GasInspector.
      Definition Self : Ty.t := Ty.path "revm::inspector::gas::GasInspector".
      
      (*
          pub fn gas_remaining(&self) -> u64 {
              self.gas_remaining
          }
      *)
      Definition gas_remaining (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "revm::inspector::gas::GasInspector",
                "gas_remaining"
              |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_gas_remaining :
        M.IsAssociatedFunction Self "gas_remaining" gas_remaining.
      
      (*
          pub fn last_gas_cost(&self) -> u64 {
              self.last_gas_cost
          }
      *)
      Definition last_gas_cost (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "revm::inspector::gas::GasInspector",
                "last_gas_cost"
              |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_last_gas_cost :
        M.IsAssociatedFunction Self "last_gas_cost" last_gas_cost.
    End Impl_revm_inspector_gas_GasInspector.
    
    Module Impl_revm_inspector_Inspector_where_revm_primitives_db_Database_DB_DB_for_revm_inspector_gas_GasInspector.
      Definition Self (DB : Ty.t) : Ty.t := Ty.path "revm::inspector::gas::GasInspector".
      
      (*
          fn initialize_interp(
              &mut self,
              interp: &mut crate::interpreter::Interpreter,
              _context: &mut EvmContext<DB>,
          ) {
              self.gas_remaining = interp.gas.limit();
          }
      *)
      Definition initialize_interp
          (DB : Ty.t)
          (ε : list Value.t)
          (τ : list Ty.t)
          (α : list Value.t)
          : M :=
        let Self : Ty.t := Self DB in
        match ε, τ, α with
        | [], [], [ self; interp; _context ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let interp := M.alloc (| interp |) in
            let _context := M.alloc (| _context |) in
            M.read (|
              let~ _ :=
                M.write (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm::inspector::gas::GasInspector",
                    "gas_remaining"
                  |),
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "revm_interpreter::gas::Gas",
                      "limit",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| interp |),
                        "revm_interpreter::interpreter::Interpreter",
                        "gas"
                      |)
                    ]
                  |)
                |) in
              M.alloc (| Value.Tuple [] |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn step(
              &mut self,
              interp: &mut crate::interpreter::Interpreter,
              _context: &mut EvmContext<DB>,
          ) {
              self.gas_remaining = interp.gas.remaining();
          }
      *)
      Definition step (DB : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self DB in
        match ε, τ, α with
        | [], [], [ self; interp; _context ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let interp := M.alloc (| interp |) in
            let _context := M.alloc (| _context |) in
            M.read (|
              let~ _ :=
                M.write (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm::inspector::gas::GasInspector",
                    "gas_remaining"
                  |),
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "revm_interpreter::gas::Gas",
                      "remaining",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| interp |),
                        "revm_interpreter::interpreter::Interpreter",
                        "gas"
                      |)
                    ]
                  |)
                |) in
              M.alloc (| Value.Tuple [] |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn step_end(
              &mut self,
              interp: &mut crate::interpreter::Interpreter,
              _context: &mut EvmContext<DB>,
          ) {
              let remaining = interp.gas.remaining();
              self.last_gas_cost = self.gas_remaining.saturating_sub(remaining);
              self.gas_remaining = remaining;
          }
      *)
      Definition step_end (DB : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self DB in
        match ε, τ, α with
        | [], [], [ self; interp; _context ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let interp := M.alloc (| interp |) in
            let _context := M.alloc (| _context |) in
            M.read (|
              let~ remaining :=
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "revm_interpreter::gas::Gas",
                      "remaining",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| interp |),
                        "revm_interpreter::interpreter::Interpreter",
                        "gas"
                      |)
                    ]
                  |)
                |) in
              let~ _ :=
                M.write (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm::inspector::gas::GasInspector",
                    "last_gas_cost"
                  |),
                  M.call_closure (|
                    M.get_associated_function (| Ty.path "u64", "saturating_sub", [] |),
                    [
                      M.read (|
                        M.SubPointer.get_struct_record_field (|
                          M.read (| self |),
                          "revm::inspector::gas::GasInspector",
                          "gas_remaining"
                        |)
                      |);
                      M.read (| remaining |)
                    ]
                  |)
                |) in
              let~ _ :=
                M.write (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "revm::inspector::gas::GasInspector",
                    "gas_remaining"
                  |),
                  M.read (| remaining |)
                |) in
              M.alloc (| Value.Tuple [] |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn call_end(
              &mut self,
              _context: &mut EvmContext<DB>,
              _inputs: &CallInputs,
              mut outcome: CallOutcome,
          ) -> CallOutcome {
              if outcome.result.result.is_error() {
                  outcome.result.gas.spend_all();
                  self.gas_remaining = 0;
              }
              outcome
          }
      *)
      Definition call_end (DB : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self DB in
        match ε, τ, α with
        | [], [], [ self; _context; _inputs; outcome ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let _context := M.alloc (| _context |) in
            let _inputs := M.alloc (| _inputs |) in
            let outcome := M.alloc (| outcome |) in
            M.read (|
              let~ _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "revm_interpreter::instruction_result::InstructionResult",
                                  "is_error",
                                  []
                                |),
                                [
                                  M.read (|
                                    M.SubPointer.get_struct_record_field (|
                                      M.SubPointer.get_struct_record_field (|
                                        outcome,
                                        "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                                        "result"
                                      |),
                                      "revm_interpreter::interpreter::InterpreterResult",
                                      "result"
                                    |)
                                  |)
                                ]
                              |)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let~ _ :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "revm_interpreter::gas::Gas",
                                "spend_all",
                                []
                              |),
                              [
                                M.SubPointer.get_struct_record_field (|
                                  M.SubPointer.get_struct_record_field (|
                                    outcome,
                                    "revm_interpreter::interpreter_action::call_outcome::CallOutcome",
                                    "result"
                                  |),
                                  "revm_interpreter::interpreter::InterpreterResult",
                                  "gas"
                                |)
                              ]
                            |)
                          |) in
                        let~ _ :=
                          M.write (|
                            M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "revm::inspector::gas::GasInspector",
                              "gas_remaining"
                            |),
                            Value.Integer 0
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              outcome
            |)))
        | _, _, _ => M.impossible
        end.
      
      (*
          fn create_end(
              &mut self,
              _context: &mut EvmContext<DB>,
              _inputs: &CreateInputs,
              mut outcome: CreateOutcome,
          ) -> CreateOutcome {
              if outcome.result.result.is_error() {
                  outcome.result.gas.spend_all();
                  self.gas_remaining = 0;
              }
              outcome
          }
      *)
      Definition create_end (DB : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self DB in
        match ε, τ, α with
        | [], [], [ self; _context; _inputs; outcome ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let _context := M.alloc (| _context |) in
            let _inputs := M.alloc (| _inputs |) in
            let outcome := M.alloc (| outcome |) in
            M.read (|
              let~ _ :=
                M.match_operator (|
                  M.alloc (| Value.Tuple [] |),
                  [
                    fun γ =>
                      ltac:(M.monadic
                        (let γ :=
                          M.use
                            (M.alloc (|
                              M.call_closure (|
                                M.get_associated_function (|
                                  Ty.path "revm_interpreter::instruction_result::InstructionResult",
                                  "is_error",
                                  []
                                |),
                                [
                                  M.read (|
                                    M.SubPointer.get_struct_record_field (|
                                      M.SubPointer.get_struct_record_field (|
                                        outcome,
                                        "revm_interpreter::interpreter_action::create_outcome::CreateOutcome",
                                        "result"
                                      |),
                                      "revm_interpreter::interpreter::InterpreterResult",
                                      "result"
                                    |)
                                  |)
                                ]
                              |)
                            |)) in
                        let _ :=
                          M.is_constant_or_break_match (| M.read (| γ |), Value.Bool true |) in
                        let~ _ :=
                          M.alloc (|
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "revm_interpreter::gas::Gas",
                                "spend_all",
                                []
                              |),
                              [
                                M.SubPointer.get_struct_record_field (|
                                  M.SubPointer.get_struct_record_field (|
                                    outcome,
                                    "revm_interpreter::interpreter_action::create_outcome::CreateOutcome",
                                    "result"
                                  |),
                                  "revm_interpreter::interpreter::InterpreterResult",
                                  "gas"
                                |)
                              ]
                            |)
                          |) in
                        let~ _ :=
                          M.write (|
                            M.SubPointer.get_struct_record_field (|
                              M.read (| self |),
                              "revm::inspector::gas::GasInspector",
                              "gas_remaining"
                            |),
                            Value.Integer 0
                          |) in
                        M.alloc (| Value.Tuple [] |)));
                    fun γ => ltac:(M.monadic (M.alloc (| Value.Tuple [] |)))
                  ]
                |) in
              outcome
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (DB : Ty.t),
        M.IsTraitInstance
          "revm::inspector::Inspector"
          (Self DB)
          (* Trait polymorphic types *) [ (* DB *) DB ]
          (* Instance *)
          [
            ("initialize_interp", InstanceField.Method (initialize_interp DB));
            ("step", InstanceField.Method (step DB));
            ("step_end", InstanceField.Method (step_end DB));
            ("call_end", InstanceField.Method (call_end DB));
            ("create_end", InstanceField.Method (create_end DB))
          ].
    End Impl_revm_inspector_Inspector_where_revm_primitives_db_Database_DB_DB_for_revm_inspector_gas_GasInspector.
  End gas.
End inspector.
