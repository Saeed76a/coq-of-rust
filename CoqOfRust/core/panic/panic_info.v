(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module panic.
  Module panic_info.
    (* StructRecord
      {
        name := "PanicInfo";
        const_params := [];
        ty_params := [];
        fields :=
          [
            ("message", Ty.path "core::fmt::Arguments");
            ("location", Ty.apply (Ty.path "&") [] [ Ty.path "core::panic::location::Location" ]);
            ("can_unwind", Ty.path "bool");
            ("force_no_backtrace", Ty.path "bool")
          ];
      } *)
    
    Module Impl_core_fmt_Debug_for_core_panic_panic_info_PanicInfo.
      Definition Self : Ty.t := Ty.path "core::panic::panic_info::PanicInfo".
      
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
                "debug_struct_field4_finish",
                []
              |),
              [
                M.read (| f |);
                M.read (| Value.String "PanicInfo" |);
                M.read (| Value.String "message" |);
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "core::panic::panic_info::PanicInfo",
                  "message"
                |);
                M.read (| Value.String "location" |);
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "core::panic::panic_info::PanicInfo",
                  "location"
                |);
                M.read (| Value.String "can_unwind" |);
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "core::panic::panic_info::PanicInfo",
                  "can_unwind"
                |);
                M.read (| Value.String "force_no_backtrace" |);
                M.alloc (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::panic::panic_info::PanicInfo",
                    "force_no_backtrace"
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
    End Impl_core_fmt_Debug_for_core_panic_panic_info_PanicInfo.
    
    (* StructRecord
      {
        name := "PanicMessage";
        const_params := [];
        ty_params := [];
        fields := [ ("message", Ty.path "core::fmt::Arguments") ];
      } *)
    
    Module Impl_core_panic_panic_info_PanicInfo.
      Definition Self : Ty.t := Ty.path "core::panic::panic_info::PanicInfo".
      
      (*
          pub(crate) fn new(
              message: fmt::Arguments<'a>,
              location: &'a Location<'a>,
              can_unwind: bool,
              force_no_backtrace: bool,
          ) -> Self {
              PanicInfo { location, message, can_unwind, force_no_backtrace }
          }
      *)
      Definition new (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ message; location; can_unwind; force_no_backtrace ] =>
          ltac:(M.monadic
            (let message := M.alloc (| message |) in
            let location := M.alloc (| location |) in
            let can_unwind := M.alloc (| can_unwind |) in
            let force_no_backtrace := M.alloc (| force_no_backtrace |) in
            Value.StructRecord
              "core::panic::panic_info::PanicInfo"
              [
                ("location", M.read (| location |));
                ("message", M.read (| message |));
                ("can_unwind", M.read (| can_unwind |));
                ("force_no_backtrace", M.read (| force_no_backtrace |))
              ]))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_new : M.IsAssociatedFunction Self "new" new.
      
      (*
          pub fn message(&self) -> PanicMessage<'_> {
              PanicMessage { message: self.message }
          }
      *)
      Definition message (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            Value.StructRecord
              "core::panic::panic_info::PanicMessage"
              [
                ("message",
                  M.read (|
                    M.SubPointer.get_struct_record_field (|
                      M.read (| self |),
                      "core::panic::panic_info::PanicInfo",
                      "message"
                    |)
                  |))
              ]))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_message : M.IsAssociatedFunction Self "message" message.
      
      (*
          pub fn location(&self) -> Option<&Location<'_>> {
              // NOTE: If this is changed to sometimes return None,
              // deal with that case in std::panicking::default_hook and core::panicking::panic_fmt.
              Some(&self.location)
          }
      *)
      Definition location (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            Value.StructTuple
              "core::option::Option::Some"
              [
                M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::panic::panic_info::PanicInfo",
                    "location"
                  |)
                |)
              ]))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_location : M.IsAssociatedFunction Self "location" location.
      
      (*
          pub fn payload(&self) -> &(dyn crate::any::Any + Send) {
              struct NoPayload;
              &NoPayload
          }
      *)
      Definition payload (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.alloc (| Value.StructTuple "core::panic::panic_info::payload::NoPayload" [] |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_payload : M.IsAssociatedFunction Self "payload" payload.
      
      (*
          pub fn can_unwind(&self) -> bool {
              self.can_unwind
          }
      *)
      Definition can_unwind (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "core::panic::panic_info::PanicInfo",
                "can_unwind"
              |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_can_unwind : M.IsAssociatedFunction Self "can_unwind" can_unwind.
      
      (*
          pub fn force_no_backtrace(&self) -> bool {
              self.force_no_backtrace
          }
      *)
      Definition force_no_backtrace (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.read (|
              M.SubPointer.get_struct_record_field (|
                M.read (| self |),
                "core::panic::panic_info::PanicInfo",
                "force_no_backtrace"
              |)
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_force_no_backtrace :
        M.IsAssociatedFunction Self "force_no_backtrace" force_no_backtrace.
    End Impl_core_panic_panic_info_PanicInfo.
    
    Module Impl_core_fmt_Display_for_core_panic_panic_info_PanicInfo.
      Definition Self : Ty.t := Ty.path "core::panic::panic_info::PanicInfo".
      
      (*
          fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
              formatter.write_str("panicked at ")?;
              self.location.fmt(formatter)?;
              formatter.write_str(":\n")?;
              formatter.write_fmt(self.message)?;
              Ok(())
          }
      *)
      Definition fmt (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self; formatter ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let formatter := M.alloc (| formatter |) in
            M.catch_return (|
              ltac:(M.monadic
                (M.read (|
                  let~ _ :=
                    M.match_operator (|
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::try_trait::Try",
                            Ty.apply
                              (Ty.path "core::result::Result")
                              []
                              [ Ty.tuple []; Ty.path "core::fmt::Error" ],
                            [],
                            "branch",
                            []
                          |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::Formatter",
                                "write_str",
                                []
                              |),
                              [ M.read (| formatter |); M.read (| Value.String "panicked at " |) ]
                            |)
                          ]
                        |)
                      |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::ops::control_flow::ControlFlow::Break",
                                0
                              |) in
                            let residual := M.copy (| γ0_0 |) in
                            M.alloc (|
                              M.never_to_any (|
                                M.read (|
                                  M.return_ (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::ops::try_trait::FromResidual",
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          []
                                          [ Ty.tuple []; Ty.path "core::fmt::Error" ],
                                        [
                                          Ty.apply
                                            (Ty.path "core::result::Result")
                                            []
                                            [
                                              Ty.path "core::convert::Infallible";
                                              Ty.path "core::fmt::Error"
                                            ]
                                        ],
                                        "from_residual",
                                        []
                                      |),
                                      [ M.read (| residual |) ]
                                    |)
                                  |)
                                |)
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::ops::control_flow::ControlFlow::Continue",
                                0
                              |) in
                            let val := M.copy (| γ0_0 |) in
                            val))
                      ]
                    |) in
                  let~ _ :=
                    M.match_operator (|
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::try_trait::Try",
                            Ty.apply
                              (Ty.path "core::result::Result")
                              []
                              [ Ty.tuple []; Ty.path "core::fmt::Error" ],
                            [],
                            "branch",
                            []
                          |),
                          [
                            M.call_closure (|
                              M.get_trait_method (|
                                "core::fmt::Display",
                                Ty.path "core::panic::location::Location",
                                [],
                                "fmt",
                                []
                              |),
                              [
                                M.read (|
                                  M.SubPointer.get_struct_record_field (|
                                    M.read (| self |),
                                    "core::panic::panic_info::PanicInfo",
                                    "location"
                                  |)
                                |);
                                M.read (| formatter |)
                              ]
                            |)
                          ]
                        |)
                      |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::ops::control_flow::ControlFlow::Break",
                                0
                              |) in
                            let residual := M.copy (| γ0_0 |) in
                            M.alloc (|
                              M.never_to_any (|
                                M.read (|
                                  M.return_ (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::ops::try_trait::FromResidual",
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          []
                                          [ Ty.tuple []; Ty.path "core::fmt::Error" ],
                                        [
                                          Ty.apply
                                            (Ty.path "core::result::Result")
                                            []
                                            [
                                              Ty.path "core::convert::Infallible";
                                              Ty.path "core::fmt::Error"
                                            ]
                                        ],
                                        "from_residual",
                                        []
                                      |),
                                      [ M.read (| residual |) ]
                                    |)
                                  |)
                                |)
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::ops::control_flow::ControlFlow::Continue",
                                0
                              |) in
                            let val := M.copy (| γ0_0 |) in
                            val))
                      ]
                    |) in
                  let~ _ :=
                    M.match_operator (|
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::try_trait::Try",
                            Ty.apply
                              (Ty.path "core::result::Result")
                              []
                              [ Ty.tuple []; Ty.path "core::fmt::Error" ],
                            [],
                            "branch",
                            []
                          |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::Formatter",
                                "write_str",
                                []
                              |),
                              [ M.read (| formatter |); M.read (| Value.String ":
" |) ]
                            |)
                          ]
                        |)
                      |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::ops::control_flow::ControlFlow::Break",
                                0
                              |) in
                            let residual := M.copy (| γ0_0 |) in
                            M.alloc (|
                              M.never_to_any (|
                                M.read (|
                                  M.return_ (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::ops::try_trait::FromResidual",
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          []
                                          [ Ty.tuple []; Ty.path "core::fmt::Error" ],
                                        [
                                          Ty.apply
                                            (Ty.path "core::result::Result")
                                            []
                                            [
                                              Ty.path "core::convert::Infallible";
                                              Ty.path "core::fmt::Error"
                                            ]
                                        ],
                                        "from_residual",
                                        []
                                      |),
                                      [ M.read (| residual |) ]
                                    |)
                                  |)
                                |)
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::ops::control_flow::ControlFlow::Continue",
                                0
                              |) in
                            let val := M.copy (| γ0_0 |) in
                            val))
                      ]
                    |) in
                  let~ _ :=
                    M.match_operator (|
                      M.alloc (|
                        M.call_closure (|
                          M.get_trait_method (|
                            "core::ops::try_trait::Try",
                            Ty.apply
                              (Ty.path "core::result::Result")
                              []
                              [ Ty.tuple []; Ty.path "core::fmt::Error" ],
                            [],
                            "branch",
                            []
                          |),
                          [
                            M.call_closure (|
                              M.get_associated_function (|
                                Ty.path "core::fmt::Formatter",
                                "write_fmt",
                                []
                              |),
                              [
                                M.read (| formatter |);
                                M.read (|
                                  M.SubPointer.get_struct_record_field (|
                                    M.read (| self |),
                                    "core::panic::panic_info::PanicInfo",
                                    "message"
                                  |)
                                |)
                              ]
                            |)
                          ]
                        |)
                      |),
                      [
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::ops::control_flow::ControlFlow::Break",
                                0
                              |) in
                            let residual := M.copy (| γ0_0 |) in
                            M.alloc (|
                              M.never_to_any (|
                                M.read (|
                                  M.return_ (|
                                    M.call_closure (|
                                      M.get_trait_method (|
                                        "core::ops::try_trait::FromResidual",
                                        Ty.apply
                                          (Ty.path "core::result::Result")
                                          []
                                          [ Ty.tuple []; Ty.path "core::fmt::Error" ],
                                        [
                                          Ty.apply
                                            (Ty.path "core::result::Result")
                                            []
                                            [
                                              Ty.path "core::convert::Infallible";
                                              Ty.path "core::fmt::Error"
                                            ]
                                        ],
                                        "from_residual",
                                        []
                                      |),
                                      [ M.read (| residual |) ]
                                    |)
                                  |)
                                |)
                              |)
                            |)));
                        fun γ =>
                          ltac:(M.monadic
                            (let γ0_0 :=
                              M.SubPointer.get_struct_tuple_field (|
                                γ,
                                "core::ops::control_flow::ControlFlow::Continue",
                                0
                              |) in
                            let val := M.copy (| γ0_0 |) in
                            val))
                      ]
                    |) in
                  M.alloc (| Value.StructTuple "core::result::Result::Ok" [ Value.Tuple [] ] |)
                |)))
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::fmt::Display"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
    End Impl_core_fmt_Display_for_core_panic_panic_info_PanicInfo.
    
    Module Impl_core_panic_panic_info_PanicMessage.
      Definition Self : Ty.t := Ty.path "core::panic::panic_info::PanicMessage".
      
      (*
          pub const fn as_str(&self) -> Option<&'static str> {
              self.message.as_str()
          }
      *)
      Definition as_str (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            M.call_closure (|
              M.get_associated_function (| Ty.path "core::fmt::Arguments", "as_str", [] |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.read (| self |),
                  "core::panic::panic_info::PanicMessage",
                  "message"
                |)
              ]
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom AssociatedFunction_as_str : M.IsAssociatedFunction Self "as_str" as_str.
    End Impl_core_panic_panic_info_PanicMessage.
    
    Module Impl_core_fmt_Display_for_core_panic_panic_info_PanicMessage.
      Definition Self : Ty.t := Ty.path "core::panic::panic_info::PanicMessage".
      
      (*
          fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
              formatter.write_fmt(self.message)
          }
      *)
      Definition fmt (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self; formatter ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let formatter := M.alloc (| formatter |) in
            M.call_closure (|
              M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_fmt", [] |),
              [
                M.read (| formatter |);
                M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::panic::panic_info::PanicMessage",
                    "message"
                  |)
                |)
              ]
            |)))
        | _, _, _ => M.impossible
        end.
      
      Axiom Implements :
        M.IsTraitInstance
          "core::fmt::Display"
          Self
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method fmt) ].
    End Impl_core_fmt_Display_for_core_panic_panic_info_PanicMessage.
    
    Module Impl_core_fmt_Debug_for_core_panic_panic_info_PanicMessage.
      Definition Self : Ty.t := Ty.path "core::panic::panic_info::PanicMessage".
      
      (*
          fn fmt(&self, formatter: &mut fmt::Formatter<'_>) -> fmt::Result {
              formatter.write_fmt(self.message)
          }
      *)
      Definition fmt (ε : list Value.t) (τ : list Ty.t) (α : list Value.t) : M :=
        match ε, τ, α with
        | [], [], [ self; formatter ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let formatter := M.alloc (| formatter |) in
            M.call_closure (|
              M.get_associated_function (| Ty.path "core::fmt::Formatter", "write_fmt", [] |),
              [
                M.read (| formatter |);
                M.read (|
                  M.SubPointer.get_struct_record_field (|
                    M.read (| self |),
                    "core::panic::panic_info::PanicMessage",
                    "message"
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
    End Impl_core_fmt_Debug_for_core_panic_panic_info_PanicMessage.
  End panic_info.
End panic.
