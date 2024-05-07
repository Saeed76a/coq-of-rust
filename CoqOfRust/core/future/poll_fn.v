(* Generated by coq-of-rust *)
Require Import CoqOfRust.CoqOfRust.

Module future.
  Module poll_fn.
    (*
    pub fn poll_fn<T, F>(f: F) -> PollFn<F>
    where
        F: FnMut(&mut Context<'_>) -> Poll<T>,
    {
        PollFn { f }
    }
    *)
    Definition poll_fn (τ : list Ty.t) (α : list Value.t) : M :=
      match τ, α with
      | [ T; F ], [ f ] =>
        ltac:(M.monadic
          (let f := M.alloc (| f |) in
          Value.StructRecord "core::future::poll_fn::PollFn" [ ("f", M.read (| f |)) ]))
      | _, _ => M.impossible
      end.
    
    (* StructRecord
      {
        name := "PollFn";
        ty_params := [ "F" ];
        fields := [ ("f", F) ];
      } *)
    
    Module Impl_core_marker_Unpin_where_core_marker_Unpin_F_for_core_future_poll_fn_PollFn_F.
      Definition Self (F : Ty.t) : Ty.t := Ty.apply (Ty.path "core::future::poll_fn::PollFn") [ F ].
      
      Axiom Implements :
        forall (F : Ty.t),
        M.IsTraitInstance
          "core::marker::Unpin"
          (Self F)
          (* Trait polymorphic types *) []
          (* Instance *) [].
    End Impl_core_marker_Unpin_where_core_marker_Unpin_F_for_core_future_poll_fn_PollFn_F.
    
    Module Impl_core_fmt_Debug_for_core_future_poll_fn_PollFn_F.
      Definition Self (F : Ty.t) : Ty.t := Ty.apply (Ty.path "core::future::poll_fn::PollFn") [ F ].
      
      (*
          fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
              f.debug_struct("PollFn").finish()
          }
      *)
      Definition fmt (F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self F in
        match τ, α with
        | [], [ self; f ] =>
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
                M.alloc (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.path "core::fmt::Formatter",
                      "debug_struct",
                      []
                    |),
                    [ M.read (| f |); M.read (| Value.String "PollFn" |) ]
                  |)
                |)
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (F : Ty.t),
        M.IsTraitInstance
          "core::fmt::Debug"
          (Self F)
          (* Trait polymorphic types *) []
          (* Instance *) [ ("fmt", InstanceField.Method (fmt F)) ].
    End Impl_core_fmt_Debug_for_core_future_poll_fn_PollFn_F.
    
    Module Impl_core_future_future_Future_where_core_ops_function_FnMut_F_Tuple_ref_mut_core_task_wake_Context__for_core_future_poll_fn_PollFn_F.
      Definition Self (T F : Ty.t) : Ty.t :=
        Ty.apply (Ty.path "core::future::poll_fn::PollFn") [ F ].
      
      (*     type Output = T; *)
      Definition _Output (T F : Ty.t) : Ty.t := T.
      
      (*
          fn poll(self: Pin<&mut Self>, cx: &mut Context<'_>) -> Poll<T> {
              // SAFETY: We are not moving out of the pinned field.
              (unsafe { &mut self.get_unchecked_mut().f })(cx)
          }
      *)
      Definition poll (T F : Ty.t) (τ : list Ty.t) (α : list Value.t) : M :=
        let Self : Ty.t := Self T F in
        match τ, α with
        | [], [ self; cx ] =>
          ltac:(M.monadic
            (let self := M.alloc (| self |) in
            let cx := M.alloc (| cx |) in
            M.call_closure (|
              M.get_trait_method (|
                "core::ops::function::FnMut",
                F,
                [ Ty.tuple [ Ty.apply (Ty.path "&mut") [ Ty.path "core::task::wake::Context" ] ] ],
                "call_mut",
                []
              |),
              [
                M.SubPointer.get_struct_record_field (|
                  M.call_closure (|
                    M.get_associated_function (|
                      Ty.apply
                        (Ty.path "core::pin::Pin")
                        [
                          Ty.apply
                            (Ty.path "&mut")
                            [ Ty.apply (Ty.path "core::future::poll_fn::PollFn") [ F ] ]
                        ],
                      "get_unchecked_mut",
                      []
                    |),
                    [ M.read (| self |) ]
                  |),
                  "core::future::poll_fn::PollFn",
                  "f"
                |);
                Value.Tuple [ M.read (| cx |) ]
              ]
            |)))
        | _, _ => M.impossible
        end.
      
      Axiom Implements :
        forall (T F : Ty.t),
        M.IsTraitInstance
          "core::future::future::Future"
          (Self T F)
          (* Trait polymorphic types *) []
          (* Instance *)
          [ ("Output", InstanceField.Ty (_Output T F)); ("poll", InstanceField.Method (poll T F)) ].
    End Impl_core_future_future_Future_where_core_ops_function_FnMut_F_Tuple_ref_mut_core_task_wake_Context__for_core_future_poll_fn_PollFn_F.
  End poll_fn.
End future.