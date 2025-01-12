(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module handler.
  Module handle_types.
    Module post_execution.
      Axiom ReimburseCallerHandle :
        forall (EXT DB : Ty.t),
        (Ty.apply
            (Ty.path "revm::handler::handle_types::post_execution::ReimburseCallerHandle")
            []
            [ EXT; DB ]) =
          (Ty.apply
            (Ty.path "alloc::sync::Arc")
            []
            [
              Ty.dyn
                [
                  ("existential predicate with variables", []);
                  ("existential predicate with variables", [])
                ];
              Ty.path "alloc::alloc::Global"
            ]).
      
      Axiom RewardBeneficiaryHandle :
        forall (EXT DB : Ty.t),
        (Ty.apply
            (Ty.path "revm::handler::handle_types::post_execution::RewardBeneficiaryHandle")
            []
            [ EXT; DB ]) =
          (Ty.apply
            (Ty.path "alloc::sync::Arc")
            []
            [
              Ty.dyn
                [
                  ("existential predicate with variables", []);
                  ("existential predicate with variables", [])
                ];
              Ty.path "alloc::alloc::Global"
            ]).
      
      Axiom OutputHandle :
        forall (EXT DB : Ty.t),
        (Ty.apply
            (Ty.path "revm::handler::handle_types::post_execution::OutputHandle")
            []
            [ EXT; DB ]) =
          (Ty.apply
            (Ty.path "alloc::sync::Arc")
            []
            [
              Ty.dyn
                [
                  ("existential predicate with variables", []);
                  ("existential predicate with variables", [])
                ];
              Ty.path "alloc::alloc::Global"
            ]).
      
      Axiom EndHandle :
        forall (EXT DB : Ty.t),
        (Ty.apply
            (Ty.path "revm::handler::handle_types::post_execution::EndHandle")
            []
            [ EXT; DB ]) =
          (Ty.apply
            (Ty.path "alloc::sync::Arc")
            []
            [
              Ty.dyn
                [
                  ("existential predicate with variables", []);
                  ("existential predicate with variables", [])
                ];
              Ty.path "alloc::alloc::Global"
            ]).
      
      Axiom ClearHandle :
        forall (EXT DB : Ty.t),
        (Ty.apply
            (Ty.path "revm::handler::handle_types::post_execution::ClearHandle")
            []
            [ EXT; DB ]) =
          (Ty.apply
            (Ty.path "alloc::sync::Arc")
            []
            [
              Ty.dyn
                [
                  ("existential predicate with variables", []);
                  ("existential predicate with variables", [])
                ];
              Ty.path "alloc::alloc::Global"
            ]).
      
      (* StructRecord
        {
          name := "PostExecutionHandler";
          const_params := [];
          ty_params := [ "EXT"; "DB" ];
          fields :=
            [
              ("reimburse_caller",
                Ty.apply
                  (Ty.path "alloc::sync::Arc")
                  []
                  [
                    Ty.dyn
                      [
                        ("existential predicate with variables", []);
                        ("existential predicate with variables", [])
                      ];
                    Ty.path "alloc::alloc::Global"
                  ]);
              ("reward_beneficiary",
                Ty.apply
                  (Ty.path "alloc::sync::Arc")
                  []
                  [
                    Ty.dyn
                      [
                        ("existential predicate with variables", []);
                        ("existential predicate with variables", [])
                      ];
                    Ty.path "alloc::alloc::Global"
                  ]);
              ("output",
                Ty.apply
                  (Ty.path "alloc::sync::Arc")
                  []
                  [
                    Ty.dyn
                      [
                        ("existential predicate with variables", []);
                        ("existential predicate with variables", [])
                      ];
                    Ty.path "alloc::alloc::Global"
                  ]);
              ("end_",
                Ty.apply
                  (Ty.path "alloc::sync::Arc")
                  []
                  [
                    Ty.dyn
                      [
                        ("existential predicate with variables", []);
                        ("existential predicate with variables", [])
                      ];
                    Ty.path "alloc::alloc::Global"
                  ]);
              ("clear",
                Ty.apply
                  (Ty.path "alloc::sync::Arc")
                  []
                  [
                    Ty.dyn
                      [
                        ("existential predicate with variables", []);
                        ("existential predicate with variables", [])
                      ];
                    Ty.path "alloc::alloc::Global"
                  ])
            ];
        } *)
      
      Module Impl_revm_handler_handle_types_post_execution_PostExecutionHandler_EXT_DB.
        Definition Self (EXT DB : Ty.t) : Ty.t :=
          Ty.apply
            (Ty.path "revm::handler::handle_types::post_execution::PostExecutionHandler")
            []
            [ EXT; DB ].
        
        (*
            pub fn new<SPEC: Spec + 'a>() -> Self {
                Self {
                    reimburse_caller: Arc::new(mainnet::reimburse_caller::<SPEC, EXT, DB>),
                    reward_beneficiary: Arc::new(mainnet::reward_beneficiary::<SPEC, EXT, DB>),
                    output: Arc::new(mainnet::output::<EXT, DB>),
                    end: Arc::new(mainnet::end::<EXT, DB>),
                    clear: Arc::new(mainnet::clear::<EXT, DB>),
                }
            }
        *)
        Definition new (EXT DB : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self EXT DB in
          match ε, τ, α with
          | [], [ SPEC ], [] =>
            ltac:(M.monadic
              (Value.StructRecord
                "revm::handler::handle_types::post_execution::PostExecutionHandler"
                [
                  ("reimburse_caller",
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::sync::Arc")
                          []
                          [
                            Ty.function
                              [
                                Ty.apply
                                  (Ty.path "&mut")
                                  []
                                  [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ];
                                Ty.apply (Ty.path "&") [] [ Ty.path "revm_interpreter::gas::Gas" ]
                              ]
                              (Ty.apply
                                (Ty.path "core::result::Result")
                                []
                                [
                                  Ty.tuple [];
                                  Ty.apply
                                    (Ty.path "revm_primitives::result::EVMError")
                                    []
                                    [ Ty.associated ]
                                ]);
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.get_function (|
                          "revm::handler::mainnet::post_execution::reimburse_caller",
                          [ SPEC; EXT; DB ]
                        |)
                      ]
                    |));
                  ("reward_beneficiary",
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::sync::Arc")
                          []
                          [
                            Ty.function
                              [
                                Ty.apply
                                  (Ty.path "&mut")
                                  []
                                  [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ];
                                Ty.apply (Ty.path "&") [] [ Ty.path "revm_interpreter::gas::Gas" ]
                              ]
                              (Ty.apply
                                (Ty.path "core::result::Result")
                                []
                                [
                                  Ty.tuple [];
                                  Ty.apply
                                    (Ty.path "revm_primitives::result::EVMError")
                                    []
                                    [ Ty.associated ]
                                ]);
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.get_function (|
                          "revm::handler::mainnet::post_execution::reward_beneficiary",
                          [ SPEC; EXT; DB ]
                        |)
                      ]
                    |));
                  ("output",
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::sync::Arc")
                          []
                          [
                            Ty.function
                              [
                                Ty.apply
                                  (Ty.path "&mut")
                                  []
                                  [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ];
                                Ty.path "revm::frame::FrameResult"
                              ]
                              (Ty.apply
                                (Ty.path "core::result::Result")
                                []
                                [
                                  Ty.path "revm_primitives::result::ResultAndState";
                                  Ty.apply
                                    (Ty.path "revm_primitives::result::EVMError")
                                    []
                                    [ Ty.associated ]
                                ]);
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.get_function (|
                          "revm::handler::mainnet::post_execution::output",
                          [ EXT; DB ]
                        |)
                      ]
                    |));
                  ("end_",
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::sync::Arc")
                          []
                          [
                            Ty.function
                              [
                                Ty.apply
                                  (Ty.path "&mut")
                                  []
                                  [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ];
                                Ty.apply
                                  (Ty.path "core::result::Result")
                                  []
                                  [
                                    Ty.path "revm_primitives::result::ResultAndState";
                                    Ty.apply
                                      (Ty.path "revm_primitives::result::EVMError")
                                      []
                                      [ Ty.associated ]
                                  ]
                              ]
                              (Ty.apply
                                (Ty.path "core::result::Result")
                                []
                                [
                                  Ty.path "revm_primitives::result::ResultAndState";
                                  Ty.apply
                                    (Ty.path "revm_primitives::result::EVMError")
                                    []
                                    [ Ty.associated ]
                                ]);
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.get_function (|
                          "revm::handler::mainnet::post_execution::end",
                          [ EXT; DB ]
                        |)
                      ]
                    |));
                  ("clear",
                    M.call_closure (|
                      M.get_associated_function (|
                        Ty.apply
                          (Ty.path "alloc::sync::Arc")
                          []
                          [
                            Ty.function
                              [
                                Ty.apply
                                  (Ty.path "&mut")
                                  []
                                  [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ]
                              ]
                              (Ty.tuple []);
                            Ty.path "alloc::alloc::Global"
                          ],
                        "new",
                        []
                      |),
                      [
                        M.get_function (|
                          "revm::handler::mainnet::post_execution::clear",
                          [ EXT; DB ]
                        |)
                      ]
                    |))
                ]))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_new :
          forall (EXT DB : Ty.t),
          M.IsAssociatedFunction (Self EXT DB) "new" (new EXT DB).
        (*
            pub fn reimburse_caller(
                &self,
                context: &mut Context<EXT, DB>,
                gas: &Gas,
            ) -> Result<(), EVMError<DB::Error>> {
                (self.reimburse_caller)(context, gas)
            }
        *)
        Definition reimburse_caller
            (EXT DB : Ty.t)
            (ε : list Value.t)
            (τ : list Ty.t)
            (α : list Value.t)
            : M :=
          let Self : Ty.t := Self EXT DB in
          match ε, τ, α with
          | [], [], [ self; context; gas ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let context := M.alloc (| context |) in
              let gas := M.alloc (| gas |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::ops::function::Fn",
                  Ty.dyn
                    [
                      ("existential predicate with variables", []);
                      ("existential predicate with variables", [])
                    ],
                  [
                    Ty.tuple
                      [
                        Ty.apply
                          (Ty.path "&mut")
                          []
                          [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ];
                        Ty.apply (Ty.path "&") [] [ Ty.path "revm_interpreter::gas::Gas" ]
                      ]
                  ],
                  "call",
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
                          Ty.dyn
                            [
                              ("existential predicate with variables", []);
                              ("existential predicate with variables", [])
                            ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "deref",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm::handler::handle_types::post_execution::PostExecutionHandler",
                        "reimburse_caller"
                      |)
                    ]
                  |);
                  Value.Tuple [ M.read (| context |); M.read (| gas |) ]
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_reimburse_caller :
          forall (EXT DB : Ty.t),
          M.IsAssociatedFunction (Self EXT DB) "reimburse_caller" (reimburse_caller EXT DB).
        
        (*
            pub fn reward_beneficiary(
                &self,
                context: &mut Context<EXT, DB>,
                gas: &Gas,
            ) -> Result<(), EVMError<DB::Error>> {
                (self.reward_beneficiary)(context, gas)
            }
        *)
        Definition reward_beneficiary
            (EXT DB : Ty.t)
            (ε : list Value.t)
            (τ : list Ty.t)
            (α : list Value.t)
            : M :=
          let Self : Ty.t := Self EXT DB in
          match ε, τ, α with
          | [], [], [ self; context; gas ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let context := M.alloc (| context |) in
              let gas := M.alloc (| gas |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::ops::function::Fn",
                  Ty.dyn
                    [
                      ("existential predicate with variables", []);
                      ("existential predicate with variables", [])
                    ],
                  [
                    Ty.tuple
                      [
                        Ty.apply
                          (Ty.path "&mut")
                          []
                          [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ];
                        Ty.apply (Ty.path "&") [] [ Ty.path "revm_interpreter::gas::Gas" ]
                      ]
                  ],
                  "call",
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
                          Ty.dyn
                            [
                              ("existential predicate with variables", []);
                              ("existential predicate with variables", [])
                            ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "deref",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm::handler::handle_types::post_execution::PostExecutionHandler",
                        "reward_beneficiary"
                      |)
                    ]
                  |);
                  Value.Tuple [ M.read (| context |); M.read (| gas |) ]
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_reward_beneficiary :
          forall (EXT DB : Ty.t),
          M.IsAssociatedFunction (Self EXT DB) "reward_beneficiary" (reward_beneficiary EXT DB).
        
        (*
            pub fn output(
                &self,
                context: &mut Context<EXT, DB>,
                result: FrameResult,
            ) -> Result<ResultAndState, EVMError<DB::Error>> {
                (self.output)(context, result)
            }
        *)
        Definition output
            (EXT DB : Ty.t)
            (ε : list Value.t)
            (τ : list Ty.t)
            (α : list Value.t)
            : M :=
          let Self : Ty.t := Self EXT DB in
          match ε, τ, α with
          | [], [], [ self; context; result ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let context := M.alloc (| context |) in
              let result := M.alloc (| result |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::ops::function::Fn",
                  Ty.dyn
                    [
                      ("existential predicate with variables", []);
                      ("existential predicate with variables", [])
                    ],
                  [
                    Ty.tuple
                      [
                        Ty.apply
                          (Ty.path "&mut")
                          []
                          [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ];
                        Ty.path "revm::frame::FrameResult"
                      ]
                  ],
                  "call",
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
                          Ty.dyn
                            [
                              ("existential predicate with variables", []);
                              ("existential predicate with variables", [])
                            ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "deref",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm::handler::handle_types::post_execution::PostExecutionHandler",
                        "output"
                      |)
                    ]
                  |);
                  Value.Tuple [ M.read (| context |); M.read (| result |) ]
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_output :
          forall (EXT DB : Ty.t),
          M.IsAssociatedFunction (Self EXT DB) "output" (output EXT DB).
        
        (*
            pub fn end(
                &self,
                context: &mut Context<EXT, DB>,
                end_output: Result<ResultAndState, EVMError<DB::Error>>,
            ) -> Result<ResultAndState, EVMError<DB::Error>> {
                (self.end)(context, end_output)
            }
        *)
        Definition end_ (EXT DB : Ty.t) (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
          let Self : Ty.t := Self EXT DB in
          match ε, τ, α with
          | [], [], [ self; context; end_output ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let context := M.alloc (| context |) in
              let end_output := M.alloc (| end_output |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::ops::function::Fn",
                  Ty.dyn
                    [
                      ("existential predicate with variables", []);
                      ("existential predicate with variables", [])
                    ],
                  [
                    Ty.tuple
                      [
                        Ty.apply
                          (Ty.path "&mut")
                          []
                          [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ];
                        Ty.apply
                          (Ty.path "core::result::Result")
                          []
                          [
                            Ty.path "revm_primitives::result::ResultAndState";
                            Ty.apply
                              (Ty.path "revm_primitives::result::EVMError")
                              []
                              [ Ty.associated ]
                          ]
                      ]
                  ],
                  "call",
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
                          Ty.dyn
                            [
                              ("existential predicate with variables", []);
                              ("existential predicate with variables", [])
                            ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "deref",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm::handler::handle_types::post_execution::PostExecutionHandler",
                        "end"
                      |)
                    ]
                  |);
                  Value.Tuple [ M.read (| context |); M.read (| end_output |) ]
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_end_ :
          forall (EXT DB : Ty.t),
          M.IsAssociatedFunction (Self EXT DB) "end_" (end_ EXT DB).
        
        (*
            pub fn clear(&self, context: &mut Context<EXT, DB>) {
                (self.clear)(context)
            }
        *)
        Definition clear
            (EXT DB : Ty.t)
            (ε : list Value.t)
            (τ : list Ty.t)
            (α : list Value.t)
            : M :=
          let Self : Ty.t := Self EXT DB in
          match ε, τ, α with
          | [], [], [ self; context ] =>
            ltac:(M.monadic
              (let self := M.alloc (| self |) in
              let context := M.alloc (| context |) in
              M.call_closure (|
                M.get_trait_method (|
                  "core::ops::function::Fn",
                  Ty.dyn
                    [
                      ("existential predicate with variables", []);
                      ("existential predicate with variables", [])
                    ],
                  [
                    Ty.tuple
                      [
                        Ty.apply
                          (Ty.path "&mut")
                          []
                          [ Ty.apply (Ty.path "revm::context::Context") [] [ EXT; DB ] ]
                      ]
                  ],
                  "call",
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
                          Ty.dyn
                            [
                              ("existential predicate with variables", []);
                              ("existential predicate with variables", [])
                            ];
                          Ty.path "alloc::alloc::Global"
                        ],
                      [],
                      "deref",
                      []
                    |),
                    [
                      M.SubPointer.get_struct_record_field (|
                        M.read (| self |),
                        "revm::handler::handle_types::post_execution::PostExecutionHandler",
                        "clear"
                      |)
                    ]
                  |);
                  Value.Tuple [ M.read (| context |) ]
                ]
              |)))
          | _, _, _ => M.impossible
          end.
        
        Axiom AssociatedFunction_clear :
          forall (EXT DB : Ty.t),
          M.IsAssociatedFunction (Self EXT DB) "clear" (clear EXT DB).
      End Impl_revm_handler_handle_types_post_execution_PostExecutionHandler_EXT_DB.
      
    End post_execution.
  End handle_types.
End handler.
